// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Casama';

  @override
  String tabTitle(String page, String app) {
    return '$page・$app';
  }

  @override
  String tabTitleBotPage(String page, String bot) {
    return '$page・$bot';
  }

  @override
  String get tabTitleChat => 'チャット';

  @override
  String get tabTitleCall => '通話';

  @override
  String get tabTitleProject => 'プロジェクト';

  @override
  String get tabTitleGroupChat => 'グループチャット';

  @override
  String get loading => '読み込み中…';

  @override
  String get retry => '再試行';

  @override
  String get keepGoing => '続ける';

  @override
  String get keepGoingMessage => '止まったところから続けてください。';

  @override
  String get startOver => '最初からやり直す';

  @override
  String get continueRunHint => '止まったところから新しい予算で続けます。依頼を最初からやり直しません。';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get edit => '編集';

  @override
  String get close => '閉じる';

  @override
  String get create => '作成';

  @override
  String get continueLabel => '続行';

  @override
  String get somethingWentWrong => '問題が発生しました';

  @override
  String get errorViewHint => 'アプリを再起動すると解決する場合があります。';

  @override
  String get signInTitle => 'Casamaにサインイン';

  @override
  String get signUpTitle => 'アカウントを作成';

  @override
  String get email => 'メールアドレス';

  @override
  String get password => 'パスワード';

  @override
  String get signIn => 'サインイン';

  @override
  String get signUp => 'アカウントを作成';

  @override
  String get haveAccount => 'アカウントをお持ちですか？サインイン';

  @override
  String get needAccount => '初めてですか？アカウントを作成';

  @override
  String get magicLink => 'サインインリンクをメールで受け取る';

  @override
  String get magicLinkSent => 'メールでサインインリンクをご確認ください。';

  @override
  String get continueWithGoogle => 'Googleで続ける';

  @override
  String get continueWithApple => 'Appleで続ける';

  @override
  String get continueWithEmail => 'メールで続ける';

  @override
  String get moreSignInOptions => 'その他のオプション';

  @override
  String get usePasswordInstead => 'パスワードを使う';

  @override
  String get checkInboxTitle => '受信トレイを確認してください';

  @override
  String checkInboxBody(String email) {
    return 'サインインリンクと6桁のコードを$emailに送信しました。リンクをタップするか、ここにコードを入力してください。';
  }

  @override
  String get emailCodeLabel => '6桁のコード';

  @override
  String get resendLink => '再送信';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString秒後に再送信';
  }

  @override
  String get useDifferentEmail => '別のメールアドレスを使う';

  @override
  String get authWrongPassword =>
      'メールアドレスとパスワードが一致しません。もう一度お試しいただくか、メールリンクでサインインしてください。';

  @override
  String get authEmailNotConfirmed => 'まずメールアドレスを確認してください。お送りしたリンクを開いてください。';

  @override
  String get authCodeInvalid =>
      'コードが間違っているか、有効期限が切れています。最新のメールをご確認いただくか、新しく送信してください。';

  @override
  String get authTooManyTries => '試行回数が多すぎます。少し待ってからもう一度お試しください。';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds秒',
      one: '1秒',
    );
    return '一度にリクエストが多すぎます。$_temp0後にもう一度お試しください。';
  }

  @override
  String get tooManyRequestsReady => 'もう一度お試しいただけます。';

  @override
  String computerInUseBy(String name) {
    return '$nameがこのコンピューターを使っています';
  }

  @override
  String get authAccountExists => 'このメールアドレスのアカウントはすでに存在します。サインインしてください。';

  @override
  String get authSignupDisabled => 'このサーバーでは新規登録を受け付けていません。';

  @override
  String get useMagicLinkInstead => 'メールリンクでサインイン';

  @override
  String get invalidEmail => '有効なメールアドレスを入力してください';

  @override
  String get passwordTooShort => '6文字以上で入力してください';

  @override
  String get signOut => 'サインアウト';

  @override
  String get onboardingTitle => 'ワークスペースを設定';

  @override
  String get createWorkspace => 'ワークスペースを作成';

  @override
  String get workspaceName => 'ワークスペース名';

  @override
  String get joinWorkspace => '招待コードで参加';

  @override
  String get inviteCode => '招待コード';

  @override
  String get join => '参加';

  @override
  String get addModelKeyTitle => 'モデルキーを追加';

  @override
  String get addModelKeyBody =>
      'ボットは自分のモデルプロバイダーキーを使用します。暗号化して保存され、再表示されることはありません。';

  @override
  String get provider => 'プロバイダー';

  @override
  String get label => 'ラベル';

  @override
  String get apiKey => 'APIキー';

  @override
  String get baseUrl => 'ベースURL';

  @override
  String get testKey => 'キーをテスト';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'キーは有効です（$model、${msString}ms）';
  }

  @override
  String keyFailed(String error) {
    return 'キーのテストに失敗しました：$error';
  }

  @override
  String get createFirstBot => '最初のボットを作成';

  @override
  String get botName => 'ボット名';

  @override
  String get model => 'モデル';

  @override
  String get persona => '指示';

  @override
  String get personaHint => 'このボットが何をするか、どう働くかを書きます。ペルソナを選ぶと自動入力され、自由に編集できます。';

  @override
  String get modelKey => 'モデルキー';

  @override
  String get navComputer => 'コンピューター';

  @override
  String get navChats => 'チャット';

  @override
  String get navTasks => 'タスク';

  @override
  String get settingsConnectionsSection => '接続';

  @override
  String get advanced => '詳細設定';

  @override
  String get settingsAdvancedSummary => 'シークレット、コンピューター、デバイス';

  @override
  String get bots => 'ボット';

  @override
  String get newBot => '新しいボット';

  @override
  String get noBots => 'ボットはまだありません';

  @override
  String get botStatusIdle => '待機中';

  @override
  String get botStatusWorking => '作業中';

  @override
  String get botStatusWaiting => '返信待ち';

  @override
  String sidebarMoreWorking(int count) {
    return 'ほか$count体が作業中';
  }

  @override
  String get botStatusDisabled => '無効';

  @override
  String costToday(String cost) {
    return '本日$cost';
  }

  @override
  String get newChat => '新しいチャット';

  @override
  String get conversations => '会話';

  @override
  String messageHint(String bot) {
    return '$botにメッセージ';
  }

  @override
  String messageHintWithApps(String bot) {
    return '$botにメッセージ・@でアプリをメンション';
  }

  @override
  String get mentionSectionBots => 'ボット';

  @override
  String get mentionSectionApps => 'アプリ';

  @override
  String get mentionSectionAddToBot => 'このボットに追加';

  @override
  String get mentionSectionConnect => '接続する';

  @override
  String get mentionSectionStartGroup => 'グループチャットを始める';

  @override
  String get mentionBadgeBot => 'ボット';

  @override
  String get mentionBadgeApp => 'アプリ';

  @override
  String get mentionAddAction => '追加';

  @override
  String get mentionConnectAction => '接続';

  @override
  String get mentionMaxApps => '1メッセージにつき最大3つのアプリをメンションできます。';

  @override
  String get mentionRemovedApp => '削除されたアプリ';

  @override
  String get send => '送信';

  @override
  String get stop => '停止';

  @override
  String get thinking => '考え中…';

  @override
  String get checkingItsWork => '内容を確認中…';

  @override
  String get mapFullScreen => '全画面表示';

  @override
  String get mapTitle => '地図';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => '停止しました。';

  @override
  String emptyChat(String bot) {
    return '$botに話しかけてみましょう。';
  }

  @override
  String get toolRunning => '実行中';

  @override
  String get toolFailedLabel => '失敗';

  @override
  String get toolOutput => '出力';

  @override
  String get remembered => 'メモリーに記憶しました';

  @override
  String skillLoaded(String name) {
    return 'スキル「$name」を読み込みました';
  }

  @override
  String checkpointSaved(String label) {
    return '復元ポイントを保存しました：$label';
  }

  @override
  String computerState(String state) {
    return 'コンピューター：$state';
  }

  @override
  String get activity => 'アクティビティ';

  @override
  String get timelineTitle => '実行タイムライン';

  @override
  String get allEvents => 'すべて';

  @override
  String get filterTools => 'ツール';

  @override
  String get filterMessages => 'メッセージ';

  @override
  String get filterSystem => 'システム';

  @override
  String get restore => '復元';

  @override
  String get restoreConfirm => 'この復元ポイントに戻しますか？それ以降に変更されたファイルは置き換えられます。';

  @override
  String get restored => '復元ポイントから復元しました。';

  @override
  String get noRuns => '実行履歴はまだありません。';

  @override
  String get computerTitle => 'コンピューター';

  @override
  String get computerStart => '起動';

  @override
  String get computerSleep => 'スリープ';

  @override
  String get screen => '画面';

  @override
  String get terminal => 'ターミナル';

  @override
  String get files => 'ファイル';

  @override
  String get noScreen => '画面にはまだ何もありません。ボットがページを開くとここに表示されます。';

  @override
  String get refresh => '更新';

  @override
  String get upload => 'アップロード';

  @override
  String get download => 'ダウンロード';

  @override
  String get emptyFolder => 'このフォルダーは空です';

  @override
  String get noCheckpoints => 'リスクのある変更の前に自動で保存されるため、いつでも元に戻せます。';

  @override
  String get computerAsleep => 'コンピューターはスリープ中です。ファイルは保存されており、必要なときに起動します。';

  @override
  String get connectTerminal => '接続';

  @override
  String get terminalDisconnected => '切断されました。';

  @override
  String get terminalReconnecting => 'サーバーを再起動しています。再接続中…';

  @override
  String get memory => 'メモリー';

  @override
  String get noMemories => 'まだ記憶していることはありません。';

  @override
  String get noMemoriesMatch => '一致するメモリーはありません。';

  @override
  String get clearSearch => 'クリア';

  @override
  String get addMemory => 'メモリーを追加';

  @override
  String get addMemoryHelp => 'あなたや仕事についてボットが常に知っておくべき内容です。';

  @override
  String get addMemoryFactHint => '例：会計年度は4月始まりです。';

  @override
  String get addMemoryPreferenceHint => '例：要約は箇条書き5項目以内にしてください。';

  @override
  String get memoryAdded => 'メモリーを追加しました';

  @override
  String get pin => 'ピン留め';

  @override
  String get unpin => 'ピン留めを外す';

  @override
  String get deleteMemoryConfirm => 'このメモリーを忘れさせますか？元に戻せません。';

  @override
  String get skills => 'スキル';

  @override
  String get noSkills => 'スキルはまだありません。スキルは、必要なときにボットが読み込む指示です。';

  @override
  String get newSkill => '新しいスキル';

  @override
  String get skillName => '名前（小文字・ハイフン）';

  @override
  String get skillDescription => '1行の説明';

  @override
  String get skillBody => '指示（Markdown）';

  @override
  String get enabled => '有効';

  @override
  String get settings => '設定';

  @override
  String get workspace => 'ワークスペース';

  @override
  String get switchWorkspace => 'ワークスペースを切り替え';

  @override
  String get modelKeys => 'モデルキー';

  @override
  String get moreProviders => 'その他のプロバイダー';

  @override
  String get integrationsAdvancedSummary => 'Composio、Pipedream、カスタムサーバー';

  @override
  String get toolPermissions => 'ツールの権限';

  @override
  String get devicesAdvancedSummary => '保存期間、プライベートモデル、アクセスできるボット';

  @override
  String get companionAdvancedSummary => 'コマンド、ローカルツール（MCP）、コーディングエージェント';

  @override
  String get noKeys => 'モデルキーはまだありません。';

  @override
  String get addKey => 'キーを追加';

  @override
  String get usage => '利用状況';

  @override
  String get language => '言語';

  @override
  String inviteSent(String email) {
    return '$emailに招待を送信しました。';
  }

  @override
  String get botProfile => 'ボットプロフィール';

  @override
  String get groupMembers => 'このチャットのボット';

  @override
  String get groupMembersHelp => '各ボットが独自のメモリーと設定を保持します。タップするとプロフィールを開きます。';

  @override
  String get botAdvancedSummary => 'チャットアプリ、リンク、ルール、ウォッチャー、プラグイン、アクティビティ';

  @override
  String get botActivityRow => 'すべての実行をステップごとに表示';

  @override
  String get createBotAdvancedSummary => 'モデルキーとモデル';

  @override
  String get botProfileSection => 'プロフィール';

  @override
  String get botBrain => 'ブレイン';

  @override
  String get botAbilities => '機能';

  @override
  String get botSchedule => 'スケジュール';

  @override
  String get chatComputerLive => 'コンピューターで作業中';

  @override
  String get autonomy => '自律性';

  @override
  String get autonomyAskAlways => '実行前に確認';

  @override
  String get autonomyAskRisky => 'リスクのある操作は確認';

  @override
  String get autonomyAutonomous => '自律的に実行';

  @override
  String get saved => '保存しました。';

  @override
  String get justNow => 'たった今';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString分前',
      one: '1分前',
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
      other: '$nString時間前',
      one: '1時間前',
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
      other: '$nString日前',
      one: '昨日',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'ボット';

  @override
  String get addIntegration => '連携を追加';

  @override
  String get addSecret => 'シークレットを追加';

  @override
  String get allowedHosts => '許可されたホスト';

  @override
  String get allowedHostsHelp => 'カンマ区切り（例：api.github.com）';

  @override
  String get alwaysAllow => '常に許可';

  @override
  String get approval => '承認';

  @override
  String get approvalAlreadyDecided => 'このリクエストはすでに決定済みか、期限切れです。';

  @override
  String get approvals => '承認';

  @override
  String get approve => '承認する';

  @override
  String get approved => '承認済み';

  @override
  String get authHeaderOptional => 'Authorizationヘッダー（任意）';

  @override
  String get authSecretName => '認証シークレット名（任意）';

  @override
  String get authSecretNameHelp => '設定 → シークレットにある名前を指定すると、Bearerトークンとして送信されます';

  @override
  String get baseUrlOptional => 'ベースURL（任意）';

  @override
  String get blankBot => '空のボット';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'モデルを選択';

  @override
  String get createBotNeedsModel => 'このボットを作成するには、上でモデルを選択してください。';

  @override
  String get createBotKeyRejected =>
      'プロバイダーがこのキーを拒否しました。設定 → モデルキーで確認するか、別のキーを選択してください。';

  @override
  String get createBotDiscardTitle => 'このボットを破棄しますか？';

  @override
  String get createBotDiscardBody => 'ここに入力した内容は失われます。';

  @override
  String get searchModels => 'モデルを検索またはモデルIDを入力';

  @override
  String get recommendedModels => 'おすすめ';

  @override
  String get allModels => 'すべてのモデル';

  @override
  String useCustomModel(String id) {
    return '「$id」を使用';
  }

  @override
  String modelListFallback(String reason) {
    return '推奨モデルを表示しています。$reason任意のモデルIDを入力することもできます。';
  }

  @override
  String get noModelsFound => '一致するモデルがありません。';

  @override
  String get addModelKeyFirst =>
      'まずモデルキーを追加してください。ボットが思考に使います。暗号化して保存され、再表示されません。';

  @override
  String get composioToolkits => 'ツールキット（カンマ区切り、例：github, gmail）';

  @override
  String get copySecret => 'シークレットをコピー';

  @override
  String get cronExpression => 'Cron式';

  @override
  String get cronHelp => '分 時 日 月 曜日';

  @override
  String get denied => '拒否済み';

  @override
  String get deny => '拒否';

  @override
  String get everyHour => '毎時';

  @override
  String get expired => '期限切れ';

  @override
  String get inbox => '受信トレイ';

  @override
  String get integrationName => '名前';

  @override
  String get integrationNameHelp => '小文字の英字、数字、アンダースコア';

  @override
  String get integrationType => '種類';

  @override
  String get integrations => '連携';

  @override
  String get kindMcp => 'MCPサーバー';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'すべて既読にする';

  @override
  String get newRoutine => '新しいルーティン';

  @override
  String get noIntegrationsForBot => 'まず設定で連携を追加してから、ここでこのボット用にオンにしてください。';

  @override
  String get noRoutines => 'ルーティンはまだありません';

  @override
  String get noSecrets => 'シークレットはまだありません';

  @override
  String get notifications => '通知';

  @override
  String get openInbox => '受信トレイを開く';

  @override
  String get pipedreamApps => 'アプリ（カンマ区切り）';

  @override
  String get pipedreamClientId => 'クライアントID';

  @override
  String get pipedreamClientSecret => 'クライアントシークレット';

  @override
  String get pipedreamProject => 'プロジェクトID';

  @override
  String get riskHigh => '高リスク';

  @override
  String get riskLow => '低リスク';

  @override
  String get riskMedium => '中リスク';

  @override
  String get routineGithub => 'GitHubイベント時';

  @override
  String get routineInstructions => '指示';

  @override
  String get routineInstructionsHint => '毎回ボットに何をさせたいですか？';

  @override
  String get routineName => '名前';

  @override
  String get routineEditTitle => 'ルーティンを編集';

  @override
  String get routineEditSubtitle => '実行内容とスケジュールを変更します。';

  @override
  String get routineRecentRuns => '最近の実行';

  @override
  String get routineNoRuns => 'まだ実行されていません。';

  @override
  String get routineSaved => 'ルーティンを保存しました';

  @override
  String get routineStarted => 'ルーティンを開始しました';

  @override
  String get routineWebhook => 'Webhook受信時';

  @override
  String get routines => 'ルーティン';

  @override
  String get routineAdvancedSummary => 'GitHub・Webhookトリガー、Cron、タイムゾーン';

  @override
  String get routineRepeatDaily => '毎日';

  @override
  String get routineRepeatWeekdays => '平日';

  @override
  String get routineRepeatWeekly => '毎週';

  @override
  String get routineDay => '曜日';

  @override
  String get routineTimeLabel => '時刻';

  @override
  String get routineRunsAt => '実行時刻';

  @override
  String routineTimesIn(String timezone) {
    return 'タイムゾーン：$timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'カスタム：$schedule';
  }

  @override
  String get routineOtherTriggers => 'その他のトリガー';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString分ごと',
      one: '1分ごと',
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
      other: '$nString時間ごと',
      one: '1時間ごと',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return '毎時$minute分';
  }

  @override
  String cronDailyAt(String time) {
    return '毎日$time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return '平日$time';
  }

  @override
  String cronWeekendsAt(String time) {
    return '週末$time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days$time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return '毎月$day日$time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items・$last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': '毎週日曜日',
      'mon': '毎週月曜日',
      'tue': '毎週火曜日',
      'wed': '毎週水曜日',
      'thu': '毎週木曜日',
      'fri': '毎週金曜日',
      'sat': '毎週土曜日',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': '日曜日',
      'mon': '月曜日',
      'tue': '火曜日',
      'wed': '水曜日',
      'thu': '木曜日',
      'fri': '金曜日',
      'sat': '土曜日',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'ボットの作業をライブで見る';

  @override
  String get headlessScreenEmpty =>
      'このコンピューターは軽量に保つためブラウザーのみで動作しています。ボットがWebページを開くとここに表示されます。アプリも見て操作したい場合はデスクトップに切り替えてください。';

  @override
  String get headlessScreenChecking => '数秒ごとにページを確認中';

  @override
  String get headlessBrowserOnly => 'ブラウザーのみ';

  @override
  String get switchedToDesktopHere => 'デスクトップに切り替えました。起動すると画面がここに表示されます。';

  @override
  String get desktopBarLabel => 'デスクトップ・メモリを多く使用します';

  @override
  String get switchToBrowserOnly => 'ブラウザーのみに切り替え';

  @override
  String get switchingToBrowserOnly => 'ブラウザーのみに切り替え中…';

  @override
  String get switchedToBrowserOnly => 'ブラウザーのみに切り替えました。メモリの使用量が減りました。';

  @override
  String get runNow => '今すぐ実行';

  @override
  String get secretName => '名前';

  @override
  String get secretNameHelp => '大文字（例：GITHUB_TOKEN）';

  @override
  String get secretValue => '値';

  @override
  String get secrets => 'シークレット';

  @override
  String get serverUrl => 'サーバーURL';

  @override
  String get specUrl => 'OpenAPI仕様URL';

  @override
  String get startFrom => 'ペルソナ';

  @override
  String get storedEncrypted => '暗号化して保存され、再表示されません';

  @override
  String get taskBlocked => 'ブロック中';

  @override
  String get taskDoing => '進行中';

  @override
  String get taskDone => '完了';

  @override
  String get taskTodo => '未着手';

  @override
  String get test => 'テスト';

  @override
  String get timezone => 'タイムゾーン';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => '繰り返し';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => '実行を見る';

  @override
  String get webhookCreated => 'Webhookを作成しました';

  @override
  String get webhookSecret => '署名シークレット';

  @override
  String get webhookShownOnce => '署名シークレットを今すぐコピーしてください。一度しか表示されません。';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot：$summary';
  }

  @override
  String integrationFailed(String error) {
    return '接続に失敗しました：$error';
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
      other: '接続済み（ツール$nString個）',
      one: '接続済み（ツール1個）',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return '次回：$when';
  }

  @override
  String onlySentTo(String hosts) {
    return '$hostsにのみ送信';
  }

  @override
  String requestedAgo(String when) {
    return '$whenにリクエスト';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron（$timezone）';
  }

  @override
  String templateIncludesRoutines(String names) {
    return '含まれるルーティン：$names';
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
      other: 'ツール$nString個',
      one: 'ツール1個',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'ボットが操作を再開しました';

  @override
  String get botComputer => 'コンピューター';

  @override
  String get botComputerDefault => '専用コンピューターがあればそれを使い、なければチームコンピューターを使います';

  @override
  String get botInControl => 'ボットが操作中';

  @override
  String get computerName => '名前';

  @override
  String get computers => 'コンピューター';

  @override
  String get connectingLive => '接続中…';

  @override
  String get dismiss => '閉じる';

  @override
  String get renameTopic => '名前を変更';

  @override
  String get library => 'ライブラリ';

  @override
  String get navLibrary => 'ライブラリ';

  @override
  String get librarySearchHint => 'ライブラリを検索';

  @override
  String get libraryFilterAll => 'すべて';

  @override
  String get libraryFilterPages => 'サイトとゲーム';

  @override
  String get libraryFilterImages => '画像';

  @override
  String get libraryFilterVideos => '動画';

  @override
  String get libraryFilterAudio => '音声';

  @override
  String get libraryFilterDocuments => 'ドキュメント';

  @override
  String get libraryFilterFiles => 'ファイル';

  @override
  String get creationKindPage => 'ページ';

  @override
  String get creationKindImage => '画像';

  @override
  String get creationKindVideo => '動画';

  @override
  String get creationKindAudio => '音声';

  @override
  String get creationKindDocument => 'ドキュメント';

  @override
  String get creationKindFile => 'ファイル';

  @override
  String get libraryPinned => 'ピン留め済み';

  @override
  String get libraryToday => '今日';

  @override
  String get libraryYesterday => '昨日';

  @override
  String get libraryThisWeek => '今週';

  @override
  String get libraryEarlier => 'それ以前';

  @override
  String get videoCantPlay => 'この動画はこのデバイスで再生できません。';

  @override
  String get libraryEmptyTitle => '最初に何を作りますか？';

  @override
  String get libraryEmptyBody => '1つ選ぶとボットが作業を始めます。ボットが作ったものはすべてここに自動で集まります。';

  @override
  String get libraryNoMatch => '一致するものがありません。';

  @override
  String get libraryStarterGame => '小さなゲーム';

  @override
  String get libraryStarterGamePrompt => 'ブラウザーで遊べる小さなゲームを作ってください。';

  @override
  String get libraryStarterLogo => 'ロゴ';

  @override
  String get libraryStarterLogoPrompt => 'プロジェクトのロゴをデザインしてください。';

  @override
  String get libraryStarterSite => '1ページのサイト';

  @override
  String get libraryStarterSitePrompt => '自分のビジネス向けに1ページのWebサイトを作ってください。';

  @override
  String get libraryStarterVideo => '短い動画';

  @override
  String get libraryStarterVideoPrompt => '次の内容で短い動画を作ってください：';

  @override
  String get libraryStarterCard => 'バースデーカード';

  @override
  String get libraryStarterCardPrompt => '次の人向けにバースデーカードを作ってください：';

  @override
  String get libraryStarterReport => 'レポート';

  @override
  String get libraryStarterReportPrompt => '次のテーマを調べてレポートを書いてください：';

  @override
  String get libraryStarterElse => 'その他…';

  @override
  String get creationOpen => '開く';

  @override
  String get creationPlay => '再生';

  @override
  String get creationView => '表示';

  @override
  String get creationChangeIt => '変更する';

  @override
  String creationChangeDraft(String title) {
    return '「$title」について：';
  }

  @override
  String creationMadeBy(String bot) {
    return '作成：$bot';
  }

  @override
  String creationVersion(int n) {
    return 'バージョン$n';
  }

  @override
  String creationFromChat(String bot) {
    return '$botとのチャットから';
  }

  @override
  String creationFromBot(String bot) {
    return '作成：$bot';
  }

  @override
  String get creationFromHelp => '会話へ移動';

  @override
  String get creationDetails => '詳細';

  @override
  String get creationAlongside => '一緒に作成';

  @override
  String creationDeleted(String title) {
    return '「$title」を削除しました';
  }

  @override
  String get showInLibrary => 'ライブラリに表示';

  @override
  String get pinInLibrary => 'ライブラリにピン留め';

  @override
  String get libraryItemNotFound => 'まだライブラリに追加されていません。少し待ってからもう一度お試しください。';

  @override
  String creationPinned(String title) {
    return '「$title」をピン留めしました';
  }

  @override
  String creationUnpinned(String title) {
    return '「$title」のピン留めを外しました';
  }

  @override
  String pageCardUpdated(int version) {
    return '更新済み・バージョン$version';
  }

  @override
  String get madeHere => 'ここで作成';

  @override
  String madeHereEmpty(String bot) {
    return '$botはまだ何も作成していません。';
  }

  @override
  String get madeHereThisChat => 'このチャット';

  @override
  String madeHereByBot(String bot) {
    return '作成：$bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return '$botが作ったほかのもの';
  }

  @override
  String madeHereCount(String count) {
    return 'ここで作成（$count）';
  }

  @override
  String get sidePanelComputer => 'コンピューター';

  @override
  String get madeForTicket => 'このチケット用に作成';

  @override
  String get libraryCantChangePicked => '作成先の本人またはボットの管理者のみが変更できます。';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件削除しました',
      one: '1件削除しました',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件選択中',
      one: '1件選択中',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => '新しい順';

  @override
  String get librarySortOpened => '最近開いた順';

  @override
  String get librarySortName => '名前順';

  @override
  String get libraryScopeMine => '自分向け';

  @override
  String get libraryScopeWorkspace => 'ワークスペース全体';

  @override
  String get libraryFilterSort => '並び替えと絞り込み';

  @override
  String get creationWhoCanSee => '閲覧できる人';

  @override
  String get libraryTile => 'ライブラリ';

  @override
  String get libraryTileHelp => '作成したもの';

  @override
  String get regenerateReply => '再生成';

  @override
  String get deleteMessage => 'メッセージを削除';

  @override
  String get deleteMessageTitle => 'このメッセージを削除しますか？';

  @override
  String get deleteMessageBody => 'このチャットの全員から削除されます。前後のメッセージは残ります。';

  @override
  String get messageDeleted => 'メッセージを削除しました';

  @override
  String get findInChat => 'チャット内を検索';

  @override
  String get findInChatHint => 'このチャット内を検索';

  @override
  String findInChatCount(int index, int count) {
    return '$index / $count';
  }

  @override
  String get findInChatNone => '一致なし';

  @override
  String get findPrevious => '前の一致';

  @override
  String get findNext => '次の一致';

  @override
  String get closeFind => '検索を閉じる';

  @override
  String get pinTopic => 'ピン留め';

  @override
  String get unpinTopic => 'ピン留めを外す';

  @override
  String get inAppAlertReview => '確認';

  @override
  String get forBot => '対象ボット';

  @override
  String get handBack => '操作を戻す';

  @override
  String get handBackNote => 'ボットへのメモ（任意）';

  @override
  String get handBackNoteHint => '例：サインインしたので続けてください';

  @override
  String get live => 'ライブ';

  @override
  String get liveView => 'ライブビュー';

  @override
  String get liveViewHelp => 'このコンピューターをリアルタイムで見て、必要なときに操作できます。';

  @override
  String get newComputer => '新しいコンピューター';

  @override
  String get newComputerHelp =>
      '専用コンピューターは1体のボット専用です。ファイルはチームコンピューターと分けて保存されます。';

  @override
  String get openLiveView => 'ライブビューを開く';

  @override
  String get liveExpand => '全画面表示';

  @override
  String get liveCopy => 'コピー';

  @override
  String get liveScreenshot => 'スクリーンショット';

  @override
  String get liveScreenshots => 'スクリーンショット';

  @override
  String get liveScreenshotsHelp => 'このネットワークではライブ映像が通らないため、画面は約1秒ごとに更新されます。';

  @override
  String get liveReconnecting => '再接続中…';

  @override
  String get liveReconnectingHelp =>
      'ライブ映像が切断されました（サーバーが再起動中の可能性があります）。再接続を試みている間はスクリーンショットを表示します。';

  @override
  String get liveTryAgain => '再試行';

  @override
  String get liveDroppedHelp =>
      'ライブ映像が復旧しなかったため、画面は約1秒ごとに更新されます。「再試行」をタップしてください。';

  @override
  String get liveMore => 'その他';

  @override
  String get liveSaveScreenshot => 'スクリーンショットを保存';

  @override
  String get liveCopyFromComputer => 'コンピューターからコピー';

  @override
  String get livePasteToComputer => 'コンピューターに貼り付け';

  @override
  String get liveRotateHint => '大きな画面で見るにはスマートフォンを横向きにしてください';

  @override
  String get liveWatching => '視聴中';

  @override
  String get liveCopied => 'コンピューターからコピーしました。';

  @override
  String get liveNothingCopied => '何もコピーされていません。先にコンピューター上で何かを選択してください。';

  @override
  String get livePasteEmpty => 'クリップボードが空です。';

  @override
  String get liveMinimize => 'サイドパネルに戻る';

  @override
  String get liveShownFullScreen => 'ライブビューは全画面で開いています。';

  @override
  String get liveStillWatching => 'まだ見ていますか？';

  @override
  String get liveStillWatchingHelp => '省電力のため、誰も見ていないときはコンピューターがスリープします。';

  @override
  String get liveKeepWatching => '視聴を続ける';

  @override
  String get livePausedToSavePower => '省電力のため一時停止しました';

  @override
  String get livePausedToSavePowerHelp =>
      '誰も見ていなかったためコンピューターを休止しました。「再開」で再び起動します。';

  @override
  String get liveResume => '再開';

  @override
  String get paused => '一時停止中';

  @override
  String get pausedUserInControl => '一時停止中：人が画面を操作しています';

  @override
  String get letBotUseTerminal => 'ターミナルとファイルの使用を許可';

  @override
  String get screenHandedBack => '画面の操作を戻しました';

  @override
  String get privateComputer => '専用コンピューター';

  @override
  String get profileDesktop => 'デスクトップ';

  @override
  String get profileHeadless => 'Headless';

  @override
  String get rename => '名前を変更';

  @override
  String get rightClickNextTap => '次のタップで右クリック';

  @override
  String get screenshotMode => 'スクリーンショット（このネットワークではライブ映像を利用できません）';

  @override
  String get showKeyboard => 'キーボード';

  @override
  String get someoneElseInControl => 'ほかの人が操作中です';

  @override
  String get switchToDesktop => 'デスクトップに切り替え';

  @override
  String get switchToHeadless => 'Headlessに切り替え';

  @override
  String get switchProfileConfirm =>
      '切り替えるためにコンピューターを再起動します。ファイルは保持されますが、現在実行中の作業は停止します。';

  @override
  String get switchProfileButton => '切り替え';

  @override
  String get switchingToDesktop => 'デスクトップに切り替え中…';

  @override
  String get switchingToHeadless => 'Headlessに切り替え中…';

  @override
  String get switchedToDesktop => 'デスクトップに切り替えました。画面を見るにはライブビューを開いてください。';

  @override
  String get switchedToHeadless => 'Headlessに切り替えました。メモリの使用量が減りました。';

  @override
  String get takeControl => '操作を代わる';

  @override
  String get takeoverCompleted => '操作を戻しました';

  @override
  String get takeoverDismissed => '拒否しました';

  @override
  String get takeoverPrivacy => '操作を代わっている間、ボットは一時停止し、入力や画面の内容はボットに送信されません。';

  @override
  String get liveShellOnTooltip => '操作を代わっている間も、ボットがターミナルとファイルを使い続けられるようにします';

  @override
  String get liveShellOffTooltip => '操作を代わっている間は、ボットのターミナルとファイルも一時停止します';

  @override
  String get liveShellOnNote =>
      'ボットはターミナルとファイルを引き続き使えますが、操作を戻すまで画面は見えず操作もできません。';

  @override
  String get liveShellOffNote => '操作を戻すまでボットは完全に一時停止します。';

  @override
  String get teamComputer => 'チームコンピューター';

  @override
  String get withDesktop => 'デスクトップ付き';

  @override
  String get withDesktopHelp => 'ライブ視聴できる画面を追加します（メモリ使用量が増えます）';

  @override
  String get youAreInControl => '操作中です';

  @override
  String botAsksForHelp(String reason) {
    return 'ボットからの確認：$reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$botがあなたの助けを求めています';
  }

  @override
  String deleteComputerConfirm(String name) {
    return '$nameを削除しますか？ファイル、スナップショット、復元ポイントも削除されます。';
  }

  @override
  String latencyMs(int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return '${msString}ms';
  }

  @override
  String privateComputerOf(String bot) {
    return '$botのコンピューター';
  }

  @override
  String get micPermissionNeeded => '音声入力するにはマイクへのアクセスを許可してください。';

  @override
  String get dictationEmpty => '音声が認識されませんでした。もう一度お試しください。';

  @override
  String get startCall => '音声通話を始める';

  @override
  String get stopDictation => '停止して文字起こし';

  @override
  String get dictate => '音声入力';

  @override
  String get dictateOnDevice => 'このデバイスで音声入力';

  @override
  String get stopListening => '聞き取りを停止';

  @override
  String get dictationRetry => '再試行';

  @override
  String get dictationSayAgain => 'もう一度話す';

  @override
  String get dictationFailed => 'テキストに変換できませんでした。';

  @override
  String get dictationFailedUseDevice =>
      'テキストに変換できませんでした。もう一度話すとこのデバイスで聞き取ります。';

  @override
  String get dictationNoServiceUseDevice =>
      'このワークスペースでは音声入力が設定されていません。代わりにこのデバイスで聞き取れます。';

  @override
  String get dictationDeviceFailed => 'デバイスの音声入力が停止したため、マイクをCasama側に戻しました。';

  @override
  String get dictationDevicePermission => 'このデバイスで音声入力するには音声認識を許可してください。';

  @override
  String get readAloud => '読み上げる';

  @override
  String get callConnecting => '接続中…';

  @override
  String get callLive => '通話中';

  @override
  String get callEnded => '通話を終了しました';

  @override
  String get callEndedIdle => '2分間無音が続いたため通話を終了しました。';

  @override
  String get callFailed => '通話に接続できませんでした。';

  @override
  String get callListening => '聞き取り中';

  @override
  String get callSpeaking => '発話中';

  @override
  String get callWorking => '作業中';

  @override
  String get callMutedState => 'ミュート中';

  @override
  String get callCaptions => '字幕';

  @override
  String get callSpeaker => 'スピーカー';

  @override
  String get callEarpiece => '受話口';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'ヘッドホン';

  @override
  String get callAudioOutput => '通話音声の出力先';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'プロフィール画像を変更中',
      'memory_search': 'メモリーを検索中',
      'memory_write': 'メモリーに保存中',
      'memory': 'メモリーを更新中',
      'knowledge_search': 'ナレッジを検索中',
      'web_search': 'Webを検索中',
      'web': 'Webページを読み込み中',
      'browser_open': 'Webサイトを開いています',
      'browser_click': 'ページをクリック中',
      'browser_type': 'ページに入力中',
      'browser_press': 'キーを押しています',
      'browser_scroll': 'ページをスクロール中',
      'browser_look': 'ページを確認中',
      'desktop_click': '画面をクリック中',
      'desktop_type': '入力中',
      'desktop_press': 'キーを押しています',
      'desktop_launch': 'アプリを起動中',
      'desktop_look': '画面を確認中',
      'shell': 'コンピューターで作業中',
      'files_read': 'ファイルを読み込み中',
      'files_write': 'ファイルを書き込み中',
      'files_list': 'ファイル一覧を確認中',
      'files_search': 'ファイルを検索中',
      'files_from_chat': 'チャットからファイルを取得中',
      'http': 'サービスに接続中',
      'data_search': 'データを検索中',
      'data_call': 'データを取得中',
      'skills_load': 'スキルを準備中',
      'skills_create': '新しいスキルを習得中',
      'skills_update': 'スキルを改善中',
      'checkpoint': 'チェックポイントを保存中',
      'computer_restart': 'コンピューターを再起動中',
      'takeover': '操作の交代を依頼中',
      'delegate': 'ヘルパーに依頼中',
      'routines_list': 'ルーティンを確認中',
      'routines_create': 'ルーティンを設定中',
      'routines_update': 'ルーティンを更新中',
      'routines_delete': 'ルーティンを削除中',
      'watchers_create': 'ウォッチャーを設定中',
      'watchers_list': 'ウォッチャーを確認中',
      'watchers_delete': 'ウォッチャーを削除中',
      'tasks_list': 'タスクを確認中',
      'tasks_create': 'タスクを追加中',
      'tasks': 'タスクを更新中',
      'notify_user': 'メモを送信中',
      'usage_report': '利用状況を確認中',
      'device_read': 'デバイスデータを読み込み中',
      'device_access': 'デバイスへのアクセスを依頼中',
      'pages_publish': 'ページを公開中',
      'pages': 'ページを更新中',
      'media': '画像を作成中',
      'media_video': '動画を作成中',
      'bots_create': '新しいボットを作成中',
      'bots_update': 'ボットを更新中',
      'bots_list': 'ボットを確認中',
      'bots_archive': 'ボットをアーカイブ中',
      'channel_send': 'メッセージを送信中',
      'links_ask': '連絡先のアシスタントに確認中',
      'logins_list': '保存済みログインを確認中',
      'replay_run': '保存済み手順を繰り返しています',
      'replay_save': '手順を保存中',
      'setup_apply': '設定を提案中',
      'sidebar_organize': 'サイドバーを整理中',
      'suggestions_add': '提案を追加中',
      'teach_save_draft': 'スキルの下書きを保存中',
      'welcome_name': '名前を決定中',
      'secrets_request': 'シークレットの入力を依頼中',
      'pages_list': 'ページを確認中',
      'pages_share': '公開範囲を変更中',
      'projects_create': 'プロジェクトを開始中',
      'projects_status': 'プロジェクトを確認中',
      'projects_update': 'プロジェクトを更新中',
      'projects': 'プロジェクトを計画中',
      'payments': '支払いの承認を依頼中',
      'voice_call': 'お店や企業に電話中',
      'voice_call_user': 'あなたに発信中',
      'tools_load': '準備中',
      'ui_show': '表示を準備中',
      'start_task': 'チャットで開始中',
      'adult_sites_turn_on': 'アダルトサイトの有効化を依頼中',
      'connections_attach': 'アプリの利用を開始中',
      'other': '作業中',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'プロフィール画像を変更しました',
      'memory_search': 'メモリーを検索しました',
      'memory_write': 'メモリーに保存しました',
      'memory': 'メモリーを更新しました',
      'knowledge_search': 'ナレッジを検索しました',
      'web_search': 'Webを検索しました',
      'web': 'Webページを読み込みました',
      'browser_open': 'Webサイトを開きました',
      'browser_click': 'ページをクリックしました',
      'browser_type': 'ページに入力しました',
      'browser_press': 'キーを押しました',
      'browser_scroll': 'ページをスクロールしました',
      'browser_look': 'ページを確認しました',
      'desktop_click': '画面をクリックしました',
      'desktop_type': '入力しました',
      'desktop_press': 'キーを押しました',
      'desktop_launch': 'アプリを起動しました',
      'desktop_look': '画面を確認しました',
      'shell': 'コンピューターで作業しました',
      'files_read': 'ファイルを読み込みました',
      'files_write': 'ファイルを書き込みました',
      'files_list': 'ファイル一覧を確認しました',
      'files_search': 'ファイルを検索しました',
      'files_from_chat': 'チャットからファイルを取得しました',
      'http': 'サービスに接続しました',
      'data_search': 'データを検索しました',
      'data_call': 'データを取得しました',
      'skills_load': 'スキルを使用しました',
      'skills_create': '新しいスキルを習得しました',
      'skills_update': 'スキルを改善しました',
      'checkpoint': 'チェックポイントを保存しました',
      'computer_restart': 'コンピューターを再起動しました',
      'takeover': '操作の交代を依頼しました',
      'delegate': 'ヘルパーに依頼しました',
      'routines_list': 'ルーティンを確認しました',
      'routines_create': 'ルーティンを設定しました',
      'routines_update': 'ルーティンを更新しました',
      'routines_delete': 'ルーティンを削除しました',
      'watchers_create': 'ウォッチャーを設定しました',
      'watchers_list': 'ウォッチャーを確認しました',
      'watchers_delete': 'ウォッチャーを削除しました',
      'tasks_list': 'タスクを確認しました',
      'tasks_create': 'タスクを追加しました',
      'tasks': 'タスクを更新しました',
      'notify_user': 'メモを送信しました',
      'usage_report': '利用状況を確認しました',
      'device_read': 'デバイスデータを読み込みました',
      'device_access': 'デバイスへのアクセスを依頼しました',
      'pages_publish': 'ページを公開しました',
      'pages': 'ページを更新しました',
      'media': '画像を作成しました',
      'media_video': '動画を作成しました',
      'bots_create': '新しいボットを作成しました',
      'bots_update': 'ボットを更新しました',
      'bots_list': 'ボットを確認しました',
      'bots_archive': 'ボットをアーカイブしました',
      'channel_send': 'メッセージを送信しました',
      'links_ask': '連絡先のアシスタントに確認しました',
      'logins_list': '保存済みログインを確認しました',
      'replay_run': '保存済み手順を繰り返しました',
      'replay_save': '手順を保存しました',
      'setup_apply': '設定を提案しました',
      'sidebar_organize': 'サイドバーを整理しました',
      'suggestions_add': '提案を追加しました',
      'teach_save_draft': 'スキルの下書きを保存しました',
      'welcome_name': '名前を決めました',
      'secrets_request': 'シークレットの入力を依頼しました',
      'pages_list': 'ページを確認しました',
      'pages_share': '公開範囲を変更しました',
      'projects_create': 'プロジェクトを開始しました',
      'projects_status': 'プロジェクトを確認しました',
      'projects_update': 'プロジェクトを更新しました',
      'projects': 'プロジェクトを計画しました',
      'payments': '支払いの承認を依頼しました',
      'voice_call': 'お店や企業に電話しました',
      'voice_call_user': 'あなたに発信しました',
      'tools_load': '準備しました',
      'ui_show': '表示しました',
      'start_task': 'チャットで開始しました',
      'adult_sites_turn_on': 'アダルトサイトの有効化を依頼しました',
      'connections_attach': 'アプリの利用を開始しました',
      'other': '完了',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return '$appを使用中';
  }

  @override
  String toolUsedApp(String app) {
    return '$appを使用しました';
  }

  @override
  String get toolDetails => '詳細';

  @override
  String approvalAsking(String bot) {
    return '$botが事前に確認しています';
  }

  @override
  String get approvalLookClosely => '許可する前によく確認してください';

  @override
  String approvalAttachConnection(String app) {
    return 'このワークスペースですでに接続済みの$appの使用を開始します';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return '確認なしで$botにこの操作を任せる';
  }

  @override
  String get pageShareToPublic => 'リンクを知っている人なら誰でも開けます';

  @override
  String get pageShareToWorkspace => 'このワークスペースの全員が開けます';

  @override
  String get pageShareToPrivate => 'あなただけが開けます';

  @override
  String approvalAllowedLine(String what) {
    return '許可済み：$what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return '拒否済み：$what';
  }

  @override
  String approvalExpiredLine(String what) {
    return '時間切れ：$what';
  }

  @override
  String get callToolFailed => 'うまくいきませんでした';

  @override
  String get callToolNeedsOk => '続行するには承認が必要です';

  @override
  String get callToolAllow => '許可';

  @override
  String get callToolNotNow => '今はしない';

  @override
  String get callToolAllowed => '許可しました。結果はチャットに表示されます';

  @override
  String get callToolDeclined => '今回は見送りました';

  @override
  String get callToolBackground => 'まだ作業中です。結果はチャットに表示されます';

  @override
  String get callToolInChat => '結果はチャットに表示されます';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString秒';
  }

  @override
  String get callNeedsKeyTitle => '通話にはGoogle AIキーが必要です';

  @override
  String get callNeedsKeyBody =>
      'ライブ通話はGoogleのGemini Liveで動作するため、このワークスペースにはGoogle AIキーが必要です。通話にのみ使用され、読み上げ、音声入力、画像、動画はOpenRouterで実行されます。Google AI Studioで無料キーを作成し、「モデルキー」に追加するとすぐに通話できます。キーを追加できるのはワークスペースのオーナーと管理者のみです。';

  @override
  String get callAddKey => 'Google AIキーを追加';

  @override
  String get callGetFreeKey => 'Googleから無料キーを取得';

  @override
  String get callMicUnmute => 'マイクオン';

  @override
  String get videoUnmute => '音声をオン';

  @override
  String get callMicMute => 'マイクオフ';

  @override
  String get videoMute => '音声をオフ';

  @override
  String get hangUp => '通話を終了';

  @override
  String callWith(String bot) {
    return '$botと通話';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return '$fromとの通話を終了して$toと通話しますか？';
  }

  @override
  String get callSwitchBody => '同時に行える通話は1つだけです。現在の通話は先にチャットへ保存されます。';

  @override
  String get callSwitchConfirm => '終了して通話';

  @override
  String get callVoiceConsentTitle => '音声はGoogleに送信されます';

  @override
  String get callVoiceConsentBody =>
      '通話中、Casamaはあなたの音声と話した内容をGoogle Geminiに送信し、Geminiがそれを聞き取ってボットの返答を音声にします。通話で話した内容は、ボットが使うAIモデルにもOpenRouter経由で送信されます。同意するまで何も送信されません。この共有は「設定 → プライバシー」でいつでも停止できます。';

  @override
  String get callVoiceConsentAgree => '同意して通話';

  @override
  String get callVoiceConsentNotNow => '今はしない';

  @override
  String get callEndedLost => '接続が長時間途切れたため、通話を終了しました。';

  @override
  String get callMinimize => '最小化';

  @override
  String get callEndCall => '通話を終了';

  @override
  String get callEndAndAnswer => '終了して応答';

  @override
  String get callReconnecting => '再接続中…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分',
      one: '1分',
      zero: '1分未満',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return '$botと通話中・$time・タップで戻る';
  }

  @override
  String callReturnBar(String bot) {
    return '$botと通話中・タップで戻る';
  }

  @override
  String get callOpen => '通話を開く';

  @override
  String get callOnHold => '保留中';

  @override
  String get callNotificationLive => '通話中';

  @override
  String get callNotificationMuted => 'ミュート中';

  @override
  String get callNotificationChannel => '通話';

  @override
  String callTabTitle(String time) {
    return '通話中・$time';
  }

  @override
  String get callMenuShow => '通話を表示';

  @override
  String get callJobWorking => '作業中';

  @override
  String callJobStrip(String task) {
    return '作業中：$task';
  }

  @override
  String callJobNeedsYou(String task) {
    return '確認が必要：$task';
  }

  @override
  String get callTileWatching => 'ライブビュー';

  @override
  String get callTileDone => '完了';

  @override
  String get callTileNeedsYou => '確認が必要';

  @override
  String callTileLabel(String state) {
    return 'ボットの画面（$state）。タップで全画面表示';
  }

  @override
  String get callTileHide => '画面を隠す';

  @override
  String get screenCardLive => 'ライブ';

  @override
  String screenCardLabel(String bot, String state) {
    return '$botの画面（$state）';
  }

  @override
  String get screenCardOpen => '全画面で開く';

  @override
  String get screenCardYouHave => '画面を操作中です';

  @override
  String screenCardHeldBy(String name) {
    return '$nameが画面を操作中です';
  }

  @override
  String get screenCardMore => 'その他のオプション';

  @override
  String screenCardIntro(String bot) {
    return '$botの画面です。タップで視聴、ドラッグで移動できます。';
  }

  @override
  String get screenCardHideForNow => '今は隠す';

  @override
  String get screenCardDontShow => '自動で表示しない';

  @override
  String get screenCardTurnedOff => '画面カードはオフです。設定で再びオンにできます。';

  @override
  String get screenCardOfferOff => '画面カードをよく非表示にしていますか？オフにできます。';

  @override
  String get screenCardTurnOff => 'オフにする';

  @override
  String screenCardNeedsYou(String bot) {
    return '$botが画面での操作を求めています';
  }

  @override
  String callRecapTitle(String length) {
    return '通話・$length';
  }

  @override
  String get callRecapStarted => '通話中に開始';

  @override
  String get callRecapTaskDone => '完了';

  @override
  String get callRecapTaskFailed => '未完了';

  @override
  String get callRecapTaskStopped => '停止';

  @override
  String get callRecapTaskRunning => '作業中';

  @override
  String get callRecapOpenRun => '実行内容を見る';

  @override
  String get summarizeCalls => '通話を要約する';

  @override
  String get summarizeCallsHelp =>
      '各通話の終了後、内容と次のアクションをカードに表示します。ボットの小型モデルを少し使用します。';

  @override
  String callCardVoice(String length) {
    return '音声通話・$length';
  }

  @override
  String callCardPhone(String length) {
    return '電話通話・$length';
  }

  @override
  String callCardDropped(String length) {
    return '通話切断・$length';
  }

  @override
  String callCardMissed(String name) {
    return '$nameからの不在着信';
  }

  @override
  String callCardLive(String name) {
    return '$nameと通話中';
  }

  @override
  String get callCardLiveElsewhere => '別のデバイスで通話中';

  @override
  String get callCardReturn => '通話に戻る';

  @override
  String callCardBotHungUp(String name) {
    return '$nameが通話を終了しました';
  }

  @override
  String get callCardEndedQuiet => '無音が続いたため終了しました';

  @override
  String get callCardEndedLimit => '通話時間の上限に達したため終了しました';

  @override
  String get callCardWritingSummary => '要約を作成中…';

  @override
  String callCardSummaryBy(String name) {
    return '要約作成：$name';
  }

  @override
  String get callCardNextSteps => '次のステップ';

  @override
  String get callCardDoIt => '実行する';

  @override
  String get callCardDismissStep => '閉じる';

  @override
  String get callCardStepStarted => '開始しました';

  @override
  String get callCardStepFailed => '開始できませんでした。もう一度お試しください。';

  @override
  String get callCardDoneOnCall => '通話中に完了';

  @override
  String callCardMore(int count) {
    return 'ほか$count件';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '文字起こし・$countターン',
      one: '文字起こし・1ターン',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => '文字起こし';

  @override
  String get callCardSearchTranscript => '文字起こしを検索';

  @override
  String get callCardNoMatches => '一致なし';

  @override
  String get callCardYou => 'あなた';

  @override
  String get callCardCallBack => 'かけ直す';

  @override
  String get callCardCopy => 'コピー';

  @override
  String get callCardCopied => 'コピーしました';

  @override
  String get callCardShare => '共有';

  @override
  String get callCardMoreActions => 'その他';

  @override
  String get callCardDelete => '通話を削除';

  @override
  String get callCardDeleteTitle => 'この通話を削除しますか？';

  @override
  String get callCardDeleteBody => 'カードと文字起こしがこのチャットから削除されます。開始された作業の結果は残ります。';

  @override
  String get callCardDeleted => '通話を削除しました';

  @override
  String get callCardDeleteFailed => '通話を削除できませんでした';

  @override
  String callCardSemantics(String title, String summary) {
    return '$title。$summary';
  }

  @override
  String replyLatency(int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return '応答開始まで${msString}ms';
  }

  @override
  String get voiceSettings => '音声';

  @override
  String get voiceSettingsHelp => '読み上げ音声と通話中にボットが使えるツール';

  @override
  String get callTools => '通話中のツール';

  @override
  String get callToolsHelp =>
      '通話ではメモリー、Web検索、あなたへのメモ、ルーティン、チケットがすでに使え、大きな作業はチャットに引き継がれます。通話中に使わせたい接続済みアプリのツールを追加してください（追加するごとに通話コストがわずかに増えます）。';

  @override
  String get callToolsNone =>
      'このボットにはまだ接続済みアプリが有効になっていません。「連携」でオンにしてから、ここでツールを選んでください。';

  @override
  String get openIntegrations => '連携を開く';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '接続済みアプリのツール$countString個を追加済み',
      one: '接続済みアプリのツール1個を追加済み',
      zero: '組み込みの音声ツールのみ',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => '音声ID（任意）';

  @override
  String get voiceIdHelp => 'KoreやPuckなどのGemini音声名（空欄の場合はKore）';

  @override
  String get useThisComputer => 'このコンピューターをボットに使う';

  @override
  String get companionDesktopOnly =>
      'ボット用コンピューターとして動作できるのはデスクトップアプリ（macOS、Windows、Linux）のみです。';

  @override
  String get companionIntro =>
      '選んだボットがこのコンピューターで作業できるようにします。コマンドの実行、選んだフォルダー内のファイル編集、ブラウザーやアプリの操作が行えます。すべての操作は画面に表示され、いつでも停止できます。各機能を承認するまでオフのままです。';

  @override
  String get thisComputer => 'このコンピューター';

  @override
  String get companionOnline => 'オン：許可したボットがこのコンピューターを使えます';

  @override
  String get companionError => 'Casamaに接続できません。再試行中';

  @override
  String get companionOff => 'オフ';

  @override
  String get companionCapabilities => 'ボットに許可する操作';

  @override
  String get companionCapabilitiesHelp =>
      '項目ごとに承認してください。ボットの自律性に関わらず、リスクの高い操作は常に確認します。';

  @override
  String get capShell => 'コマンドの実行（共有フォルダー内）';

  @override
  String get capFiles => '共有フォルダー内のファイルを読み取り・編集';

  @override
  String get capBrowser => 'ブラウザーを使用（あなたのものとは別）';

  @override
  String get capDesktop => 'デスクトップアプリを使用';

  @override
  String get sharedFolders => '共有フォルダー';

  @override
  String get sharedFoldersHelp => 'ボットはこのフォルダーにのみアクセスできます。';

  @override
  String get addFolder => 'フォルダーを追加';

  @override
  String get botsAllowed => '許可されたボット';

  @override
  String get botsAllowedHelp =>
      '許可されたボットはこのコンピューターでも作業できます。各ボットは専用コンピューターを保持し、このコンピューターが必要な作業のときだけこちらを使います。';

  @override
  String get worksOnTitle => '動作場所';

  @override
  String worksOnSubtitle(String bot) {
    return '$botがコマンド実行、ファイル操作、ブラウズを行う場所です。';
  }

  @override
  String get worksOnAuto => '自動';

  @override
  String worksOnAutoHelp(String bot) {
    return '$botがステップごとに判断します。あなたのコンピューターが必要な場合を除き、自身のコンピューターを使います。';
  }

  @override
  String get worksOnBot => 'ボットのコンピューターのみ';

  @override
  String get worksOnBotHelp => 'あなたのコンピューターは一切使いません。';

  @override
  String get worksOnMine => '自分のコンピューターのみ';

  @override
  String get worksOnMineHelp => 'すべてあなたのコンピューター上で実行されるため、電源が入っている必要があります。';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'すべて$computer上で実行されるため、電源が入っている必要があります。';
  }

  @override
  String worksOnLine(String mode) {
    return '動作場所：$mode';
  }

  @override
  String placesTitle(String bot) {
    return '$botの作業場所';
  }

  @override
  String get placesSubtitle => 'ここで表示するコンピューターを選びます。ボットがどこで作業するかは「動作場所」で決まります。';

  @override
  String placesBarLabel(String computer, String mode) {
    return '$computerを表示中・動作場所：$mode・変更';
  }

  @override
  String get placeYoursOnline => '自分のコンピューター・オンライン';

  @override
  String get placeYoursOffline => '自分のコンピューター・オフライン';

  @override
  String get placeTeamComputer => 'チームコンピューター';

  @override
  String placeBotsOwn(String bot) {
    return '$botの専用コンピューター';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$computerで$action';
  }

  @override
  String get botYourComputer => '自分のコンピューター';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer・$mode';
  }

  @override
  String get botYourComputerNone => 'どの自分のコンピューターでも許可されていません';

  @override
  String botYourComputerHow(String bot) {
    return '$botが自分のコンピューターでも作業できるようにするには、そのコンピューターでCasamaを開き、「設定 → このコンピューターをボットに使う → 許可されたボット」でオンにしてください。いずれの場合も専用コンピューターは保持されます。';
  }

  @override
  String get routineWhere => '作業場所';

  @override
  String get routineWhereHelp => 'このルーティンがコマンドを実行しファイルを使用する場所です。';

  @override
  String get routineWhereBot => 'ボットのコンピューター';

  @override
  String get routineWhereBotHelp => 'あなたのコンピューターの電源が入っていなくても実行されます。';

  @override
  String get routineWhereMine => '電源オン時は自分のコンピューター';

  @override
  String get routineWhereMineHelp =>
      '自分のファイルやアプリでの作業向けです。コンピューターがオフだった場合は実行結果に表示されます。';

  @override
  String get routineUsesComputer => 'コンピューターを使用';

  @override
  String get routineUsesComputerOn => 'ファイルの保存、コマンドの実行、ページの閲覧ができます。';

  @override
  String get routineUsesComputerOff =>
      'アプリ、Web、メモリーのみを読み取ります。高速で、コンピューターを起動することもありません。';

  @override
  String get computerBotsAllowed => '許可されたボット';

  @override
  String get unpairComputer => 'このコンピューターの使用を停止して連携を解除';

  @override
  String botActingHere(String bot, String action) {
    return '$botがこのコンピューターで作業中：$action';
  }

  @override
  String get quickAsk => 'クイック質問';

  @override
  String get quickAskHint => 'ボットに何でも聞く…';

  @override
  String get bot => 'ボット';

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
  String get cloudModelsTitle => 'クラウドモデル';

  @override
  String get cloudModelsHelp => '数秒以内にすべてのCloudサーバーに適用されます。';

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
  String get connectionsTitle => 'アプリ接続';

  @override
  String get connectionsServerComposio => 'CasamaのComposioアカウント';

  @override
  String get connectionsServerComposioHelp =>
      '独自のサインインを持たないアプリは、このサーバーのComposioアカウント経由でワンクリック接続できます。';

  @override
  String get connectionsOwnAccounts => '各自のアカウント';

  @override
  String get connectionsOwnAccountsHelp =>
      '各自が自分のComposio、Pipedream、またはZapierを使用します。';

  @override
  String get connectionsNoComposioKey =>
      'Casamaのアカウントを使うには、このサーバーにCOMPOSIO_API_KEYを追加してください。';

  @override
  String get connectionsGoogleTitle => 'Googleアプリ';

  @override
  String get connectionsGoogleComposio => 'Composio経由';

  @override
  String get connectionsGoogleComposioHelp => 'Gmail、カレンダー、ドライブなどがすぐに使えます。';

  @override
  String get connectionsGoogleDirect => 'Google独自のサーバー';

  @override
  String get connectionsGoogleDirectHelp =>
      'Google Workspace Developer Previewへの登録が必要です。';

  @override
  String get notInstanceOwner => '管理コンソールを開けるのはインスタンスオーナーのみです。';

  @override
  String get runs24h => '実行（24時間）';

  @override
  String get failedRuns24h => '失敗した実行（24時間）';

  @override
  String get cost24h => '支出（24時間）';

  @override
  String get computersRunning => '稼働中のコンピューター';

  @override
  String get devicesOnline => 'オンラインの個人コンピューター';

  @override
  String get editQuotas => '上限を編集';

  @override
  String get maxBots => 'ボット数の上限';

  @override
  String get monthlyUsd => '月間支出上限（USD）';

  @override
  String updateAvailable(String latest, String current) {
    return 'Casama $latestが利用可能です（現在：$current）';
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
      other: '$nStringワークスペース',
      one: '1ワークスペース',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return '$whenにサインイン';
  }

  @override
  String quotasFor(String name) {
    return '$nameの上限';
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
      other: 'メンバー$nString人',
      one: 'メンバー1人',
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
      other: '$nString体のボット',
      one: '1体のボット',
    );
    return '$_temp0';
  }

  @override
  String cost30d(String usd) {
    return '30日間で$usd';
  }

  @override
  String get connectingToServer => 'Casamaに接続中…';

  @override
  String get cannotReachServer => 'Casamaサーバーに接続できません';

  @override
  String get connectionFailed => 'Casamaサーバーに接続できませんでした。接続を確認してもう一度お試しください。';

  @override
  String get serverNotResponding => 'Casamaサーバーが応答していません。少し待ってからもう一度お試しください。';

  @override
  String cannotReachServerHelp(String url) {
    return '接続状況、または$urlのサーバーが稼働しているか確認してください。';
  }

  @override
  String get serverUnreachableBody =>
      'オンライン状態をご確認ください。接続できている場合、サーバーが再起動中の可能性があるため再試行を続けます。';

  @override
  String retryingIn(int seconds) {
    return '$seconds秒後に再試行';
  }

  @override
  String get retryingNow => '試行中…';

  @override
  String get upgradeTitle => 'プランをアップグレード';

  @override
  String get notNow => '今はしない';

  @override
  String get seePlans => 'プランを見る';

  @override
  String get billing => '請求';

  @override
  String get billingOffSelfHosted =>
      'このサーバーでは請求が無効です。独自のライセンスで動作しています（個人利用は1人まで無料、チーム利用にはBusinessライセンスが必要です）。';

  @override
  String get restorePurchases => '購入を復元';

  @override
  String get restoreStarted => '購入履歴を確認中…';

  @override
  String get plans => 'プラン';

  @override
  String get currentPlan => '現在のプラン';

  @override
  String subscribeFor(String price) {
    return '$priceで定期購入';
  }

  @override
  String get subscribeOnWeb => 'Webで定期購入';

  @override
  String get credits => 'クレジット';

  @override
  String get creditHistory => 'クレジット履歴';

  @override
  String get creditReasonPurchase => 'クレジット購入';

  @override
  String get creditReasonGrant => 'クレジット付与';

  @override
  String get creditReasonRefund => '返金';

  @override
  String get creditReasonAdjustment => '調整';

  @override
  String get creditReasonExpire => 'クレジット失効';

  @override
  String limitBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ボット$countString体',
      one: 'ボット1体',
    );
    return '$_temp0';
  }

  @override
  String get limitBotsUnlimited => 'ボット数無制限';

  @override
  String get unlimitedValue => '無制限';

  @override
  String trialDaysFree(int n) {
    return '$n日間無料';
  }

  @override
  String get extraPeople => '追加メンバー';

  @override
  String extraPeopleHelp(String price, int seats) {
    return 'プランに含まれる$seats名を超える場合は、1人あたり月額$priceです。';
  }

  @override
  String get extraPeopleSaved => '追加メンバーを更新しました';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '月間コンピューター利用時間$hoursString時間';
  }

  @override
  String limitCredits(String amount) {
    return '月間クレジット$amount';
  }

  @override
  String get viaWeb => 'Webで請求';

  @override
  String get viaAppStore => 'App Storeで請求';

  @override
  String get viaGooglePlay => 'Google Playで請求';

  @override
  String get yourPlan => '現在のプラン';

  @override
  String planEndsOn(String date) {
    return '$dateに終了';
  }

  @override
  String planRenewsOn(String date) {
    return '$dateに更新';
  }

  @override
  String creditsBalance(String amount) {
    return 'クレジット残高：$amount';
  }

  @override
  String get manageSubscription => 'サブスクリプションを管理';

  @override
  String get compViaCasama => 'Casamaから無料提供';

  @override
  String compFreeUntil(String date) {
    return '$dateまで無料';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'テスト購入。テスター上限が適用されます：月間クレジット$credits、1日$daily。';
  }

  @override
  String compKeepPlan(String plan) {
    return '$planを維持';
  }

  @override
  String get haveGiftCode => 'ギフトコードをお持ちですか？';

  @override
  String get redeemCodeTitle => 'ギフトコードを使う';

  @override
  String get redeemCodeIntro =>
      'お持ちのコードを入力してください。選んだワークスペースにお支払いなしでプランが適用されます。';

  @override
  String get redeemCodeLabel => 'ギフトコード';

  @override
  String get redeemCodeChecking => '確認中…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$planが$monthsか月無料',
      one: '$planが1か月無料',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid => 'このコードは存在しないか、すでに使用できません。';

  @override
  String get redeemCodeWorkspace => 'ワークスペース';

  @override
  String get redeemCodeSubmit => '適用';

  @override
  String get redeemCodeFinePrint =>
      'ギフトコードは1人1回までです。期間が終了すると、プランを選ばない限り、ワークスペースは無料プランに移行します。';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$planが有効になりました';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'ワークスペースで$dateまで$planを無料で使えます。どのデバイスでもCasamaを開いてご利用ください。';
  }

  @override
  String get redeemCodeOpenBilling => '請求を開く';

  @override
  String get redeemCodeNoWorkspace =>
      'ギフトコードは自分がオーナーのワークスペースに適用されます。先にワークスペースを作成してから、もう一度リンクを開いてください。';

  @override
  String get redeemCodeUnavailable => 'このバージョンのアプリでは利用できません。';

  @override
  String usageComputerHours(String hours) {
    return 'クラウドコンピューター：$hours時間';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'ライブビュー：$minutes分';
  }

  @override
  String get thisMonth => '今月';

  @override
  String get noBillableUsage => '請求対象の利用はまだありません。';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'セルフホストのCasamaをこのワークスペースに接続します。公開アドレスと通知は無料で、クラウドコンピューターとモデルクレジットはこちらに請求されます。';

  @override
  String get linkCloudNewKey => '新しいCasama Linkキー';

  @override
  String get linkCloudKeyCreated => 'キーを作成しました';

  @override
  String get linkCloudKeyOnce =>
      '今すぐコピーしてください。一度しか表示されません。サーバーのCASAMA_CLOUD_URLに設定してください。';

  @override
  String get copy => 'コピー';

  @override
  String get revoke => '取り消す';

  @override
  String get instanceName => 'サーバー名';

  @override
  String get server => 'サーバー';

  @override
  String get serverAddress => 'サーバーアドレス';

  @override
  String get serverAddressInvalid =>
      'https://casama.example.comやhttp://192.168.1.20:8080のようなサーバーアドレスを入力してください。';

  @override
  String get connect => '接続';

  @override
  String get changeServer => '別のサーバーを使う';

  @override
  String serverIs(String host) {
    return 'サーバー：$host';
  }

  @override
  String get continueWithSso => 'SSOで続ける';

  @override
  String get workEmail => '仕事用メールアドレス';

  @override
  String get privacy => 'プライバシー';

  @override
  String get exportMyData => 'データをエクスポート';

  @override
  String get exportMyDataHelp => 'ボット、チャット、実行履歴、メモリー、設定（シークレットは含まれません）。';

  @override
  String exportReady(String kb) {
    return 'エクスポート準備完了（${kb}KB）';
  }

  @override
  String get runHistoryRetention => '実行履歴の保存期間';

  @override
  String get runHistoryRetentionHelp => '古い実行イベントは自動で削除されます。';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString日',
      one: '1日',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'アカウントを削除';

  @override
  String get deleteAccountHelp => '短い猶予期間のあと、データが消去されます。';

  @override
  String get deleteAccountQuestion => 'アカウントを削除しますか？';

  @override
  String deleteAccountConfirm(String email) {
    return 'あなたが唯一のオーナーであるワークスペースは、ボットやコンピューターを含めアカウントと一緒に削除されます。Webで購入したプランは自動で解約されます。App StoreまたはGoogle Playで購入したプランは解約されません。購入元のストアで解約してください。確認のため$emailを入力してください。';
  }

  @override
  String get accountDeleted => 'アカウントの削除を予約しました';

  @override
  String accountDeletedBody(String date) {
    return 'サインアウトしました。データは$dateに消去されます。';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countStringステップ',
      one: '1ステップ',
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
      other: '前の$countStringステップを表示',
      one: '前の1ステップを表示',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'コピーしました';

  @override
  String get jumpToLatest => '最新へ移動';

  @override
  String get chatViewFullTable => '表全体を表示';

  @override
  String get chatShowMore => 'もっと見る';

  @override
  String get chatShowLess => '折りたたむ';

  @override
  String get chatTableTitle => '表';

  @override
  String chatEmptySubtitle(String bot) {
    return '$botに何でも質問するか、下のアイデアをタップして始めましょう。';
  }

  @override
  String get suggestPlanDay => '今日の予定を立てるのを手伝って';

  @override
  String get suggestWriteMessage => 'メッセージを書くのを手伝って';

  @override
  String get suggestExplain => '何かを調べてわかりやすく説明して';

  @override
  String get suggestCapabilities => 'どんなことを手伝ってもらえますか？';

  @override
  String connectedAppSummary(String app) {
    return '$appを接続しました';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casamaはこのサーバーを確認していません。$hostを信頼できる場合のみ接続してください。';
  }

  @override
  String get serverNotCheckedShort =>
      'Casamaはこのサーバーを確認していません。運営元を信頼できる場合のみ接続してください。';

  @override
  String get serverAddressLabel => 'サーバーアドレス';

  @override
  String get serverAddressHelp =>
      'サーバーのアドレスを貼り付けてください。アドレスにキーが含まれる場合、キーは暗号化して保存されチャットには残りません。';

  @override
  String get serverChecking => 'サーバーを確認中…';

  @override
  String serverSignInOn(String host) {
    return '$hostでサインインします。';
  }

  @override
  String get serverUseKey => '代わりにキーを使う';

  @override
  String get serverUseSignIn => '代わりにサインインする';

  @override
  String serverSignInUnavailable(String name) {
    return '$nameはこのCasamaサーバーからのブラウザーサインインに対応していません。キーをお使いください。';
  }

  @override
  String get serverNoSignIn => 'このサーバーはサインイン不要で使えます。';

  @override
  String get serverHeaderLabel => 'ヘッダー名（任意）';

  @override
  String get serverToolsTitle => '使用できるツール';

  @override
  String get serverToolsHelp => '不要なものはオフにできます。リスクのある操作の前にボットは引き続き確認します。';

  @override
  String addedInChatBy(String bot) {
    return '$botがチャットで追加';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$nameは自分のコンピューター上で動作します。そのコンピューターでCasamaを開き、「このコンピューターをボットに使う」をオンにして追加してください。';
  }

  @override
  String get connectAppsTitle => 'アプリを接続';

  @override
  String get moreApps => 'その他';

  @override
  String addAppTile(String app) {
    return 'このボットに$appを追加';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$botに$appを追加しました';
  }

  @override
  String get connectAppsHint => '普段使っているツールでの読み取りや操作を任せてください。';

  @override
  String connectAppTile(String app) {
    return '$appを接続';
  }

  @override
  String get showComputer => 'コンピューターを表示';

  @override
  String get hideComputer => 'コンピューターを隠す';

  @override
  String get moreActions => 'その他';

  @override
  String get noConversations => '会話はまだありません';

  @override
  String get untitledChat => '新しい会話';

  @override
  String get listening => '聞き取り中…';

  @override
  String get orLabel => 'または';

  @override
  String get notificationsPrimerBubble => 'お見逃しなく！';

  @override
  String get notificationsPrimerTitle => '通知をオンにする';

  @override
  String get notificationsPrimerBody =>
      'ボットがあなたの判断を必要とするときや、作業が完了したときにお知らせします。';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chromeがこのサイトの通知をブロックしています。アドレスバーの鍵アイコンから許可してから、もう一度「オンにする」をタップしてください。';

  @override
  String get notificationsTurnOn => 'オンにする';

  @override
  String get autoUpdates => '自動アップデート';

  @override
  String get autoUpdatesHelp => '終了時に新しいバージョンをインストールします。';

  @override
  String get upToDate => 'Casamaは最新です';

  @override
  String get noReleasesToCheck =>
      'このコンピューター向けのリリースがまだ公開されていないため、比較できるバージョンがありません。';

  @override
  String updateReady(String version) {
    return 'Casama $versionが利用可能です';
  }

  @override
  String appVersion(String version) {
    return 'バージョン$version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Casama $versionの新機能';
  }

  @override
  String get whatsNewGotIt => '了解';

  @override
  String get whatsNewSubtitle => '前回のアップデートからの変更点です。';

  @override
  String get whatsNew010Calls => 'ボットに通話して相談できます。字幕付きで音声で答えてくれます。';

  @override
  String get whatsNew010Looks =>
      'Casamaを自分好みに：「設定 → 外観」でテーマ、配色、フォント、壁紙を変更でき、ギャラリーからさらに追加できます。';

  @override
  String get whatsNew010AboutYou =>
      '「設定 → あなたについて」で呼び方や好みの返信スタイルを一度伝えるだけで、ボットが覚えておきます。';

  @override
  String get whatsNew010SignIn => 'パスキー、Apple、Google、またはメールのコードでサインインできます。';

  @override
  String get openAtLogin => 'ログイン時に開く';

  @override
  String get openAtLoginHelp => 'クイック質問ショートカットをすぐに使えます。';

  @override
  String get signInTagline => 'アプリを閉じても働き続けるチームメイト。';

  @override
  String get signInTagline2 => 'あなたのAIチームをご紹介します。';

  @override
  String get signInTagline3 => '話すだけじゃない。やり遂げるAI。';

  @override
  String get signInTagline4 => '実行前に確認してくれる、頼れるチームメイト。';

  @override
  String get signInTagline5 => '任せたら、あとは完了を待つだけ。';

  @override
  String get noBotsHelp => 'ボットは専用コンピューターを持つチームメイトです。1体作成してチャットを始めましょう。';

  @override
  String get newBotSubtitle => '専用コンピューターとメモリーを持つチームメイト。';

  @override
  String get appearance => '外観';

  @override
  String get modelKeysHelp =>
      'OpenRouter、OpenAI、Anthropic、Google、xAIなどの互換プロバイダー';

  @override
  String get signOutConfirm => 'いつでもサインインし直せます。ボットはそのまま働き続けます。';

  @override
  String get roleOwner => 'オーナー';

  @override
  String get roleAdmin => '管理者';

  @override
  String get roleMember => 'メンバー';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeSystem => 'システム';

  @override
  String get themeDark => 'ダーク';

  @override
  String get createWorkspaceBody => 'ワークスペースにはボット、そのコンピューター、一緒に働くメンバーがまとまります。';

  @override
  String get workspaceNameHint => 'マイチーム';

  @override
  String get orJoinWithCode => 'または招待コードで参加';

  @override
  String get getOpenRouterKey => 'OpenRouterキーを取得';

  @override
  String get createFirstBotBody => '名前とモデルを決めましょう。どちらもあとから変更できます。';

  @override
  String stepOf(int step, int total) {
    return 'ステップ$step/$total';
  }

  @override
  String get providerHintOpenRouter => '推奨：チャット、画像、動画、音声';

  @override
  String get providerHintGoogle => 'ライブ通話のみ';

  @override
  String get providerHintCompatible => 'OpenAI互換APIすべて';

  @override
  String get providerHintSearch => 'Web検索';

  @override
  String get noRoutinesHelp =>
      'ルーティンはボットが自律的に行う作業です。指定した日時に1回、スケジュールどおり、またはWebhook受信時に実行されます。';

  @override
  String get routineOnce => '1回のみ';

  @override
  String lastRun(String when) {
    return '前回：$when';
  }

  @override
  String get routineOff => 'オフ';

  @override
  String get routineEnds => '終了条件';

  @override
  String get routineEndsNever => 'なし';

  @override
  String get routineEndsOnDate => '指定日';

  @override
  String get routineEndsAfterRuns => '指定回数後';

  @override
  String get routineEndDate => '最終日';

  @override
  String get routineRunCountLabel => '実行回数';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n回',
      one: '1回',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return '$whenに終了';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '残り$n回',
      one: '残り1回',
      zero: '残りの実行はありません',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => '終了条件を変更';

  @override
  String get routineEndTitle => '終了条件';

  @override
  String get routineEndSubtitle =>
      '条件に達すると自動でオフになります。実行回数を新しく設定すると今からカウントされます。';

  @override
  String deleteRoutineTitle(String name) {
    return '「$name」を削除しますか？';
  }

  @override
  String get deleteRoutineBody => '今後は実行されません。すでに会話に投稿された結果はそのまま残ります。';

  @override
  String get triggerOnce => '1回のみ';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString分後';
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
      other: '$nString時間後',
      one: '1時間後',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return '明日$time';
  }

  @override
  String get integrationNeedsName => '1文字以上の名前を付けてください。';

  @override
  String integrationNeedsField(String field) {
    return '保存するには$fieldを入力してください。';
  }

  @override
  String integrationSavedAs(String name) {
    return '$nameとして保存しました';
  }

  @override
  String get integrationUrlInvalid => 'https://で始まる完全なアドレスを入力してください';

  @override
  String get openFile => '開く';

  @override
  String get saveFile => '保存';

  @override
  String get shareFile => '共有';

  @override
  String savedFile(String name) {
    return '$nameを保存しました';
  }

  @override
  String noAppToOpen(String name) {
    return 'このデバイスに$nameを開けるアプリがありません。代わりに保存してください。';
  }

  @override
  String get previewUnavailable => 'この種類のファイルはプレビューできません。表示するには開くか保存してください。';

  @override
  String get openInSystemPlayer => '動画プレーヤーで開く';

  @override
  String get playMedia => '再生';

  @override
  String get fullScreen => '全画面表示';

  @override
  String get exitFullScreen => '全画面を終了';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countページ',
      one: '1ページ',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'ブラウザーで開く';

  @override
  String get convertingToPdf => 'プレビューを準備中…';

  @override
  String tableFirstRows(int count) {
    return '最初の$count行を表示中';
  }

  @override
  String get imageCouldNotLoad => 'この画像を読み込めませんでした';

  @override
  String get mediaKindImage => '画像';

  @override
  String get mediaKindVideo => '動画';

  @override
  String get mediaKindAudio => '音声';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'ファイルを開く';

  @override
  String get attach => '添付';

  @override
  String get attachFiles => 'ファイル';

  @override
  String get attachPhotos => '写真ライブラリ';

  @override
  String get attachCamera => '写真を撮る';

  @override
  String get attachScan => '書類をスキャン';

  @override
  String get scanFailed => '書類をスキャンできませんでした。もう一度お試しください。';

  @override
  String get dropToAttach => 'ファイルをドロップして添付';

  @override
  String uploadFailed(String name) {
    return '$nameをアップロードできませんでした';
  }

  @override
  String attachFailed(String name, String reason) {
    return '$nameを添付できませんでした：$reason';
  }

  @override
  String attachFailedTitle(String name) {
    return '$nameを添付できませんでした';
  }

  @override
  String get sendWithoutIt => '添付せずに送信';

  @override
  String get sendWithoutThem => '添付せずに送信';

  @override
  String get removeAttachment => '削除';

  @override
  String get editPhoto => '写真を編集';

  @override
  String get retryUpload => '再試行';

  @override
  String get uploadingAttachments => 'アップロード中…';

  @override
  String get notSent => '未送信';

  @override
  String get deleteChat => 'チャットを削除';

  @override
  String get deleteChatTitle => 'このチャットを削除しますか？';

  @override
  String deleteChatBody(String bot) {
    return 'このチャットを閲覧できる全員から、メッセージが削除されます。ここで$botが作成したものはライブラリに残り、利用状況の記録と、$botがこのチャットから覚えた内容（メモリー）も残ります。';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ここで作成した$count件も削除する',
      one: 'ここで作成した1件も削除する',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp => 'オフの場合、ライブラリに残ります。';

  @override
  String get chatDeleted => 'チャットを削除しました';

  @override
  String get deleteAllChats => 'すべてのチャットを削除';

  @override
  String get deleteAllChatsRow => '履歴を空にしてやり直します。メモリーは残ります。';

  @override
  String deleteAllChatsTitle(String bot) {
    return '$botとのすべてのチャットを削除しますか？';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return '削除できる$botとのチャットは、メッセージ、写真、ファイルとともにすべて削除されます。グループチャットは残ります。利用状況の記録と$botのメモリーも残ります。';
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
      other: '$nString件のチャットを削除しました。',
      one: '1件のチャットを削除しました。',
      zero: '削除するチャットはありません。',
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
      other: 'ボットが作業中のため$nString件のチャットを残しました。',
      one: 'ボットが作業中のため1件のチャットを残しました。',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'このチャットには$n体のボットがいます。それぞれ独自のメモリーと設定を保持します。',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention => '@に続けて名前を入力すると、特定のボットに直接頼めます。';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone：$leadが最初に答え、分担する作業があれば割り振ります。そうでなければ各ボットが順番に答え、最後のボットがまとめます。';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'メンションしない場合は最後に話したボット（最初は$lead）が答えます。';
  }

  @override
  String get messageNotSent =>
      'ファイルをアップロードできなかったため、メッセージは送信されませんでした。入力欄に戻しています。';

  @override
  String get chatSendsWhenDone => 'この返信が完了したら送信されます';

  @override
  String get noComputerForFiles => 'このボットにはファイルを保存するコンピューターがありません。';

  @override
  String fileTooLarge(String name) {
    return '$nameは25MBを超えており、大きすぎて添付できません。代わりにGoogle Drive、Dropbox、iCloud、またはその他のクラウドストレージからリンクを送信してください。';
  }

  @override
  String get secretsHelp =>
      'ボットは名前を使ってリクエストにシークレットを含めます。許可したホストにのみ送信され、モデルには一切見えません。';

  @override
  String deleteSecretTitle(String name) {
    return '$nameを削除しますか？';
  }

  @override
  String get deleteSecretBody => 'これを使っているボットはそのサービスに接続できなくなります。';

  @override
  String get hide => '隠す';

  @override
  String get show => '表示';

  @override
  String get deleteMemoryTitle => 'このメモリーを削除しますか？';

  @override
  String get noMemoriesHelp => 'チャットを続けると、ボットは事実、好み、過去の作業の要約など大切なことを記憶していきます。';

  @override
  String get memoryHelp =>
      'ピン留めしたメモリーは常にボットのコンテキストに入ります。誤りがあれば編集できます。削除したメモリーは元に戻せません。';

  @override
  String get memoryFact => '事実';

  @override
  String get memoryPreference => '好み';

  @override
  String get memorySummary => '要約';

  @override
  String get memoryEpisode => 'エピソード';

  @override
  String get pinned => 'ピン留め済み';

  @override
  String get editMemory => 'メモリーを編集';

  @override
  String get editMemoryHelp => '次に関連する話題が出たときボットが参照します。';

  @override
  String get modelKeysIntro =>
      'ボットは自分のモデルプロバイダーキーで思考します。キーは暗号化して保存され、再表示されません。';

  @override
  String get casamaCloudKeyHint => 'クレジットから支払い';

  @override
  String get casamaCloudIncluded => '含まれる';

  @override
  String get casamaCloudModelLocked => 'Casamaがこのモデルを選択します。';

  @override
  String get serverVoiceSetUp =>
      'このサーバーは音声を提供しているため、キーを追加する必要はありません。ワークスペースに自分のキーがある場合はそちらが優先されます。';

  @override
  String modelKeysFor(String workspace) {
    return 'キーは1つのワークスペースに紐づきます。以下は$workspace用です。';
  }

  @override
  String get yourKeys => '自分のキー';

  @override
  String get keyWorking => '動作中';

  @override
  String get keyFailing => 'エラー';

  @override
  String get keyUntested => '未テスト';

  @override
  String get skillsHelp => 'スキルは、レポートの社内スタイルなど、タスクに必要なときにボットが読み込む指示です。';

  @override
  String get skillsForAllBots => 'すべてのボット';

  @override
  String skillsOnlyForBot(String bot) {
    return '$bot専用';
  }

  @override
  String get skillsRemovedBot => '削除されたボット';

  @override
  String deleteSkillTitle(String name) {
    return 'スキル「$name」を削除しますか？';
  }

  @override
  String get editSkill => 'スキルを編集';

  @override
  String get deleteSkill => 'スキルを削除';

  @override
  String get skillDescriptionHelp => 'ボットはこれを読んで、いつスキルを適用するか判断します。';

  @override
  String get skillBodyHint => '# 手順\n1. …';

  @override
  String get computersHelp =>
      '各ボットは、全員で共有するチームコンピューターまたは専用コンピューターで作業します。ファイルはチャットをまたいで保持されます。';

  @override
  String get computersEmptyTitle => 'コンピューターはまだありません';

  @override
  String get thisDevice => 'このデバイス';

  @override
  String get personalComputerConnected => '接続済み';

  @override
  String get personalComputerOffline => 'オフライン';

  @override
  String computerCpus(num n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '${n}CPU',
      one: '1CPU',
    );
    return '$_temp0';
  }

  @override
  String computerMemory(Object size) {
    return '$sizeメモリ';
  }

  @override
  String computerDisk(Object size) {
    return '$sizeディスク';
  }

  @override
  String computerLastUsed(Object when) {
    return '最終使用：$when';
  }

  @override
  String computerLastSeen(Object when) {
    return '最終接続：$when';
  }

  @override
  String get computerSaved => '保存済み';

  @override
  String get computerSavedHelp => '停止中もファイルは保持されます';

  @override
  String computerCanUse(Object list) {
    return 'ボットが利用可能：$list';
  }

  @override
  String get computerCanUseNothing => 'ボットはまだ使えません';

  @override
  String get computerCapShell => 'ターミナル';

  @override
  String get computerCapFiles => 'ファイル';

  @override
  String get computerCapBrowser => 'ブラウザー';

  @override
  String get computerCapDesktop => '画面';

  @override
  String get computerCapMcp => 'ローカルツール';

  @override
  String get computerCapMessages => 'メッセージ';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$nameはオフラインです。そのコンピューターでCasamaを開き、「このコンピューターをボットに使う」をオンにしてください。自分のコンピューターはプランのコンピューター時間を消費しません。';
  }

  @override
  String get yourComputerOffline => 'あなたのコンピューターがオフラインです';

  @override
  String get howToFix => '対処方法';

  @override
  String get computerHoursUsedTitle => 'コンピューター時間を使い切りました';

  @override
  String get personalScreenNote =>
      'これは自分のコンピューターのため、ライブビューの代わりに数秒ごとに新しいスクリーンショットが表示されます。';

  @override
  String get renameComputer => 'コンピューター名を変更';

  @override
  String deleteComputerTitle(String name) {
    return '$nameを削除しますか？';
  }

  @override
  String get privacyIntro =>
      'チャット、メモリー、ファイルはあなたのものです。いつでもエクスポートしたり、アカウントを削除したりできます。';

  @override
  String get yourData => 'あなたのデータ';

  @override
  String get shareAnalytics => '利用状況データを共有';

  @override
  String get shareAnalyticsHelp => '利用状況とクラッシュレポートのみ。メッセージやファイルは含まれません。';

  @override
  String get measureAds => '広告の効果測定に協力';

  @override
  String get measureAdsHelp =>
      'Casamaの広告を見た人が登録や定期購入をしたことを、CasamaがMetaに伝えられるようになります。Casamaに広告が表示されることはありません。';

  @override
  String get measureAdsNeedsUsageData => 'これを使うには「利用状況データを共有」をオンにしてください。';

  @override
  String get trackingTile => 'トラッキングを許可';

  @override
  String get trackingAllowed =>
      '許可済み。このデバイスではMetaのSDKが動作し、Casamaの広告を見たあとの登録や定期購入を、CasamaがMetaに伝えられます。設定アプリで変更できます。';

  @override
  String get trackingNotAllowed =>
      '未許可。このデバイスからMetaに情報が送信されることはありません。設定アプリで変更できます。';

  @override
  String get trackingNotAsked =>
      'Casamaはまだ許可を求めていません。許可するまで、このデバイスからMetaに情報が送信されることはありません。';

  @override
  String get trackingOpenSettings => '設定を開く';

  @override
  String get workspaceAnalytics => 'このワークスペースの利用状況データ';

  @override
  String get workspaceAnalyticsHelp => 'このワークスペースの利用状況データです。クラッシュレポートはオンのままです。';

  @override
  String get dangerZone => '危険な操作';

  @override
  String get quotasHelp => '無制限にする場合は空欄にしてください。';

  @override
  String get serviceOff => 'オフ';

  @override
  String get serviceDown => '停止中';

  @override
  String get serviceOk => '正常';

  @override
  String get sendInvite => '招待を送信';

  @override
  String get thinking0 => 'モデル';

  @override
  String get saveChanges => '変更を保存';

  @override
  String get autonomyAskAlwaysHelp => '何かを変更するすべての操作の前に確認します。';

  @override
  String get autonomyAskRiskyHelp => '自律的に動きますが、ファイル削除や支払いなどリスクのある操作の前には確認します。';

  @override
  String get autonomyAutonomousHelp => '確認なしで実行します。信頼できるルーティンに最適です。';

  @override
  String get usageSubtitle => '今月のモデル利用額';

  @override
  String get skillsRowHelp => 'タスクに応じてボットが読み込む指示';

  @override
  String get integrationsRowHelp => 'MCPサーバーと接続済みアプリ';

  @override
  String get secretsRowHelp => 'トークンとパスワード（許可した宛先にのみ送信）';

  @override
  String get computersRowHelp => 'チームコンピューターと専用コンピューター';

  @override
  String get companionRowHelp => 'ボットがこのデバイスのアプリやファイルを使えるようにします';

  @override
  String get privacyRowHelp => 'データのエクスポートやアカウントの削除';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => '連携はまだありません';

  @override
  String get integrationsHelp =>
      '連携によりボットにツールを追加できます（MCPサーバー、OpenAPIソース、Composio、Pipedream）。各ツールには連携先にちなんだ名前が付きます。';

  @override
  String get botIntegrationsHelp => 'このボットが使える連携をオンにしてください。次回の実行時からツールが表示されます。';

  @override
  String get openSettings => '設定を開く';

  @override
  String get noRunsHelp =>
      'チャット、ルーティン、Webhookからボットが作業するたびに、その実行内容とコストがここに表示されます。';

  @override
  String get runCompleted => '完了';

  @override
  String get runWaiting => '待機中';

  @override
  String get runWorking => '作業中';

  @override
  String get triggerChat => 'チャット';

  @override
  String get triggerRoutine => 'ルーティン';

  @override
  String get noEventsForFilter => 'この実行にはこの種類のイベントがありません。';

  @override
  String get runStatusFailed => '失敗';

  @override
  String get runStatusStopped => '停止';

  @override
  String get quickAskIntro => 'すぐにお願いを送信します。選んだボットとの新しいチャットが始まります。';

  @override
  String quickAskIntroBot(String name) {
    return 'すぐにお願いを送信します。$nameとの新しいチャットが始まります。';
  }

  @override
  String quickAskHintBot(String bot) {
    return '$botに何をお願いしますか？';
  }

  @override
  String get stateProvisioning => '準備中';

  @override
  String get stateStarting => '起動中';

  @override
  String get computerRestoringFiles => 'ファイルを復元中…';

  @override
  String get stateRunning => '実行中';

  @override
  String get stateIdle => '待機中';

  @override
  String get stateSleeping => 'スリープ中';

  @override
  String get stateStopped => '停止中';

  @override
  String get stateError => 'エラー';

  @override
  String get terminalHelp =>
      'このコンピューター上のシェルです。ボットも同じシェルを使うため、作業内容を確認したり修正したりできます。';

  @override
  String get up => '上へ';

  @override
  String get emptyFolderHelp => 'ボットが作成したファイルやアップロードしたファイルがここに表示されます。';

  @override
  String deleteFileTitle(String name) {
    return '$nameを削除しますか？';
  }

  @override
  String get botComputerAuto => '自動';

  @override
  String get botComputerHelp => 'ボット専用のコンピューターです。コマンドの実行、Webブラウズ、ファイルの保存を行います。';

  @override
  String get billingOffTitle => '課金はありません';

  @override
  String revokeKeyTitle(String name) {
    return '$nameのキーを取り消しますか？';
  }

  @override
  String get revokeKeyBody => 'そのサーバーは直ちにクラウドコンピューターとクレジットの使用を停止します。';

  @override
  String get handBackHelp => 'ボットがあなたの続きから再開します。必要であれば、行った操作を伝えてください。';

  @override
  String get serverHelp => '独自のCasamaサーバーを使います。あなたまたは管理者が設定したアドレスを入力してください。';

  @override
  String get ssoHelp => '仕事用メールアドレスを入力すると、会社のサインインページに移動します。';

  @override
  String get colorScheme => '配色';

  @override
  String get searchThemes => '配色を検索';

  @override
  String get noThemesFound => '一致する配色がありません。';

  @override
  String get noAppsMatch => '一致するアプリがありません。詳細設定から独自のサーバーを追加できます。';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のアプリ',
      one: '1件のアプリ',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => 'すべて';

  @override
  String get familyPurple => 'パープル';

  @override
  String get familyBlue => 'ブルー';

  @override
  String get familyTeal => 'ティール';

  @override
  String get familyGreen => 'グリーン';

  @override
  String get familyWarm => 'ウォーム';

  @override
  String get familyRed => 'レッド＆ピンク';

  @override
  String get familyNeutral => 'ニュートラル';

  @override
  String get background => '背景';

  @override
  String get backgroundPattern => 'パターン';

  @override
  String get backgroundColors => 'カラー';

  @override
  String get backgroundThemeColors => 'テーマ';

  @override
  String get patternStrength => 'パターンの濃さ';

  @override
  String get wallpaperEverywhere => 'すべての画面に表示';

  @override
  String get wallpaperEverywhereHelp => 'オフにするとチャットの背景のみに表示されます。';

  @override
  String get resetBackground => '初期設定に戻す';

  @override
  String get copyMessage => 'コピー';

  @override
  String get selectText => 'テキストを選択';

  @override
  String get shareMessage => '共有';

  @override
  String get messageCopied => 'コピーしました';

  @override
  String get botUiBroken => '返信のこの部分を表示できませんでした。';

  @override
  String get botUiSent => '送信済み';

  @override
  String get botUiConnected => '接続済み';

  @override
  String get draftNewEmail => '新しいメール';

  @override
  String get draftNewMessage => '新しいメッセージ';

  @override
  String get draftNewPost => '新しい投稿';

  @override
  String get draftReadyToSend => '送信準備完了';

  @override
  String get draftReadyToPost => '投稿準備完了';

  @override
  String get draftEdited => '編集済み';

  @override
  String get draftSendEmail => 'メールを送信';

  @override
  String get draftSend => '送信';

  @override
  String get draftPost => '投稿';

  @override
  String get draftDiscard => '破棄';

  @override
  String get draftEdit => '編集';

  @override
  String get draftDoneEditing => '完了';

  @override
  String get draftFrom => '差出人';

  @override
  String get draftTo => '宛先';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Bcc';

  @override
  String get draftSubject => '件名';

  @override
  String get botCardNewEvent => '新しい予定';

  @override
  String get botCardEvent => '予定';

  @override
  String get botCardReadyToAdd => '追加の準備完了';

  @override
  String get botCardAddToCalendar => 'カレンダーに追加';

  @override
  String get botCardChange => '変更';

  @override
  String get botCardSkip => 'スキップ';

  @override
  String get botCardAllDay => '終日';

  @override
  String botCardMore(int count) {
    return 'ほか+$count件';
  }

  @override
  String get botCardAgenda => '予定表';

  @override
  String get botCardMessages => 'メッセージ';

  @override
  String botCardUnread(int count) {
    return '未読$count件';
  }

  @override
  String get botCardReply => '返信';

  @override
  String botCardReplyTo(String name) {
    return '$nameに返信';
  }

  @override
  String get botCardTasks => 'タスク';

  @override
  String botCardDoneOf(int done, int total) {
    return '$total件中$done件完了';
  }

  @override
  String get botCardSaveChanges => '変更を保存';

  @override
  String get botCardChoose => '選択';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'どなたのことですか？';

  @override
  String get botCardNoneOfThese => '該当なし';

  @override
  String get botCardReminder => 'リマインダー';

  @override
  String get botCardRoutine => 'ルーティン';

  @override
  String get botCardWatcher => '監視中';

  @override
  String get botCardScheduled => '設定済み';

  @override
  String botCardNext(String when) {
    return '次回：$when';
  }

  @override
  String get botCardCancelIt => 'キャンセルする';

  @override
  String get botIcon => 'アイコン';

  @override
  String get botIconInitials => 'イニシャル';

  @override
  String get errorDetailsTitle => 'エラーの詳細';

  @override
  String get exportLabel => 'エクスポート';

  @override
  String get openTimeline => '実行タイムラインを開く';

  @override
  String get details => '詳細';

  @override
  String get themes => 'テーマ';

  @override
  String get myThemes => 'あなたのテーマ';

  @override
  String get saveTheme => '現在のテーマを保存';

  @override
  String get themeName => 'テーマ名';

  @override
  String get importTheme => 'テーマを読み込む';

  @override
  String get themeCode => 'テーマコード';

  @override
  String get themeCodeHelp => '共有されたコードを貼り付けてください。casama-theme:で始まります';

  @override
  String get invalidThemeCode => 'Casamaのテーマコードではありません。';

  @override
  String themeImported(String name) {
    return '「$name」をテーマに追加しました';
  }

  @override
  String get themeCodeCopied => 'テーマコードをコピーしました。「外観 → テーマを読み込む」に貼り付けて共有できます。';

  @override
  String get shareTheme => 'コードを共有';

  @override
  String deleteThemeTitle(String name) {
    return '「$name」を削除しますか？';
  }

  @override
  String get fonts => 'フォント';

  @override
  String get headingFont => '見出し';

  @override
  String get bodyFont => '本文';

  @override
  String get fontsHelp =>
      'Google SansとNoto Serifはアプリに内蔵されており、オフラインでも使えます。その他のGoogleフォントは初回選択時にダウンロードされます。';

  @override
  String get searchFonts => 'すべてのGoogleフォントを検索';

  @override
  String get suggestedFonts => 'おすすめ';

  @override
  String get allFonts => 'すべてのGoogleフォント';

  @override
  String get noFontsFound => 'その名前のフォントが見つかりません';

  @override
  String get resetFonts => '初期設定を使う';

  @override
  String get fontSample => 'あなたと一緒に働くボットたち。';

  @override
  String get backgroundPhoto => '写真';

  @override
  String get yourPhoto => '自分の写真';

  @override
  String get browsePhotos => '写真を探す';

  @override
  String get removePhoto => '写真を削除';

  @override
  String get photoBlur => 'ぼかし';

  @override
  String get photoDim => '暗さ';

  @override
  String photoBy(String name) {
    return '写真：$name（Unsplash）';
  }

  @override
  String get searchPhotos => '写真を検索';

  @override
  String get photosUnavailable => '写真を読み込めませんでした。';

  @override
  String get noPhotos => '写真が見つかりません';

  @override
  String get photoHelp => 'イラストの下に写真が配置されます。ぼかしと暗さを調整すると上の文字が読みやすくなります。';

  @override
  String get periodToday => '今日';

  @override
  String get periodWeek => '今週';

  @override
  String get periodYear => '今年';

  @override
  String get totalSpend => '利用額';

  @override
  String get tokensIn => '入力トークン';

  @override
  String get tokensOut => '出力トークン';

  @override
  String get runsLabel => '実行';

  @override
  String get spendByDay => '日別の利用額';

  @override
  String get byBot => 'ボット別';

  @override
  String get byModel => 'モデル別';

  @override
  String get everythingMetered => 'すべて従量課金';

  @override
  String get bySource => 'ソース別';

  @override
  String get byPerson => 'メンバー別';

  @override
  String get usageAllBots => 'すべてのボット';

  @override
  String get usageAllModels => 'すべてのモデル';

  @override
  String get usageAllSources => 'すべてのソース';

  @override
  String get usageEveryone => '全員';

  @override
  String get usageJustMe => '自分のみ';

  @override
  String get usageClearFilters => 'クリア';

  @override
  String get usageFilterBot => 'ボットで絞り込む';

  @override
  String get usageFilterModel => 'モデルで絞り込む';

  @override
  String get usageFilterSource => 'ソースで絞り込む';

  @override
  String get usageFilterPerson => 'メンバーで絞り込む';

  @override
  String get usageSourceChat => 'チャット';

  @override
  String get usageSourceChatApp => 'チャットアプリ';

  @override
  String get usageSourceRoutine => 'ルーティン';

  @override
  String get usageSourceApi => 'API・その他のエージェント';

  @override
  String get usageSourceOther => 'その他';

  @override
  String get usageNoPerson => '自動';

  @override
  String get usageUnnamedPerson => '名前のないメンバー';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n回実行',
      one: '1回実行',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'CSVをエクスポート';

  @override
  String get exportJson => 'JSONをエクスポート';

  @override
  String get askBotAboutUsage => 'この内容についてボットに聞く';

  @override
  String get noUsageYet => 'この期間の利用状況はまだありません。';

  @override
  String get otherModel => 'コンピューター・その他';

  @override
  String get deletedBot => '特定のボットなし';

  @override
  String get usageHelp =>
      '費用はトークン数と公開価格に基づく概算です。最終的な請求額はモデルプロバイダーの請求書をご確認ください。';

  @override
  String usageAskPrompt(String period, String summary) {
    return '$periodのCasama利用状況です。何にいくら使われているか、節約できるポイントがないかを分析してください。必要であれば、利用状況ツールで最新の数値も確認できます。\n\n$summary';
  }

  @override
  String get kindTokensIn => 'モデル入力';

  @override
  String get kindTokensOut => 'モデル出力';

  @override
  String get kindComputer => 'クラウドコンピューター時間';

  @override
  String get kindModels => 'AIモデル';

  @override
  String get creditsThisMonth => '今月のクレジット';

  @override
  String creditsUsedPercent(int percent) {
    return '$percent%使用済み';
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
      other: '通常のコストで、あと約$nString回実行できます',
      one: '通常のコストで、あと約1回実行できます',
      zero: '通常のコストでは、残りは実行1回分未満です',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut => 'クレジットがなくなりました。ボットを動かし続けるには追加してください。';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1クレジット=$priceです。プランにより毎月$amountが追加され、未使用のクレジットは翌月まで繰り越されます。';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1クレジット=$priceです。App StoreまたはGoogle Playのクレジットパックは有効期限がなく、Webで購入したクレジットパックは12か月間有効です。';
  }

  @override
  String get creditsDailyLabel => '本日の上限';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used/$cap';
  }

  @override
  String get creditsDailyExplainer =>
      '残りのクレジットに関わらず、Casamaのモデル、音声、アプリに1日で使えるプランの上限額です。';

  @override
  String get creditsDailyReached =>
      '本日の上限に達したためボットは一時停止中です。上限を増やすにはプランをアップグレードしてください。';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '約$n時間後にリセットされます。',
      one: '約1時間後にリセットされます。',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => '1時間以内にリセットされます。';

  @override
  String get creditsHoursLabel => 'コンピューター時間';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used/$limit時間';
  }

  @override
  String creditsHoursExplainer(String date) {
    return '今月、ボットのコンピューターが稼働できる時間です。使い切るとコンピューターは停止しますが、チャットは引き続き使えます。$dateにリセットされます。';
  }

  @override
  String creditsHoursReached(String date) {
    return '今月のコンピューター時間を使い切ったため、コンピューターを起動できません。チャットは引き続き使えます。$dateにリセットされます。時間を増やすにはアップグレードしてください。';
  }

  @override
  String get kindStream => 'ライブビュー';

  @override
  String get kindTts => '読み上げる';

  @override
  String get computerMissingTitle => 'コンピューターが見つかりません';

  @override
  String get computerMissingHelp => '削除されたか、一覧が古い可能性があります。「更新」で再確認してください。';

  @override
  String get computerMissingBotHelp =>
      'このボットのコンピューターは削除されたか、一覧が古い可能性があります。更新するか、このボット用に別のコンピューターを選んでください。';

  @override
  String get computerChoose => 'コンピューターを選択';

  @override
  String get personaWork => '仕事';

  @override
  String get personaResearch => 'リサーチ';

  @override
  String get personaBuild => '構築';

  @override
  String get personaCreate => '創作';

  @override
  String get personaLife => '暮らし';

  @override
  String get personaOther => 'その他';

  @override
  String get blankBotHelp => 'ゼロから始めて独自の指示を書きます。';

  @override
  String get browse => '探す';

  @override
  String get browseAllPersonas => 'すべて見る';

  @override
  String get botIdentity => '名前とアイコン';

  @override
  String get serviceKeys => 'サービスキー';

  @override
  String get noServiceKeys => 'サービスキーはまだありません。';

  @override
  String get serviceKeysHelp => '検索、地図、データ用の自分のキー';

  @override
  String get serviceKeysIntro =>
      'モデル、音声、画像はCasamaが実行します。検索、地図、データサービスに独自のアカウントを使いたい場合のみキーを追加してください。キーは暗号化して保存され、再表示されません。';

  @override
  String get choosePersona => 'ペルソナを選択';

  @override
  String get choosePersonaHelp =>
      'それぞれに指示、スタイル、場合によってはスキルやルーティンが含まれます。あとからすべて変更できます。';

  @override
  String get searchPersonas => 'ペルソナを検索';

  @override
  String get noPersonasFound => '一致するペルソナがありません';

  @override
  String get previewPersona => 'プレビュー';

  @override
  String get personaInstructions => '指示';

  @override
  String get personaTryAsking => '試してみる質問';

  @override
  String usePersona(String name) {
    return '$nameを使う';
  }

  @override
  String get loadPersona => 'ペルソナを読み込む';

  @override
  String get replaceInstructionsTitle => '指示を置き換えますか？';

  @override
  String replaceInstructionsBody(String name) {
    return 'ボットの現在の指示が$nameの指示に置き換わります。スキルとルーティンはそのまま残ります。';
  }

  @override
  String get replace => '置き換える';

  @override
  String get appsTitle => 'アプリ';

  @override
  String get appsSubtitle => 'チームで普段使っているツールをボットに与えましょう。';

  @override
  String get connectedTab => '接続済み';

  @override
  String get browseTab => '探す';

  @override
  String get searchApps => 'アプリを検索';

  @override
  String get popularApps => '人気';

  @override
  String get allApps => 'すべてのアプリ';

  @override
  String get appCatDeveloper => '開発者向け';

  @override
  String get appCatProductivity => '仕事効率化';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => '決済';

  @override
  String get appCatDesign => 'デザイン';

  @override
  String get appCatSales => '営業・サポート';

  @override
  String get appCatData => 'データ・検索';

  @override
  String get appCatAutomation => '自動化';

  @override
  String get authOneClick => 'ワンクリック';

  @override
  String get authApiKey => 'APIキー';

  @override
  String get authNone => 'サインイン不要';

  @override
  String get authAdminSetup => '設定が必要';

  @override
  String get connectedBadge => '接続済み';

  @override
  String get whatBotsCanDo => 'ボットができること';

  @override
  String continueWith(String app) {
    return '$appで続ける';
  }

  @override
  String get signInTab => 'サインイン';

  @override
  String get connectNoSignIn => 'このアプリはサインイン不要で使えます。';

  @override
  String finishSignIn(String app) {
    return '$appへのサインインを完了';
  }

  @override
  String finishSignInHelp(String app) {
    return 'ブラウザーで$appが開きました。アクセスを許可すると自動で更新されます。';
  }

  @override
  String get reopenSignIn => 'サインインページをもう一度開く';

  @override
  String appConnected(String app) {
    return '$appが接続されました';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$appはこのワークスペースですでに接続されています。その接続を使うか、別のアカウントを追加してください。';
  }

  @override
  String get useConnection => 'これを使う';

  @override
  String get addAnotherAccount => '別のアカウントを追加';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ボット用に$countString個のツールが使えます。',
      one: 'ボット用に1個のツールが使えます。',
      zero: '使用できます。',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'どのボットが使えますか？';

  @override
  String get whichBotsHelp => 'リスクのある操作の前にはボットが引き続き確認します。';

  @override
  String get doneLabel => '完了';

  @override
  String openApp(String app) {
    return '$appを開く';
  }

  @override
  String get pasteLabel => '貼り付け';

  @override
  String get connectingLabel => '接続中…';

  @override
  String get connectFailedTitle => '接続できませんでした';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'または次のいずれかを経由して$appを接続してください。一度サインインすれば、ボットに$appを使うよう頼めます。';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote => 'サインイン情報は暗号化して保存され、再表示されません。いつでも接続を解除できます。';

  @override
  String get composioHelp => '数百種類のアプリに対応し、サインインも自動で処理します。';

  @override
  String get pipedreamHelp => 'Pipedream Connect経由で数千種類のアプリに接続できます。';

  @override
  String get customServer => 'カスタムサーバー';

  @override
  String get customServerHelp => '任意のMCPサーバーまたはOpenAPI仕様（開発者向け）。';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString体のボットが使用中',
      one: '1体のボットが使用中',
      zero: 'まだどのボットにも割り当てられていません',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => '準備完了';

  @override
  String get statusNeedsAttention => '確認が必要';

  @override
  String get statusChecking => '確認中';

  @override
  String get toolsHelp =>
      '読み取り専用ツールは自動で実行されます。変更を伴うツールはボットが信頼できない内容を読んだときに事前に確認し、「常に確認」のツールは毎回あなたの確認を待ちます。';

  @override
  String get botsWithAccess => 'アクセスできるボット';

  @override
  String get reconnect => '再接続';

  @override
  String get disconnect => '接続を解除';

  @override
  String disconnectTitle(String app) {
    return '$appの接続を解除しますか？';
  }

  @override
  String get disconnectBody => 'ボットはこのアプリのツールを直ちに使えなくなり、保存されたサインイン情報も削除されます。';

  @override
  String get testConnection => '接続をテスト';

  @override
  String get signedInOAuth => '自分のアカウントでサインイン済み';

  @override
  String get signedInKey => 'APIキーで接続済み';

  @override
  String get signedInNone => 'サインイン不要';

  @override
  String get noConnectionsTitle => '最初のアプリを接続';

  @override
  String get noConnections =>
      'Stripe、Linear、Notion、Gmailなど。ほとんどがワンクリックで接続できます。';

  @override
  String get browseApps => 'アプリを探す';

  @override
  String providerSetupTitle(String provider) {
    return '$providerを接続';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$providerが代わりにアプリへサインインするため、キーを直接扱う必要はありません。';
  }

  @override
  String get getFreeKey => '無料キーを取得';

  @override
  String connectedThroughHub(String provider) {
    return '$provider経由';
  }

  @override
  String providerAppsTitle(String provider) {
    return '$provider経由のアプリ';
  }

  @override
  String get addAnApp => 'アプリを追加';

  @override
  String searchProviderApps(String provider) {
    return '$providerアプリを検索';
  }

  @override
  String get accountConnected => 'サインイン済み';

  @override
  String get accountPending => 'サインイン待ち';

  @override
  String get accountError => 'サインインエラー';

  @override
  String get providerReconnectHint => 'アプリ呼び出しコストを抑えるにはCasamaで直接サインインしてください';

  @override
  String get noProviderAccounts => 'アプリはまだありません。追加してサインインしてください。';

  @override
  String get projectId => 'プロジェクトID';

  @override
  String get toolRiskLow => '読み取り専用';

  @override
  String get toolRiskMedium => '変更あり';

  @override
  String get toolRiskHigh => '常に確認';

  @override
  String get askWhichBot => 'どのボットに確認してもらいますか？';

  @override
  String get computerWake => '起動';

  @override
  String get computerAsleepTitle => 'コンピューターはスリープ中です';

  @override
  String get computerAsleepFilesHelp => 'ファイルを見たりアップロードしたりするには起動してください。';

  @override
  String get computerFilesTimedOut =>
      'ファイルの読み込みに時間がかかりすぎました。コンピューターがオンになっているか確認して、もう一度お試しください。';

  @override
  String get computerGoingToSleep => 'スリープに移行中';

  @override
  String get liveViewWakesHelp =>
      'このコンピューターはスリープ中です。ライブビューを開くと起動し、しばらく使わないと再びスリープします。';

  @override
  String get wakeAndWatch => '起動してライブ視聴';

  @override
  String get chatGptPlan => 'ChatGPTプラン';

  @override
  String get continueWithChatGpt => 'ChatGPTで続ける';

  @override
  String get chatGptConnectHelp =>
      'APIキーの代わりにあなたのChatGPTプランでボットを動かします。モデルの呼び出しはプランの上限に計上され、あなただけが利用できます。';

  @override
  String get chatGptDesktopOnly =>
      'ChatGPTプランを接続するには、デスクトップアプリを開くか、CLIで「casama credential chatgpt」を実行してください。';

  @override
  String get chatGptWaiting => 'ブラウザーでChatGPTのサインインを完了してください…';

  @override
  String chatGptConnected(String account) {
    return 'ChatGPTプラン（$account）を接続しました。';
  }

  @override
  String get chatGptPlanUsageOff =>
      'サインインしましたが、プランの利用が許可されていません。再接続して許可するか、APIキーを追加してください。';

  @override
  String get orAddApiKey => 'またはAPIキーを追加';

  @override
  String get planOnlyYou => 'あなただけが利用できます';

  @override
  String get planOtherMember => 'ほかのメンバーのプラン';

  @override
  String get planConnected => '接続済み';

  @override
  String get planUsageOff => 'プランの利用がオフです';

  @override
  String get planNeedsReconnect => 'もう一度サインイン';

  @override
  String get useNextModelAtLimit => 'プランの上限に達したらボットの次のモデルを使う';

  @override
  String get useNextModelAtLimitHelp =>
      'オフ：ChatGPTの上限に達すると実行が停止します。オン：ボットの次のモデルで続行します（料金が発生する場合があります）。';

  @override
  String get manageUsage => '利用状況を管理';

  @override
  String get removeKey => '削除';

  @override
  String removeKeyConfirm(String label) {
    return '$labelを削除しますか？これを使っているボットは別のキーを設定するまで動作を停止します。';
  }

  @override
  String get removeKeyChatGptNote => 'ChatGPTのサインインも同時に解除されます。';

  @override
  String modelFallbackNotice(String message) {
    return '次のモデルに切り替えました：$message';
  }

  @override
  String get twoStepSignIn => '2段階サインイン';

  @override
  String get twoStepHelp => 'サインインするたびに認証アプリのコード入力を求めます。';

  @override
  String get signInWithPasskey => 'パスキーでサインイン';

  @override
  String get account => 'アカウント';

  @override
  String get accountRow => 'メールアドレス、パスワード、すべての端末からサインアウト';

  @override
  String get forgotPassword => 'パスワードをお忘れですか？';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get newPasswordAgain => '新しいパスワード（確認）';

  @override
  String get passwordsDontMatch => 'パスワードが一致しません';

  @override
  String get newPasswordTitle => '新しいパスワードを設定';

  @override
  String get newPasswordBody => 'サインイン済みです。メールでサインインする際の新しいパスワードを設定してください。';

  @override
  String get savePassword => 'パスワードを保存';

  @override
  String get passwordSaved => 'パスワードを保存しました。';

  @override
  String get passwordTitle => 'パスワード';

  @override
  String get passwordRow => 'メールでサインインするためのパスワードを設定または変更します';

  @override
  String get passwordHelp =>
      '6文字以上で入力してください。Google、Apple、パスキー、メールリンクでのサインインも引き続き使えます。';

  @override
  String passwordCodeSent(String email) {
    return 'アカウントを安全に保つため、$email宛てに送信したコードを入力してください。';
  }

  @override
  String get changeEmailTitle => 'メールアドレスを変更';

  @override
  String get changeEmailHelp =>
      '現在のアドレスと新しいアドレスの両方に確認リンクをメールで送信します。両方を確認すると変更が完了します。';

  @override
  String get newEmail => '新しいメールアドレス';

  @override
  String get changeEmailSend => '確認メールを送信';

  @override
  String get changeEmailRow => 'サインインに使うメールアドレスを変更します';

  @override
  String changeEmailSent(String email) {
    return '両方の受信トレイを確認してください。両方のリンクが確認されると、$emailが新しいメールアドレスになります。';
  }

  @override
  String changeEmailPending(String email) {
    return '確認待ち：$email';
  }

  @override
  String get signOutEverywhere => 'すべてのデバイスからサインアウト';

  @override
  String get signOutEverywhereHelp => 'この端末を含むすべてのスマートフォン、コンピューター、ブラウザー';

  @override
  String get signOutEverywhereConfirm =>
      'この端末を含むすべてのデバイスからサインアウトしますか？端末を紛失した場合や、他人がサインインしている可能性がある場合に使用してください。';

  @override
  String get passkeySuggestTitle => '次回からもっと速くサインインしませんか？';

  @override
  String get passkeySuggestBody =>
      'パスキーを追加すると、Face ID、指紋認証、または画面ロックでサインインできます。パスワードやメールは不要です。';

  @override
  String get passkeys => 'パスキー';

  @override
  String get passkeysRow => 'Face ID、指紋認証、または画面ロックでサインイン';

  @override
  String get passkeysHelp =>
      'パスキーを使うと、パスワードやメールなしでFace ID、指紋認証、または画面ロックでサインインできます。各スマートフォン、コンピューター、パスワードマネージャーごとに保存されます。';

  @override
  String get passkeyAdd => 'パスキーを追加';

  @override
  String get passkeyAddAnother => '別のパスキーを追加';

  @override
  String get passkeyAdded => 'パスキーを追加しました。次回からはパスキーでサインインできます。';

  @override
  String get passkeyRename => '名前を変更';

  @override
  String get passkeyRenameTitle => 'パスキーの名前を変更';

  @override
  String get passkeyNameLabel => '名前';

  @override
  String get passkeyRemove => '削除';

  @override
  String passkeyRemoveConfirm(String name) {
    return '「$name」を削除しますか？今後このパスキーではサインインできなくなります。';
  }

  @override
  String passkeyAddedWhen(String when) {
    return '追加：$when';
  }

  @override
  String passkeyLastUsed(String when) {
    return '最終使用：$when';
  }

  @override
  String get twoStepSetUp => '認証アプリを設定';

  @override
  String get twoStepAddAnother => '別の認証アプリを追加';

  @override
  String get twoStepScan =>
      '1Password、Google Authenticator、Authyなどの認証アプリでこのコードをスキャンするか、セットアップキーを入力し、表示された6桁のコードを入力してください。';

  @override
  String get twoStepKey => 'セットアップキー';

  @override
  String get twoStepCode => '6桁のコード';

  @override
  String get twoStepVerify => '確認';

  @override
  String get twoStepNowOn => '2段階サインインがオンになりました。';

  @override
  String get twoStepAuthenticators => '認証アプリ';

  @override
  String get twoStepRename => '名前を変更';

  @override
  String get twoStepRenameTitle => '認証アプリの名前を変更';

  @override
  String get twoStepNameLabel => '名前';

  @override
  String get twoStepNameHint => '例：仕事用スマートフォン';

  @override
  String get twoStepRemove => '削除';

  @override
  String get twoStepRemoveConfirm =>
      'この認証アプリを削除しますか？唯一の認証アプリである場合、次回からはパスワードのみでサインインします。';

  @override
  String get twoStepPromptTitle => 'コードを入力';

  @override
  String get twoStepPromptBody => '認証アプリを開き、6桁のコードを入力してサインインを完了してください。';

  @override
  String get twoStepPromptAccount => 'サインイン中のアカウント';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => '新しいパスワードの対象';

  @override
  String get connectAiAppAccount => 'アクセス先';

  @override
  String joinAsAccount(String email, String server) {
    return '$serverに$emailとして参加します。';
  }

  @override
  String get requireTwoStep => 'オーナーと管理者に2段階サインインを必須にする';

  @override
  String get requireTwoStepHelp => 'オーナーと管理者は設定が必要です。まず自分の設定をオンにしてください。';

  @override
  String get twoStepNeededForAdmin =>
      'このワークスペースではオーナーと管理者に2段階サインインが必須です。管理設定を使うには2段階サインインを設定するか、コードを使ってサインインし直してください。';

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
  String get suspendWorkspace => '停止';

  @override
  String get unsuspendWorkspace => '停止を解除';

  @override
  String get suspendReason => '理由';

  @override
  String get suspendWorkspaceHelp =>
      'コンピューターとボットの動作が停止します。データは削除されず、いつでも解除できます。';

  @override
  String workspaceSuspended(String reason) {
    return '停止中：$reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'このワークスペースは停止中のため、ボットを実行したりコンピューターを起動したりできません。このサーバーの管理者にお問い合わせください。';

  @override
  String get abuseKind_mining_pool => '暗号資産マイニングをブロック';

  @override
  String get abuseKind_blocked_port => 'メールポートをブロック';

  @override
  String get abuseKind_egress_flood => 'トラフィックの過剰送信';

  @override
  String get abuseKind_signup_blocked => '登録を拒否';

  @override
  String get abuseKind_suspended => 'ワークスペースを停止';

  @override
  String get abuseKind_unsuspended => '停止を解除';

  @override
  String get kindLocalMcp => 'コンピューター上';

  @override
  String get capMcp => 'ローカルツール（MCP）';

  @override
  String get localMcpServers => 'ローカルツール（MCP）';

  @override
  String get localMcpHelp =>
      'T3 Code、Claude Code、Codex、デザインアプリなど、このコンピューターやネットワーク上でボットが使えるMCPサーバーです。トークンやサインイン情報はこのコンピューターに留まります。';

  @override
  String get localMcpAdd => 'ローカルMCPサーバーを追加';

  @override
  String get localMcpEmpty => 'ローカルMCPサーバーはまだありません。';

  @override
  String get localMcpName => '名前';

  @override
  String get localMcpStdio => 'コマンド';

  @override
  String get localMcpLoopback => 'アドレス';

  @override
  String get localMcpCommand => 'コマンド';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'アドレス';

  @override
  String get localMcpFolder => '作業フォルダー（任意）';

  @override
  String get localMcpEnv => '環境変数（1行に1つKEY=value、このコンピューターに保存）';

  @override
  String get localMcpNeedsCapability =>
      'ボットがこれらを使えるようにするには、上の「ローカルツール（MCP）」をオンにしてください。';

  @override
  String get localMcpBadUrl =>
      'このコンピューターまたは同一ネットワーク上のhttp://アドレス（例：http://127.0.0.1:3845/mcp）、またはhttps://アドレスを入力してください。';

  @override
  String get localMcpBadFolder => '共有フォルダー内のフォルダーを選択してください。';

  @override
  String get codingAgents => 'コーディングエージェント';

  @override
  String get codingAgentsHelp =>
      'ボットはこのコンピューター上のエージェントにコーディング作業を任せられます。あなた自身のサインインを使用し、共有したフォルダー内で作業します。';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString個のコーディングエージェントが見つかりました',
      one: '1個のコーディングエージェントが見つかりました',
      zero: 'コーディングエージェントが見つかりません',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved => 'このサーバーはまだワークスペースに保存されていません。一度削除して追加し直してください。';

  @override
  String get localMcpSignInKind => 'サインイン方法';

  @override
  String get localMcpAuthNone => 'なし';

  @override
  String get localMcpAuthToken => 'トークン';

  @override
  String get localMcpAuthHeader => 'ヘッダー';

  @override
  String get localMcpAuthOAuth => 'ブラウザー';

  @override
  String get localMcpToken => 'トークン（このコンピューターに保存）';

  @override
  String get localMcpHeaderName => 'ヘッダー名';

  @override
  String get localMcpHeaderValue => 'ヘッダー値（このコンピューターに保存）';

  @override
  String get localMcpOAuthHelp =>
      'このサーバーにサインインするためCasamaがブラウザーを開きます。サインイン情報はこのコンピューターに留まります。';

  @override
  String get localMcpNetworkWarning =>
      'このサーバーはこのコンピューター上にありません。このコンピューターを使えるボットがアクセスできます。';

  @override
  String get localMcpSignIn => 'サインイン';

  @override
  String get localMcpNeedsSignIn => 'サインインが必要';

  @override
  String get localMcpEdit => 'ローカルMCPサーバーを編集';

  @override
  String get localMcpImport => 'ほかのアプリから追加';

  @override
  String get localMcpImportHelp =>
      'このコンピューターのT3 Code、Claude Code、Claude Desktop、Cursor、VS Code、Codex、Windsurfですでに設定されているMCPサーバーです。';

  @override
  String get localMcpImportNone => 'このコンピューターのほかのアプリにMCPサーバーが見つかりませんでした。';

  @override
  String get localMcpImportAdded => '追加済み';

  @override
  String get localMcpImportRemote =>
      'インターネット上にあるため、通常は「接続」から追加します。このコンピューターからしか接続できない場合のみここに追加してください。';

  @override
  String get mcpQuestionDecline => '拒否';

  @override
  String get mcpQuestionSend => '送信';

  @override
  String get cardMcpQuestion => '質問';

  @override
  String get cardMcpSignIn => 'サインイン';

  @override
  String get mcpSignInHereHelp => 'ボットが再び使えるようにサインインしてください。';

  @override
  String localMcpSignedIn(String name) {
    return '$nameにサインインしました';
  }

  @override
  String localMcpImportFrom(String source) {
    return '$sourceから';
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
      other: 'サーバーを$nString件追加',
      one: 'サーバーを1件追加',
      zero: '追加',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name（このコンピューターに保存）';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$nameへのサインインが必要です';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return '$deviceでCasamaを開き、そちらでサインインしてください。';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'このツールが動作しているコンピューターでCasamaを開き、そちらでサインインしてください。';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connectionからの質問';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return '$connectionに回答しました';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return '$connectionの質問への回答を断りました';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return '$connectionの質問が閉じられました';
  }

  @override
  String get codingAgentsNone =>
      'コーディングエージェントが見つかりません。コーディング作業を任せるにはClaude Code、Codex、またはCursorのコマンドラインエージェントをインストールしてください。';

  @override
  String get codingAgentsNeedShell =>
      'コーディングエージェントはコマンドとして実行されるため、「コマンドの実行」をオンにする必要があります。';

  @override
  String get allowCommands => 'オンにする';

  @override
  String get codingAgentAllow => '許可';

  @override
  String get codingAgentAllowed => '許可済み';

  @override
  String get codingAgentsAllowHelp =>
      '「許可」と表示されているエージェントはまだこのコンピューターで実行されていません。一度許可するとボットがタスクを任せられるようになります。';

  @override
  String get ownAgentsAdd => '独自に追加';

  @override
  String get ownAgentYours => '自分用';

  @override
  String get ownAgentNotFound => 'このコンピューターに見つかりません';

  @override
  String get ownAgentsHelp =>
      '独自のエージェントは、このコンピューター上で、あなたの代理として動くチャットでのみ実行されます。ワークスペースのほかの人は、表示も変更もできません。';

  @override
  String get ownAgentFormTitle => '独自のエージェントを追加';

  @override
  String get ownAgentEditTitle => 'エージェントを編集';

  @override
  String get ownAgentName => '名前';

  @override
  String get ownAgentBin => 'コマンド名';

  @override
  String get ownAgentCommand => 'コマンド';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'タスクが入る場所に$taskを置いてください（Casamaが自動で引用符で囲みます）。すべてのコマンドはコマンド名で始まります。$folderや、エージェントが回答をファイルに書き出す場合は$result_fileも使えます。';
  }

  @override
  String get ownAgentResult => '回答の読み取り方法';

  @override
  String get ownAgentResultTail => '出力の末尾';

  @override
  String get ownAgentResultJson => 'resultフィールドを含むJSON行';

  @override
  String get ownAgentResultStream => 'JSON行のストリーム';

  @override
  String get ownAgentResultField => 'JSONフィールド';

  @override
  String get ownAgentResultFile => 'ファイルへの書き込み';

  @override
  String get ownAgentResultFieldName => 'フィールド名';

  @override
  String get ownAgentTimeLimit => '制限時間（分）';

  @override
  String get ownAgentTest => 'テスト';

  @override
  String get ownAgentTestHelp =>
      'テストではこのコンピューター上で「pong」とだけ返すよう指示し、出力された内容を表示します。';

  @override
  String ownAgentTestPassed(String reply) {
    return '応答：$reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return '想定どおりの応答がありませんでした（終了コード$code）。';
  }

  @override
  String get ownAgentTestTimedOut => '時間内に完了しませんでした。';

  @override
  String ownAgentBadCommand(String task) {
    return '名前、コマンド名、および$taskを含むコマンドを入力してください。';
  }

  @override
  String get board => 'ボード';

  @override
  String get newTicket => '新しいチケット';

  @override
  String get newTicketSubtitle => 'ボット向けのタスクをボードで管理します。';

  @override
  String get allProjects => 'すべてのプロジェクト';

  @override
  String get manageProjects => 'プロジェクトを管理';

  @override
  String get filterByProject => 'プロジェクトで絞り込む';

  @override
  String get moveTo => '移動先';

  @override
  String get noMatchingTickets => '一致するチケットがありません';

  @override
  String get noMatchingTicketsHelp => 'この条件に一致するチケットはありません。';

  @override
  String get clearFilters => 'フィルターをクリア';

  @override
  String get ticketTitle => 'タイトル';

  @override
  String get ticketDetails => '詳細';

  @override
  String get taskInReview => '確認中';

  @override
  String get priority => '優先度';

  @override
  String get priorityUrgent => '緊急';

  @override
  String get priorityHigh => '高';

  @override
  String get priorityMedium => '中';

  @override
  String get priorityLow => '低';

  @override
  String get priorityNone => '優先度なし';

  @override
  String get filterAll => 'すべて';

  @override
  String get filterMine => '自分';

  @override
  String get filterBots => 'ボット';

  @override
  String get assignee => '担当';

  @override
  String get unassigned => '未割り当て';

  @override
  String get assignToMe => '自分';

  @override
  String get reviewRequired => '確認が必要';

  @override
  String get reviewRequiredHelp => 'ボットは完了ではなく確認待ち状態で終了します。';

  @override
  String get comments => 'コメント';

  @override
  String get addComment => 'コメントを追加';

  @override
  String get sendComment => '送信';

  @override
  String get openThread => 'ボットのスレッドを開く';

  @override
  String get deleteTicket => 'チケットを削除';

  @override
  String get ticketResult => '結果';

  @override
  String get noCommentsYet => 'コメントはまだありません。ボットやチームへのメモを残せます。';

  @override
  String get noTickets => 'ボットに仕事を任せましょう';

  @override
  String get noTicketsHelp => '単発の作業でも、大きな目標でも任せられます。進捗はここから確認できます。';

  @override
  String get tasksStartTicket => 'チケットを追加';

  @override
  String get tasksStartTicketHelp => '1つの作業です。ボットに割り当てると開始します。';

  @override
  String get tasksStartProject => 'プロジェクトを開始';

  @override
  String get tasksStartProjectHelp => 'より大きな目標です。ボットがチケットとして計画を立て、あなたの承認を待ちます。';

  @override
  String get tasksExamples => 'または次の例から始める';

  @override
  String get tasksExampleResearch => '競合他社の上位3社を調査して';

  @override
  String get tasksExampleDraft => 'ローンチのお知らせの下書きを作って';

  @override
  String get tasksExampleTidy => 'ファイルを整理して';

  @override
  String get ticketStatus => 'ステータス';

  @override
  String get spaces => 'ワークスペース';

  @override
  String get newWorkspace => '新しいワークスペース';

  @override
  String get newWorkspaceSubtitle => 'ボット、チャット、メンバーをチームごとに分けられる専用の空間です。';

  @override
  String get joinWorkspaceHelp => '誰かから送られた招待リンクを貼り付けてください。';

  @override
  String get inviteLinkField => '招待リンク';

  @override
  String get workspaceIcon => 'アイコン';

  @override
  String get workspaceColor => 'カラー';

  @override
  String get workspaceSettings => 'ワークスペース設定';

  @override
  String get workspaceSettingsHelp => '名前、アイコン、カラー、招待リンク';

  @override
  String get inviteLinks => '招待リンク';

  @override
  String get inviteLinksHelp =>
      'リンクを知っている人は、サインインすれば誰でも参加できます。リンクは、期限が切れるか、使用回数の上限に達するか、取り消すまで有効です。';

  @override
  String get createInviteLink => 'リンクを作成';

  @override
  String get linkExpires => '有効期限';

  @override
  String get linkNever => '無期限';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$daysString日後',
      one: '1日後',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => '使用回数';

  @override
  String get linkUnlimited => '無制限';

  @override
  String linkUses(String uses) {
    return '$uses回使用済み';
  }

  @override
  String get linkRevoked => '取り消し済み';

  @override
  String get revokeLink => '取り消す';

  @override
  String get linkCopied => '招待リンクをコピーしました。';

  @override
  String get inviteRole => '役割';

  @override
  String get shareLinkLabel => '共有';

  @override
  String get botFolder => 'フォルダー';

  @override
  String get noFolder => 'フォルダーなし';

  @override
  String get newFolder => '新しいフォルダー…';

  @override
  String get folderName => 'フォルダー名';

  @override
  String get archiveBot => 'ボットをアーカイブ';

  @override
  String archiveBotTitle(String name) {
    return '$nameをアーカイブしますか？';
  }

  @override
  String get archiveBotBody =>
      'サイドバーから外れ、動作を停止します。チャットと履歴は保持され、「アーカイブ済みボット」からいつでも戻せます。';

  @override
  String get archive => 'アーカイブ';

  @override
  String get archivedBots => 'アーカイブ済みボット';

  @override
  String get unarchive => '元に戻す';

  @override
  String botArchived(String name) {
    return '$nameをアーカイブしました。';
  }

  @override
  String get deleteBot => 'ボットを削除';

  @override
  String deleteBotTitle(String name) {
    return '「$name」を削除しますか？';
  }

  @override
  String deleteBotBody(String name) {
    return '$nameとのチャットは、メッセージ、写真、ファイルとともにすべて完全に削除され、$nameは動作を停止してサイドバーから消えます。グループチャットと利用状況の記録は残ります。設定とメモリーは「アーカイブ済みボット」に移動します。';
  }

  @override
  String botDeleted(String name) {
    return '$nameを削除しました。';
  }

  @override
  String get settingsHistory => '設定履歴';

  @override
  String get settingsHistoryHelp => 'このボットの設定に対するすべての変更と変更者';

  @override
  String get noHistory => '変更履歴はまだありません。';

  @override
  String get restoreSettings => 'この設定に戻す';

  @override
  String restoreSettingsBody(String fields) {
    return '$fieldsをこの変更前の状態に戻しますか？現在の設定も履歴に残ります。';
  }

  @override
  String changedByBot(String name) {
    return '$nameが変更';
  }

  @override
  String get changedByPerson => 'メンバーが変更';

  @override
  String get changedBySystem => 'Casamaが変更';

  @override
  String get fieldName => '名前';

  @override
  String get fieldInstructions => '指示';

  @override
  String get fieldModel => 'モデル';

  @override
  String get fieldAutonomy => '自律性';

  @override
  String get fieldBudget => '予算';

  @override
  String get fieldComputer => 'コンピューター';

  @override
  String get fieldArchived => 'アーカイブ状態';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$botに$serviceキーが必要です';
  }

  @override
  String secretRequestHosts(String hosts) {
    return '$hosts専用';
  }

  @override
  String get secretRequestHelp => '直接保管庫に保存され、ボットには一切見えません。';

  @override
  String secretSaved(String name) {
    return '$nameを保存しました';
  }

  @override
  String get secretDeclined => '拒否しました';

  @override
  String secretWhat(String service) {
    return '$serviceキー';
  }

  @override
  String totpWhat(String service) {
    return '$serviceサインインコード';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return '操作を戻しました：$what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return '$hostのログイン情報を共有しました';
  }

  @override
  String get shareLogin => 'ログイン情報を共有';

  @override
  String get shareLoginUsername => 'メールアドレスまたはユーザー名';

  @override
  String get shareLoginPassword => 'パスワード';

  @override
  String get shareLoginRemember => '次回のために記憶する';

  @override
  String shareLoginHelp(String host, String bot) {
    return '$hostでのみ使用されます。$botにはパスワードは一切見えません。';
  }

  @override
  String get shareLoginSave => '保存してサインイン';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$botが$hostへのサインインを必要としています';
  }

  @override
  String get signInOnPage => 'ページ上でサインイン';

  @override
  String loginOnPageLine(String host) {
    return 'ページ上で$hostにサインイン中';
  }

  @override
  String get loginOnPageHelp => 'ページ上でサインインしてから「操作を戻す」をタップしてください。';

  @override
  String get back => '戻る';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '未共有：カレンダー',
      'reminders': '未共有：リマインダー',
      'contacts': '未共有：連絡先',
      'places': '未共有：場所',
      'photos': '未共有：写真',
      'health': '未共有：ヘルスケアデータ',
      'notifications': '未共有：通知',
      'activity': '未共有：コンピューターのアクティビティ',
      'browserTab': '未共有：現在のブラウザーのタブ',
      'browserHistory': '未共有：ブラウザーの履歴とブックマーク',
      'alarm': '未共有：アラーム',
      'home': '未共有：「ホーム」のアクセサリ',
      'other': '未共有：デバイスのデータ',
    });
    return '$_temp0';
  }

  @override
  String get decline => '拒否';

  @override
  String get signInCode => 'サインインコード';

  @override
  String get secretKindValue => 'キーまたはパスワード';

  @override
  String get totpSeedLabel => 'セットアップキー、otpauth://リンク、または現在表示中のコード';

  @override
  String get totpSeedHelp =>
      'サイトの2段階設定のセットアップキーを使うと、ボットが以降のコードも自動生成できます（キー自体はボットに見えません）。または今表示されているコードを入力すると、そのままボットに送られます。';

  @override
  String get scanQrCode => 'QRコードをスキャン';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$botに$serviceのサインインコードが必要です';
  }

  @override
  String get search => '検索';

  @override
  String get searchHint => 'チャット、メモリー、スキル、チケット、ファイルを検索';

  @override
  String get searchEmptyPrompt => '2文字以上入力してください。';

  @override
  String searchNoResults(String query) {
    return '「$query」に一致する結果はありません。';
  }

  @override
  String get searchMessages => 'メッセージ';

  @override
  String get searchChats => 'チャット';

  @override
  String get searchTickets => 'チケット';

  @override
  String get searchFiles => 'ファイル';

  @override
  String get searchFilesAsleep =>
      'スリープ中のコンピューターのファイルは検索されません。ファイルを検索に含めるにはコンピューターを起動してください。';

  @override
  String get searchSearching => '検索中…';

  @override
  String get searchJumpHint => '検索または移動…';

  @override
  String get searchRecent => '最近';

  @override
  String get searchClearRecent => 'クリア';

  @override
  String get searchRemoveRecent => '最近の検索から削除';

  @override
  String get searchJumpBackIn => '続きから再開';

  @override
  String get searchNeedsYou => '確認が必要';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n件の項目が確認待ちです',
      one: '1件の項目が確認待ちです',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => '移動';

  @override
  String get searchTopHits => '上位の結果';

  @override
  String get searchScopeAll => 'すべて';

  @override
  String get searchMemories => 'メモリー';

  @override
  String get searchKeepTyping => '入力を続けてメッセージ、メモリー、ファイルを検索してください。';

  @override
  String searchAskBot(String bot, String query) {
    return '「$query」について$botに聞く';
  }

  @override
  String get searchAskBotHelp => 'この質問で新しいチャットを始めます';

  @override
  String get searchKeysHint => '↑ ↓で移動   ↵で開く   escで閉じる';

  @override
  String get searchClear => '検索をクリア';

  @override
  String get installFor => 'インストール先';

  @override
  String get wholeWorkspace => 'ワークスペース全体';

  @override
  String get skillCatalog => 'スキルカタログ';

  @override
  String get searchSkills => 'スキルを検索';

  @override
  String get all => 'すべて';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString個のファイル',
      one: '1個のファイル',
    );
    return '$_temp0';
  }

  @override
  String get install => 'インストール';

  @override
  String skillInstalled(String name) {
    return '$nameをインストールしました。';
  }

  @override
  String get noResults => '結果がありません。';

  @override
  String get importFromGitHub => 'GitHubから読み込む';

  @override
  String get importFromGitHubHelp =>
      'SKILL.mdを含むフォルダーへのリンクを貼り付けてください。インストール前にすべてのファイルを確認できます。プライベートリポジトリにはapi.github.comで許可されたGITHUB_TOKENシークレットを使用します。';

  @override
  String get preview => 'プレビュー';

  @override
  String get skillScriptsNote =>
      'スキル内のスクリプトはボットのコンピューター上でのみ実行され、サーバー上では決して実行されません。';

  @override
  String get binaryFile => '（バイナリファイル）';

  @override
  String skillUpdate(String name) {
    return '$nameを更新';
  }

  @override
  String get checkingForUpdates => 'アップデートを確認中…';

  @override
  String get skillUpToDate => 'すでに最新です。';

  @override
  String get update => '更新';

  @override
  String get filesAdded => '追加';

  @override
  String get filesChanged => '変更';

  @override
  String get filesRemoved => '削除';

  @override
  String get fromCatalog => 'カタログから';

  @override
  String get savedByBot => 'ボットが保存';

  @override
  String get checkForUpdates => 'アップデートを確認';

  @override
  String get attachSkill => 'スキルを添付';

  @override
  String get rerunSetup => 'セットアップをやり直す';

  @override
  String get rerunSetupHelp => 'セットアップの質問に答え直して、新しい提案を確認します';

  @override
  String get trace => 'トレース';

  @override
  String get openTrace => 'トレースを開く';

  @override
  String get editMessage => '編集';

  @override
  String get editMessageHelp => '送信するとここから会話をやり直します。元のバージョンも残り、矢印で切り替えられます。';

  @override
  String get previousVersion => '前のバージョン';

  @override
  String get nextVersion => '次のバージョン';

  @override
  String get quietHours => 'おやすみ時間';

  @override
  String get quietHoursHelp =>
      'おやすみ時間が終わるまで通知を保留します（受信トレイには届きます）。開いているチャットの承認はそのまま届きます。';

  @override
  String quietHoursRange(String start, String end) {
    return '$start〜$end';
  }

  @override
  String get off => 'オフ';

  @override
  String get botNotifications => 'このボットからの通知';

  @override
  String get botNotificationsHelp => 'このボットがあなたのおやすみ時間に従うかどうか';

  @override
  String get botMayCall => '着信を許可';

  @override
  String get botMayCallHelp =>
      '通話に値する用件があるとき、このボットがあなたに電話をかけられます。オフの場合は代わりに通知を送ります。';

  @override
  String get quietDefault => '私のおやすみ時間に従う';

  @override
  String get quietAlways => '常に通知する';

  @override
  String get quietCustom => '独自のおやすみ時間';

  @override
  String get from => '開始';

  @override
  String get until => '終了';

  @override
  String get shareAsTemplate => 'テンプレートとして共有';

  @override
  String get shareAsTemplateRow => '指示、スキル、ルーティンを含むファイルまたはリンク';

  @override
  String get shareAsTemplateHelp =>
      '指示、スキル、ルーティン、使用サービスが含まれます。キーやシークレットは含まれません。';

  @override
  String get copyLink => 'リンクをコピー';

  @override
  String get includeMemories => 'メモリーを含める';

  @override
  String get includeMemoriesHelp => 'あなたについて学習した内容です。共有する際はご注意ください。';

  @override
  String get saveAsFile => 'ファイルとして保存';

  @override
  String get notABotTemplate => 'このファイルはCasamaのボットテンプレートではありません。';

  @override
  String get importBot => 'ボットを読み込む';

  @override
  String botImported(String name) {
    return '$nameの準備ができました。';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$nameの準備ができました。使えるように「連携」で$servicesを接続してください。';
  }

  @override
  String get whatComesWithIt => '含まれる内容';

  @override
  String get connectAfterImport => '読み込み後に接続';

  @override
  String get importRoutines => 'ルーティンをスケジュール設定';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'メモリー$countString件を保持',
      one: 'メモリー1件を保持',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'ルーティンを開始中…';

  @override
  String get offlineSaved => 'オフラインです。保存済みのメッセージを表示しています。';

  @override
  String get loadEarlierMessages => '以前のメッセージ';

  @override
  String get chatLoadFailedTitle => 'このチャットを読み込めませんでした';

  @override
  String get chatLoadFailedBody => '接続を確認して、もう一度お試しください。';

  @override
  String get projects => 'プロジェクト';

  @override
  String get newProject => '新しいプロジェクト';

  @override
  String get noProjects => 'プロジェクトはまだありません';

  @override
  String get projectsHelp =>
      'プロジェクトには、チャット、計画、ToDo、ファイル、作成されたものすべてが1つにまとまります。ボットと一緒に進めることも、ボットに計画を立てさせて自動で進めさせることもできます。';

  @override
  String get newProjectHelp => 'チャット、計画、ToDo、ファイル、作成されたものを1つにまとめます。';

  @override
  String get startPlanning => '計画を始める';

  @override
  String get projectTitle => 'タイトル';

  @override
  String get projectGoal => 'ゴール';

  @override
  String get projectDoneWhen => '完了条件';

  @override
  String get projectLead => '担当ボット';

  @override
  String get projectBudget => '予算';

  @override
  String get projectGoalHint => '最終的に何ができている必要がありますか？例：自分のドメインでランディングページを公開する…';

  @override
  String get projectDoneHint => '任意。完了と判断する基準';

  @override
  String get projectBudgetHint => '任意。使い切ると作業を一時停止します';

  @override
  String get projectThread => 'プロジェクトチャット';

  @override
  String get approvePlan => '計画を承認する';

  @override
  String get pause => '一時停止';

  @override
  String get resume => '再開';

  @override
  String get milestones => 'マイルストーン';

  @override
  String get needsSignoff => 'あなたの承認が必要です';

  @override
  String get signOff => '完了を承認';

  @override
  String get projectPlan => '計画';

  @override
  String get tickets => 'チケット';

  @override
  String get projectTimeline => 'タイムライン';

  @override
  String get projectPlanning => '計画中';

  @override
  String get projectActive => '進行中';

  @override
  String get projectPaused => '一時停止中';

  @override
  String get projectBlocked => 'ブロック中';

  @override
  String get projectDone => '完了';

  @override
  String get projectCancelled => 'キャンセル済み';

  @override
  String get projectName => '名前';

  @override
  String get projectNameHint => 'Space Dodger、春のお知らせメール…';

  @override
  String get createProject => 'プロジェクトを作成';

  @override
  String projectWorksAlone(String bot) {
    return '$botに自動で進めさせる';
  }

  @override
  String get projectWorksAloneHelp =>
      '承認用の計画案を作成し、ゴールを達成するまでセッションを分けて作業を進めます。あなたの承認なしに開始することはありません。';

  @override
  String get projectWorksAloneOn => 'ゴールを達成するまでセッションを分けて作業します。';

  @override
  String get projectWorksAloneOff => 'チャットで一緒に作業を進めます。';

  @override
  String get projectMade => 'このプロジェクトで作成';

  @override
  String projectMadeEmpty(String bot) {
    return 'まだありません。このプロジェクトのチャットで$botが作成したものがここに表示されます。';
  }

  @override
  String get projectSeeAll => 'すべて見る';

  @override
  String get projectTodos => 'ToDo';

  @override
  String get projectFiles => 'ファイル';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$botのコンピューター上の$folder';
  }

  @override
  String get projectMarkDone => '完了にする';

  @override
  String get projectReopen => '再開する';

  @override
  String get projectCover => 'カバー';

  @override
  String get projectCoverNone => 'なし';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'ヨット',
      'mountain': '山',
      'seedling': '新芽',
      'compass': 'コンパス',
      'lantern': 'ランタン',
      'telescope': '望遠鏡',
      'map': '地図',
      'chess': 'チェス',
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
      other: '$countString件',
      one: '1件',
      zero: 'まだありません',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'プロジェクト';

  @override
  String get creationMoveToProject => 'プロジェクトへ移動';

  @override
  String get creationNoProject => 'プロジェクトなし';

  @override
  String get makeProject => 'これをプロジェクトにする';

  @override
  String get makeProjectTitle => 'このトピックをプロジェクトにする';

  @override
  String makeProjectHelp(String bot) {
    return 'このトピックで$botが作成したものはこのプロジェクトに整理され、今後作成するものも同様に追加されます。';
  }

  @override
  String get openProject => 'プロジェクトを開く';

  @override
  String get theBot => 'ボット';

  @override
  String get forYou => 'あなたへ';

  @override
  String get inboxNeedsYou => '確認が必要';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '確認が必要（$nString）';
  }

  @override
  String get inboxBriefs => 'ブリーフィング';

  @override
  String get inboxUpdates => '更新情報';

  @override
  String get inboxEmptyHelp => 'ボットからの確認依頼、朝のブリーフィング、通知、新しいページがここに届きます。';

  @override
  String get inboxNeedsYouEmpty => '今すぐ対応が必要なものはありません';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'ボットが判断や手助けを必要としているときや、提案があるときにここに表示されます。';

  @override
  String get noBriefs => '朝のブリーフィングはまだありません';

  @override
  String botPublishedPage(String bot, String title) {
    return '$botが「$title」を公開しました';
  }

  @override
  String get forYouEmpty => '今はお届けするものはありません';

  @override
  String get forYouEmptyHelp => '朝のブリーフィングや日中の提案を受け取るには、ボットの設定で声かけをオンにしてください。';

  @override
  String morningBriefFrom(String name) {
    return '$nameからの朝のブリーフィング';
  }

  @override
  String get suggestions => '提案';

  @override
  String suggestedBy(String name) {
    return '$nameからの提案';
  }

  @override
  String get dismissSuggestion => 'この提案を閉じますか？';

  @override
  String dismissSuggestionHelp(String bot) {
    return '$botが今後もう一度提案してよいか選んでください。';
  }

  @override
  String get justThisOnce => '今回だけ閉じる';

  @override
  String justThisOnceHelp(String bot) {
    return '今回は非表示にします。あとで重要になった場合は$botが再度提案することがあります。';
  }

  @override
  String get dontSuggestAgain => '今後提案しない';

  @override
  String dontSuggestAgainHelp(String bot) {
    return '完全に非表示にします。$botがあなたの希望を記憶します。';
  }

  @override
  String wontSuggestAgain(String bot) {
    return '了解しました。$botはこの内容を今後提案しません。';
  }

  @override
  String get doIt => '実行する';

  @override
  String get checkins => '声かけ';

  @override
  String get checkinsHelp => '朝のブリーフィングを届け、対応が必要なことがないか数時間ごとに確認します。初期設定はオフです。';

  @override
  String get briefTime => '朝のブリーフィング時刻';

  @override
  String get scanEvery => '確認の間隔';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString時間',
      one: '1時間',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => '1日の上限';

  @override
  String get on => 'オン';

  @override
  String get actionRules => 'アクションルール';

  @override
  String get actionRulesRow => '確認なしでできること';

  @override
  String get actionRulesHelp =>
      '操作ごとの扱いを決めます（許可、上限付きで許可、事前に確認、または自分で完了する）。最も具体的なルールが優先され、ルールがない場合はボットの自律性が使われます。ボットが自分のルールを変えることはできません。';

  @override
  String get addRule => 'ルールを追加';

  @override
  String get addRuleHelp => 'ボットの操作と、そのときの対応方法を選びます。';

  @override
  String get noRules => 'ルールはまだありません。ボットの自律性レベルに従います。';

  @override
  String get otherTools => '特定のツール';

  @override
  String get workspaceRule => 'ワークスペースルール';

  @override
  String get catSend => 'メッセージの送信';

  @override
  String get catPay => '支払い';

  @override
  String get catDelete => '削除';

  @override
  String get catPublish => '公開';

  @override
  String get catShare => '共有と招待';

  @override
  String get catSignIn => 'サインイン';

  @override
  String get whenTheBot => 'ボットが次の操作をするとき';

  @override
  String get itShould => 'そのときの動作';

  @override
  String get ruleAllow => 'そのまま実行';

  @override
  String get ruleAllowLimits => '上限内で実行';

  @override
  String get ruleAsk => '事前に確認する';

  @override
  String get ruleHandOff => '自分に任せて完了してもらう';

  @override
  String get ruleDomains => '次のドメインのみ（カンマ区切り）';

  @override
  String get ruleMaxAmount => 'この金額まで';

  @override
  String get ruleForWorkspace => 'ワークスペース内のすべてのボットに適用';

  @override
  String get watchers => 'ウォッチャー';

  @override
  String get watchersRow => '見守っている対象';

  @override
  String get noWatchers => '監視中のものはありません';

  @override
  String get watchersHelp =>
      'ボットに「〜になったら教えて」と頼むと、ページ、返信、結果、時刻を監視します。変化があるまで費用はかかりません。';

  @override
  String get watcherActive => '監視中';

  @override
  String get watcherPaused => '一時停止中';

  @override
  String get watcherDone => '完了';

  @override
  String get watcherExpired => '期限切れ';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString回通知済み',
      one: '1回通知済み',
      zero: 'まだ通知されていません',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'AIアプリを接続';

  @override
  String connectAiAppAsk(String app) {
    return '$appがCasamaへのアクセスを求めています';
  }

  @override
  String get connectAiAppHelpShort =>
      '選んだワークスペース内で、あなたとしてボット一覧の取得、作業の依頼、結果の読み取りができます。ボットの承認とルールは引き続き適用されます。';

  @override
  String get connectAiAppSendsTo => '許可すると次の場所に戻ります';

  @override
  String get connectAiAppUnknown =>
      'Casamaはこのアドレスを確認できていません。アプリには誰でも好きな名前を付けられるため、自分でこの接続を開始し、このサイトを信頼している場合のみ許可してください。';

  @override
  String get connectAiAppDone => '完了しました。AIアプリに戻れます。';

  @override
  String get refuse => '拒否';

  @override
  String get allow => '許可';

  @override
  String get connectAiApps => 'AIアプリを接続';

  @override
  String get connectAiAppsHelp =>
      'MCP対応アプリはこのアドレスに接続してサインインするか、APIキーを使用します。接続した本人として動作します。';

  @override
  String get connectedAiApps => '接続済みのAIアプリ';

  @override
  String get connectedAiAppsHelp =>
      'サインインして接続したアプリです。接続を解除すると、このワークスペースへのアクセスが直ちに停止します。';

  @override
  String get connectedAiAppsAdminHelp =>
      'このワークスペースのメンバーがサインインして接続したアプリです。接続を解除すると、直ちにアクセスが停止します。';

  @override
  String get noConnectedAiApps => '接続済みのAIアプリはまだありません。';

  @override
  String mcpConnectionUsed(String when) {
    return '最終使用：$when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return '接続日時：$when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person・$when';
  }

  @override
  String get disconnectAiAppBody =>
      'このワークスペースですぐに動作を停止します。再び使うには、アプリ側からもう一度接続してください。';

  @override
  String get mcpApprovals => 'AIアプリからの承認を許可';

  @override
  String get mcpApprovalsHelp => '接続済みアプリがボットの操作を承認できるようになります。';

  @override
  String get newApiKey => '新しいAPIキー';

  @override
  String get apiKeyName => '名前';

  @override
  String get newGroupChat => '新しいグループチャット';

  @override
  String get groupChats => 'グループチャット';

  @override
  String groupWhoAnswers(String names) {
    return '$namesが回答します';
  }

  @override
  String get groupEveryoneAnswers => '全員が回答します';

  @override
  String get groupMentionHint => 'ボットを@メンション、または@everyone';

  @override
  String routineRan(String name) {
    return 'ルーティン「$name」を実行しました';
  }

  @override
  String groupBotCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ボット$countString体',
      one: 'ボット1体',
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
      other: '確認待ち$countString件',
      one: '確認待ち1件',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      '2〜10体のボットを1つのチャットに集められます。@名前で特定のボットに質問でき、@everyoneで担当ボットに作業の計画と割り振りを任せられます。';

  @override
  String get groupCreate => 'グループチャットを作成';

  @override
  String get groupCrewEmpty => '下のリストからボットを選んでグループを作ります。';

  @override
  String get groupLeadShort => '担当';

  @override
  String get groupMakeLead => '担当にする';

  @override
  String groupRemoveBot(String name) {
    return '$nameを削除';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'あと$count体のボットを選択',
      one: 'あと1体のボットを選択',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => '1グループの上限である10体に達しています。';

  @override
  String get groupLeadHint =>
      '@everyoneを使うと担当ボットが作業を計画します。上部の別のボットをタップすると担当を変更できます。';

  @override
  String groupLeadIs(String name) {
    return '$nameが担当です：@everyoneを使うと作業を計画します。上部の別のボットをタップすると担当を変更できます。';
  }

  @override
  String groupPickOneMoreLead(String name) {
    return 'あと1体のボットを選択してください。$nameが担当です。上部の別のボットをタップすると担当を変更できます。';
  }

  @override
  String get groupNeedTwoBots => 'グループチャットには少なくとも2体のボットが必要です。先に別のボットを作成してください。';

  @override
  String get groupSearchBots => 'ボットを検索';

  @override
  String get groupNoMatch => 'その名前に一致するボットはありません。';

  @override
  String get groupTitle => '名前（任意）';

  @override
  String get groupPickBots => 'ボット';

  @override
  String get groupLead => 'グループを担当';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'ページ';

  @override
  String get pagesRow => '公開されたレポートとダッシュボード';

  @override
  String get noPages => 'ページはまだありません';

  @override
  String get pagesHelp =>
      'ボットにレポート、ダッシュボード、トラッカーの作成を頼むと、ページとして公開できます。ページはブラウザーで開き、共有するまでは非公開のままです。';

  @override
  String get pagePrivate => '自分のみ';

  @override
  String get pageWorkspace => 'ワークスペース';

  @override
  String get pagePublic => 'リンクを知っている全員';

  @override
  String get pageRefreshes => 'スケジュール通りに更新';

  @override
  String get pageCardOpen => 'ページ・タップして開く';

  @override
  String get exportPdf => 'PDFをエクスポート';

  @override
  String get pageMakePublicTitle => 'このページを公開しますか？';

  @override
  String get pageMakePublicBody =>
      'リンクを知っている人なら誰でも、掲載データを含めて閲覧できるようになります。いつでも取り消すことができ、取り消すとリンクは無効になります。';

  @override
  String get pageMakePublic => '公開する';

  @override
  String get pagePublicLinkTitle => '公開リンク';

  @override
  String get pagePublicLinkBody => 'コピーしました。検索エンジンには掲載されません。';

  @override
  String deletePageTitle(String title) {
    return '「$title」を削除しますか？';
  }

  @override
  String get openPages => 'ページで開く';

  @override
  String get discard => '破棄';

  @override
  String get discardChangesTitle => '変更を破棄しますか？';

  @override
  String get discardChangesBody => '編集内容はまだ保存されていません。';

  @override
  String get keepEditing => '編集を続ける';

  @override
  String get teachTask => 'タスクを教える';

  @override
  String get teachWhichBot => 'どのボットに教えますか？';

  @override
  String get teachRecording => '記録中';

  @override
  String get teachRecordingPaused => '記録を停止しました';

  @override
  String get teachRecordingHelp =>
      '普段通りに操作してください。画面表示と各ステップが記録されますが、パスワード欄の入力は記録されません。';

  @override
  String get teachStop => '停止';

  @override
  String get teachMarkSecret => 'シークレットにする';

  @override
  String get teachMarkSecretHelp =>
      '直前に入力した内容が記録から削除され、ボットが尋ねるシークレット入力項目になります。';

  @override
  String get teachDraftTitle => '新しいスキル';

  @override
  String get teachDrafting => '記録からスキルを作成中…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countStringステップ',
      one: '1ステップ',
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
      other: '$countStringステップ',
      one: '1ステップ',
    );
    return '実演した内容（$_temp0）';
  }

  @override
  String get teachReviewHelp => 'ステップ、入力項目、成功条件を確認して保存してください。すぐに試せます。';

  @override
  String get teachDraftFailed =>
      'ボットが下書きを作成できませんでした。下の記録を見ながら手順を自分で入力するか、破棄してください。';

  @override
  String get teachAlreadySaved => 'このスキルは保存済みです';

  @override
  String get teachSaveAndTry => '保存して試す';

  @override
  String teachSaved(String name) {
    return '$nameを保存しました';
  }

  @override
  String get teachDiscardTitle => 'この記録を破棄しますか？';

  @override
  String get teachDiscardBody => '記録されたすべてのステップ、スナップショット、スクリーンショットが削除されます。';

  @override
  String teachStepClick(int x, int y) {
    return '$x, $yをクリック';
  }

  @override
  String teachStepType(String text) {
    return '「$text」と入力';
  }

  @override
  String teachStepSecret(String name) {
    return 'シークレット$nameを入力';
  }

  @override
  String teachStepKey(String key) {
    return '$keyを押す';
  }

  @override
  String get teachStepScroll => 'スクロール';

  @override
  String get plugins => 'プラグイン';

  @override
  String get pluginsRow => 'プラグインパッケージのスキルとツール';

  @override
  String get noPlugins => 'プラグインはまだありません';

  @override
  String get pluginsHelp =>
      'プラグインはGitHub上のAgent Plugins 1.0パッケージです。スキルやMCPツールを追加でき、サーバーはこのボットのコンピューター上で動作し、Casamaのサーバー上では動きません。';

  @override
  String get addPlugin => 'プラグインを追加';

  @override
  String get addPluginHelp =>
      'プラグインのフォルダーへのGitHubリンクを貼り付けてください。インストールされる前に追加内容を確認できます。';

  @override
  String get pluginAdds => '追加される内容';

  @override
  String pluginStdio(String command) {
    return 'ボットのコンピューターで実行：$command';
  }

  @override
  String pluginRemote(String url) {
    return '$urlに接続';
  }

  @override
  String pluginTalksTo(String hosts) {
    return '通信先：$hosts';
  }

  @override
  String get pluginSkill => 'スキル';

  @override
  String get pluginHosts => 'ネットワーク';

  @override
  String get pluginServerError => '起動できませんでした';

  @override
  String get pluginRunsOnComputer => 'ボットのコンピューターで実行';

  @override
  String get pluginWhereToolsRun => 'ツールの実行場所';

  @override
  String get pluginWhereToolsRunHelp =>
      '自分のコンピューター上ではそこにあるデータを使えますが、あなたのチャットからあなただけが利用できます。インターネット上のサーバーには影響しません。';

  @override
  String get pluginPlaceBot => 'ボットのコンピューター';

  @override
  String pluginPlaceMine(String name) {
    return '自分のコンピューター：$name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return '$name上で実行';
  }

  @override
  String get pluginRunsOnDeviceHelp => 'そのコンピューターの所有者とのチャット内でのみ動作します';

  @override
  String get pluginRunsOnDeviceOffline =>
      'オフライン：その端末でCasamaアプリが開かれるとツールが再び使えるようになります';

  @override
  String get pluginUpToDate => 'すでに最新です';

  @override
  String get checkForUpdate => 'アップデートを確認';

  @override
  String get uninstall => 'アンインストール';

  @override
  String uninstallPluginTitle(String name) {
    return '$nameをアンインストールしますか？';
  }

  @override
  String get uninstallPluginBody => 'このボットからスキル、ツール、ファイル、保存済みシークレットが削除されます。';

  @override
  String updatePluginTitle(String name) {
    return '$nameをアップデート';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return '新しいスキル：$names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return '変更されたスキル：$names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return '削除されたスキル：$names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return '新しいツールサーバー：$names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return '変更されたツールサーバー：$names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return '削除されたツールサーバー：$names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return '新しい通信先ホスト：$hosts';
  }

  @override
  String get pluginDiffNone => '追加内容に変更はありません。';

  @override
  String get next => '次へ';

  @override
  String get botNameLabel => '名前';

  @override
  String get importAgent => 'エージェントを読み込む';

  @override
  String get importAgentHelp =>
      'OpenClawまたはHermes Agentからボットを取り込むか、Grok Bot、Muse、ChatGPT Dots、Claude Duet、Hark、Instinctの設定（ペルソナ、スキル、スケジュール、メモリー）を貼り付けられます。作成前にすべて確認でき、キーや設定ファイルが読み取られることはありません。';

  @override
  String get importAgentPickFolder => 'フォルダーを選択';

  @override
  String get importAgentPickZip => 'フォルダーのZIPをアップロード';

  @override
  String get importPasteChoice => 'ボットの設定を貼り付け';

  @override
  String get importPasteChoiceHelp =>
      'Grok Bot、Muse、ChatGPT Dots、Claude Duet、Hark、Instinctなどのアプリから';

  @override
  String get importPasteTitle => 'ボットの設定を貼り付け';

  @override
  String get importPasteHelp =>
      '下のプロンプトをボットに送り、返答全体を貼り付けてください。新しいボットが作成される前にすべて確認できます。';

  @override
  String get importPasteSource => 'ボットの現在の場所はどこですか？';

  @override
  String get importPasteOther => 'そのほか';

  @override
  String get importPasteStep1 => '1. このプロンプトをボットに送る';

  @override
  String get importPasteReply => '2. 返答を貼り付ける';

  @override
  String get importPasteSafety =>
      'キー、パスワード、カード番号のように見える行は除外されます。読み込み後にアプリへもう一度サインインしてください。';

  @override
  String get importPasteSubtitle => '貼り付けた設定';

  @override
  String get agentImportReviewHelp => '不要な項目のチェックを外してください。読み込むまで何も作成されません。';

  @override
  String get agentImportNoPersona => 'ペルソナファイルが見つかりませんでした。';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スキル$countString個',
      one: 'スキル1個',
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
      other: 'ルーティン$countString件',
      one: 'ルーティン1件',
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
      other: 'メモリー$countString件',
      one: 'メモリー1件',
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
      other: 'ほか$countString個のファイル',
      one: 'ほか1個のファイル',
    );
    return '$_temp0をコンピューターの~/imported/にコピー';
  }

  @override
  String agentImportSkipped(String files) {
    return '未読み込み：$files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$nameを読み込み、$countString個のファイルをコンピューターにコピーしました';
  }

  @override
  String agentImportedFilesLater(String name) {
    return '$nameを読み込みました。残りのファイルはまだコピーできていません。コンピューターを割り当ててから再度読み込むとコピーできます。';
  }

  @override
  String get importMemoryTitle => 'ChatGPTまたはClaudeからメモリーを読み込む';

  @override
  String get importMemoryHelp =>
      'このプロンプトをChatGPTまたはClaudeにコピーし、下の欄に回答を貼り付けてください。';

  @override
  String get importMemoryPick => '正しいものだけ残し、それ以外はチェックを外してください。';

  @override
  String get importMemoryPaste => '回答';

  @override
  String get importMemoryNone => 'その回答からメモリーが見つかりませんでした。';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString件のメモリーを追加しました',
      one: '1件のメモリーを追加しました',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => 'ルーティンとスキルのファイル管理';

  @override
  String get routinesAsFilesHelp =>
      'すべてのルーティンとスキルをMarkdownファイルとして扱えます：エクスポートしてどこででも編集し、再読み込みしたりGitHubリポジトリで管理したりできます。';

  @override
  String get exportFiles => 'ファイルとしてエクスポート';

  @override
  String get importFiles => 'ファイルを読み込む';

  @override
  String get importFilesApply => '適用';

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

    return '新規$createdString件・変更$updatedString件・変更なし$unchangedString件';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return '読み込み完了：新規$createdString件・変更$updatedString件';
  }

  @override
  String get gitSync => 'Git同期';

  @override
  String get gitSyncOff => 'オフ';

  @override
  String get gitSyncHelp =>
      'Casamaでの変更がリポジトリにコミットされ、リポジトリへのプッシュは確認後にCasamaへ反映されます。両方の場所で同じファイルが変更された場合はCasama版を維持してプルリクエストを作成します。api.github.com向けに許可されたGITHUB_TOKENシークレットが必要です。';

  @override
  String get gitSyncNeedsToken => 'GITHUB_TOKENシークレットが必要です';

  @override
  String gitSyncedWhen(String when) {
    return '同期：$when';
  }

  @override
  String get gitSyncPr => '確認待ちのプルリクエスト';

  @override
  String get syncNow => '今すぐ同期';

  @override
  String get syncQueued => '1分以内に同期されます';

  @override
  String get gitBranch => 'ブランチ';

  @override
  String get gitFolder => 'リポジトリ内のフォルダー（任意）';

  @override
  String get gitSyncOn => '同期オン';

  @override
  String get gitSyncRemove => '同期を停止';

  @override
  String get gitWebhookTitle => 'このWebhookをリポジトリに追加';

  @override
  String get gitWebhookHelp =>
      'リポジトリの設定で、このアドレスとシークレットを使ってpushイベント用のWebhookを追加してください（コンテンツタイプ：application/json）。シークレットが表示されるのは今だけです。';

  @override
  String get gitWebhookUrl => 'Payload URL';

  @override
  String get gitWebhookSecret => 'シークレット';

  @override
  String get knowledge => 'ナレッジ';

  @override
  String get knowledgeRow => '検索と引用に使えるドキュメント';

  @override
  String get noKnowledge => 'ナレッジはまだありません';

  @override
  String get knowledgeHelp =>
      'ファイル、Webサイト、GitHubリポジトリを渡せます。必要なときに検索し、回答の根拠となったドキュメントを示します。';

  @override
  String get addKnowledge => 'ナレッジを追加';

  @override
  String get addKnowledgeHelp =>
      'PDF、Word、Markdown、HTML、CSV、テキストファイル、Webサイト（1ドメイン、robots.txtに従います）、またはリポジトリのドキュメントを追加できます。Webサイトとリポジトリは毎日更新されます。';

  @override
  String get knowledgeFiles => 'ファイル';

  @override
  String get knowledgeWebsite => 'Webサイト';

  @override
  String get knowledgePickFiles => 'ファイルを選択';

  @override
  String get knowledgeWebsiteUrl => 'Webサイトのアドレス';

  @override
  String get knowledgeRepoUrl => 'GitHubリンク';

  @override
  String get knowledgeShareAll => 'ワークスペース内のすべてのボットと共有';

  @override
  String get knowledgeShared => 'ワークスペース全体';

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
      other: '$docsString件のドキュメント',
      one: '1件のドキュメント',
    );
    return '$_temp0・$chunksString箇所のパッセージ';
  }

  @override
  String get knowledgeError => '読み込めませんでした';

  @override
  String get knowledgeSyncing => '読み込み中…';

  @override
  String get knowledgePending => '読み込み待ち';

  @override
  String get add => '追加';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$botからのスキル提案：$name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$botからの$name改善提案';
  }

  @override
  String skillUsesTools(String tools) {
    return '使用ツール：$tools';
  }

  @override
  String get saveSkill => 'スキルを保存';

  @override
  String get applyEdit => '変更を適用';

  @override
  String skillSaved(String name) {
    return '$nameを保存しました';
  }

  @override
  String skillUpdated(String name) {
    return '$nameをアップデートしました';
  }

  @override
  String get skillStats => '稼働状況';

  @override
  String get skillNotUsedYet => '未使用';

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

    return '使用$usesString回・成功$rateString%・失敗$failuresString回・修正$correctionsString回';
  }

  @override
  String skillLastFailure(String date) {
    return '前回の問題：$date';
  }

  @override
  String get skillHistory => '以前のバージョン';

  @override
  String get replays => 'リプレイ';

  @override
  String get replaysRow => '考えずにそのまま実行できる記録済み手順';

  @override
  String get noReplays => 'リプレイはまだありません';

  @override
  String get replaysHelp =>
      'リプレイはボットがそのまま実行できるブラウザーまたはデスクトップ操作の記録で、より速く低コストです。手順が動かなくなった場合はボットがその地点から引き継ぎ、リプレイを更新できます。実演して教えた記録から保存するか、直前の操作を保存するようボットに頼めます。';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countStringステップ',
      one: '1ステップ',
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
      other: '$runsString回実行',
      one: '1回実行',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: 'うち$failuresString回サポートが必要',
      one: 'うち1回サポートが必要',
    );
    return '$_temp0・$_temp1';
  }

  @override
  String runReplay(String name) {
    return '$nameを実行';
  }

  @override
  String get runReplayHelp => '入力する値を確認してから実行してください。';

  @override
  String get run => '実行';

  @override
  String get saveAsReplay => 'リプレイとしても保存';

  @override
  String replaySaved(String name) {
    return 'リプレイ「$name」を保存しました';
  }

  @override
  String get passwordManagers => 'パスワードマネージャー';

  @override
  String get passwordManagersRow => 'ボット用の1PasswordまたはBitwardenログイン';

  @override
  String get noPasswordManagers => 'パスワードマネージャーは未接続です';

  @override
  String get passwordManagersHelp =>
      '選んだ保管庫のログイン情報を使ってボットがサインインできます。ボットにパスワードが見えることはなく、そのログイン専用のサイト上のブラウザー欄にだけ自動入力されます。';

  @override
  String get connectPasswordManager => 'パスワードマネージャーを接続';

  @override
  String get pmWorkspace => 'ワークスペース全体';

  @override
  String get pmJustMe => '自分のみ';

  @override
  String get pmNoVaults => '保管庫はまだ選択されていません';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '保管庫$countString個',
      one: '保管庫1個',
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
      other: 'ログイン情報$countString件',
      one: 'ログイン情報1件',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'サービスアカウントのトークンを使って1Password Connectサーバーに接続します。';

  @override
  String get pmBitwardenHelp =>
      '組織のコレクション向けにBitwardenのVault Management API（bw serve）を使用します。';

  @override
  String get pmConnectUrl => 'Connectサーバーアドレス';

  @override
  String get pmConnectToken => 'Connectトークン';

  @override
  String get pmBwUrl => 'bw serveアドレス';

  @override
  String get pmBwToken => 'アクセストークン（任意）';

  @override
  String get pmForWorkspace => 'ワークスペース全体向け';

  @override
  String get pmChooseVaults => 'ボットが使用できる保管庫';

  @override
  String get pmChooseVaultsHelp =>
      'チェックを入れた保管庫やコレクション内のログイン情報だけがボットから利用可能になります。';

  @override
  String get welcomeGettingReady => 'スペースを準備中…';

  @override
  String get setUpManually => '手動で設定';

  @override
  String get tryAgain => '再試行';

  @override
  String get inviteLinkCopied => '招待リンクをコピーしました。一緒に働くメンバーに送ってください。';

  @override
  String get inviteFriends => '友人を招待';

  @override
  String inviteFriendsRow(String amount) {
    return '友人が参加するたびに$amount分の無料利用枠を獲得できます';
  }

  @override
  String get inviteFriendsRowPlain => '友人にCasamaを紹介';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Casamaを贈って$amount獲得';
  }

  @override
  String get inviteFriendsHeadlinePlain => '友人にCasamaを紹介';

  @override
  String inviteFriendsHelp(String amount) {
    return 'リンクを友人に送りましょう。友人が登録して最初のチャットを終えると、$amount分の無料利用枠がもらえます。';
  }

  @override
  String get inviteFriendsHelpPlain => 'リンクを友人に送ると、すぐに登録して始められます。';

  @override
  String get inviteFriendsYourCode => 'あなたの招待コード。タップしてコピーできます。';

  @override
  String get inviteFriendsShare => 'リンクを共有';

  @override
  String get inviteFriendsCopyLink => 'リンクをコピー';

  @override
  String get inviteFriendsCopied => 'コピーしました。友人に送ってください。';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'あなたのために働くAIチームメイト、Casamaを一緒に使いませんか：$link（招待コード：$code）';
  }

  @override
  String get inviteFriendsProgress => 'あなたの招待';

  @override
  String get inviteFriendsJoined => '参加した友人';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString人がまだ初回チャットを完了していません',
      one: '1人がまだ初回チャットを完了していません',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => '獲得した無料利用枠';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'あと$countString人の友人から特典をもらえます',
      one: 'あと1人の友人から特典をもらえます',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached => '招待特典の上限に達しました。ありがとうございます！';

  @override
  String get inviteFriendsHow => '仕組み';

  @override
  String get inviteFriendsStep1 => 'リンクまたはコードを友人に共有する';

  @override
  String get inviteFriendsStep2 => '友人が登録し、1週間以内にあなたのコードを入力する';

  @override
  String inviteFriendsStep3(String amount) {
    return '友人が最初のチャットを終えると、$amount分の無料利用枠がもらえます';
  }

  @override
  String get inviteFriendsStep3Plain => '友人が自分専用のAIチームメイトを使い始められます';

  @override
  String get inviteFriendsUnavailable => 'このサーバーでは招待を利用できません。';

  @override
  String get referralHaveCode => '友人のコードをお持ちですか？';

  @override
  String get referralCodeHint => '招待コード';

  @override
  String get referralUse => '使う';

  @override
  String get referralRedeemed => '招待コードを追加しました。Casamaへようこそ！';

  @override
  String referralRedeemedFrom(String name) {
    return '$nameさんの招待で参加しました。Casamaへようこそ！';
  }

  @override
  String referralJoinedThrough(String name) {
    return '$nameさんの招待で参加しました。';
  }

  @override
  String get referralJoinedThroughFriend => '友人の招待で参加しました。';

  @override
  String referralInvitedBy(String name) {
    return '$nameさんからの招待';
  }

  @override
  String get referralInvitedByFriend => '友人からの招待';

  @override
  String get referralWelcomeTitle => 'Casamaへようこそ';

  @override
  String get referralWelcomeHelp =>
      '専用のコンピューターであなたのために働くAIチームメイトです。招待を受けると、招待してくれた友人に特典が届きます。';

  @override
  String get referralAccept => '招待を受ける';

  @override
  String get referralGetStarted => '始める';

  @override
  String get referralInvalid => 'この招待は無効です';

  @override
  String get referralInvalidHelp =>
      'コードの入力に誤りがあるかもしれません。そのまま登録してCasamaを始めることもできます。';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return '$amount贈って$amount獲得';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'リンクを友人に送りましょう。友人があなたのコードで登録して最初のチャットを終えると、お互いに$amount分の無料利用枠がもらえます。';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'リンクを友人に送りましょう。友人があなたのコードで登録して最初のチャットを終えると、あなたに$reward、友人に$welcomeの無料利用枠が贈られます。';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return '友人が最初のチャットを終えると、お互いに$amount分の無料利用枠がもらえます';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return '友人が最初のチャットを終えると、あなたに$reward、友人に$welcomeが贈られます';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'あなたのために働くAIチームメイト、Casamaを一緒に使いませんか。招待コード$codeで登録すると$amount分の無料利用枠がもらえます：$link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return '登録から1週間以内に入力すると、最初のチャット後に$amount分の無料利用枠がもらえます。';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return '$amount分のウェルカムボーナスがワークスペースに付与されました。';
  }

  @override
  String referralWelcomePending(String amount) {
    return '$amount分のウェルカムボーナスは最初のチャット完了後に届きます。';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return '専用のコンピューターであなたのために働くAIチームメイトです。招待を受けると、最初のチャット後に$amount分の無料利用枠がもらえます。';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return '登録完了です！$amount分のウェルカムボーナスは最初のチャット後に届きます。';
  }

  @override
  String get connectManaged => 'Composioでサインイン';

  @override
  String connectManagedHelp(String app) {
    return 'Casamaはサインインを処理するComposio経由で$appを接続します。接続はいつでも解除できます。';
  }

  @override
  String get sharing => '共有';

  @override
  String get sharingRow => 'チャット、編集、管理ができるメンバー';

  @override
  String get sharingHelp =>
      '非公開にしない限り、ワークスペース内の全員がボットとチャットできます。追加したメンバーはチャットや設定編集、アクセス管理も行えます。ほかのメンバーのために動くときも、ボットはその人自身のコンピューターと接続だけを使います。';

  @override
  String get sharingPrivate => '非公開';

  @override
  String get sharingPrivateOn => '自分と下のメンバーだけが閲覧できます';

  @override
  String get sharingPrivateOff => 'ワークスペース内の全員がチャットできます';

  @override
  String get sharingPeople => '人数';

  @override
  String get sharingOnlyCreator => '作成者のみ';

  @override
  String get sharingEveryoneChats => '全員がチャット可能・編集できる人を追加';

  @override
  String sharingEveryoneRole(String role) {
    return 'すべての$role';
  }

  @override
  String get accessChat => 'チャット可能';

  @override
  String get accessEdit => '編集可能';

  @override
  String get accessAdmin => '管理可能';

  @override
  String get sharingSaved => '共有設定を保存しました';

  @override
  String get triggerCalendar => '会議';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '一致する会議の前後（$minutesString分）',
      zero: '一致する会議の開始時',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      '先にGoogleカレンダーまたはOutlookを接続してください。';

  @override
  String get calendarTriggerCalendar => 'カレンダー';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString分',
      zero: '開始時',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests => '社外の人が参加する会議のみ';

  @override
  String get calendarVideoLink => 'ビデオ会議リンクがある会議のみ';

  @override
  String get calendarTitleMatch => '次を含むタイトルのみ（任意）';

  @override
  String get fullAccess => 'フルアクセス';

  @override
  String get fullAccessHelp =>
      'ボットは、専用のコンピューターとあなたのMacで、事前の確認なしに操作します。支払い、パスワードの変更、自分で設定した「確認」ルールについては、引き続き確認します。';

  @override
  String get fullAccessConfirmTitle => 'フルアクセスをオンにしますか？';

  @override
  String get fullAccessConfirmBody =>
      'このワークスペースのすべてのボットが、事前の確認なしでメッセージ送信、ファイル削除、Mac上でのコマンド実行、接続の追加を行えるようになります。支払いとパスワード変更では引き続き確認を求めます。';

  @override
  String get fullAccessTurnOn => 'オンにする';

  @override
  String get botToBot => 'ボット同士の会話を許可';

  @override
  String get botToBotHelp => 'ボット同士が@メンション、メッセージ送信、作業の引き継ぎを行えます。';

  @override
  String get capMessages => 'メッセージ（iMessage）';

  @override
  String get chatApps => 'チャットアプリ';

  @override
  String get chatAppsRow => 'Telegram、メール、SMS、Slack、WhatsAppなど';

  @override
  String get botEmail => 'メールアドレス';

  @override
  String get botEmailRow => 'このボットに専用アドレスを設定';

  @override
  String botEmailClaimTitle(String name) {
    return '$nameにメールアドレスを付与';
  }

  @override
  String get botEmailClaimHelp =>
      '他の人がここへメールでき、ボットがメールで返信します。請求書、予約確認、ニュースレターなど何でも転送できます。';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => '名前はあとから変更できません。';

  @override
  String get botEmailNameLabel => '名前';

  @override
  String botEmailWillBe(String address) {
    return 'ボットのアドレス：$address。';
  }

  @override
  String get botEmailClaim => 'アドレスを作成';

  @override
  String get botEmailTaken => 'その名前は使われています。次のいずれかをお試しください：';

  @override
  String get botEmailClaimed => 'ボットにアドレスが設定されました';

  @override
  String get botEmailClaimedHelp => 'ようこそメールを送信しています。返信するか、何でも転送してみてください。';

  @override
  String get botEmailCopy => 'コピー';

  @override
  String get botEmailCopied => 'コピー済み';

  @override
  String get botEmailContacts => '連絡先に追加';

  @override
  String botEmailWrite(String name) {
    return '$name宛てに書く';
  }

  @override
  String get botEmailPaused => '一時停止中。メールの受信と保存は続けますが、返信はしません。';

  @override
  String get botEmailPause => '一時停止';

  @override
  String get botEmailResume => '再開';

  @override
  String get botEmailSenders => '許可された送信者';

  @override
  String get botEmailSendersHelp =>
      'これらの人だけに返信します。知らない人からのメールは保存されますが、処理は開始されません。';

  @override
  String get botEmailEditSenders => 'チャットアプリで編集';

  @override
  String get botEmailMove => '別のボットへ移動';

  @override
  String get botEmailMoveHelp => 'アドレスとそのメールを別のボットへ移動します。';

  @override
  String get botEmailRelease => 'アドレスを手放す';

  @override
  String get botEmailReleaseHelp => '受信を完全に停止します。この名前が再利用されることはありません。';

  @override
  String botEmailReleaseConfirm(String address) {
    return '$addressを手放しますか？すぐに受信を停止し、この名前が再び発行されることはありません。';
  }

  @override
  String get botEmailReleaseNow => '手放す';

  @override
  String get botEmailMoved => '移動完了';

  @override
  String botEmailNewBotRow(String name) {
    return '$nameにメールアドレスを付与';
  }

  @override
  String get botEmailInbox => '受信トレイ';

  @override
  String get botEmailInboxRow => '保存済みメール、未登録者、ファイル';

  @override
  String get botEmailEmpty => 'メールはまだありません';

  @override
  String get botEmailStrangers => '未登録の送信者';

  @override
  String get botEmailAll => 'すべてのメール';

  @override
  String get botEmailUnconfirmed => 'この送信者を確認できませんでした';

  @override
  String get botEmailAllow => '許可';

  @override
  String get botEmailBlock => 'ブロック';

  @override
  String get botEmailBlocked => 'ブロックしました。今後この送信者からのメールは拒否されます。';

  @override
  String get botEmailUnblock => 'ブロック解除';

  @override
  String get botEmailOpenChat => 'チャットを開く';

  @override
  String get botEmailFiles => 'ファイル';

  @override
  String get botEmailNewSenders => '新しい送信者を知らせる';

  @override
  String get botEmailNewSendersHelp => '多くても1日1回。オンにしない限り通知しません。';

  @override
  String get botEmailTryTitle => 'できることの例';

  @override
  String get botEmailTryForward => '請求書や予約確認メールを転送する';

  @override
  String get botEmailTryForwardHelp => '上のアドレスに何でも転送してください。内容を読み取ってここで返信します。';

  @override
  String get botEmailTryReceipts => '領収書を整理して残す';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return '$address宛てのメールを整理するルーティンを作成します。';
  }

  @override
  String get botEmailTryDigest => '週1回のまとめ';

  @override
  String botEmailTryDigestHelp(String address) {
    return '$addressに届いたニュースレターを週ごとのサマリーにまとめるルーティンを作成します。';
  }

  @override
  String get botEmailTryCopied => 'アドレスをコピーしました';

  @override
  String get botEmailTryMade => 'ルーティンを作成しました';

  @override
  String get botEmailReceiptsName => '領収書を整理して残す';

  @override
  String get botEmailReceiptsInstructions =>
      'このメールの領収書を用途、金額、日付ごとに整理してください。おかしな点がない限り返信は不要です。';

  @override
  String get botEmailDigestName => '週間ニュースレターまとめ';

  @override
  String get botEmailDigestInstructions =>
      '今週のニュースレターをまとめ、知っておくべき見出しだけを短く1通のダイジェストにして送ってください。';

  @override
  String get botEmailTriggerTag => 'アドレスタグ';

  @override
  String get botEmailTriggerTagHelp =>
      'ada+shop@のshopのようなタグ宛てのメールのみを対象にします。メールアドレス専用です。';

  @override
  String get botEmailTriggerUnconfirmed => '未確認の送信者からのメールも受け取る';

  @override
  String get botEmailTriggerAutomatic => '自動送信メールも受け取る';

  @override
  String botEmailStorage(String used, String limit) {
    return '$limit中$used';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used使用済み';
  }

  @override
  String get botEmailStorageFull =>
      'メールボックスがいっぱいのため新しいメールを受信できません。古いメールを削除して空き容量を作ってください。';

  @override
  String get botEmailSelect => '選択';

  @override
  String get botEmailSelectDone => '完了';

  @override
  String get botEmailDelete => '削除';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'メール$n件を削除',
      one: 'メール1件を削除',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n件のメールを削除しますか？',
      one: 'このメールを削除しますか？',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody => '本文とファイルは完全に削除されます。すでにチャットにあるコピーは残ります。';

  @override
  String get botEmailDeleteOlder => '古いメールを削除';

  @override
  String get botEmailOlder30Days => '30日より前';

  @override
  String get botEmailOlder6Months => '6か月より前';

  @override
  String get botEmailOlderYear => '1年より前';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': '30日より前のメールをすべて削除しますか？',
      'months6': '6か月より前のメールをすべて削除しますか？',
      'other': '1年より前のメールをすべて削除しますか？',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'メール$n件を削除しました',
      one: 'メール1件を削除しました',
      zero: '削除対象なし',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ボットのメールアドレス$n件',
      one: 'ボットのメールアドレス1件',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew => 'ボットが新しい相手へメールを送信';

  @override
  String get botEmailPerkRepliesOnly => 'ボットがあなたへメールで返信';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'チャットアプリを接続';

  @override
  String get chatAppsEmpty => 'チャットアプリはまだありません';

  @override
  String get chatAppsHelp =>
      'Telegram、メール、SMS、Slack、WhatsApp、Messenger、Feishu、iMessageからこのボットにメッセージを送れます。返信するのは許可リストの人だけで、それ以外のメッセージもここに記録されます。';

  @override
  String get chatAppsAddHelp =>
      'アプリの開発者設定から認証情報を貼り付けてください。暗号化して保存され、二度と表示されません。';

  @override
  String get chatAppsKind => 'アプリ';

  @override
  String get chatAppsSenders => '許可された送信者';

  @override
  String get chatAppsSendersHelp =>
      '1行につき1件：メールアドレス（または*@company.com）、電話番号、ユーザーID。IDがわからない場合は空欄のままボットにメッセージを送り、「アクティビティ」からコピーしてください。';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      '先にMacのデスクトップアプリで「メッセージ」を許可した状態で「このコンピューターをボットに使う」をオンにしてください。';

  @override
  String chatAppsConnected(String name) {
    return '$nameが接続されました';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegramからはすでにメッセージがここへ届いています。ボットにメッセージを送って試してみてください。';

  @override
  String get chatAppsPasteUrl => 'このアドレスをアプリのWebhook設定に貼り付けてください。';

  @override
  String get chatAppsWebhookUrl => 'Webhookアドレス';

  @override
  String get chatAppsVerifyToken => '確認トークン';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '許可された送信者$countString名',
      one: '許可された送信者1名',
      zero: '許可された送信者なし',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'アクティビティ';

  @override
  String get chatAppsNoActivity => 'メッセージはまだありません。';

  @override
  String get chatAppsIgnored => '無視済み：許可リストにありません';

  @override
  String get chatAppsAllow => '許可';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$senderがこのボットにメッセージできるようになりました';
  }

  @override
  String get chatAppsRoutine => 'ルーティンを開始しました';

  @override
  String get chatAppsFailed => '送信できませんでした';

  @override
  String get chatAppsSent => '送信済み';

  @override
  String get chatAppsAnswered => '回答済み';

  @override
  String get chatAppsRemove => '接続を解除';

  @override
  String get chBotToken => 'ボットトークン';

  @override
  String get chAddress => 'メールアドレス';

  @override
  String get chApiKey => 'APIキー';

  @override
  String get chSigningSecret => '署名シークレット';

  @override
  String get chPhoneNumber => '電話番号';

  @override
  String get chAccountSid => 'アカウントSID';

  @override
  String get chAuthToken => 'Authトークン';

  @override
  String get chPhoneNumberId => '電話番号ID';

  @override
  String get chAccessToken => 'アクセストークン';

  @override
  String get chAppSecret => 'アプリシークレット';

  @override
  String get chPageToken => 'ページアクセストークン';

  @override
  String get chAppId => 'アプリID';

  @override
  String get chEncryptKey => '暗号化キー';

  @override
  String get chVerificationToken => '確認トークン';

  @override
  String get chPublicKey => '公開鍵';

  @override
  String get chTrackerUser => 'トラッカー上のボットのユーザーID';

  @override
  String get chSiteUrl => 'サイトアドレス（https://…）';

  @override
  String get chAccountEmail => 'アカウントメール';

  @override
  String get routineMessage => '条件に一致するメッセージが届いたとき';

  @override
  String get triggerMessage => 'メッセージ';

  @override
  String get messageTriggerHelp =>
      'このボット宛てのメールやチャットメッセージが一致すると開始します。先に「チャットアプリ」でアプリを接続してください。';

  @override
  String get messageTriggerAnyApp => 'すべてのアプリ';

  @override
  String get messageTriggerSender => '送信元（アドレス、電話番号、または*@company.com）';

  @override
  String get messageTriggerSubject => '件名に含む語句';

  @override
  String get messageTriggerWords => '本文に含む語句';

  @override
  String callIncoming(String name) {
    return '$nameから着信中';
  }

  @override
  String get callAnswer => '応答';

  @override
  String get callDecline => '拒否';

  @override
  String get callFullScreenTitle => 'ロック画面での通話着信';

  @override
  String get callFullScreenOff =>
      'オフ：ボットからの着信は通知としてのみ表示されます。全画面で着信表示するにはオンにしてください。';

  @override
  String get encryption => 'コンテンツを暗号化';

  @override
  String get encryptionHelp =>
      'メッセージ、メモリー、チケット、ページ、ナレッジは保存前にこのワークスペース専用のキーで暗号化されます。検索時は暗号化文内の完全一致ではなくタイトルと意味で一致するものを探します。';

  @override
  String get encryptionOff => 'オフ';

  @override
  String get encryptionUnavailable => '利用不可：このサーバーには暗号化キーが設定されていません';

  @override
  String get encryptionEncrypting => 'オンにしています：保存済みの内容を暗号化中';

  @override
  String get encryptionOnServer => 'オン（サーバーのキーを使用）';

  @override
  String get encryptionOnKms => 'オン（AWS KMSを使用）';

  @override
  String get encryptionDecrypting => 'オフにしています：保存済みの内容を復号中';

  @override
  String get encryptionConfirm =>
      'コンテンツはこのワークスペースのキーで暗号化されます。ワークスペースが削除されるとキーも破棄され、コンテンツを復元できなくなります。暗号化されたテキストは完全一致検索の対象外になります。';

  @override
  String get encryptionTurnOn => 'オンにする';

  @override
  String get encryptionRotate => 'キーをローテーション';

  @override
  String get encryptionKeyManaged =>
      'Casamaがこのワークスペースのキーを作成・保管し、サーバー自身のキーで保護します。保存やコピーは必要ありません。';

  @override
  String get encryptionRotateTitle => 'キーをローテーションしますか？';

  @override
  String get encryptionRotateBody =>
      'ワークスペースキーをサーバーの現在のキーで保護し直します。コンテンツはそのまま読め、再暗号化も不要です。サーバーのキーを変更したあとや定期的に実行してください。';

  @override
  String get encryptionRotateHelp => 'ワークスペースキーをサーバーの現在のキーで保護し直します';

  @override
  String encryptionRotatedWhen(String when) {
    return '前回のローテーション：$when';
  }

  @override
  String get memoryBackend => 'メモリーの保存場所';

  @override
  String get memoryBuiltIn => '内蔵';

  @override
  String get memoryBackendHelp => 'ボットの長期メモリー';

  @override
  String get memoryBackendSheetHelp =>
      '自分のアカウントでHonchoまたはSupermemoryにボットのメモリーを保管できます。メモリー画面、エクスポート、削除はこれまで通り使えます。';

  @override
  String get memoryHonchoWorkspace => 'Honchoワークスペース';

  @override
  String get memoryHonchoWorkspaceHelp =>
      '空欄の場合はこのCasamaワークスペース用に作成されたものが使われます';

  @override
  String get memoryBaseUrl => 'サーバーアドレス（任意）';

  @override
  String get memoryBaseUrlHelp => 'セルフホストのHonchoまたはSupermemory用のみ';

  @override
  String get memoryCopyExisting => '現在のメモリーをコピーする';

  @override
  String get memoryUseBuiltIn => '内蔵メモリーに戻す';

  @override
  String get providerHintData => '有料データ（場所、メール、SEO）';

  @override
  String get kindA2a => 'AIエージェント（A2A）';

  @override
  String get a2aAgentUrl => 'エージェントアドレスまたはエージェントカードURL';

  @override
  String get a2aAgentToken => 'アクセストークン（任意）';

  @override
  String get a2a => 'Agent-to-Agent（A2A）';

  @override
  String get a2aHelp => '外部エージェントがあなたの公開したボットにタスクを依頼できます。';

  @override
  String get chromeExtensionSwitch => 'Casama for Chrome';

  @override
  String get chromeExtensionSwitchHelp => 'メンバーがこのワークスペースでブラウザー拡張機能を使えます。';

  @override
  String get chromeActSwitch => 'メンバーのブラウザーでのボット利用';

  @override
  String get chromeActSwitchHelp =>
      'メンバーは自分のChromeでボットにページを開かせて操作させることができ、専用のタブグループからいつでも停止できます。';

  @override
  String get a2aPublish => 'A2Aエージェントとして公開';

  @override
  String get a2aPublishHelp => 'ワークスペースAPIキーを持つ外部エージェントがこのボットにタスクを依頼できます。';

  @override
  String get a2aWorkspaceOff => '先にワークスペース設定でAgent-to-Agentをオンにしてください。';

  @override
  String get a2aCardUrl => 'エージェントカード';

  @override
  String get phoneCalls => '電話発信';

  @override
  String get phoneCallsHelp =>
      '自分のTwilioアカウントを使ってボットにお店などへ電話させられます。電話をかける前には、通常の承認ルールに従って必ず確認を求めます。';

  @override
  String get twilioSid => 'アカウントSID';

  @override
  String get twilioToken => 'Authトークン';

  @override
  String get twilioFrom => '発信元番号';

  @override
  String get phoneCallsPersonal => '個人の電話番号への発信を許可';

  @override
  String get phoneCallsCap => '1日の通話上限';

  @override
  String get phoneCallsOff => '未接続';

  @override
  String get outCall => '電話';

  @override
  String get outCallRinging => '呼び出し中…';

  @override
  String get outCallLive => '通話中';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString秒で終了';
  }

  @override
  String get outCallEndedByYou => '通話を終了しました';

  @override
  String get outCallTakenOver => '通話を引き継ぎました';

  @override
  String get outCallFailed => '発信できませんでした';

  @override
  String get outCallNothingYet => 'まだ会話はありません。';

  @override
  String get outCallTakeOver => '操作を代わる';

  @override
  String get outCallEnd => '通話を終了';

  @override
  String get outCallYourPhone => 'あなたの電話番号';

  @override
  String get outCallYourPhoneHelp =>
      '+819012345678のような国際形式で入力してください。保存済みの番号を使う場合は空欄のままにします。';

  @override
  String get payments => '支払い';

  @override
  String get paymentsHelp =>
      'ボットが、毎回あなたが承認する使い捨てのバーチャルカードでお店に支払えるようにします。自分のStripe Issuingアカウントをご用意ください。';

  @override
  String paymentsOn(String spent, String cap) {
    return '今月の上限$cap中$spentを使用';
  }

  @override
  String get paymentsSheetHelp =>
      'どのカードも、表示された金額をあなたが承認して発行されます。その加盟店で1回だけ、1時間以内に使えます。有価証券、暗号資産、ギフトカード、送金には一切使えません。';

  @override
  String get paymentsStripeKey => 'Stripeシークレットキー（Issuing権限付き）';

  @override
  String get paymentsWebhookSecret => 'Webhook署名シークレット';

  @override
  String get paymentsWebhook => 'StripeのWebhookをここに向けて設定してください';

  @override
  String get paymentsCardholder => 'カード名義';

  @override
  String get paymentsAddress => '請求先住所';

  @override
  String get paymentsCity => '市区町村';

  @override
  String get paymentsState => '都道府県・州';

  @override
  String get paymentsZip => '郵便番号';

  @override
  String get paymentsCountry => '国（2文字コード）';

  @override
  String get paymentsCap => 'ワークスペースの月間上限（USD）';

  @override
  String get paymentsBotCap => 'ボット1体あたりの月間上限（USD）';

  @override
  String get links => 'リンク済みボット';

  @override
  String get linksRow => '信頼できる連絡先のボットとリンク';

  @override
  String get linksHelp =>
      'あなたのボットが、リンクした連絡先のボットに食事の空き時間などを尋ねられます。各ボットは所有者のルールに従って必要な情報だけを共有し、やり取りは双方に表示されます。';

  @override
  String get linksEmpty => 'リンク済みのボットはまだありません';

  @override
  String get linksInvite => '連絡先を招待';

  @override
  String get linksContactName => '連絡先の名前';

  @override
  String get linksInviteReady => 'この招待を送る';

  @override
  String get linksInviteHelp =>
      '連絡先に送信してください。相手がCasamaで自分のボットを選んで承認すると接続されます。7日間・1回限り有効です。';

  @override
  String get linksAccept => '招待を受ける';

  @override
  String get linksAcceptHelp => '連絡先から届いた招待を貼り付けてください。';

  @override
  String get linksInviteText => '招待';

  @override
  String linksActive(String bot) {
    return '$botとリンク済み';
  }

  @override
  String get linksPending => '相手の承認待ち';

  @override
  String get linksRevoked => 'リンク解除済み';

  @override
  String get linksExchanges => 'やり取り';

  @override
  String get linksNoExchanges => 'まだやり取りはありません。';

  @override
  String get linksNoAnswer => '返答なし';

  @override
  String get linksWorking => '処理中…';

  @override
  String get linksRevoke => 'リンク解除';

  @override
  String get wakeWord => 'ウェイクワード';

  @override
  String get wakeWordRow => '決まったフレーズを話してボットとの通話を開始';

  @override
  String wakeWordOnRow(String phrase) {
    return '「$phrase」を待機中';
  }

  @override
  String get wakeWordHelp =>
      'Casamaを開いている間、このデバイスが指定したフレーズを聞き取り、選んだボットとのライブ通話を始めます。';

  @override
  String get wakeWordListen => 'ウェイクワードを待機';

  @override
  String get wakeWordPhrase => 'フレーズ';

  @override
  String get wakeWordPhraseHelp => '「ヘイCasama」のような2〜3語';

  @override
  String get wakeWordBot => '呼び出すボット';

  @override
  String get wakeWordDownloading => 'デバイス上モデルをダウンロード中…';

  @override
  String get wakeWordTest => 'フレーズをテスト';

  @override
  String get wakeWordTesting => '聞き取り中…フレーズを話してください';

  @override
  String get wakeWordHeard => '聞き取りました！';

  @override
  String get wakeWordStopTest => '停止';

  @override
  String get wakeWordPrivacy =>
      '聞き取りはこのデバイス上のオープンソースモデル（約18 MB、初回のみダウンロード）で行われます。通話が始まるまで音声が外部に送られることはありません。';

  @override
  String get secretStore => 'シークレットの保存場所';

  @override
  String get secretStoreVault => 'このサーバーのVault';

  @override
  String get secretStoreHelp =>
      'ボットの名前付きシークレットを自分のInfisicalプロジェクトに保管します。Casamaは各シークレットの名前と使用許可場所だけを保持します。';

  @override
  String get secretStoreSite => 'Infisicalアドレス';

  @override
  String get secretStoreProject => 'プロジェクトID';

  @override
  String get secretStoreEnv => '環境';

  @override
  String get secretStoreClientId => 'マシンIDクライアントID';

  @override
  String get secretStoreClientSecret => 'クライアントシークレット';

  @override
  String get secretStoreMove => '現在のシークレットをInfisicalへ移動';

  @override
  String get secretStoreBack => 'このサーバーのVaultに戻す';

  @override
  String get localServer => 'このコンピューターでCasamaを実行';

  @override
  String get setupTitleMac => 'このMacにCasamaを設定';

  @override
  String get setupTitle => 'このコンピューターにCasamaを設定';

  @override
  String get setupEntryMac => 'このMacで実行';

  @override
  String get setupEntry => 'このコンピューターで実行';

  @override
  String get setupEntryHelp => 'このコンピューター上のプライベートサーバー。個人利用は無料です。';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'サーバー';

  @override
  String get setupStepAccount => 'アカウント';

  @override
  String get setupStepModel => 'AIモデル';

  @override
  String get setupStepPhone => '電話番号';

  @override
  String get setupDockerChecking => 'Dockerを確認中…';

  @override
  String get setupDockerMissingTitle => 'まずDockerをインストールしてください';

  @override
  String get setupDockerMissingBodyMac =>
      'CasamaのサーバーはDocker Desktop内で動作します。Macのほかの環境から分離して動かす無料アプリです。';

  @override
  String get setupDockerMissingBodyLinux =>
      'CasamaのサーバーはDocker内で動作し、コンピューターのほかの環境から分離して動かします。';

  @override
  String get setupDockerGetMac => 'Docker Desktopをダウンロード';

  @override
  String get setupDockerGetLinux => 'Dockerインストールガイドを開く';

  @override
  String get setupDockerStep1 => 'ダウンロードされたファイルを開き、Dockerを「アプリケーション」にドラッグします。';

  @override
  String get setupDockerStep2 => 'Dockerを開いて規約に同意してください。';

  @override
  String get setupDockerStep3 => 'この画面に戻ってください。準備ができると自動で進みます。';

  @override
  String get setupDockerWaiting => 'Dockerの待機中…';

  @override
  String get setupDockerStoppedTitle => 'Dockerを起動する必要があります';

  @override
  String get setupDockerStoppedBodyMac =>
      'Dockerはインストールされていますが開いていません。起動すると（1分ほどかかる場合があります）このページは自動で進みます。';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Dockerはインストールされていますが動作していません。このコマンドで起動すると、このページは自動で進みます。';

  @override
  String get setupDockerOpen => 'Dockerを開く';

  @override
  String get setupDockerOpening => 'Dockerを起動中…';

  @override
  String get setupDockerPermissionTitle => 'Dockerに権限が必要です';

  @override
  String get setupDockerPermissionBody =>
      'Dockerは動作していますが、現在のユーザーに使用権限がありません。このコマンドを実行してから、一度ログアウトしてログインし直してください。';

  @override
  String get setupDockerComposeTitle => 'DockerにComposeがありません';

  @override
  String get setupDockerComposeBody =>
      'このDockerにはCompose v2がありません。Docker Desktopには含まれています。Linuxの場合はdocker-compose-pluginパッケージをインストールしてください。';

  @override
  String get setupStepSkipped => 'スキップ';

  @override
  String get setupArtDocker => 'まずはサーバーを入れる箱を用意します。';

  @override
  String get setupArtServer => 'あなたの拠点を作成中。ここが一番時間がかかります。';

  @override
  String get setupArtAccount => 'サーバーが起動しました！';

  @override
  String get setupArtModel => '次は頭脳を設定しましょう。';

  @override
  String get setupArtPhone => '最後のステップ：手元でも使えるようにします。';

  @override
  String get setupDockerSlowTitle => '時間がかかっていますか？';

  @override
  String get setupDockerSlowMenuBar =>
      'メニューバーのクジラアイコンを確認してください。動きが止まればDockerの準備は完了です。';

  @override
  String get setupDockerSlowTerms =>
      'Dockerに規約への同意を求めるウィンドウが表示されている場合は、先にそちらを完了してください。Dockerへのサインインは任意です。';

  @override
  String get setupDockerSlowRestart => '進まない場合はDockerのメニューから終了し、「再確認」を押してください。';

  @override
  String get setupDockerSlowInstalled =>
      'すでにインストール済みですか？初期設定を完了させるため「アプリケーション」から一度Dockerを開いてください。';

  @override
  String get setupDockerSlowOther =>
      '代わりにOrbStackやColimaをお使いですか？そちらを起動してください。Casamaはdocker infoに応答するどのDockerでも動作します。';

  @override
  String get setupDockerSlowTerminal =>
      'ターミナルでdocker infoを実行してDockerの状態を確認してください。';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Dockerの応答：$detail';
  }

  @override
  String get setupDockerRecheck => '再確認';

  @override
  String get setupDockerGuide => 'トラブルシューティングガイド';

  @override
  String setupDiskLow(String gb, String need) {
    return 'ディスクの空き容量が$gb GBしかありません。サーバーには約$need GB必要です。';
  }

  @override
  String get setupServerTitle => 'サーバーをダウンロードして起動';

  @override
  String get setupServerBody =>
      '初回は約2.5 GBのダウンロード（5〜10分程度）が行われ、セットアップ後は約10 GBのディスク容量を使用します。作業中もコンピューターをそのまま使えます。';

  @override
  String setupServerBodySized(String download, String disk) {
    return '$download GBをダウンロードし、セットアップ後は約$disk GBのディスク容量を使用します。初回は5〜10分ほどかかります。その間もコンピューターをそのまま使えます。';
  }

  @override
  String get setupServerBodyNothing => '必要なものはすべてこのコンピューターに揃っているため、1〜2分で起動します。';

  @override
  String get setupServerStart => '開始';

  @override
  String get setupServerStageDownload => 'サーバーをダウンロード中';

  @override
  String get setupServerStagePrepare => '準備中';

  @override
  String get setupServerStageParts => 'コンポーネントをダウンロード中';

  @override
  String setupServerDownloaded(int megabytes) {
    return '現在$megabytes MB';
  }

  @override
  String get setupServerStagePartsNote => '一番時間がかかる工程です';

  @override
  String setupServerPartsCount(int done, int total) {
    return '$total中$doneダウンロード済み';
  }

  @override
  String get setupServerStageStart => '起動中';

  @override
  String get setupServerStageWait => '応答を待っています';

  @override
  String get setupServerKeepOpen => '完了するまでCasamaを開いたままにしてください。';

  @override
  String get setupServerFailed => 'サーバーが起動しませんでした。';

  @override
  String get setupServerConnecting => '準備完了。接続中…';

  @override
  String get setupShowDetails => '詳細を表示';

  @override
  String get setupHideDetails => '詳細を隠す';

  @override
  String get setupAccountTitle => 'アカウントを作成';

  @override
  String get setupAccountBody =>
      'このアカウントはこのコンピューター上だけに保存され、このサーバーを所有します。メールは送信されません。';

  @override
  String get setupAccountName => 'お名前';

  @override
  String get setupAccountNameMissing => '名前を入力してください';

  @override
  String get setupAccountCreate => 'アカウントを作成';

  @override
  String get setupAccountHave => 'すでにここにアカウントがある';

  @override
  String get setupAccountNew => '代わりに新しいアカウントを作成';

  @override
  String get setupAccountSignInTitle => 'サーバーにサインイン';

  @override
  String get setupAccountSignInBody => 'このサーバーで作成したアカウントを使います。';

  @override
  String get setupAccountClosed => 'このサーバーにはすでにオーナーがいます。そのアカウントでサインインしてください。';

  @override
  String get setupAccountPreparing => 'スペースを準備中…';

  @override
  String get setupModelTitle => 'ボットにモデルを設定';

  @override
  String get setupModelBody =>
      'ボットが考えるにはAIモデルが必要です。ChatGPTプランでサインインするか、OpenRouter、Googleなどのプロバイダーのキーを貼り付けてください。';

  @override
  String get setupSkip => '今はスキップ';

  @override
  String get setupPhoneTitle => 'スマートフォンを接続';

  @override
  String get setupPhoneBody =>
      'Casama Linkを使うとこのコンピューターに専用アドレスが付与され、どこからでもスマートフォンから接続できます。無料のCasama Cloudアカウントで一度承認するだけで、チャットはこのコンピューター内に留まります。';

  @override
  String get setupPhoneTurnOn => 'このコンピューターにアドレスを割り当てる';

  @override
  String get setupPhoneScanTitle => 'スマートフォンのカメラでこれをスキャンしてください';

  @override
  String get setupPhoneScanBody =>
      'スマートフォンでCasamaが開き、サインインします。まだアプリが入っていない場合は、開いたページで入手方法を確認できます。';

  @override
  String get setupPhoneWaiting => 'スマートフォンを待っています…';

  @override
  String get setupPhoneConnected => 'スマートフォンが接続されました';

  @override
  String get setupPhoneConnectedBody =>
      'スマートフォンがサインインしました。別のデバイスを追加するには新しいコードを表示してください。';

  @override
  String get setupPhoneOwnerOnly => 'アドレスを割り当てられるのはこのサーバーのオーナーだけです。';

  @override
  String get setupFinish => '完了';

  @override
  String get setupCardTitle => '設定を完了する';

  @override
  String get setupCardModel => 'ボットが返信できるようにAIモデルを追加してください。';

  @override
  String get setupCardPhone => 'スマートフォンをこのコンピューターに接続してください。';

  @override
  String get setupCardOpen => '設定を続ける';

  @override
  String get desktopUsers => '同時使用デスクトップユーザー数';

  @override
  String get desktopUsersHelp =>
      'このチーム用コンピューター上のボットは1つの画面を共有します。使用中は他のボットが順番待ちをします（シェル、ファイル、ブラウザーでの作業は並行して続きます）。';

  @override
  String desktopUsersCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ボット$countString体',
      one: 'ボット1体',
    );
    return '$_temp0';
  }

  @override
  String deviceAccessAsk(String kind, String bot) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': '$botがカレンダーを使う許可を求めています',
      'reminders': '$botがリマインダーを使う許可を求めています',
      'contacts': '$botが連絡先を使う許可を求めています',
      'places': '$botが場所を使う許可を求めています',
      'photos': '$botが写真を使う許可を求めています',
      'health': '$botがヘルスケアデータを使う許可を求めています',
      'notifications': '$botが通知を使う許可を求めています',
      'activity': '$botがコンピューターのアクティビティを使う許可を求めています',
      'browserTab': '$botが現在のブラウザーのタブを使う許可を求めています',
      'browserHistory': '$botがブラウザーの履歴とブックマークを使う許可を求めています',
      'alarm': '$botがアラームを使う許可を求めています',
      'home': '$botが「ホーム」のアクセサリを使う許可を求めています',
      'other': '$botがデバイスのデータを使う許可を求めています',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp => '自分のチャット内でのみ有効です。設定 → デバイス接続からいつでも停止できます。';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'カレンダーの使用を許可しました',
      'reminders': 'リマインダーの使用を許可しました',
      'contacts': '連絡先の使用を許可しました',
      'places': '場所の使用を許可しました',
      'photos': '写真の使用を許可しました',
      'health': 'ヘルスケアデータの使用を許可しました',
      'notifications': '通知の使用を許可しました',
      'activity': 'コンピューターのアクティビティの使用を許可しました',
      'browserTab': '現在のブラウザーのタブの使用を許可しました',
      'browserHistory': 'ブラウザーの履歴とブックマークの使用を許可しました',
      'alarm': 'アラームの使用を許可しました',
      'home': '「ホーム」のアクセサリの使用を許可しました',
      'other': 'デバイスのデータの使用を許可しました',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => '未共有';

  @override
  String get deviceKindCalendar => 'カレンダー';

  @override
  String get deviceKindReminders => 'リマインダー';

  @override
  String get deviceKindContacts => '連絡先';

  @override
  String get deviceKindPlaces => '場所';

  @override
  String get deviceKindPhotos => '写真';

  @override
  String get deviceKindHealth => 'ヘルスケアデータ';

  @override
  String get deviceKindNotifications => '通知';

  @override
  String get deviceKindActivity => 'コンピューターのアクティビティ';

  @override
  String get deviceKindBrowserTab => '現在のブラウザーのタブ';

  @override
  String get deviceKindBrowserHistory => 'ブラウザーの履歴とブックマーク';

  @override
  String get deviceKindAlarm => 'アラーム';

  @override
  String get deviceKindHome => '「ホーム」のアクセサリ';

  @override
  String get deviceBrowserAsks => 'ボットがブラウザーにリクエストできる内容';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama for Chromeがこれらにリアルタイムで応答し、記録は一切残りません。拡張機能の設定でオン・オフを切り替えられます。';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return '$botからのリクエストを停止';
  }

  @override
  String get deviceConnections => 'デバイス接続';

  @override
  String get deviceConnectionsHelp =>
      'このデバイスのデータをボットと共有します。各項目の既定はオフで、あなたが許可したボットだけが、あなた自身のチャット内でのみ読み取れます。';

  @override
  String get deviceConnectionsNone =>
      'このデバイスはまだデータを共有できません。スマートフォンでCasamaを開き、共有したい項目をオンにしてください。';

  @override
  String get deviceKeepFor => '保持期間';

  @override
  String get deviceKeepLiveOnly => 'ライブのみ';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString日',
      one: '1日',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'プライベートモデルのみ';

  @override
  String get devicePrivateModelHelp => 'ローカルモデルで動作するボットだけが読み取れます';

  @override
  String get deviceNoBots => 'ボットはまだいません。必要になったときにボットが許可を求めるか、今すぐ許可できます。';

  @override
  String get deviceAllowBot => 'ボットを許可';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'どのボットにカレンダーの読み取りを許可しますか？',
      'reminders': 'どのボットにリマインダーの読み取りを許可しますか？',
      'contacts': 'どのボットに連絡先の読み取りを許可しますか？',
      'places': 'どのボットに場所の読み取りを許可しますか？',
      'photos': 'どのボットに写真の読み取りを許可しますか？',
      'health': 'どのボットにヘルスケアデータの読み取りを許可しますか？',
      'notifications': 'どのボットに通知の読み取りを許可しますか？',
      'activity': 'どのボットにコンピューターのアクティビティの読み取りを許可しますか？',
      'browserTab': 'どのボットに現在のブラウザーのタブの読み取りを許可しますか？',
      'browserHistory': 'どのボットにブラウザーの履歴とブックマークの読み取りを許可しますか？',
      'alarm': 'どのボットにアラームの読み取りを許可しますか？',
      'home': 'どのボットに「ホーム」のアクセサリの読み取りを許可しますか？',
      'other': 'どのボットにデバイスのデータの読み取りを許可しますか？',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casamaに権限がありません。システム設定で許可してからもう一度お試しください。';

  @override
  String get deviceOtherDevices => 'ほかのデバイス';

  @override
  String get deviceForget => 'このデバイスを忘れる';

  @override
  String get deviceBrowsers => 'ボットが使えるブラウザー';

  @override
  String get deviceBrowsersHelp =>
      'Casama for Chromeでペアリングされています。許可したボットはそこで専用のタブグループを使い、あなたのサインイン状態で作業します。';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ボット$count体',
      one: 'ボット1体',
      zero: 'ボットはまだありません',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'オンライン';

  @override
  String get deviceBrowserOffline => 'オフライン';

  @override
  String get deviceBrowserUnpair => 'このブラウザーのペアリングを解除';

  @override
  String get deviceBrowserAllBots => 'すべてのボット';

  @override
  String get deviceChromeNotPaired => 'Casama for Chrome：未ペアリング';

  @override
  String get deviceChromeHowToPair =>
      'Casama for Chromeをインストールしてサインインし、その他 → 「ボットにこのブラウザーを使わせる」を開いてください。';

  @override
  String get deviceConnectionsRowHelp => 'このデバイスのカレンダー、連絡先など';

  @override
  String get healthExtraCycle => '周期記録';

  @override
  String get healthExtraGlucose => '血糖値';

  @override
  String get healthExtraBloodPressure => '血圧';

  @override
  String get appleHealth => 'Appleヘルスケア';

  @override
  String get appleHealthAbout =>
      'これがオンのときのみ、Appleヘルスケア（HealthKit）から睡眠、アクティビティ、ワークアウト、心臓の1日ごとの概要を読み取ります。CasamaがAppleヘルスケアに書き込むことは一切ありません。';

  @override
  String get healthNotMedical =>
      '1日ごとの概要（睡眠、アクティビティ、ワークアウト、心臓）のみです。ボットは普段との比較を説明しますが、医療上の助言は行いません。';

  @override
  String get healthNeedsEncryption =>
      'ヘルスケアデータには保存時の暗号化が必要です。所有しているワークスペースでオンにしてからもう一度お試しください。';

  @override
  String get placeAddHere => '今いる場所を追加';

  @override
  String get placeName => 'この場所に名前を付ける（自宅、職場、ジム）';

  @override
  String get placeNoLocation => '位置情報を取得できません。Casamaの位置情報を許可してからもう一度お試しください。';

  @override
  String get placesHelp =>
      '登録した場所への到着や出発をボットに知らせます。共有されるのは場所の名前と時刻のみで、移動経路は共有されません。';

  @override
  String get watchedAppsHelp =>
      'これらのアプリからの通知だけが共有されます。ワンタイムコードはスマートフォンの外へ送られる前に隠されます。';

  @override
  String get watchedAppAdd => 'アプリを追加（名前またはパッケージID）';

  @override
  String get providerHintMaps => '出発時刻を知らせるための所要時間';

  @override
  String routineDevice(String event, String detail) {
    return 'スマートフォン上で：$event $detail';
  }

  @override
  String get ctxSelection => '選択したテキスト';

  @override
  String get ctxAddScreenshot => 'スクリーンショットを追加';

  @override
  String get ctxScreenshotAdded => 'スクリーンショットを追加しました';

  @override
  String get ctxScreenshotFailed =>
      'スクリーンショットを撮影できませんでした。システム設定でCasamaに画面収録を許可してください。';

  @override
  String get watchedFolders => '監視フォルダー';

  @override
  String get watchedFoldersHelp =>
      'これらのフォルダーに新しいファイルが入るとルーティンを開始できます（例：ダウンロードに新しいPDFが入ったら整理する）。共有されるのはファイル名のみで、ボットがこのコンピューター上で動くときだけファイルの中身を読み取ります。';

  @override
  String get whyTitle => 'なぜこれが表示されるのですか？';

  @override
  String whyData(String data) {
    return '使用データ：$data';
  }

  @override
  String whyUrgency(String urgency) {
    return '緊急度：$urgency';
  }

  @override
  String get heldMeeting => '会議中だったため待機し、ブリーフィングと一緒に届きました。';

  @override
  String get heldFocus => '集中モード中だったため待機し、ブリーフィングと一緒に届きました。';

  @override
  String get heldDriving => '運転中だったため待機し、ブリーフィングと一緒に届きました。';

  @override
  String get heldCap => 'ボットが今日すでに5件のメッセージを送っていたため、この件はブリーフィングまで待機しました。';

  @override
  String get heldLow => '緊急ではなかったため、通知を鳴らさずブリーフィングまで待機しました。';

  @override
  String get lessLikeThis => 'このような提案を減らす';

  @override
  String get lessLikeThisDone => '了解しました。今後この種を減らします';

  @override
  String get widgetStatusWorking => '作業中…';

  @override
  String get widgetStatusOff => 'オフ';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner => 'インスタンスオーナーにより停止中';

  @override
  String get previewHi => 'こんにちは！';

  @override
  String get previewAsk => 'メモを整理してもらえますか？';

  @override
  String get previewOnIt => '承知しました';

  @override
  String get previewDone => '完了しました！3つのフォルダーに整理しました。';

  @override
  String get previewMessage => 'メッセージ';

  @override
  String get fontPreviewGreeting => 'おはようございます';

  @override
  String get photosFromUnsplash => '写真提供：Unsplash';

  @override
  String get showBotSteps => 'ボットの手順を表示';

  @override
  String get showBotStepsHelp => 'すべてのチャットにコマンドと技術的なエラーを表示します。';

  @override
  String get showScreenCard => '作業中のボットの画面を表示';

  @override
  String get showScreenCardHelp => 'チャット内の小さなライブカードです。タップすると全画面で見られます。';

  @override
  String get showReplyUsage => '返信に利用状況を表示';

  @override
  String get showReplyUsageHelp => '各返信にかかったコストをその下の行に表示します。';

  @override
  String get openLinksInApp => 'アプリ内でリンクを開く';

  @override
  String get openLinksInAppHelp =>
      'WebリンクをCasama内のブラウザーで開きます。オフの場合は既定のブラウザーで開きます。';

  @override
  String replyUsageTokens(String count) {
    return '$countトークン';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '自分のキーで$amount';
  }

  @override
  String get replyUsageOnPlan => 'ChatGPTプランを使用';

  @override
  String replyUsageSoFar(String amount) {
    return 'ここまで$amount';
  }

  @override
  String get replyUsageTooltip => 'この返信にかかったコスト';

  @override
  String get replyUsageTitle => 'この返信にかかったコスト';

  @override
  String get replyUsageFromCredits => 'クレジットから支払い';

  @override
  String get replyUsageYourKeys => '自分のキーを使用';

  @override
  String get replyUsageTotal => '合計';

  @override
  String get replyUsageTime => '時間帯';

  @override
  String get replyUsageTokensLabel => 'トークン';

  @override
  String get replyUsageSteps => 'ステップ';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '補助実行$n回を含む',
      one: '補助実行1回を含む',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing => 'この返信では課金計測されませんでした。';

  @override
  String replyUsageCreditsValue(String price) {
    return '1クレジット=$price。自分のキーや外部プランはCasamaではなくそれぞれのプロバイダーから請求されます。';
  }

  @override
  String get replyUsageOpenRun => '実行を開く';

  @override
  String get replyUsageLoadFailed => 'この返信の利用状況を読み込めませんでした。';

  @override
  String get replyUsageOurCost => '原価';

  @override
  String get replyUsageMargin => '利益';

  @override
  String replyUsageItemCost(String amount) {
    return '原価：$amount';
  }

  @override
  String get replyUsageAdminNote =>
      'このサーバーを運営しているため、原価と利益が表示されています。他の人には見えません。';

  @override
  String get kindSpeechToText => '音声からテキスト';

  @override
  String get kindVoice => '音声通話';

  @override
  String get kindImages => '画像';

  @override
  String get kindVideo => '動画';

  @override
  String get kindSearch => 'Web検索';

  @override
  String get kindData => 'データ参照';

  @override
  String get kindPhone => '電話発信';

  @override
  String get kindApps => 'アプリ操作';

  @override
  String get activityReady => '準備中…';

  @override
  String get activitySearching => 'Webを検索中…';

  @override
  String get activityBrowsing => 'Webを閲覧中…';

  @override
  String get activityComputer => 'コンピューターで作業中…';

  @override
  String get activityFiles => 'ファイルを確認中…';

  @override
  String get activityImage => '画像を作成中…';

  @override
  String get activityVideo => '動画を作成中…';

  @override
  String get activityMemory => '記憶内容を確認中…';

  @override
  String get activityApps => 'アプリを使用中…';

  @override
  String get activityScheduling => 'スケジュールを設定中…';

  @override
  String get activityWorking => '作業中…';

  @override
  String get activityWaitingForScreen => '画面の操作を戻してもらえるのを待っています…';

  @override
  String get runFailedPlain => '問題が発生しました。もう一度試すか、「詳細」を開いて理由を確認してください。';

  @override
  String get newKeyTitle => '新しいキーをコピー';

  @override
  String get newKeyHelp => '表示されるのはこの1回だけです。接続するアプリに貼り付けてから「完了」をタップしてください。';

  @override
  String get copyKey => 'キーをコピー';

  @override
  String get keyCopied => 'キーをコピーしました';

  @override
  String revokeApiKeyTitle(String name) {
    return '「$name」を取り消しますか？';
  }

  @override
  String get revokeApiKeyBody =>
      'このキーを使うアプリはすぐに接続できなくなります。この操作は取り消せません。再接続するには新しいキーを作成してください。';

  @override
  String unlinkTitle(String name) {
    return '「$name」とのリンクを解除しますか？';
  }

  @override
  String get unlinkBody => 'ボット同士の会話がすぐに停止します。再びリンクするには新しい招待が必要です。';

  @override
  String get alreadyMember => 'すでにこのワークスペースのメンバーです。';

  @override
  String get askAdminToInvite => 'メンバーを招待できるのはオーナーと管理者のみです。招待リンクを発行してもらってください。';

  @override
  String get askBeforeJoining => '参加前に確認を求める';

  @override
  String get askBeforeJoiningHelp => 'リンクを使った人を毎回管理者が承認します。';

  @override
  String get askToJoin => '参加をリクエスト';

  @override
  String get customLinks => 'カスタムリンク';

  @override
  String get customLinksHelp => 'ロール、有効期限、使用回数を個別に設定したリンクです。';

  @override
  String get emailAddresses => 'メールアドレス';

  @override
  String get emailAddressesHelp => '1つ以上をカンマまたは改行で区切って貼り付けてください。';

  @override
  String get getCode => 'コードを取得';

  @override
  String get getNewCode => '新しいコードを取得';

  @override
  String get getStarted => '始める';

  @override
  String get welcomeCta => '始めましょう';

  @override
  String get inviteAsAdmin => '管理者として招待';

  @override
  String get inviteByEmail => 'メールで招待';

  @override
  String get inviteExpired => '期限切れ';

  @override
  String inviteExpires(String when) {
    return '$whenに失効';
  }

  @override
  String get inviteInvalid => 'この招待は無効です';

  @override
  String get inviteInvalidHelp =>
      '期限切れ、使用済み、または無効になっている可能性があります。新しい招待を依頼してください。';

  @override
  String get inviteLink => '招待リンク';

  @override
  String get inviteLinkApprovalHelp =>
      'このリンクを知っている人は誰でも参加を申請できます。下のリストで承認できます。';

  @override
  String get inviteLinkHelp =>
      'このリンクを知っている人は誰でもメンバーとして参加できます。チャットやメールで共有してください。';

  @override
  String get inviteLinkOrCode => '招待リンクまたは招待コード';

  @override
  String inviteOtherServer(String host) {
    return 'この招待は$host向けですが、このアプリは別のサーバーに接続されています。';
  }

  @override
  String get inviteRenewed => 'この招待はさらに7日間有効になりました。新しいリンクを送ってください。';

  @override
  String inviteSentTo(String email) {
    return '承認するには$emailでサインインしてください。';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Casamaの「$workspace」に参加：$url';
  }

  @override
  String invitedBy(String name) {
    return '$nameさんからの参加招待';
  }

  @override
  String get invitedToJoin => '参加へ招待されています';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString件の招待を送信しました。',
      one: '招待を送信しました。',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => '管理者として参加します';

  @override
  String get joinAsMember => 'メンバーとして参加します';

  @override
  String get joinByDomain => 'メールドメインで参加';

  @override
  String get joinByDomainHelp => '認証済みメールアドレスは招待なしで参加できます。';

  @override
  String joinByDomainSwitch(String domain) {
    return '認証済みの@$domainメールを持つ人なら誰でも参加できます';
  }

  @override
  String get joinByDomainUnavailable =>
      '認証済みの業務用メールでサインインしている場合に利用できます（gmail.comなどは対象外）。';

  @override
  String get joinNeedsApproval => '新しいメンバーの参加前に管理者が承認します。';

  @override
  String get joinRequestSent => 'リクエストを送信しました';

  @override
  String joinRequestSentHelp(String name) {
    return '$nameの管理者が確認します。参加が承認されると通知が届きます。';
  }

  @override
  String get joinWithLinkOrCode => 'リンクまたはコードで参加';

  @override
  String get spacesInvite => 'メンバーを招待';

  @override
  String spacesInviteTo(String name) {
    return '移動先：$name';
  }

  @override
  String get spacesNew => '新しいワークスペース';

  @override
  String get spacesNewHint => '専用のボット、メンバー、請求設定';

  @override
  String get spacesJoin => 'ワークスペースに参加';

  @override
  String get spacesJoinHint => '招待リンクまたは招待コードで参加';

  @override
  String joinWorkspaceNamed(String name) {
    return '$nameに参加';
  }

  @override
  String get joinedBotsHelp => 'これらのボットがサポートします。まずは挨拶してみましょう。';

  @override
  String get joinedNoBots => 'まだボットがいません。新しく作成するか、まずは中を見てみましょう。';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'メンバー$countString名',
      one: 'メンバー1名',
    );
    return '$_temp0';
  }

  @override
  String get members => 'メンバー';

  @override
  String openToDomain(String domain) {
    return '@$domainに公開中';
  }

  @override
  String openWorkspace(String name) {
    return '$nameを開く';
  }

  @override
  String get pendingInvites => '未承認の招待';

  @override
  String get people => '人数';

  @override
  String get workspaceAdvancedSummary => 'シークレット、メモリー、暗号化、支払い、MCP';

  @override
  String get peopleAdvancedSummary => '招待コード、メールドメイン、カスタムリンク';

  @override
  String get inviteLinkToCopy => '招待リンクをコピーできます';

  @override
  String linkMade(String when) {
    return '作成日：$when';
  }

  @override
  String get billingAdvancedSummary => 'サーバー別・Casama Linkサーバー・キー別の請求';

  @override
  String get billingChargesSummary => 'サーバー別の請求';

  @override
  String get billingUsageRow => 'ボットが使った内容とコスト';

  @override
  String billingUsageSoFar(String amount) {
    return '今月ここまで：$amount';
  }

  @override
  String get usageAdvancedSummary => 'トークン数、JSONエクスポート';

  @override
  String get peopleHelp => 'メンバーを招待して参加ルールを決めます。';

  @override
  String get peopleRow => 'メンバーの招待、リクエストの承認、メンバー一覧';

  @override
  String get qrCode => 'QRコード';

  @override
  String get remove => '削除';

  @override
  String get resendInvite => '再送信';

  @override
  String get resetLink => 'リンクをリセット';

  @override
  String get resetLinkHelp =>
      '現在のリンクはすぐに無効になり、新しいリンクが発行されます。すでにメンバーの人はそのまま残ります。';

  @override
  String get revokeInvite => '招待を取り消す';

  @override
  String scanToJoin(String name) {
    return 'スキャンして$nameに参加';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString件の招待を送信';
  }

  @override
  String get sendInvitesYourself => 'これらの招待を自分で送る';

  @override
  String get sendInvitesYourselfHelp =>
      'このサーバーではメール送信が設定されていません。各自にリンクを送ると、そのメールアドレスでサインインして参加できます。';

  @override
  String get signInToJoin => 'サインインして参加';

  @override
  String get startOwnWorkspace => '代わりに自分のワークスペースを始める';

  @override
  String switchToServer(String host) {
    return '$hostに切り替え';
  }

  @override
  String get waitingToJoin => '参加待ち';

  @override
  String welcomeToWorkspace(String name) {
    return '$nameへようこそ';
  }

  @override
  String get workspacesYouCanJoin => '参加できるワークスペース';

  @override
  String get yourTeamIsHere => 'チームはすでにここにあります';

  @override
  String yourTeamIsHereHelp(String domain) {
    return '$domainのメンバーがこれらのワークスペースを使っています。参加するか、自分で新しく始められます。';
  }

  @override
  String get inviteCodeCardHelp =>
      '読み上げや入力が簡単なコードです。48時間有効で、「リンクまたはコードで参加」から入力します。';

  @override
  String get inviteSomeoneNew => '新しいメンバーをワークスペースに招待';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$appのサインインには安全な（https）アドレスが必要ですが、このCasamaサーバーは$addressにあります。サインインを使うにはCasamaをhttpsで公開してください。';
  }

  @override
  String get aboutYou => 'あなたについて';

  @override
  String get aboutYouRow => 'ボットが呼ぶ名前やあなたの情報';

  @override
  String get aboutYouIntro => 'ボットはこれを読んであなたを名前で呼び、好みのスタイルで返信します。見えるのはあなただけです。';

  @override
  String get photoChange => 'プロフィール写真を変更';

  @override
  String get photoTake => '写真を撮る';

  @override
  String get photoChoose => '写真を選択';

  @override
  String get photoUseGoogle => 'Googleの写真を使う';

  @override
  String get photoRemove => '写真を削除';

  @override
  String get photoUnreadable =>
      'そのファイルはCasamaで使える写真ではありません。JPEGまたはPNGをお試しください。';

  @override
  String get whatToCallYou => 'ボットに何と呼んでほしいですか？';

  @override
  String get pronounsOptional => '代名詞（任意）';

  @override
  String get aboutMe => '自己紹介';

  @override
  String get aboutMeHint => '仕事内容、身近な人々、興味のあることなど、役立つ情報を書けます。';

  @override
  String get replyStyle => '好みの返信スタイル';

  @override
  String get replyStyleHint => '例：簡潔な返答、絵文字なし、初心者向けにわかりやすく説明';

  @override
  String get learnAboutMe => 'チャットから私について学ぶ';

  @override
  String get learnAboutMeHelp => 'ボットがあなたに関する情報を保存します。いつでも編集できます。';

  @override
  String get adultSites => '成人向けサイト';

  @override
  String get adultSitesHelp => '依頼したときだけ、ボットが成人向けWebサイトを開けるようにします。18歳以上限定です。';

  @override
  String get adultSitesConfirmTitle => '成人向けサイトをオンにしますか？';

  @override
  String get adultSitesConfirmBody =>
      '18歳以上であることを確認します。依頼すると、ボットはあなたに代わって成人向けWebサイトを開き、内容をテキストで一覧表示できます。この機能が使えるのは、Web版またはデスクトップアプリのCasamaから依頼した場合だけで、共有チャットでは一切使えません。';

  @override
  String get adultSitesConfirm => '18歳以上です';

  @override
  String get adultSitesApprovalDetail =>
      '「許可」を選ぶと18歳以上であることを確認し、アカウントで成人向けサイトを有効にします。「あなたについて」からいつでもオフにできます。';

  @override
  String useInThisSpace(String workspace) {
    return '$workspaceで共有した情報を使う';
  }

  @override
  String get useInThisSpaceHelp => 'オフ：ここでは名前と返信スタイルだけが使われます。';

  @override
  String get learnedAboutYou => 'ボットが覚えたこと';

  @override
  String get noLearnedFacts => 'まだありません。チャットの中でボットがあなたについて覚えたことがここに表示されます。';

  @override
  String get addFact => '項目を追加';

  @override
  String get editFact => '項目を編集';

  @override
  String get deleteFactTitle => 'この項目を削除しますか？';

  @override
  String get deleteFactConfirm => 'ボットはこの情報を忘れます。';

  @override
  String get importToProfile => 'ChatGPTまたはClaudeから読み込む';

  @override
  String get savedToProfile => 'プロフィールに保存しました';

  @override
  String get undo => '元に戻す';

  @override
  String get suggestedLookApplied => '新しいテーマを適用しました';

  @override
  String get suggestedLookUnavailable => 'このアプリにはそのテーマがありません';

  @override
  String get removedFromProfile => 'プロフィールから削除しました';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString件の事実を追加しました',
      one: '1件の事実を追加しました',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'すべてのワークスペースでボットがこの名前を使います。あとから「設定 → あなたについて」で変更できます。';

  @override
  String get nameStepBubble => 'はじめまして！';

  @override
  String get heardFromTitle => 'どこでCasamaを知りましたか？';

  @override
  String get heardFromHelp => '1タップで改善に役立ちます。スキップもできます。';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => '友人';

  @override
  String get heardFromSearch => '検索';

  @override
  String get heardFromAiAssistant => 'AIアシスタント';

  @override
  String get heardFromOther => 'その他';

  @override
  String get heardFromSkip => 'スキップ';

  @override
  String get nameStepHint => 'お名前';

  @override
  String get skillCatalogSubtitle => 'タスクで必要なときにボットが読み込める既製のスキルです。';

  @override
  String get skillCategoryWork => '仕事';

  @override
  String get skillCategoryWriting => '執筆';

  @override
  String get skillCategoryResearch => 'リサーチ';

  @override
  String get skillCategoryData => 'データ';

  @override
  String get skillCategoryMoney => 'マネー';

  @override
  String get skillCategoryBuild => '構築';

  @override
  String get skillCategoryLife => '暮らし';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString個のスキル',
      one: '1個のスキル',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'インストール済み';

  @override
  String skillInstalledFor(String names) {
    return '$namesにインストール済み';
  }

  @override
  String installSkillFor(String name) {
    return '$nameをインストールする対象';
  }

  @override
  String skillUseHint(String name) {
    return 'タスクに合うときにボットが自動で読み込みます。チャットで/$nameと入力して使うこともできます。';
  }

  @override
  String get skillInstructions => '指示';

  @override
  String get skillAlreadyEverywhere => 'インストール可能なすべての場所に追加済みです。';

  @override
  String get gallery => 'ギャラリー';

  @override
  String get galleryEmpty => 'ギャラリー内に一致するものがありません。';

  @override
  String get galleryOffline => '現在ギャラリーに接続できません。内蔵のスタイルやスキルは引き続き使えます。';

  @override
  String get galleryUse => '使う';

  @override
  String get galleryInstall => 'インストール';

  @override
  String get galleryReport => '報告';

  @override
  String get galleryShare => 'ギャラリーに共有';

  @override
  String galleryBy(String name) {
    return '作成：$name';
  }

  @override
  String get galleryFeatured => '注目';

  @override
  String get galleryAll => 'すべて';

  @override
  String get galleryThemes => 'テーマ';

  @override
  String get gallerySchemes => 'カラー';

  @override
  String get galleryWallpapers => '壁紙';

  @override
  String get gallerySkills => 'スキル';

  @override
  String get fromGallery => 'ギャラリー';

  @override
  String galleryApplied(String name) {
    return '$nameを使用中';
  }

  @override
  String get gallerySeeAll => 'すべて見る';

  @override
  String get galleryInUse => '使用中';

  @override
  String galleryInstalled(String name) {
    return '$nameをインストールしました';
  }

  @override
  String get galleryPreviewDark => 'ダークでプレビュー';

  @override
  String get galleryPreviewLight => 'ライトでプレビュー';

  @override
  String get galleryClearSearch => '検索をクリア';

  @override
  String get galleryOfflineTitle => 'ギャラリーはオフラインです';

  @override
  String galleryNoMatches(String query) {
    return '「$query」に一致するものがありません';
  }

  @override
  String get galleryInstructions => '指示';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$paletteに$pattern';
  }

  @override
  String get galleryImage => '画像';

  @override
  String get galleryMeshGradient => 'メッシュグラデーション';

  @override
  String get galleryOwnDoodles => 'オリジナルイラスト';

  @override
  String get galleryLightAndDark => 'ライト＆ダーク';

  @override
  String get galleryContribute =>
      'お気に入りのスタイルを作りましたか？共有すると、Casamaの全員がここから見つけられます。';

  @override
  String get galleryTypeTheme => 'テーマ';

  @override
  String get galleryTypeScheme => '配色';

  @override
  String get galleryTypeWallpaper => '壁紙';

  @override
  String get galleryTypeSkill => 'スキル';

  @override
  String get galleryBehindChats => 'チャットの背景';

  @override
  String celebrateNewBot(String name) {
    return '$nameに挨拶しましょう！';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$nameの準備ができました！';
  }

  @override
  String get celebrateJoined => '参加完了！スペースへようこそ。';

  @override
  String celebrateNewRoutine(String name) {
    return '$nameの設定が完了しました。';
  }

  @override
  String get fewerEffects => '演出を控えめにする';

  @override
  String get fewerEffectsHelp => 'お祝い演出、タブのバウンス、ボットのアニメーションをオフにします。';

  @override
  String get haptics => '触覚フィードバック';

  @override
  String get trackpadHaptics => 'トラックパッドの触覚';

  @override
  String get hapticsHelp => '何かが起きたときやボットがあなたを呼ぶときに、軽く振動します。';

  @override
  String get watchHaptics => '触覚';

  @override
  String get settingsAppSection => 'アプリ';

  @override
  String get settingsSecuritySection => 'サインインとセキュリティ';

  @override
  String get customize => 'カスタマイズ';

  @override
  String get customizeColors => 'カラー';

  @override
  String get appearanceCustomLook => 'カスタムテーマ';

  @override
  String get appearanceCustomHelp => '自分で変更した内容です。残すにはテーマとして保存してください。';

  @override
  String get appearanceFromGallery => 'ギャラリーから';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '全$countString件を表示';
  }

  @override
  String appearanceSwitched(String name) {
    return '$nameに切り替えました';
  }

  @override
  String appearanceSaved(String name) {
    return '$nameをテーマに保存しました';
  }

  @override
  String get appearanceAboutTheme => 'このテーマについて';

  @override
  String settingsOnDevServer(String host) {
    return '設定・開発サーバー$host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'あなた：$text';
  }

  @override
  String get chatPreviewPhoto => '写真';

  @override
  String get chatPreviewVideo => '動画';

  @override
  String get chatPreviewVoice => 'ボイスメモ';

  @override
  String get chatPreviewNone => 'メッセージはまだありません';

  @override
  String get chatTimeYesterday => '昨日';

  @override
  String get chatDayToday => '今日';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day・$time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day $time';
  }

  @override
  String get anyPriority => 'すべての優先度';

  @override
  String get readingAloud => '読み上げ中';

  @override
  String get readAloudPreparing => '準備中…';

  @override
  String get readAloudPaused => '一時停止中';

  @override
  String get stopReading => '読み上げを停止';

  @override
  String get readAloudSpeed => '再生速度';

  @override
  String readAloudTimeLeft(String time) {
    return '残り$time';
  }

  @override
  String get readAloudShowMessage => '読み上げ中のメッセージを表示';

  @override
  String mentionOpenProfile(String name) {
    return '$name、プロフィールを開く';
  }

  @override
  String get paywallSubtitle =>
      'より多くのボット、より長いコンピューター時間、毎月の新しいクレジットでボットを動かし続けられます。';

  @override
  String get paywallPerkBots => 'ボット';

  @override
  String get paywallPerkBotsBody => 'それぞれが役割を持つAIチーム。';

  @override
  String get paywallPerkComputers => 'コンピューター時間';

  @override
  String get paywallPerkComputersBody => 'ボットは専用のコンピューターでブラウズやコーディング、開発を行います。';

  @override
  String get paywallPerkCredits => '月間クレジット';

  @override
  String get paywallPerkCreditsBody => 'モデル、検索、ツールに利用できます。';

  @override
  String get paywallPerkSeats => 'メンバー枠';

  @override
  String get paywallPerkSeatsBody => 'チームを同じワークスペースに招待できます。';

  @override
  String paywallHours(String hours) {
    return '$hours時間';
  }

  @override
  String get paywallWeekly => '週額';

  @override
  String get paywallMonthly => '月額';

  @override
  String get paywallYearly => '年額';

  @override
  String get paywallPerMonth => '/月';

  @override
  String get paywallPerYear => '/年';

  @override
  String get paywallContinue => '続行';

  @override
  String get paywallContinueCheckout => 'お支払いへ進む';

  @override
  String get paywallRestore => '復元';

  @override
  String get paywallFineStore => '自動更新されます。ストア設定からいつでも解約できます。';

  @override
  String get paywallFineWeb => '自動更新されます。「請求」からいつでも解約できます。';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price、解約するまで自動更新されます。お支払いはApple Accountに請求されます。更新の24時間前までに、Apple Accountの設定からいつでも解約できます。',
      'google_play':
          '$price、解約するまで自動更新されます。お支払いはGoogle Playアカウントに請求されます。更新の24時間前までに、Google Playアカウントの設定からいつでも解約できます。',
      'other':
          '$price、解約するまで自動更新されます。お支払いはストアアカウントに請求されます。更新の24時間前までに、ストアアカウントの設定からいつでも解約できます。',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日間の無料トライアル後、$priceで解約するまで自動更新されます。',
      one: '1日間の無料トライアル後、$priceで解約するまで自動更新されます。',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日間の無料トライアル後、$priceで解約するまで自動更新されます。',
      one: '1日間の無料トライアル後、$priceで解約するまで自動更新されます。',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日間の無料トライアル後、$priceで解約するまで自動更新されます。',
      one: '1日間の無料トライアル後、$priceで解約するまで自動更新されます。',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0お支払いはトライアル終了時にApple Accountに請求されます。トライアル終了の24時間前までにApple Accountの設定で解約すれば、請求されません。',
      'google_play':
          '$_temp1お支払いはトライアル終了時にGoogle Playアカウントに請求されます。トライアル終了の24時間前までにGoogle Playアカウントの設定で解約すれば、請求されません。',
      'other':
          '$_temp2お支払いはトライアル終了時にストアアカウントに請求されます。トライアル終了の24時間前までにストアアカウントの設定で解約すれば、請求されません。',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => '無料トライアルを開始';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日間無料、その後$price/年',
      one: '1日間無料、その後$price/年',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日間無料、その後$price/月',
      one: '1日間無料、その後$price/月',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price、解約するまで自動更新されます。「請求」からいつでも解約でき、期間終了までプランを利用できます。';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日間の無料トライアル後、$priceで解約するまで自動更新されます。',
      one: '1日間の無料トライアル後、$priceで解約するまで自動更新されます。',
    );
    return '$_temp0トライアル終了前に「請求」から解約すれば課金されません。';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '週額$price',
      'year': '年額$price',
      'other': '月額$price',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => '利用規約';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get aiConsentTitle => 'チャット内容はAI企業に送信されます';

  @override
  String get aiConsentBody =>
      '返信を作成するため、Casamaはあなたがボットと共有した内容を外部のAIプロバイダーに送信します。同意するまで何も送信されません。';

  @override
  String get aiConsentUpdatedNotice => 'このリストにWebページを追加しました。';

  @override
  String get aiConsentWhatTitle => '送信される内容';

  @override
  String get aiConsentWhat =>
      'メッセージ、ファイル、写真、通話中の音声、音声メッセージと音声入力、ボットが記憶しているあなたに関する情報、ボットがあなたのために開くWebページ（ボットのコンピューター上またはこのデバイスのブラウザー内）、およびオンにしたスマートフォンのデータ（カレンダーやヘルスケアなど）。';

  @override
  String get aiConsentWhoTitle => '送信先';

  @override
  String get aiConsentWho =>
      'OpenRouterに送られ、そこからDeepSeek、Google、OpenAIなど、使用するモデルの開発会社に渡されます。通話にはGoogle Geminiを使用し、音声メッセージと音声入力はOpenAIがテキストに変換します。Web検索はParallel、Serper、またはDeepSeekに送られます。自分のAPIキーを使う場合は、代わりにそのプロバイダーに送られます。';

  @override
  String get aiConsentWhyTitle => '利用目的';

  @override
  String get aiConsentWhy =>
      '返信の作成に使用されます。共有は「設定 → プライバシー」でいつでも停止できます。詳しくはプライバシーポリシーをご覧ください。';

  @override
  String get aiConsentAgree => '同意して続行';

  @override
  String get aiConsentTile => 'AIプロバイダー';

  @override
  String get aiConsentTileOn => '許可済み。ボットと共有した内容は返信作成のため外部のAIプロバイダーに送信されます。';

  @override
  String get aiConsentWithdrawQuestion => 'AIプロバイダーとの共有を停止しますか？';

  @override
  String get aiConsentWithdrawBody =>
      'プロバイダーなしではボットは返信できません。今後送信する際にはCasamaが再度確認します。';

  @override
  String get aiConsentWithdraw => '共有を停止';

  @override
  String get planChanged => 'プランを変更しました';

  @override
  String get purchasesRestored => '購入を復元しました';

  @override
  String get creditsAdded => 'クレジットを追加しました';

  @override
  String get purchasePending => '購入の承認を待っています。承認され次第追加されます。';

  @override
  String get purchaseFailed => '購入が完了しませんでした。請求は行われていません。';

  @override
  String get purchaseVerifyFailed =>
      '購入をまだ確認できませんでした。自動で再試行されますが、しばらくしても反映されない場合は「購入を復元」をタップしてください。';

  @override
  String paywallTitleFor(String plan) {
    return '$planでチームを強化';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return '$planへようこそ！';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nか月無料',
      one: '1か月無料',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return '$planに切り替え';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          'App Storeで定期購入しています。プランを変更するには、定期購入したデバイスのApp Storeをお使いください。',
      'google_play':
          'Google Playで定期購入しています。プランを変更するには、定期購入したデバイスのGoogle Playをお使いください。',
      'other': 'アプリストアで定期購入しています。プランを変更するには、定期購入したデバイスのストアをお使いください。',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Webで定期購入しています。ここでWeb決済を使ってプランを変更するか、サブスクリプションを管理してください。';

  @override
  String get subscribedOutsideAppNote =>
      'このサブスクリプションはこのアプリ外で請求されているため、ここでは変更できません。';

  @override
  String get outOfCreditsTitle => 'クレジットがなくなりました';

  @override
  String get outOfCreditsPaidBody =>
      'クレジットを追加するまでボットは一時停止します。App StoreまたはGoogle Playのクレジットパックは有効期限がなく、Webで購入したクレジットパックは12か月間有効です。';

  @override
  String get outOfCreditsFreeBody => 'アップグレードすると、毎月のクレジット、ボット数、コンピューター時間が増えます。';

  @override
  String get addCredits => 'クレジットを追加';

  @override
  String get seePlansButton => 'プランを見る';

  @override
  String get paywallAskAdmin =>
      'プランを変更できるのはワークスペースのオーナーと管理者のみです。アップグレードを依頼してください。';

  @override
  String get upgradeToPro => 'Proにアップグレード';

  @override
  String get upgradeToProBody => 'より多くのボット、コンピューター時間、毎月のクレジット。';

  @override
  String get manageTab => '管理';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'メモリ';

  @override
  String get vitalsDisk => 'ディスク';

  @override
  String get fixItTitle => 'うまく動きませんか？';

  @override
  String get fixItSubtitle => '次の順でお試しください。下に行くほど踏み込んだ対処になります。';

  @override
  String get fixRestart => '再起動';

  @override
  String get fixRestartHelp => '約20秒・データは失われません';

  @override
  String get fixResetSystem => 'システムをリセット';

  @override
  String get fixResetSystemHelp => 'クリーンなシステム・ファイルはそのまま残ります';

  @override
  String get fixErase => 'すべて消去';

  @override
  String get fixEraseHelp => '新品同様の状態・7日間は取り消し可能';

  @override
  String get fixResetAction => 'リセット…';

  @override
  String get fixEraseAction => '消去…';

  @override
  String get computerRestarting => '再起動中…';

  @override
  String get computerRestarted => '再起動しました。ファイルはすべてそのまま残っています。';

  @override
  String get computerUpdateTitle => 'アップデートがあります';

  @override
  String get computerUpdateBody =>
      '新しいツールと修正が利用できます。アップデートするとこのコンピューターが再起動します。ファイルは残りますが、開いているウィンドウや実行中のプログラムは閉じられます。';

  @override
  String get computerUpdateBotWorking =>
      '現在このコンピューターでボットが作業中です。アップデートすると作業中の処理が停止します。';

  @override
  String get computerUpdateNow => '今すぐアップデート';

  @override
  String get computerUpdateLater => 'あとで';

  @override
  String get computerUpdateConfirmTitle => 'このコンピューターをアップデートしますか？';

  @override
  String get computerUpdateMenu => 'コンピューターをアップデート';

  @override
  String get computerUpdating => 'アップデート中…';

  @override
  String get computerUpdated => 'アップデートしました。ファイルはすべてそのまま残っています。';

  @override
  String get computerUpdateBusyTitle => 'コマンドがまだ実行中です';

  @override
  String get computerUpdateBusyBody =>
      '今アップデートすると停止します。完了まで待つか、このままアップデートしてください。';

  @override
  String get computerUpdateAnyway => 'このままアップデート';

  @override
  String resetSheetTitle(String name) {
    return '$nameをリセット';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$botsは約1分間このコンピューターを使用できなくなります。';
  }

  @override
  String get resetSheetBusyNone => '約1分間使用できなくなります。';

  @override
  String get resetOptionSystem => 'システムをリセット（ファイルは保持）';

  @override
  String get resetOptionSystemHelp => '壊れたインストール、設定、応答しないプログラムを修復します。';

  @override
  String get resetOptionErase => 'すべて消去';

  @override
  String get resetOptionEraseHelp => '真っさらなコンピューターに戻します。';

  @override
  String get resetKept => '保持';

  @override
  String get resetRemoved => '削除';

  @override
  String get resetKeptFiles => 'workspaceフォルダ内のファイル';

  @override
  String get resetKeptSettings => '名前、設定、ボット';

  @override
  String get resetKeptRestorePoints => '復元ポイント';

  @override
  String get resetRemovedApps => 'インストールしたアプリとツール';

  @override
  String get resetRemovedPrograms => '実行中のプログラム';

  @override
  String get resetRemovedCaches => 'キャッシュとホームフォルダーの設定';

  @override
  String get resetRemovedFiles => 'ワークスペースを含むすべてのファイル';

  @override
  String get resetSavePoint => '先に復元ポイントを保存';

  @override
  String get resetSavePointHelp => '7日間元に戻せるようにするためです';

  @override
  String eraseTypeName(String name) {
    return '確認のため$nameと入力してください';
  }

  @override
  String get resetConfirmSystem => 'システムをリセット';

  @override
  String get resetConfirmErase => 'すべて消去';

  @override
  String get resetStepSaving => '復元ポイントを保存中';

  @override
  String get resetStepWipingSystem => 'アプリと設定を削除中';

  @override
  String get resetStepWipingErase => 'すべてのファイルを消去中';

  @override
  String get resetStepRestarting => '新しいシステムを起動中';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'リセット中… $stepString/$totalString';
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

    return '消去中… $stepString/$totalString';
  }

  @override
  String get resetLeaveHint => 'この画面を閉じても大丈夫です。処理は自動で進みます。';

  @override
  String get resetDone => '新しいシステムの準備が完了しました';

  @override
  String get eraseDone => 'コンピューターを消去しました';

  @override
  String get resetFailed => 'リセットが完了しませんでした';

  @override
  String get resetUndoHint => '「元に戻す」ですべて元の状態に戻せます。復元ポイントは7日間保持されます。';

  @override
  String get restoredPrevious => '元の状態に戻しました';

  @override
  String get usageThisMonth => '今月';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString時間$minutesString分';
  }

  @override
  String get usageCostNote => '起動中のみ課金されます。スリープ中は無料です。';

  @override
  String get usageNone => '今月はまだ使用されていません';

  @override
  String get sleepTimerTitle => 'スリープまでの時間';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString分';
  }

  @override
  String get sleepTimerHour => '1時間';

  @override
  String get sleepTimerHelp =>
      'ボットが作業中やあなたが操作中にスリープすることはありません。待ち時間が長いほど稼働時間が延び、料金がかかります。';

  @override
  String sleepTimerSaved(String label) {
    return '操作がない状態が$label続くとスリープします';
  }

  @override
  String get storageTitle => 'ストレージ';

  @override
  String storageOf(String total) {
    return '/ $total';
  }

  @override
  String get storageFiles => 'あなたのファイル';

  @override
  String get storageApps => 'アプリとツール';

  @override
  String get storageCaches => 'キャッシュ';

  @override
  String get storageBrowser => 'ブラウザー';

  @override
  String get storageOther => 'その他';

  @override
  String get storageFree => '無料';

  @override
  String storageFreeUp(String size) {
    return '$sizeの空き容量を増やす';
  }

  @override
  String get storageNothingToClean => '削除できるキャッシュはありません';

  @override
  String storageFreed(String size) {
    return '$size解放しました';
  }

  @override
  String get storageAsleep => '何が容量を使っているか見るにはコンピューターを起こしてください。';

  @override
  String get processesTitle => '実行中';

  @override
  String get processesNone => 'コンピューター本体以外に実行中のプロセスはありません。';

  @override
  String get processesAsleep => 'スリープ中は何も実行されません。';

  @override
  String get processStop => '停止';

  @override
  String processStopTitle(String name) {
    return '$nameを停止しますか？';
  }

  @override
  String get processStopMessage => '保存していない内容はすべて失われます。';

  @override
  String processStopped(String name) {
    return '$nameを停止しました';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration・CPU $cpu%・メモリ$memory';
  }

  @override
  String get usedByTitle => '使用中のボット';

  @override
  String get usedByNone => 'このコンピューターを使っているボットはまだいません。';

  @override
  String botLastActive(String when) {
    return 'アクティブ：$when';
  }

  @override
  String get botNeverActive => 'まだアクティブになっていません';

  @override
  String get restorePointsTitle => '復元ポイント';

  @override
  String get restorePointsNone => 'まだありません。ボットはリスクのある変更前に復元ポイントを保存します。';

  @override
  String get restorePointSaveNow => '今すぐ復元ポイントを保存';

  @override
  String get restorePointSaveTitle => '復元ポイントを保存';

  @override
  String get restorePointDefaultLabel => '手動で保存';

  @override
  String get restorePointSaved => '復元ポイントを保存しました';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '全$nString件を表示';
  }

  @override
  String get historyTitle => '履歴';

  @override
  String get historyNone => 'まだ何も起きていません。';

  @override
  String get historyStarted => '起動';

  @override
  String get historySlept => 'スリープしました';

  @override
  String get historySleptIdle => 'スリープ移行（操作なし）';

  @override
  String get historyRestarted => '再起動';

  @override
  String get historyReset => 'システムをリセット';

  @override
  String get historyErased => 'すべて消去';

  @override
  String get historyCheckpointCreated => '復元ポイントを保存';

  @override
  String get historyCheckpointRestored => '復元ポイントから復元';

  @override
  String historyStorageCleaned(String size) {
    return '$sizeを解放';
  }

  @override
  String get historyStorageCleanedPlain => '空き容量を増やしました';

  @override
  String historyProcessStopped(String name) {
    return '$nameを停止';
  }

  @override
  String get historyUpdated => '設定を変更';

  @override
  String get historyYou => 'あなた';

  @override
  String get yourDataTitle => 'あなたのデータ';

  @override
  String get downloadAllFiles => 'すべてのファイルをダウンロード';

  @override
  String get downloadAllFilesHelp => 'ワークスペース内のすべてのファイルの.zip';

  @override
  String get downloadNothing => 'ダウンロードできるファイルはまだありません。';

  @override
  String get deleteComputerHelp => 'コンピューターと復元ポイントを削除します';

  @override
  String get manageComputer => '管理';

  @override
  String get restartComputer => '再起動';

  @override
  String get resetComputerMenu => 'リセット…';

  @override
  String get moreFixes => 'その他の修復方法';

  @override
  String durationMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString分';
  }

  @override
  String durationHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString時間';
  }

  @override
  String durationDays(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString日';
  }

  @override
  String get remoteUpdateTitle => 'Casamaのアップデートが必要です';

  @override
  String get remoteUpdateBody => 'このバージョンのCasamaはサポート終了しました。続けるにはアップデートしてください。';

  @override
  String get remoteUpdateNoLink =>
      'このバージョンのCasamaはサポート終了しました。インストール元からアップデートしてください。';

  @override
  String get remoteMaintenanceTitle => 'Casamaはメンテナンス中です';

  @override
  String get openLink => '開く';

  @override
  String get routineIdeas => 'アイデア';

  @override
  String get routineIdeasHelp => 'アイデアから始めて、あとから自由に変更できます。';

  @override
  String get pluginDirectory => '確認済みプラグイン';

  @override
  String get pluginDirectoryHelp => 'Casamaが確認し、確認済みのバージョンに固定されています。';

  @override
  String get pluginOrPaste => 'またはGitHubリンクから追加';

  @override
  String byAuthor(String name) {
    return '作成：$name';
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
  String get paywallBillingPeriod => '請求期間';

  @override
  String get paywallNotSoldTitle => 'このサーバーにプランはありません';

  @override
  String get paywallNotSoldBody =>
      'このサーバーではプランを販売していないため、ここでアップグレードする項目はありません。';

  @override
  String get paywallPlansFailedTitle => 'プランを読み込めませんでした';

  @override
  String get paywallPlansFailedBody => '接続を確認して、もう一度お試しください。';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'App Storeでプランが表示されていません',
      'google_play': 'Google Playでプランが表示されていません',
      'other': 'ストアでプランが表示されていません',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'このデバイスでApp Storeにサインインしていることを確認して、もう一度お試しください。',
      'google_play': 'このデバイスでGoogle Playにサインインしていることを確認して、もう一度お試しください。',
      'other': 'このデバイスでストアにサインインしていることを確認して、もう一度お試しください。',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return '最大$pct%オフ';
  }

  @override
  String get paywallMostPopular => '一番人気';

  @override
  String get paywallTaglinePlus => 'あなたと数体のボット向け';

  @override
  String get paywallTaglinePro => '活発なチームや少人数向け';

  @override
  String get paywallTaglineMax => '終日ボットが稼働するチーム向け';

  @override
  String get paywallPerMonthShort => '/月';

  @override
  String paywallBilledYearly(String price) {
    return '年払いで$price';
  }

  @override
  String paywallWorksOutTo(String price) {
    return '月あたり$price';
  }

  @override
  String get paywallBilledMonthly => '月払い';

  @override
  String get paywallBilledWeekly => '週払い';

  @override
  String get paywallPerWeekShort => '/週';

  @override
  String paywallPerWeekWorksOut(String price) {
    return '週あたり$price';
  }

  @override
  String get paywallBilledYearlyPlain => '年払い';

  @override
  String get paywallPerYearShort => '/年';

  @override
  String paywallStartTrial(int n) {
    return '$n日間の無料トライアルを開始';
  }

  @override
  String paywallGetPlan(String plan) {
    return '$planを定期購入';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count名',
      one: '1名',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return 'コンピューター$hoursString時間';
  }

  @override
  String paywallFactRuns(int runs, String credits) {
    final intl.NumberFormat runsNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String runsString = runsNumberFormat.format(runs);

    return '月に約$runsString回の返信（$credits）';
  }

  @override
  String get billingChangePlan => 'プランを変更';

  @override
  String get billingChangePlanBody => '月額と年額ですべてのプランを比較します。';

  @override
  String paywallWhatYouGet(String plan) {
    return '$planに含まれる内容';
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
  String get updatesRow => '更新情報';

  @override
  String get updatesRowSubtitle => 'ワークスペースからのお知らせ';

  @override
  String get updatesEmpty => '更新情報はありません';

  @override
  String get updatesEmptyHelp =>
      'ワークスペースのお知らせや新しいページがここに表示されます。ボットからの連絡は各チャットにあります。';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '確認待ち$n件',
      one: '確認待ち1件',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return '作業中：$title';
  }

  @override
  String suggestionClosed(String title) {
    return '今はしない：$title';
  }

  @override
  String openTopic(String title) {
    return '$titleを開く';
  }

  @override
  String get newTopic => '新しいトピック';

  @override
  String get topics => 'トピック';

  @override
  String get olderTopics => '以前';

  @override
  String get generalChat => '一般';

  @override
  String get allTopics => 'すべてのトピック';

  @override
  String get cardSecrets => 'シークレット';

  @override
  String get cardApproval => '承認';

  @override
  String get cardTakeover => '操作を代わる';

  @override
  String get cardDevice => 'デバイスへのアクセス';

  @override
  String get cardSuggestion => '提案';

  @override
  String get formBack => '戻る';

  @override
  String get formNext => '次へ';

  @override
  String get formSkip => 'スキップ';

  @override
  String formStep(int n, int total) {
    return '質問$n/$total';
  }

  @override
  String get cardSuggestions => '提案';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '確認しておきたいことが$n件見つかりました',
      one: '確認しておきたいことが1件見つかりました',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return '$when開始';
  }

  @override
  String get suggestionStartedPlain => '開始済み';

  @override
  String get suggestionPutAway => 'しまう';

  @override
  String get suggestionExpired => '期限切れ';

  @override
  String suggestionExpiredTitle(String title) {
    return '期限切れ：$title';
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
      other: 'あと$nString分で期限切れ',
      one: 'あと1分で期限切れ',
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
      other: 'あと$nString時間で期限切れ',
      one: 'あと1時間で期限切れ',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n件の提案に対応済み',
      one: '1件の提案に対応済み',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'このサーバーをスマートフォンから使う';

  @override
  String get linkIntro =>
      'どこからでもスマートフォンから接続できるアドレスをこのサーバーに割り当てます。ドメインもルーター設定も不要です。';

  @override
  String get linkIntroDetails =>
      'このサーバーを無料のCasama Cloudアカウントとリンクします。スマートフォンの通信はCloudflare経由でこのコンピューターへ直接届き、Casamaのサーバーは経由しません。';

  @override
  String get linkTurnOn => 'スマートフォンで使う';

  @override
  String get linkSignupsNote => 'オンの間、新規登録は停止されます。すでにここにアカウントがある人だけがサインインできます。';

  @override
  String get linkStepSignIn => 'このサーバーをリンク';

  @override
  String get linkSignInBody =>
      'ブラウザーで開いたばかりのページでこのコードを承認してください。ページ上に同じコードが表示されているか確認してください。';

  @override
  String get linkSignInOpen => 'ページをもう一度開く';

  @override
  String get linkStepAddress => 'アドレスを取得';

  @override
  String get linkStepRestart => 'サーバーを再起動';

  @override
  String get linkStepConnect => '接続';

  @override
  String get linkStateOnline => 'オンライン';

  @override
  String get linkStateStarting => '起動中';

  @override
  String get linkStateOffline => 'オフライン';

  @override
  String get linkStateAttention => '要確認';

  @override
  String get linkStateOff => 'オフ';

  @override
  String get linkAddress => '住所1';

  @override
  String get linkLocalAddress => 'このコンピューターで開く';

  @override
  String get linkShowCode => 'サインインコードを表示';

  @override
  String get linkCheck => '再確認';

  @override
  String get linkTurnOff => 'オフにする';

  @override
  String get linkTurnOffConfirm =>
      'リモートアクセスをオフにしますか？アドレスは機能しなくなり、再びオンにするまでスマートフォンからこのサーバーに接続できなくなります。再びオンにすると同じアドレスが戻ります。';

  @override
  String get linkTurningOff => 'オフにしています';

  @override
  String get linkNeedsOwner => 'これをオンにできるのはこのサーバーのオーナーだけです。';

  @override
  String get linkTwoStepTip =>
      'このサーバーにインターネットから接続できるようになりました。2段階サインインを有効にすると、パスワードが推測されても不正アクセスを防げます。';

  @override
  String get linkProblemNotLinked =>
      'このサーバーはCasama Cloudにリンクされていません。リンクするにはもう一度オンにしてください。';

  @override
  String get linkProblemCloudUnreachable =>
      '現在Casama Cloudに接続できません。アドレスが動作していた場合は、引き続きそのまま使えます。';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloudがこのサーバーのキーを受け付けなくなりました。再リンクするにはもう一度オンにしてください。';

  @override
  String get linkProblemSuspended =>
      'Casama Cloudにより、このサーバーのリモートアクセスがオフにされました。';

  @override
  String get linkProblemRemoved =>
      'このサーバーはCasama Cloud上のワークスペースから削除されました。再リンクするにはもう一度オンにしてください。';

  @override
  String get linkProblemPlanLimit =>
      'お使いのCasama Cloudプランで接続できるサーバー数が足りません。そちらで1台削除するか、プランをアップグレードしてください。';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloudにこのサーバーのアドレスが登録されていません。もう一度オンにしてください。';

  @override
  String get linkProblemAddressChanged =>
      'このサーバーのアドレスが変更されました。新しいアドレスを使うにはもう一度オンにしてください。';

  @override
  String get connectProblemConnectorMissing =>
      'コネクターが動作していません。Dockerが動作中か確認してからもう一度確認してください。';

  @override
  String get connectProblemConnectorBlocked =>
      'このネットワークが接続をブロックしています。通常はVPNまたは厳格なファイアウォールが原因です（送信ポート7844）。';

  @override
  String get linkProblemAddressUnanswered =>
      '接続は完了していますが、アドレスがまだ応答しません。新しいアドレスの反映には1分ほどかかる場合があります。';

  @override
  String get linkServers => 'リンク済みサーバー';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'お使いのプランでは$limit台のサーバーを接続できます。',
      one: 'お使いのプランでは1台のサーバーを接続できます。',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'まだリンクされたサーバーはありません。自分のサーバーで設定 → Casama Linkを開いてください。';

  @override
  String linkServerRemoveConfirm(String name) {
    return '$nameを削除しますか？アドレスは機能しなくなりますが、あとから再リンクできます。';
  }

  @override
  String get linkStatusActive => 'アドレスあり';

  @override
  String get linkStatusParked => '最近の接続なし';

  @override
  String get linkStatusSuspended => '停止中';

  @override
  String get pairDevice => '別のデバイスでサインイン';

  @override
  String get pairDeviceRow => 'スマートフォンでスキャンするコードを表示';

  @override
  String get pairDeviceHelp =>
      'スマートフォンのカメラでこれをスキャンするか、スマートフォンのCasamaで「サインイン」→「コードをスキャン」を開いてください。';

  @override
  String get pairDeviceWarning =>
      'これをスキャンした人は誰でもあなたとしてサインインできます。1回限り、数分間だけ有効です。';

  @override
  String pairDeviceServer(String host) {
    return '$hostにサインイン';
  }

  @override
  String get pairDeviceNewCode => '新しいコード';

  @override
  String get pairDeviceExpired => 'このコードの有効期限が切れました。';

  @override
  String get pairDeviceNotReachable =>
      'このサーバーはこのコンピューター上でのみ応答するため、スマートフォンからはまだ接続できません。';

  @override
  String get pairDeviceNotReachableOther =>
      'このサーバーのアドレスは同じネットワーク内でのみ使えます。外部からも接続できるアドレスについては、サーバー管理者に確認してください。';

  @override
  String get pairDeviceCopyLink => 'リンクをコピー';

  @override
  String get pairDeviceLinkCopied =>
      'リンクをコピーしました。Casama for Chromeまたは別のデバイスに貼り付けてください。';

  @override
  String get pairDeviceConnectChrome => 'Chromeを接続';

  @override
  String get pairDeviceChromeDone => 'Casama for Chromeがサインインしました。';

  @override
  String get pairDeviceChromeFinish => '開いたCasama for Chromeのタブで完了してください。';

  @override
  String get pairDeviceChromeMissing =>
      'このブラウザーにはCasama for Chromeがインストールされていません。';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama for Chromeでサインインできませんでした。$error';
  }

  @override
  String get scanToSignIn => 'コンピューターからコードをスキャン';

  @override
  String get scanToSignInTitle => 'コードをスキャン';

  @override
  String get scanToSignInHelp => 'サインイン済みのコンピューターで設定 → 別のデバイスでサインインを開いてください。';

  @override
  String pairSignInTo(String host) {
    return '$hostにサインインしますか？';
  }

  @override
  String get pairSignInBody => 'このコードを表示したアカウントにこのデバイスをサインインさせます。';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'このデバイスは現在$currentを使っています。$hostにサインインすると切り替わります。';
  }

  @override
  String get pairSigningIn => 'サインイン';

  @override
  String get pairCodeInvalid => 'そのコードはもう有効ではありません。新しいコードを表示してもう一度スキャンしてください。';

  @override
  String get pairLinkInvalid => 'これはCasamaのサインインコードではありません。';

  @override
  String get linkServerTitle => 'サーバーをリンク';

  @override
  String linkServerBody(String name) {
    return '$nameがあなたのCasama Cloudアカウントへの接続を求めています。';
  }

  @override
  String get linkServerCode => 'サーバー上のコード';

  @override
  String get linkServerCheck => '自分のサーバーでこれを開始し、同じコードが表示されている場合のみリンクしてください。';

  @override
  String get linkServerWhat =>
      '公開アドレスが割り当てられ、通知を送信できるようになります。クレジットを消費することはできません。';

  @override
  String get linkServerApprove => 'リンク';

  @override
  String get linkServerDone => 'リンク済み';

  @override
  String linkServerDoneBody(String name) {
    return '$nameに戻ってください。続きは自動で進みます。';
  }

  @override
  String get linkServerInvalid => 'そのコードはもう有効ではありません。サーバー側で最初からやり直してください。';

  @override
  String get linkServerEnterCode => 'サーバーに表示されているコード';

  @override
  String get linkServerFind => '検索';

  @override
  String get linkServerNeedAdmin => 'サーバーをリンクできるのはワークスペースのオーナーと管理者だけです。';

  @override
  String get localDockerStopped => 'Dockerが動作していないため、サーバーが停止しています';

  @override
  String get localDockerStoppedBody =>
      'Casamaサーバーはこのコンピューター上のDockerで動いています。Dockerを開くと、サーバーの復帰後（1分ほどかかる場合があります）Casamaが自動で再接続します。';

  @override
  String get serverOfflineTitle => 'サーバーがオフラインです';

  @override
  String get serverOfflineBody =>
      'サーバーを動かしているコンピューターの電源が入っていてスリープしていないか確認してください。接続は自動で再開します。';

  @override
  String get signUpsClosed => 'このサーバーは新規アカウントを受け付けていません。既存のアカウントでサインインしてください。';

  @override
  String get signUpsByInvitation => 'ここでは新規アカウントは招待制です。招待されたメールアドレスを使ってください。';

  @override
  String get linkPrivateNotifications => 'プライベート通知';

  @override
  String get linkPrivateNotificationsHelp =>
      '通知はCasama Cloud経由でスマートフォンに届きます。オンにすると本文を含めず「新しいアクティビティ」とだけ表示し、詳細はアプリがこのサーバーから読み込みます。';

  @override
  String get linkInvites => '招待した人の登録を許可';

  @override
  String get linkInvitesHelp =>
      'オフ：誰も新しいアカウントを作成できません。オン：メールで招待した人は作成できます。変更するとサーバーが再起動します。';

  @override
  String get linkKeepAwake => '電源接続中はこのMacをスリープさせない';

  @override
  String get linkKeepAwakeHelp =>
      'このコンピューターが起きていてCasamaが開いている間だけ、スマートフォンからこのサーバーに接続できます。';

  @override
  String get linkLiveView => '離れた場所からのライブ表示';

  @override
  String get linkLiveViewIncluded =>
      'プランに含まれています。このコンピューターから離れている間、ボットの画面がCasama Cloudの中継を通じてライブ再生されます。';

  @override
  String get linkLiveViewPlan =>
      'Casama CloudのPlus以上でご利用いただけます。このコンピューターから離れているときは約1秒ごとに画面を更新します。このコンピューター上では常にライブ表示です。';

  @override
  String get liveAwayNeedsPlan =>
      'サーバーのコンピューターから離れているときのライブ映像は、Casama CloudのPlus以上でご利用いただけます。それまでは約1秒ごとに画面が更新されます。';

  @override
  String get chatShareExport => '共有またはエクスポート';

  @override
  String get chatShareExportHelp => 'このチャットをファイルとして保存するか、読み取り専用リンクを作成します。';

  @override
  String get chatExportMarkdown => 'Markdownとしてエクスポート';

  @override
  String get chatExportMarkdownHelp => '誰でも読めるテキストファイル';

  @override
  String get chatExportJson => 'JSONとしてエクスポート';

  @override
  String get chatExportJsonHelp => 'ほかのアプリやスクリプト向け';

  @override
  String get chatShareLink => '読み取り専用リンクを共有';

  @override
  String get chatShareLinkHelp => 'リンクを知っている人は誰でもこのチャットを読めます';

  @override
  String get chatStopSharing => 'リンクの共有を停止';

  @override
  String get chatStopSharingHelp => 'リンクは無効になります';

  @override
  String get chatMakePublicTitle => 'このチャットをリンクで共有しますか？';

  @override
  String get chatMakePublicBody =>
      'リンクを知っている人は誰でも、あなたに見えている通りにこのチャットを読めます。添付ファイルは名前のみ表示され、ファイル自体は共有されません。いつでも停止できます。';

  @override
  String get chatMakePublic => 'リンクを作成';

  @override
  String get chatLinkTitle => '読み取り専用リンク';

  @override
  String get chatLinkBody =>
      'コピーしました。検索エンジンには掲載されません。新しいリンクを作成するとこのリンクは無効になります。';

  @override
  String get chatSharingStopped => 'このリンクは無効になりました';

  @override
  String get creationDuplicate => '複製';

  @override
  String creationDuplicated(String title) {
    return 'コピーを作成しました：「$title」';
  }

  @override
  String get slackInstall => 'Slackに追加';

  @override
  String slackInstallHelp(String bot) {
    return 'Slackワークスペースを1ステップで接続します。$botがそこで@メンションとダイレクトメッセージに返信します。';
  }

  @override
  String get slackInstallFinish => 'Slackで完了してから、ここに戻ってください。';

  @override
  String get helpAndSupport => 'ヘルプとサポート';

  @override
  String get helpAndSupportRow => 'Casamaヘルプに質問、お問い合わせ、ガイド';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch => 'ガイドとあなたのアカウントからすぐにお答えします。人のサポートもワンタップで呼べます。';

  @override
  String get supportIntro => 'ご質問や購入トラブル、不具合などがありましたらご連絡ください。';

  @override
  String supportSelfHosted(String host) {
    return 'このワークスペースは$hostで動作しています。サインイン、アカウント、プランについてはそのサーバーの管理者にお尋ねください。アプリ本体については当社でサポートできます。';
  }

  @override
  String get supportTalkToPerson => '担当者と話す';

  @override
  String get contactSupport => 'サポートに連絡';

  @override
  String contactSupportRow(String email) {
    return 'サポートチーム（$email）へ連絡';
  }

  @override
  String get sendFeedback => 'フィードバックを送信';

  @override
  String get sendFeedbackRow => 'アイデアやご感想をお寄せください。すべて目を通しています。';

  @override
  String get feedbackHelp => 'Casamaに求める機能、気に入っている点、使いにくい点などをお聞かせください。';

  @override
  String get feedbackKindPrompt => 'フィードバックの種類';

  @override
  String get feedbackKindIdea => 'アイデア';

  @override
  String get feedbackKindLike => '気に入った点';

  @override
  String get feedbackKindDislike => '不満な点';

  @override
  String get feedbackKindConfusing => 'わかりにくい点';

  @override
  String get feedbackMessageLabel => 'フィードバック内容';

  @override
  String get feedbackMessageHint => '例：チャットを上部にピン留めできると嬉しいです。';

  @override
  String get feedbackContactOk => 'この件について、私に連絡してもかまいません';

  @override
  String get feedbackContactOkHelp => 'ご質問や対応完了のお知らせをメールでお送りする場合があります。';

  @override
  String get feedbackNote =>
      'アプリのバージョンとプランが一緒に送信されます。アカウントや購入のトラブルは「サポートに連絡」をご利用ください。';

  @override
  String get feedbackThanks => 'ありがとうございます！すべて拝見しています。';

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
  String get supportIdeasBoard => 'アイデアボード';

  @override
  String get supportIdeasBoardHelp => 'ほかの人のリクエストを見たり、次に欲しい機能に投票したりできます';

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
  String get contactSupportHelp => '状況を教えてください。メールで返信します。';

  @override
  String get contactSupportHelpMail => '状況を教えてください。詳細が入力された状態でメールアプリが開きます。';

  @override
  String get supportSend => '送信';

  @override
  String get supportWriteEmail => 'メールを開く';

  @override
  String get supportTopicPrompt => 'お問い合わせ内容';

  @override
  String get supportTopicBilling => '請求と購入';

  @override
  String get supportTopicBroken => '動作の不具合';

  @override
  String get supportTopicAccount => 'アカウントとサインイン';

  @override
  String get supportTopicQuestion => '質問・アイデア';

  @override
  String get supportTopicOther => 'その他';

  @override
  String get supportMessageLabel => 'メッセージ';

  @override
  String get supportMessageHint => '何が起きて、本来どうなるべきだったかを教えてください。';

  @override
  String get supportMessageMore => '何をしていたかと何がうまくいかなかったかを1〜2文で添えてください。';

  @override
  String get supportIncludeChat => 'Casamaヘルプとの会話を含める';

  @override
  String get supportIncludeChatHelp => '同じ説明を二度しなくて済みます。';

  @override
  String get supportDetailsNote =>
      'アカウントを特定するため、アプリのバージョン、ワークスペースID、アカウントIDが添付されます。チャット内容が送られることはありません。';

  @override
  String get supportSentTitle => 'メッセージを送信しました';

  @override
  String supportSentBody(String email, String reference) {
    return '$email宛てに返信します。受付番号は$referenceです。';
  }

  @override
  String supportNoMailApp(String email) {
    return 'メールアプリが見つからなかったため、メッセージをコピーしました。$email宛てのメールに貼り付けてください。';
  }

  @override
  String get supportGuides => 'ガイドとよくある質問';

  @override
  String get supportGuidesHelp => 'Casamaの全機能に関するステップごとのヘルプ';

  @override
  String get introVideoTitle => 'Casamaの仕組みを見る';

  @override
  String get introVideoSubtitle => '1分半の紹介動画';

  @override
  String get supportIntroVideo => '紹介動画を見る';

  @override
  String get introVideoFailed => '動画を再生できませんでした。接続を確認してもう一度お試しください。';

  @override
  String get introVideoOnYoutube => 'YouTubeで見る';

  @override
  String get introVideoReplay => 'もう一度再生';

  @override
  String get supportIntroVideoHelp => '1分半でCasamaのできることがわかります';

  @override
  String get supportRate => 'Casamaを評価';

  @override
  String get supportRateHelp => 'ストアページでほかの人に感想を共有できます';

  @override
  String get supportIds => 'サポートID';

  @override
  String get supportIdsHelp =>
      'サポートから提示をお願いする場合があります。アカウントや購入履歴の照会に使われ、誰かにアクセス権が渡ることはありません。';

  @override
  String supportWorkspaceId(String name) {
    return 'ワークスペースID・$name';
  }

  @override
  String get supportWorkspaceIdHelp => 'App StoreおよびGoogle Playの購入IDも兼ねています';

  @override
  String get supportAccountId => 'アカウントID';

  @override
  String get supportCopyAll => 'すべての詳細をコピー';

  @override
  String get supportCopyAllHelp => 'メッセージに貼り付けるためのアプリバージョン、プラットフォーム、ID';

  @override
  String get supportNewChat => '新しい会話';

  @override
  String get supportAskHint => 'Casamaについて何でも質問してください';

  @override
  String get supportAiNote =>
      'CasamaヘルプはAIであり、誤りを含む場合があります。プランとボットのエラーのみを参照し、チャット内容は見ません。';

  @override
  String get supportGreeting =>
      'こんにちは！Casamaヘルプです。Casamaの使い方やプラン、お困りのことについて何でもお聞きください。解決できない場合はサポートチームにおつなぎします。';

  @override
  String get supportStarterPurchase => '購入が完了しませんでした';

  @override
  String get supportStarterCancel => 'プランを解約するにはどうすればよいですか？';

  @override
  String get supportStarterBot => 'ボットが返信しません';

  @override
  String get supportStarterHowTo => 'ボットには何ができますか？';

  @override
  String get supportAskPerson => '担当者に聞く';

  @override
  String get supportHandoffTitle => 'サポートチームに送信しますか？';

  @override
  String get supportHandoffButton => '確認して送信';

  @override
  String get supportThinking => '確認中…';

  @override
  String get supportAssistantError =>
      'Casamaヘルプが応答できませんでした。もう一度お試しいただくか、担当者にお尋ねください。';

  @override
  String get supportAssistantLimit => 'Casamaヘルプは現在これ以上回答できません。担当者がお手伝いできます。';

  @override
  String get purchaseHelp => '購入でお困りですか？ヘルプを見る';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => '報告';

  @override
  String get reportAndBlock => '報告してブロック';

  @override
  String get reportReply => '返信を報告';

  @override
  String get reportBot => 'ボットを報告';

  @override
  String get reportBotRow => '名前、説明、または返信に不適切な内容があります';

  @override
  String get reportPerson => 'メンバーを報告';

  @override
  String get reportGalleryItem => 'ギャラリー項目を報告';

  @override
  String get reportGalleryRequest => 'リクエストを報告';

  @override
  String get reportWorkspace => 'ワークスペースを報告';

  @override
  String get reportHelp => 'このサーバーの運営者に問題を知らせてください。すべての報告が確認されます。';

  @override
  String get reportPersonHelp => 'このサーバーの運営者に状況を知らせてください。このメンバーは自動的にブロックされます。';

  @override
  String get reportNote => 'ほかに伝えておくべきこと（任意）';

  @override
  String reportAlsoBlock(String name) {
    return '$nameもブロックする';
  }

  @override
  String get reportSent => 'ありがとうございます。報告を審査のために送信しました。';

  @override
  String get reportReasonSpam => 'スパムまたは詐欺';

  @override
  String get reportReasonSexual => '性的なコンテンツ';

  @override
  String get reportReasonViolence => '暴力または脅迫';

  @override
  String get reportReasonHarassment => '嫌がらせまたはヘイト';

  @override
  String get reportReasonIllegal => '違法または危険な行為';

  @override
  String get reportReasonImpersonation => 'なりすまし';

  @override
  String get reportReasonOther => 'その他';

  @override
  String get thisPerson => 'この人物';

  @override
  String blockPerson(String name) {
    return '$nameをブロック';
  }

  @override
  String blocked(String name) {
    return '$nameをブロックしました';
  }

  @override
  String get blockHelp => 'ブロックした相手はあなたをワークスペースに招待できず、相手からの連絡も届かなくなります。';

  @override
  String get blockedPeople => 'ブロック中のユーザー';

  @override
  String get blockedPeopleRow => '招待や連絡ができないユーザー';

  @override
  String get noBlockedPeople => 'ブロックしているユーザーはいません';

  @override
  String get unblock => 'ブロック解除';

  @override
  String get emailTips => 'ヒントとお知らせをメールで受け取る';

  @override
  String get emailTipsHelp =>
      '使い始めのヒントとときどきのアップデートをお届けします。プランやアカウントに関するメールは常に送信されます。';

  @override
  String get reportsInApp => 'アプリ内からの報告';

  @override
  String get reportsNone => '未対応の報告はありません。アプリから送信された報告がここに表示されます。';

  @override
  String get reportsPublicLinks => '報告された公開リンク';

  @override
  String get reportsNoLinks => '報告された公開リンクはありません。';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の報告',
      one: '1件の報告',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => '非公開にする';

  @override
  String get reportsRestore => '復元';

  @override
  String get reportKindReply => 'ボットの返信';

  @override
  String get reportKindBot => 'ボット';

  @override
  String get reportKindPerson => 'メンバー';

  @override
  String get reportKindGallery => 'ギャラリー項目';

  @override
  String get reportKindWorkspace => 'ワークスペース';

  @override
  String get reportMarkActioned => '対応済みにする';

  @override
  String reportSuspendWorkspace(String name) {
    return 'ワークスペース「$name」を停止';
  }

  @override
  String get reportDismiss => '却下：問題なし';

  @override
  String get supportWebTitle => 'WebサイトのCasamaヘルプ';

  @override
  String get supportWebOn => 'オン';

  @override
  String get supportWebOff => 'オフ';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'IPアドレス$count件を一時停止中',
      one: 'IPアドレス1件を一時停止中',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return '未回答の質問$count件を表示';
  }

  @override
  String get ticketsOpen => '未対応';

  @override
  String get ticketsClosed => '対応済み';

  @override
  String get ticketsAll => 'すべて';

  @override
  String get ticketsNone => 'ここにメッセージはありません。';

  @override
  String get ticketClose => '閉じる';

  @override
  String get ticketReopen => '再開する';

  @override
  String get serviceStatus => 'ステータス';

  @override
  String get supportStatus => 'Casama Cloudのステータス';

  @override
  String get supportStatusHelp => '現在障害が発生していないか確認します';

  @override
  String get galleryChatSuggestionLabel => 'ギャラリーから';

  @override
  String get galleryChatAdd => '追加';

  @override
  String galleryChatAdded(String name) {
    return '$nameを追加しました';
  }

  @override
  String galleryChatReads(String things) {
    return '読み取り：$things';
  }

  @override
  String get galleryChatRunsCode => 'コードを実行';

  @override
  String get galleryChatComputer => 'コンピューターを使用';

  @override
  String galleryChatNeeds(String apps) {
    return '必要なアプリ：$apps';
  }

  @override
  String get galleryChatDraftLabel => 'スキルの下書き';

  @override
  String get galleryChatShowInstructions => '指示を表示';

  @override
  String get galleryChatHideInstructions => '指示を隠す';

  @override
  String get galleryChatSaveSkill => '自分のスキルに保存';

  @override
  String get galleryChatSaved => '保存済み';

  @override
  String get galleryChatSavedSkill => 'スキルに保存しました';

  @override
  String get galleryChatSubmit => 'ギャラリーに提出';

  @override
  String galleryChatSubmitTitle(String name) {
    return '$nameをギャラリーに提出しますか？';
  }

  @override
  String get galleryChatSubmitBody =>
      'まずメンテナーが確認します。公開されると誰でも見つけて使えるようになります。作成者として表示名のみが公開され、メールアドレスは表示されません。';

  @override
  String get galleryChatSent => '送信済み';

  @override
  String get galleryChatSubmitted => '審査のためギャラリーに送信しました';

  @override
  String get galleryChatSubmissionsOff => 'このサーバーではギャラリーへの提出を受け付けていません。';

  @override
  String get galleryPicksTitle => 'あなたへのおすすめ';

  @override
  String get galleryPicksHelp =>
      '用途に合ったスキル、アプリ、ルーティンのセットから始めましょう。あとから何でも変更できます。';

  @override
  String get galleryPicksAdd => 'このセットを追加';

  @override
  String get galleryPicksSkip => '今はスキップ';

  @override
  String galleryPicksAddNamed(String name) {
    return '$nameを追加';
  }

  @override
  String get galleryPicksBestMatch => 'おすすめ';

  @override
  String get galleryPicksInside => '含まれるもの';

  @override
  String galleryPicksBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ボット$count体',
      one: 'ボット1体',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スキル$count個',
      one: 'スキル1個',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ルーティン$count件',
      one: 'ルーティン1件',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アプリ$count件',
      one: 'アプリ1件',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksPlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'プラグイン$count個',
      one: 'プラグイン1個',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スタイル$count件',
      one: 'スタイル1件',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return '$nameを追加しました';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return '$nameを追加しました。完了するには「アプリ」で$appsを接続してください。';
  }

  @override
  String galleryPicksPending(String name) {
    return '追加前に管理者が$nameを確認します。';
  }

  @override
  String get galleryPolicyTitle => 'ギャラリー';

  @override
  String get galleryPolicyRow => 'メンバーがギャラリーから追加できるもの';

  @override
  String get galleryPolicyMode => '追加できる人';

  @override
  String get galleryPolicyOpen => '制限なし';

  @override
  String get galleryPolicyOpenHelp => 'ブロックされていないものは誰でも追加できます。';

  @override
  String get galleryPolicyApproval => '事前に確認';

  @override
  String get galleryPolicyApprovalHelp => '以下で選んだものを追加するときは、先に管理者に確認します。';

  @override
  String get galleryPolicyAllowlist => '許可リストのみ';

  @override
  String get galleryPolicyAllowlistHelp => '許可リストにあるものだけを追加できます。';

  @override
  String get galleryPolicyApprovalFor => '確認が必要な対象';

  @override
  String get galleryPolicyRunsCode => 'コードを実行するもの';

  @override
  String get galleryPolicyApps => 'アプリを接続するもの';

  @override
  String get galleryPolicyAll => 'すべて';

  @override
  String get galleryPolicyAllowed => '許可済み';

  @override
  String get galleryPolicyAllowedHelp =>
      '確認なしで追加されます。「許可リストのみ」の場合は、これらだけが追加可能になります。';

  @override
  String get galleryPolicyBlocked => 'ブロック済み';

  @override
  String get galleryPolicyBlockedHelp => 'ここのメンバーは誰もこれらを追加できません。';

  @override
  String get galleryPolicyAddItem => 'ギャラリーから追加';

  @override
  String get galleryPolicyNone => 'まだありません';

  @override
  String get galleryPolicySearch => 'ギャラリーを検索';

  @override
  String get galleryPolicyNoResults => 'ギャラリー内に一致するものがありません。';

  @override
  String get galleryPolicySaved => 'ギャラリールールを保存しました';

  @override
  String galleryPolicyRemove(String name) {
    return '$nameを削除';
  }

  @override
  String get galleryPolicyAdminsOnly => 'これを変更できるのは管理者とオーナーのみです。';

  @override
  String get galleryPolicyWaiting => '承認待ち';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$nameからのリクエスト';
  }

  @override
  String get galleryPolicyApprove => '承認';

  @override
  String get galleryPolicyDecline => '拒否';

  @override
  String galleryPolicyApproved(String name) {
    return '$nameを承認して追加しました';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$nameを拒否しました';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return '承認されましたが、$nameを追加できませんでした。$error';
  }

  @override
  String get galleryDigestEmails => '月間ギャラリーセレクション';

  @override
  String get galleryDigestHelp => 'お使いの内容に合う新しいスキル、アプリ、ルーティンを月1回・最大6件お届けします。';

  @override
  String get newsletterTitle => 'Casama月刊メール';

  @override
  String get newsletterHelp => '新機能と今後の予定を多くても月1回お届けします。';

  @override
  String get newsletterSignUp => 'Casamaの月刊メール（新機能と今後の予定、多くても月1回）の受け取りを希望します。';

  @override
  String get newsletterCardTitle => 'Casama月刊メールを受け取りますか？';

  @override
  String get newsletterCardBody => '新機能と今後の予定を多くても月1回お届けします。いつでも停止できます。';

  @override
  String get newsletterCardYes => 'はい、受け取る';

  @override
  String get newsletterCardNo => '受け取らない';

  @override
  String get newsletterCardDone => '登録しました。設定からいつでもオフにできます。';

  @override
  String get galleryKindApp => 'アプリ';

  @override
  String get galleryKindApps => 'アプリ';

  @override
  String get galleryKindBot => 'スターターボット';

  @override
  String get galleryKindBots => 'スターターボット';

  @override
  String get galleryKindRoutine => 'ルーティン';

  @override
  String get galleryKindRoutines => 'ルーティン';

  @override
  String get galleryKindPlugin => 'プラグイン';

  @override
  String get galleryKindPlugins => 'プラグイン';

  @override
  String get galleryKindSet => 'スターターセット';

  @override
  String get galleryKindSets => 'スターターセット';

  @override
  String get galleryTabBrowse => '探す';

  @override
  String get galleryTabInstalled => 'インストール済み';

  @override
  String get gallerySearchEverything => 'すべてを検索';

  @override
  String get galleryNewBadge => '新着';

  @override
  String get galleryRowPicks => 'おすすめ';

  @override
  String get galleryRowNew => '新着';

  @override
  String get galleryRowTrending => '今週の注目';

  @override
  String get galleryRowMostUsed => '人気順';

  @override
  String get galleryRowWorksWith => '現在の構成に対応';

  @override
  String get galleryRowSets => 'スターターセット';

  @override
  String get galleryRowSeasonal => '旬のアイテム';

  @override
  String get galleryFilterFree => '無料';

  @override
  String get galleryFilterPlan => 'クレジットを使用';

  @override
  String get galleryFilterSelfHosted => 'セルフホスト対応';

  @override
  String get galleryFilterComputer => 'コンピューターが必要';

  @override
  String get galleryNoFilterMatches => 'この条件に一致するものがありません';

  @override
  String get galleryClearFilters => 'フィルターをクリア';

  @override
  String get galleryRequestThis => 'リクエストする';

  @override
  String get galleryAskCasama => 'Casamaに作ってもらう';

  @override
  String galleryAskPrompt(String query) {
    return '次のようなものを作ってください：$query';
  }

  @override
  String get galleryAccessTitle => 'アクセスできるもの';

  @override
  String galleryAccessReads(String things) {
    return '読み取り：$things';
  }

  @override
  String get galleryAccessRunsCode => 'コードを実行';

  @override
  String get galleryAccessComputer => 'コンピューターを使用';

  @override
  String get galleryAccessNothing => 'あなたのデータの読み取りや変更は行いません';

  @override
  String get galleryCreditsNone => 'クレジット消費なし';

  @override
  String get galleryCreditsLow => 'クレジット消費少';

  @override
  String get galleryCreditsMedium => 'クレジット消費中';

  @override
  String get galleryCreditsHigh => 'クレジット消費多';

  @override
  String get galleryTryIt => '試してみる';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$shown人が利用中',
      one: '1人が利用中',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '実行完了率$percent%';
  }

  @override
  String get galleryAbout => '概要';

  @override
  String get galleryMadeByCasama => 'Casama製';

  @override
  String get galleryMadeByCommunity => 'コミュニティ製';

  @override
  String get galleryMadeReviewed => '審査済み';

  @override
  String get galleryReviewedHelp => 'このバージョンのテストに合格しています';

  @override
  String galleryMoreFrom(String name) {
    return '$nameのほかのアイテム';
  }

  @override
  String galleryVersion(int version) {
    return 'バージョン$version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return '更新日：$date';
  }

  @override
  String galleryRemixOf(String name) {
    return '$nameのリミックス';
  }

  @override
  String galleryChangesTitle(String name) {
    return '$nameの変更点';
  }

  @override
  String get galleryBreaking => '仕様変更あり';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ギャラリーに$count件',
      one: 'ギャラリーに1件',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty => 'この作者によるアイテムはまだギャラリーにありません。';

  @override
  String get galleryInstalledWorkspace => 'このワークスペース内';

  @override
  String get galleryInstalledDevice => 'このデバイスのスタイル';

  @override
  String get galleryInstalledEmptyTitle => 'まだ何も追加されていません';

  @override
  String get galleryInstalledEmpty =>
      'ギャラリーから追加したスキル、アプリ、ルーティン、スタイルがここに表示され、アップデートも確認できます。';

  @override
  String get galleryInstalledError => 'インストール済みの内容を読み込めませんでした。';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のアップデート',
      one: '1件のアップデート',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'アップデート';

  @override
  String galleryUpdated(String name) {
    return '$nameをアップデートしました';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'バージョン$from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return '$nameをアップデートしますか？';
  }

  @override
  String get galleryUpdateAccessHelp => '新しいバージョンでは、現在よりも多くの操作ができるようになります：';

  @override
  String get galleryUpdateBreakingHelp => '新しいバージョンは動作が異なるため、アップデート後に確認してください。';

  @override
  String galleryUpdateNowReads(String things) {
    return '新たな読み取り：$things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return '新たにできること：$action';
  }

  @override
  String get galleryUpdateNowRunsCode => '新たにコードを実行するようになります';

  @override
  String get galleryUpdateNowComputer => '新たにコンピューターを使用するようになります';

  @override
  String get galleryRemove => '削除';

  @override
  String galleryRemoveTitle(String name) {
    return '$nameを削除しますか？';
  }

  @override
  String get galleryRemoveHelp => 'このワークスペースから削除されます。ギャラリーからいつでも再追加できます。';

  @override
  String galleryRemoved(String name) {
    return '$nameを削除しました';
  }

  @override
  String get galleryRetired => 'ギャラリーでの公開は終了しました';

  @override
  String get galleryRetiredReplaced => 'ギャラリーでの公開は終了しました（後継があります）';

  @override
  String get gallerySeeReplacement => '後継を見る';

  @override
  String get galleryForgetLook => 'このリストから削除';

  @override
  String galleryWizardTitle(String name) {
    return '$nameを追加';
  }

  @override
  String get galleryWizardAdd => '追加';

  @override
  String get galleryWizardRequired => '入力してください';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件を含む',
      one: '1件を含む',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => '必要なもの';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スキル$count個（自動追加）',
      one: 'スキル1個（自動追加）',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return '接続するアプリ：$apps';
  }

  @override
  String get galleryWizardBot => 'どのボットに追加しますか';

  @override
  String get galleryWizardPickBot => 'ボットを選択';

  @override
  String get galleryWizardSetBotHelp => 'セットのルーティンを追加するボットです。指定しない場合は除外されます。';

  @override
  String get galleryWizardSetNotAdded => '追加しない';

  @override
  String get galleryWizardNeedsTitle => 'アプリを接続';

  @override
  String galleryWizardNeedsHelp(String name) {
    return 'これらを接続すると$nameが動作します。';
  }

  @override
  String get galleryWizardSkillAdded => '追加済み';

  @override
  String get galleryWizardConnected => '接続済み';

  @override
  String get galleryWizardConnect => '接続';

  @override
  String galleryWizardConnectInApps(String name) {
    return '「設定 → アプリ」で$nameを接続してください。';
  }

  @override
  String get galleryWizardContinue => '続行';

  @override
  String get galleryWizardSkip => 'あとで';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$nameの準備ができました';
  }

  @override
  String get galleryWizardDoneHelp => 'ほかのアイテムと一緒に保存されています。';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'すべての機能を使うには、次のアプリの接続が必要です：$apps';
  }

  @override
  String get galleryWizardPendingTitle => '承認待ち';

  @override
  String get galleryWizardPendingHelp => 'このワークスペースでは管理者の確認が必要です。承認されると追加されます。';

  @override
  String get galleryRequestsTitle => 'リクエスト';

  @override
  String get galleryRequestsHelp =>
      'ギャラリーへのアイデアです。ほしいものに投票すると、人気の高いものから作者が作成します。';

  @override
  String get galleryRequestsLinkHelp => 'まだないものをリクエストするか、投票してください';

  @override
  String get galleryRequestsTop => '人気';

  @override
  String get galleryRequestsNew => '新着';

  @override
  String get galleryRequestsEmpty => 'リクエストはまだありません。最初のリクエストを送りましょう。';

  @override
  String get galleryRequestsError => 'リクエストを読み込めませんでした。';

  @override
  String get galleryRequestNew => '新しいリクエスト';

  @override
  String get galleryRequestNewHelp => '誰かに作ってほしいものを書いてください。似たリクエストは統合されます。';

  @override
  String get galleryRequestKind => '種類';

  @override
  String get galleryRequestTitleLabel => '何ができるようにしますか？';

  @override
  String get galleryRequestTitleLength => '4〜80文字で入力してください。';

  @override
  String get galleryRequestDetails => '詳細（任意）';

  @override
  String get galleryRequestSend => 'リクエストを送信';

  @override
  String get galleryRequestSent => 'リクエストを送信しました';

  @override
  String galleryRequestSimilar(String title) {
    return '「$title」はすでにリクエストされていたため、そちらに投票しました';
  }

  @override
  String get galleryRequestMine => '自分の投稿';

  @override
  String get galleryRequestVote => '投票';

  @override
  String get galleryRequestOpen => '募集中';

  @override
  String get galleryRequestPlanned => '予定';

  @override
  String get galleryRequestDone => '完了';

  @override
  String get galleryRequestDeclined => '見送り';

  @override
  String get gallerySubmitStart => 'ギャラリーに投稿';

  @override
  String get gallerySubmissionsLinkHelp => '作成したスタイル、スキル、ルーティン、ボットを共有しましょう';

  @override
  String get gallerySubmitPick => '何を共有しますか？';

  @override
  String get gallerySubmitPickHelp => '作成したものを選択してください。審査のあとギャラリーに掲載されます。';

  @override
  String get galleryLooksMine => '自分のスタイル';

  @override
  String get gallerySubmitCurrentScheme => '使用中の配色';

  @override
  String get gallerySubmitCurrentWallpaper => '使用中の壁紙';

  @override
  String get gallerySubmitMyWallpaper => '自分の壁紙';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'アプリを投稿',
      'bot': 'スターターボットを投稿',
      'routine': 'ルーティンを投稿',
      'plugin': 'プラグインを投稿',
      'set': 'スターターセットを投稿',
      'theme': 'テーマを投稿',
      'scheme': '配色を投稿',
      'wallpaper': '壁紙を投稿',
      'other': 'スキルを投稿',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp => '表示名が作成者として表示されます。メールアドレスが共有されることはありません。';

  @override
  String get gallerySubmitName => '名前';

  @override
  String get gallerySubmitNameLength => '1〜60文字で入力してください。';

  @override
  String get gallerySubmitTags => 'タグ';

  @override
  String get gallerySubmitTagsHelp => '最大6個、カンマ区切り';

  @override
  String get gallerySubmitLicense => 'ライセンス';

  @override
  String gallerySubmitRemix(String name) {
    return '元のアイテムをクレジット表記：$name';
  }

  @override
  String get gallerySubmitRemixUnnamed => '元のギャラリーアイテムをクレジット表記';

  @override
  String get gallerySubmitSend => '送信';

  @override
  String get gallerySubmitted => '審査のために送信しました';

  @override
  String get gallerySubmissionsTitle => '自分の投稿';

  @override
  String get gallerySubmissionsHelp => 'ギャラリーに投稿したアイテムと現在の状況です。';

  @override
  String get gallerySubmissionsSent => '送信済み';

  @override
  String get gallerySubmissionsEmpty => 'まだ何も送信していません。';

  @override
  String get gallerySubmissionsError => '投稿を読み込めませんでした。';

  @override
  String get gallerySubmissionOpen => '審査中';

  @override
  String get gallerySubmissionMerged => 'ギャラリーに掲載中';

  @override
  String get gallerySubmissionClosed => '不採用';

  @override
  String get gallerySubmissionFailed => '送信できませんでした';

  @override
  String get galleryMyItems => 'ギャラリーのマイアイテム';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '未対応の報告$count件',
      one: '未対応の報告1件',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'ボット';

  @override
  String get islandNeedsOk => 'あなたの承認が必要です';

  @override
  String get islandTakeOver => '操作の交代を求めています';

  @override
  String get islandWriting => '返信を作成中';

  @override
  String get islandWorking => '作業中';

  @override
  String get islandFinished => '完了';

  @override
  String get islandStoppedProblem => '問題が発生して停止しました';

  @override
  String get islandOnThisMac => 'このMac上';

  @override
  String get islandStale => '最新情報はCasamaを開いてください';

  @override
  String get islandOpen => '開く';

  @override
  String get islandStop => '停止';

  @override
  String get islandAllow => '許可';

  @override
  String get islandDeny => '拒否';

  @override
  String get islandReview => '確認';

  @override
  String get islandNothing => '現在作業中のボットはありません';

  @override
  String get islandQuickAsk => 'クイック質問…';

  @override
  String get islandOpenCasama => 'Casamaを開く';

  @override
  String get islandSettings => '設定…';

  @override
  String get islandQuit => 'Casamaを終了';

  @override
  String get islandAskHint => 'ボットに聞く…';

  @override
  String get islandNeedsYou => '確認が必要';

  @override
  String get islandDropHere => 'ドロップしてボットに聞く';

  @override
  String get siriSignedOut => 'まずCasamaにサインインしてください。';

  @override
  String get siriOpenToFinish => '完了するにはCasamaを開いてください。';

  @override
  String get siriTooMany => '1分あたりのリクエストが多すぎます。続けるにはCasamaを開いてください。';

  @override
  String get siriNoCredits => 'クレジットが不足しています。Casamaを開いて追加してください。';

  @override
  String get siriOffline => '現在Casamaがインターネットに接続できません。';

  @override
  String siriNeedsYou(String bot) {
    return '$botがあなたの承認を待っています。確認するにはCasamaを開いてください。';
  }

  @override
  String siriBotFailed(String bot) {
    return '$botで問題が発生しました。状況を確認するにはCasamaを開いてください。';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$botが返信しました。読むにはCasamaを開いてください。';
  }

  @override
  String siriStillWorking(String bot) {
    return '$botはまだ作業中です。完了したら通知が届きます。';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$botが回答しました。';
  }

  @override
  String siriRoutineStarted(String routine) {
    return '$routineを開始しました。';
  }

  @override
  String get siriNothingNeedsYou => '今すぐ対応が必要なものはありません。';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '確認待ちが$count件あります。',
      one: '確認待ちが1件あります。',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return '確認待ち：$bots。';
  }

  @override
  String get siriComputersUnavailable => 'このアカウントではコンピューターを利用できません。';

  @override
  String get siriNoComputers => 'このワークスペースにはコンピューターがありません。';

  @override
  String siriStartingComputer(String computer) {
    return '$computerを起動しています。';
  }

  @override
  String get siriComputerFailed => '現在コンピューターを起動できませんでした。';

  @override
  String get siriWhichBotToStop => 'どのボットを停止しますか？';

  @override
  String get siriBotNotRunning => 'そのボットは現在稼働していません。';

  @override
  String get siriStopped => '停止しました。';

  @override
  String get siriStopFailed => '現在ボットを停止できませんでした。';

  @override
  String get focusFilterShowingAll => '集中モードフィルタ・すべて表示';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '集中モードフィルタ・$count件表示中',
      one: '集中モードフィルタ・1件表示中',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casamaは13歳以上の方を対象としています';

  @override
  String get under13Body =>
      '申告された年齢区分に基づき、このアカウントではCasamaをご利用いただけません。サインアウトするか、別のアカウントからデータをエクスポートできます。';

  @override
  String get siriSpotlightSetting => 'SpotlightとSiriに表示';

  @override
  String get siriSpotlightSettingHelp =>
      'ボット名、ルーティン名、チャットタイトルがこのデバイスのSpotlightとSiriに表示されます。チャットの内容が表示されることはありません。アプリロックがオンのときはオフになります。';

  @override
  String get geminiSetting => 'GeminiによるCasamaの利用を許可';

  @override
  String get geminiSettingHelp =>
      'GeminiにCasamaを使うよう頼むと、このスマートフォン上でボットへの質問、確認待ちの閲覧、ルーティンの実行ができます。承認は行わず、確認依頼はここで開きます。「返信テキストを隠す」またはアプリロックがオンの場合、プライベートワークスペース内の返信は非表示のままになります。';

  @override
  String get geminiOff =>
      'このスマートフォンではCasamaに対するGeminiがオフになっています。Casamaの「設定 → プライバシー」からオンにしてください。';

  @override
  String get islandBotWorking => 'ボットが作業中';

  @override
  String get islandOnThisComputer => 'このコンピューター上';

  @override
  String get islandOnACall => '通話中';

  @override
  String get islandStartElsewhere => '別の端末で開始したボット';

  @override
  String get islandStartElsewhereHelp =>
      'Macなど別のデバイスで開始した作業も、このスマートフォンのロック画面に表示します。';

  @override
  String get islandBotsAtWork => '作業中のボット';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countステップ',
      one: '1ステップ',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'ノッチにボットを表示';

  @override
  String get showBotsInNotchHelp =>
      'ボットの作業状況をカメラ周りに表示します。オフでもメニューバーアイコンには表示されます。';

  @override
  String get notchOnHover => 'ポインターを合わせてノッチを開く';

  @override
  String get notchOnHoverHelp => 'オフの場合、クリックしてノッチを開きます。';

  @override
  String get sitePublishToWeb => 'Webに公開';

  @override
  String get sitePublishToWebHelp => '専用のWebアドレスを割り当てます。';

  @override
  String get siteAddressName => 'アドレス名';

  @override
  String get siteAddressRules => '3〜40文字の小文字の英字、数字、ハイフン（先頭と末尾は英字または数字）。';

  @override
  String get siteAddressChecking => '確認中…';

  @override
  String get siteAddressAvailable => '利用可能';

  @override
  String get siteAddressTaken => 'この名前は利用できません。';

  @override
  String get siteAnyoneCanOpen => 'アドレスを知っている人なら誰でも開けます。';

  @override
  String get sitePublish => '公開';

  @override
  String get siteOnTheWeb => 'Web公開中';

  @override
  String get siteSearchEngines => '検索エンジンに掲載する';

  @override
  String get siteSearchEnginesHelp => 'Googleなどの検索エンジンに表示されるようになります。';

  @override
  String get siteSearchEnginesPaid => '有料プランが必要です。';

  @override
  String get siteUseOwnDomain => '自分のドメインを使う';

  @override
  String get siteUnpublish => '非公開にする';

  @override
  String get siteUnpublishTitle => 'このサイトを非公開にしますか？';

  @override
  String get siteUnpublishBody => 'Webアドレスからは開けなくなりますが、ライブラリには残ります。';

  @override
  String get siteHostLive => '公開中';

  @override
  String get siteHostWaitingForDns => 'DNS待機中';

  @override
  String get siteHostGettingCertificate => '証明書を取得中';

  @override
  String get siteHostNeedsAttention => '確認が必要';

  @override
  String get siteHostPaused => '一時停止中';

  @override
  String get siteHostSuspended => '停止中';

  @override
  String get settingsDomains => 'ドメイン';

  @override
  String get settingsDomainsHelp => 'お持ちのドメインでサイトを公開できます。';

  @override
  String get settingsSearchHint => '設定を検索';

  @override
  String settingsSearchNone(String query) {
    return '「$query」に一致する設定がありません。';
  }

  @override
  String get domainsEmpty => 'bakery.comのようなお持ちのドメインを接続すると、そのアドレスでサイトが開きます。';

  @override
  String get domainsConnectOwn => '自分のドメインを接続';

  @override
  String get domainStateLive => '公開中';

  @override
  String get domainStateWaitingDns => 'DNS待機中';

  @override
  String get domainStateWaitingCert => '証明書を取得中';

  @override
  String get domainStatePaused => '一時停止中';

  @override
  String get domainStateNeedsAttention => '確認が必要';

  @override
  String get domainNoSite => 'サイトはまだありません';

  @override
  String get domainConnectField => 'あなたのドメイン';

  @override
  String get domainConnectHelp =>
      'bakery.com、www.bakery.com、shop.bakery.comのように入力してください。';

  @override
  String get domainConnectSite => '表示するサイト';

  @override
  String get domainSiteNone => 'なし';

  @override
  String get domainSiteNoneHelp => 'サイトを選ぶまでドメインには何も表示されません。';

  @override
  String get domainConnect => '接続';

  @override
  String get domainClaimTitle => '所有権を証明';

  @override
  String get domainClaimBody =>
      '別のワークスペースがこのドメインを接続しています。あなたの所有であることを示すためこのレコードを追加し、もう一度「接続」をタップしてください。';

  @override
  String get domainRecordType => '種類';

  @override
  String get domainRecordName => '名前';

  @override
  String get domainRecordValue => '値';

  @override
  String get domainSite => 'サイト';

  @override
  String get domainPickSite => 'サイトを選択';

  @override
  String get domainHosts => 'アドレス';

  @override
  String get domainPrimary => 'プライマリ';

  @override
  String get domainPrimaryHelp => '訪問者はここにアクセスし、ほかのアドレスはここに転送されます。';

  @override
  String get domainMakePrimary => 'プライマリに設定';

  @override
  String get domainRecordsTitle => '追加するレコード';

  @override
  String get domainRecordsAtCloudflare =>
      'Cloudflareでこれらを追加してください。レコードは「DNSのみ」に設定します。';

  @override
  String domainRecordsAt(String provider) {
    return '$providerのDNS設定でこれらを追加してください。';
  }

  @override
  String get domainRecordsGeneric =>
      'ドメインのDNSを管理している場所（通常はドメインを購入した会社）でこれらを追加してください。';

  @override
  String get domainRecordsNone => '追加するものはありません。設定は完了しています。';

  @override
  String get domainRecordOptional => '任意';

  @override
  String domainRecordForward(String from, String to) {
    return 'ドメインを購入した会社で、$fromから$toへの転送をオンにしてください。';
  }

  @override
  String get domainRecordFound => '確認済み';

  @override
  String get domainRecordNotFound => 'まだ見つかりません';

  @override
  String get domainCheckAgain => '再確認';

  @override
  String get domainCheckTooSoon => '今確認したばかりです。数秒後にもう一度お試しください。';

  @override
  String get domainChecksItself => 'こちらでも自動で確認するため、この画面を離れても大丈夫です。';

  @override
  String get domainHistory => '履歴';

  @override
  String get domainEventConnected => '接続済み';

  @override
  String get domainEventProved => 'レコードを確認済み';

  @override
  String get domainEventLive => '公開中';

  @override
  String get domainEventNeedsDns => 'DNSを待機中';

  @override
  String get domainEventFailed => '設定を完了できませんでした';

  @override
  String get domainEventDisconnected => 'レコードが削除されたため接続が解除されました';

  @override
  String get domainEventPaused => '一時停止中：プランの対象外です';

  @override
  String get domainEventResumed => '再開しました';

  @override
  String get domainEventRemoved => '接続解除';

  @override
  String get domainEventClaim => '所有権の確認を依頼';

  @override
  String get domainEventClaimAttempt => '別のワークスペースが接続を試みました';

  @override
  String get domainEventOverLimit => 'プランの上限を超えています';

  @override
  String get domainEventSuspended => '停止中';

  @override
  String get domainEventOther => '更新済み';

  @override
  String domainDisconnectTitle(String name) {
    return '$nameの接続を解除しますか？';
  }

  @override
  String get domainDisconnectBody =>
      'このドメインでサイトが開かなくなります。あとからDNS管理会社でレコードを削除できます。';

  @override
  String get domainsFind => 'ドメインを探す';

  @override
  String get domainsEmptyBuy => 'サイト用のドメインを購入するか、お持ちのドメインを接続します。';

  @override
  String get domainFindField => '名前またはキーワード';

  @override
  String get domainFindHint => 'パン屋';

  @override
  String get domainFindHelp => '価格は年額・税別です。';

  @override
  String get domainFindNone => '名前が見つかりません。別の言葉をお試しください。';

  @override
  String get domainFindNotOffered =>
      'このアプリではドメインの購入はできません。お持ちのドメインを接続することはできます。';

  @override
  String domainPricePerYear(String price) {
    return '年額$price（税別）';
  }

  @override
  String domainRenewsAt(String price) {
    return '更新価格$price';
  }

  @override
  String get domainReasonTaken => '取得済み';

  @override
  String get domainReasonPremium => 'プレミアムドメインのためここでは販売していません';

  @override
  String get domainReasonNotSold => 'ここでは販売していません';

  @override
  String get domainBuy => '購入';

  @override
  String domainBuyTitle(String name) {
    return '$nameを購入';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '初年度$price、以降年額$renew（税別）。';
  }

  @override
  String get domainBuyFinal => 'ドメインが登録されると購入は確定します。登録できなかった場合は全額返金されます。';

  @override
  String get domainBuyTerms => 'ドメイン利用規約に同意します';

  @override
  String get domainBuyReadTerms => '規約を読む';

  @override
  String get domainRenewAuto => '自動更新';

  @override
  String get domainRenewAutoHelp => '有効期限の約2週間前に、保存済みのお支払い方法へ請求します。';

  @override
  String get domainBuySite => '表示するサイト';

  @override
  String get domainBuyPayInBrowser => 'ブラウザーでお支払いを完了してください。この画面も連動して更新されます。';

  @override
  String get domainContactTitle => '連絡先情報';

  @override
  String get domainContactHelp => 'ドメインの登録者（個人または法人）の情報です。レジストラにより非公開に保たれます。';

  @override
  String get domainContactFirstName => '名';

  @override
  String get domainContactLastName => '姓';

  @override
  String get domainContactOrganization => '会社・屋号（任意）';

  @override
  String get domainContactAddress1 => '住所1';

  @override
  String get domainContactAddress2 => '住所2（任意）';

  @override
  String get domainContactCity => '市区町村';

  @override
  String get domainContactState => '都道府県・州';

  @override
  String get domainContactZip => '郵便番号';

  @override
  String get domainContactCountry => '国コード';

  @override
  String get domainContactCountryHint => 'JP';

  @override
  String get domainContactPhone => '電話番号';

  @override
  String get domainContactPhoneHint => '+1 415 555 0100';

  @override
  String get domainContactEmail => 'メールアドレス';

  @override
  String get domainContactRequired => '必須';

  @override
  String get domainContactCountryInvalid => 'JPやUSのような2文字のコードを入力してください';

  @override
  String get domainContactPhoneInvalid => '+1 415 555 0100のような国際形式で入力してください';

  @override
  String get domainContactEmailInvalid => '有効なメールアドレスを入力してください';

  @override
  String get domainContactSave => '保存';

  @override
  String get domainContactSaved => '連絡先情報を保存しました。';

  @override
  String get domainContactChangeNote =>
      '変更はこのワークスペースで購入したすべてのドメインに適用されます。新しいメールアドレスは再度確認が必要です。';

  @override
  String get domainOrderTitle => 'ご注文';

  @override
  String get domainOrderWaitingPayment => 'ブラウザーでのお支払い完了を待っています。';

  @override
  String domainOrderRegistering(String name) {
    return '$nameを登録中…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return '$nameを設定中…';
  }

  @override
  String domainOrderRefunding(String name) {
    return '$nameを登録できませんでした。返金処理を行っています…';
  }

  @override
  String domainOrderRefunded(String name) {
    return '$nameを登録できなかったため、全額返金しました。';
  }

  @override
  String get domainOrderAbandoned => 'このお支払いは完了しなかったため、請求は発生していません。';

  @override
  String get domainOrderNeedsAttention => 'この注文で問題が発生しました。こちらで把握していますので、対応します。';

  @override
  String domainOrderDone(String name) {
    return '$nameはあなたのものになりました。';
  }

  @override
  String get domainOrderLeave => 'この画面を閉じても、準備が整い次第お知らせします。';

  @override
  String get domainOrderBack => 'ドメイン一覧に戻る';

  @override
  String domainRenewsOn(String date) {
    return '$dateに更新';
  }

  @override
  String domainExpiresOn(String date) {
    return '$dateに期限切れ';
  }

  @override
  String domainRenewPrice(String price) {
    return '年額$price（税別）';
  }

  @override
  String get domainRenewNow => '今すぐ更新';

  @override
  String get domainRenewPayInBrowser =>
      'ブラウザーでお支払いを完了してください。支払い完了後に新しい日付が表示されます。';

  @override
  String get domainRenewCharged => '更新しました。新しい日付はまもなく表示されます。';

  @override
  String get domainRegistration => '登録';

  @override
  String domainExpired(String date) {
    return '$dateに期限切れになりました。維持するにはその日から25日以内に更新してください。';
  }

  @override
  String get domainLapsed => 'このドメインは失効しました。復旧できるかサポートにお問い合わせください（保証はできません）。';

  @override
  String get domainSuspendedLine => 'このドメインは停止中です。理由を確認するにはサポートにお問い合わせください。';

  @override
  String get domainVerifyTitle => '登録者メールアドレスを確認してください';

  @override
  String get domainVerifyBody =>
      'レジストラから登録者のメールアドレス宛てにメールが送信されました。メールを開いて確認しないとドメインが停止します。';

  @override
  String get domainVerifySendAgain => '再送信';

  @override
  String get domainVerifySent => '送信しました。登録者の受信トレイを確認してください。';

  @override
  String get domainDnsRecords => 'DNSレコード';

  @override
  String get domainDnsRecordsHelp => 'メール、サブドメイン、サイト確認';

  @override
  String get domainMoveOut => '別のレジストラに移管';

  @override
  String domainMoveOutAfter(String date) {
    return '$date以降に移管できます';
  }

  @override
  String get domainMoveOutHelp => '他社レジストラ用の移管コードを取得';

  @override
  String domainMoveOutTitle(String name) {
    return '$nameを移管しますか？';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'ドメインのロックを解除し、移管コードを一度だけ表示します。確認のため$nameを入力してください。';
  }

  @override
  String get domainMoveOutConfirm => '移管コードを取得';

  @override
  String domainMoveOutLocked(String date) {
    return '$date以降に移管できます。';
  }

  @override
  String get domainTransferCodeTitle => '移管コード';

  @override
  String get domainTransferCodeBody =>
      'このコードを新しいレジストラに渡してください。一度しか表示されないため、今すぐコピーしてください。';

  @override
  String get domainTransferCode => 'コード';

  @override
  String get domainUnlocked => '移管のためロック解除済み';

  @override
  String get domainLockAgain => 'もう一度ロック';

  @override
  String get domainLocked => '再びロックしました。';

  @override
  String get domainReauthTitle => '再サインイン';

  @override
  String get domainReauthSendCode => 'コードをメールで受け取る';

  @override
  String domainReauthCodeSent(String email) {
    return '$emailにコードを送信しました。';
  }

  @override
  String get domainReauthCode => 'メールのコード';

  @override
  String get domainReauthSignIn => 'サインイン';

  @override
  String get domainReauthSignOut => '一度サインアウトしてサインインし直し、もう一度お試しください。';

  @override
  String get dnsRecordsEmpty => 'レコードはまだありません。';

  @override
  String get dnsRecordAdd => 'レコードを追加';

  @override
  String get dnsRecordEdit => 'レコードを編集';

  @override
  String get dnsRecordManaged => 'Casamaサイトで使用中';

  @override
  String get dnsRecordType => '種類';

  @override
  String get dnsRecordHost => '名前';

  @override
  String dnsRecordHostHelp(String name) {
    return '$name自体に使う場合は空欄にするか、www、shopなどを入力してください…';
  }

  @override
  String get dnsRecordAnswer => '値';

  @override
  String get dnsRecordTtl => 'TTL（秒）';

  @override
  String get dnsRecordPriority => '優先度';

  @override
  String get dnsRecordSave => '保存';

  @override
  String get dnsRecordDeleteTitle => 'このレコードを削除しますか？';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300秒以上';

  @override
  String get dnsRecordAnswerRequired => '必須';

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
  String get deleteAccountDomains => 'ワークスペースで購入したドメイン';

  @override
  String get deleteAccountDomainsBody =>
      'これらのドメインは有効期限まで登録されたまま残ります。更新はされず、サイトはオフラインになります。';

  @override
  String get whatsNew010Sites => 'ページを専用アドレスでWeb上に公開し、自分のドメインも使えます。';

  @override
  String get inAppAlertOpen => '開く';

  @override
  String get pushPrefsTitle => '通知';

  @override
  String get pushPrefsHelp => 'デバイスで鳴らす通知を選択します。すべて受信トレイには届きます。';

  @override
  String get pushAllOn => 'すべてオン';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': '返信がオフ',
      'needsYou': '「確認が必要」がオフ',
      'routines': 'ルーティンとブリーフィングがオフ',
      'suggestions': '提案と声かけがオフ',
      'other': 'アカウントがオフ',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count種類オフ';
  }

  @override
  String get pushReplies => '返信';

  @override
  String get pushRepliesHelp => 'チャットを離れたあとにボットが質問へ回答したとき。';

  @override
  String get pushNeedsYou => '確認が必要';

  @override
  String get pushNeedsYouHelp => 'ボットが待っている承認、パスワード、操作の交代。';

  @override
  String get pushNeedsYouOffWarning => 'オフの場合、あなたがアプリを開くまでボットは待機します。';

  @override
  String get pushRoutines => 'ルーティンとブリーフィング';

  @override
  String get pushRoutinesHelp => 'ルーティンの結果や朝のブリーフィング。';

  @override
  String get pushSuggestions => '提案と声かけ';

  @override
  String get pushSuggestionsHelp => 'ボットからあなたへの手伝いの提案。';

  @override
  String get pushAccount => 'アカウント';

  @override
  String get pushAccountHelp => 'クレジット残高の低下、プロジェクト、サーバーのお知らせ。';

  @override
  String get pushHideReplyText => '返信テキストを隠す';

  @override
  String get pushHideReplyTextHelp => '通知にボットの本文を表示せず、返信があったことだけを知らせます。';

  @override
  String get reactToMessage => 'リアクション';

  @override
  String get moreReactions => 'ほかのリアクション';

  @override
  String get reactionsTitle => 'リアクション';

  @override
  String get reactionsAll => 'すべて';

  @override
  String get reactionsYou => 'あなた';

  @override
  String get reactionsTapToRemove => 'タップで削除';

  @override
  String get reactionsNone => 'リアクションはまだありません。';

  @override
  String get reactionsLoadFailed => 'リアクションした人を読み込めませんでした。';

  @override
  String get searchEmoji => '絵文字を検索';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'リアクション$count件',
      one: 'リアクション1件',
    );
    return '$emoji、$_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'リアクション$count件',
      one: 'リアクション1件',
    );
    return '$emoji、$_temp0（あなたを含む）';
  }

  @override
  String reactionQuick(String emoji) {
    return '$emojiでリアクション';
  }

  @override
  String reactionRemove(String emoji) {
    return '$emojiのリアクションを削除';
  }

  @override
  String get packsShelfTitle => 'パック';

  @override
  String get packsShelfHelp => '連携するボット、スキル、ルーティンをまとめて追加できます。';

  @override
  String get packReviewed => '審査済み';

  @override
  String get packNotReviewed => 'Casamaによる未審査';

  @override
  String packCountBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ボット$count体',
      one: 'ボット1体',
    );
    return '$_temp0';
  }

  @override
  String packCountSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スキル$count個',
      one: 'スキル1個',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ルーティン$count件',
      one: 'ルーティン1件',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アプリ$count件',
      one: 'アプリ1件',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'スタイル$count件',
      one: 'スタイル1件',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ツール$count個',
      one: 'ツール1個',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件',
      one: '1件',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'スターターセット';

  @override
  String get packAddFromLink => 'リンクからパックを追加';

  @override
  String get packAddFromLinkHelp => 'パックのGitHubリンクを貼り付けると、追加前に中身を確認できます。';

  @override
  String get packAddFromFile => 'ファイルから追加';

  @override
  String get packAddFromFileHelp => 'パックの.zipファイルを選択します。';

  @override
  String get packLinkLabel => 'GitHubリンク';

  @override
  String get packFileUnreadable => 'そのファイルはパックの.zipではありません。';

  @override
  String get packFileTooBig => 'そのファイルはパックとしては大きすぎます。';

  @override
  String packSource(String where, String commit) {
    return '$where（$commit）';
  }

  @override
  String get packFromFile => 'ファイルから';

  @override
  String get packFromShare => 'あなたと共有';

  @override
  String get packAlreadyHere => 'このワークスペースにはすでにこのパックがあります。';

  @override
  String get packOpenInstalled => 'インストール済みパックを見る';

  @override
  String get packAdd => 'パックを追加';

  @override
  String packWizardTitle(String name) {
    return '$nameを追加';
  }

  @override
  String get packWhatsInside => '含まれるもの';

  @override
  String get packWhatsInsideHelp => '不要な項目のチェックを外してください。';

  @override
  String get packSectionBots => 'ボット';

  @override
  String get packSectionSkills => 'スキル';

  @override
  String get packSectionRoutines => 'ルーティン';

  @override
  String get packSectionApps => 'アプリ';

  @override
  String get packSectionLooks => 'スタイル';

  @override
  String get packSectionIncludes => 'ギャラリーから';

  @override
  String get packSectionTools => 'ツール';

  @override
  String get packSkillRunsScripts => 'ボットのコンピューターでスクリプトを実行';

  @override
  String get packSkillForWorkspace => 'ワークスペース全体向け';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '週に約$count回実行',
      one: '週に約1回実行',
      zero: 'ときどき実行',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return '$hostと通信';
  }

  @override
  String packToolRemote(String url) {
    return '$urlに接続';
  }

  @override
  String get packIncludeMissing => 'ギャラリーに見つかりません';

  @override
  String get packLookHelp => '追加後にこのデバイスで使えます。';

  @override
  String get packNothingTicked => '追加する項目を少なくとも1つ選択してください。';

  @override
  String get packQuestions => 'いくつか質問があります';

  @override
  String get packQuestionsHelp => 'パックがボットやルーティンにこれらの内容を入力します。';

  @override
  String get packSecretsTitle => 'キーと設定';

  @override
  String get packSecretsHelp => 'パックのツールが動作するために必要です。';

  @override
  String get packReachTitle => 'アクセスできる範囲';

  @override
  String get packReachHelp => 'パックのファイルからCasamaが解析した結果です。';

  @override
  String get packReachRunsCode => 'コードを実行';

  @override
  String get packReachComputer => 'ボットのコンピューターを使用';

  @override
  String packReachHosts(String hosts) {
    return '通信先：$hosts';
  }

  @override
  String get packReachNoHosts => 'ほかのサイトとは通信しません';

  @override
  String packReachSecrets(String names) {
    return '使用するキー：$names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '週に約$count回定期実行',
      one: '週に約1回定期実行',
      zero: '定期実行なし',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casamaはこのパックを審査していません。提供元を信頼できる場合のみ追加してください。ルーティンはオフの状態で追加されます。';

  @override
  String get packPickBotTitle => 'どのボットに追加しますか？';

  @override
  String get packPickBotHelp =>
      'このパックにはボットが含まれていません。ルーティンとツールを追加するボットを選んでください。';

  @override
  String packDoneTitle(String name) {
    return '$nameを追加しました';
  }

  @override
  String get packDoneHelp => '追加された内容です。';

  @override
  String get packPendingHelp => '管理者に確認を依頼しました。承認されるとパックが追加されます。';

  @override
  String get packStatusInstalled => '追加済み';

  @override
  String get packStatusPending => '管理者の承認待ち';

  @override
  String get packStatusSkipped => 'スキップ';

  @override
  String get packStatusFailed => '失敗しました';

  @override
  String get packStatusDevice => 'このデバイス上';

  @override
  String get packConnectTitle => 'アプリを接続';

  @override
  String get packConnectHelp => 'これらを接続するとボットがすべての機能を使えるようになります。';

  @override
  String get packLooksTitle => 'このデバイスでスタイルを使いますか？';

  @override
  String get packUseLook => '使う';

  @override
  String get packLookInUse => '使用中';

  @override
  String get packInstalledTitle => 'そのパックはすでに追加されています';

  @override
  String get packsInstalledTitle => 'インストール済みパック';

  @override
  String get packsInstalledRow => 'このワークスペースに追加されたパックとアップデート';

  @override
  String get packsInstalledEmpty => 'まだパックはありません。パック一覧から見つけるか、リンクから追加してください。';

  @override
  String get packEditedBadge => '編集済み';

  @override
  String get packRemove => '削除';

  @override
  String get packUpToDate => 'このパックは最新です。';

  @override
  String get packCantCheck => 'このパックはファイルまたはリンクから追加されたため、アップデートを確認できません。';

  @override
  String packUpdateTitle(String name) {
    return '$nameをアップデート';
  }

  @override
  String packDiffAdded(String names) {
    return '新規：$names';
  }

  @override
  String packDiffRemoved(String names) {
    return '削除：$names';
  }

  @override
  String packDiffChanged(String name) {
    return '変更：$name';
  }

  @override
  String packDiffHosts(String hosts) {
    return '新しい通信先サイト：$hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return '新しく必要なキー：$names';
  }

  @override
  String packDiffSchedules(String names) {
    return '新しいスケジュール：$names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return '週あたりのスケジュール実行回数：$from → $to';
  }

  @override
  String get packDiffNone => '目立った変更はありません。';

  @override
  String get packEditedTitle => 'あなたが変更した項目';

  @override
  String get packEditedHelp => '切り替えない限り、あなたのバージョンが維持されます。';

  @override
  String get packTakeTheirs => 'パックのバージョンを使う';

  @override
  String get packReachGrewTitle => 'アクセス範囲が広がります';

  @override
  String get packReachGrewHelp => '新しいバージョンは現在のものより多くの情報にアクセスできます。';

  @override
  String get packReachConfirm => '新しいアクセス範囲を確認しました';

  @override
  String packUpdated(String name) {
    return '$nameをアップデートしました。';
  }

  @override
  String packRemoveTitle(String name) {
    return '$nameを削除しますか？';
  }

  @override
  String get packRemoveBody => 'ツールとキー、および変更していないスキルとルーティンが削除されます。アプリの接続は残ります。';

  @override
  String get packRemoveBots => 'このパックが作成したボットも削除する';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'パックを削除しました。変更した$count件の項目は残りました。',
      one: 'パックを削除しました。変更した1件の項目は残りました。',
      zero: 'パックを削除しました。',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'パックとして共有';

  @override
  String get sharePackRow => 'ボットやスキルをほかの人向けにまとめる';

  @override
  String get sharePackHelp => 'キー、チャット、メモリー、「あなたについて」、モデルの選択は含まれません。';

  @override
  String get sharePackBots => 'ボット';

  @override
  String get sharePackBotsHelp => '最大5体まで選択できます。それぞれの指示、スキル、ルーティンが含まれます。';

  @override
  String get sharePackSkills => 'ワークスペースのスキル';

  @override
  String get sharePackName => '名前';

  @override
  String get sharePackSummary => 'ひとこと説明';

  @override
  String get sharePackLook => 'このデバイスのテーマを含める';

  @override
  String get sharePackCheck => '確認して共有';

  @override
  String get sharePackFindingsTitle => 'キーのように見える行があります';

  @override
  String get sharePackFindingsHelp =>
      '共有する前に確認してください。戻って修正するか、問題なければそのまま共有できます。';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path、$line行目：$what';
  }

  @override
  String get sharePackGoBack => '戻る';

  @override
  String get sharePackAnyway => 'このまま共有';

  @override
  String get sharePackLinkTitle => 'パックのリンク';

  @override
  String sharePackLinkHelp(String date) {
    return 'Casamaにサインインしている人なら誰でも$dateまで開けます。';
  }

  @override
  String get sharePackShare => '共有';

  @override
  String get sharePackSaveFile => 'ファイルとして保存';

  @override
  String get sharePackLinkCopied => 'リンクをコピーしました。';

  @override
  String get sharePackStop => '共有を停止';

  @override
  String get sharePackStopped => 'このリンクは無効になりました。';

  @override
  String pluginFromPack(String pack) {
    return '$packパックより';
  }

  @override
  String get pluginFromPackHelp =>
      'ギャラリー → インストール済みパックからパックと一緒にアップデートまたは削除できます。';

  @override
  String get pluginSettings => '設定';

  @override
  String get pluginEditSettings => '設定を編集';

  @override
  String get pluginSettingsSaved => '設定を保存しました。';

  @override
  String get galleryPolicyKeyHelp =>
      'リポジトリ（repo/owner:name）またはパック（pack/name）を直接入力することもできます。';

  @override
  String galleryPolicyUseKey(String key) {
    return '$keyを追加';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'パック：$name';
  }

  @override
  String get reportPackShare => 'このパックを報告';

  @override
  String get appLock => 'アプリロック';

  @override
  String get appLockRow => '開くときにCasamaのロック解除を求める';

  @override
  String get appLockHelp =>
      'Casamaを開くときや一定時間離れたあとにロック解除を求めます。オンの間、サインイン情報はこのデバイスのキーチェーンに保存されます。';

  @override
  String get appLockSwitch => 'Casamaをロック';

  @override
  String get appLockLocked => 'Casamaはロックされています';

  @override
  String get appLockUnlock => 'ロック解除';

  @override
  String get appLockUnlockWithPasskey => 'パスキーでロック解除';

  @override
  String get appLockUnlockReason => 'Casamaのロック解除';

  @override
  String get appLockTurnOnReason => 'アプリロックをオンにする';

  @override
  String get appLockConfirmReason => '本人確認';

  @override
  String get appLockConfirmTitle => '本人確認';

  @override
  String get approvalConfirmTitle => 'これを許可しますか？';

  @override
  String get approvalConfirmBody => 'これは高リスクなリクエストです。ボットの続行を許可しますか？';

  @override
  String get approvalConfirmAllow => '許可';

  @override
  String appLockUnlockWith(String method) {
    return '$methodを使用してください。';
  }

  @override
  String get appLockDeviceIos => 'Face ID、Touch ID、またはパスコード';

  @override
  String get appLockDeviceAndroid => '指紋、顔認証、または画面ロック';

  @override
  String get appLockDeviceMac => 'Touch IDまたはMacのパスワード';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'デバイスの画面ロック';

  @override
  String appLockMethodDevice(String method) {
    return '$methodでロック解除';
  }

  @override
  String get appLockMethodPin => '6桁のPINでロック解除';

  @override
  String get appLockMethodPasskey => 'パスキーでロック解除';

  @override
  String get appLockPinHint => 'PINを入力';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PINが違います。あと$count回試せます。',
      one: 'PINが違います。あと1回試せます。',
      zero: 'PINが違います。',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'PINの入力間違いが多すぎます。Casamaを開くにはサインアウトしてからもう一度サインインしてください。';

  @override
  String get appLockFailed => 'うまくいきませんでした。もう一度お試しください。';

  @override
  String get appLockUnavailable =>
      '現在このデバイスでCasamaのロックを解除できません。戻るにはサインアウトしてからもう一度サインインしてください。';

  @override
  String get appLockSignOutConfirm =>
      'サインアウトすると、このデバイスのアプリロックがオフになります。Casamaを開くにはもう一度サインインしてください。';

  @override
  String get appLockCallRinging => '着信中です。応答するにはロックを解除してください。';

  @override
  String get appLockRequiredTitle => 'アプリロックをオンにする';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspaceではCasamaを開くすべてのデバイスでアプリロックが必要です。';
  }

  @override
  String get appLockRequiredNoWay =>
      'このブラウザーはこのサーバーでパスキーを使えないため、Casamaをロックできません。スマートフォンまたはコンピューターのアプリでCasamaを開いてください。';

  @override
  String appLockRequiredBy(String workspace) {
    return 'オン（$workspaceで必須）';
  }

  @override
  String get appLockTurnOn => 'オンにする';

  @override
  String get appLockTurnedOn => 'アプリロックがオンです';

  @override
  String get appLockNoWayHere =>
      'このブラウザーはこのサーバーでパスキーを使えないため、ここではCasamaをロックできません。';

  @override
  String get appLockNotChecked => '本人確認できませんでした。';

  @override
  String get appLockPinSetupTitle => 'PINを設定';

  @override
  String get appLockPinAgainTitle => 'PINをもう一度入力';

  @override
  String get appLockPinSetupBody => '6桁の数字です。Casamaを開くときに入力します。';

  @override
  String get appLockPinNext => '続ける';

  @override
  String get appLockPinMismatch => 'PINが一致しませんでした。もう一度設定してください。';

  @override
  String get appLockPinNotSaved => 'このデバイスにPINを保存できませんでした。';

  @override
  String get appLockPinChanged => 'PINを変更しました';

  @override
  String get appLockChangePin => 'PINを変更';

  @override
  String get appLockAfter => 'ロックまでの時間';

  @override
  String get appLockAfterHelp => 'バックグラウンド、最小化、またはコンピューター上でほかのアプリの後ろにある時間です。';

  @override
  String get appLockAfterImmediately => 'すぐ';

  @override
  String get appLockAfterOneMinute => '1分';

  @override
  String get appLockAfterFiveMinutes => '5分';

  @override
  String get appLockAfterFifteenMinutes => '15分';

  @override
  String get appLockAfterOneHour => '1時間';

  @override
  String get appLockBlockScreenshots => 'スクリーンショットをブロック';

  @override
  String get appLockBlockScreenshotsHelp =>
      'スクリーンショット、画面収録、画面共有にCasamaの内容が映らなくなります。';

  @override
  String get appLockLockNow => '今すぐロック';

  @override
  String get appLockPrivacySection => 'プライバシー設定';

  @override
  String get appLockAskBeforeRisky => '重要な操作の前に確認する';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'アカウント削除、キー作成、請求設定変更、データエクスポート、高リスクなリクエストの承認、コンピューター操作の交代の前に、もう一度ロック解除を求めます。';

  @override
  String get requireAppLock => 'アプリロックを必須にする';

  @override
  String get requireAppLockHelp =>
      'メンバーはどのデバイスでもCasamaを開く前にロックを設定する必要があります。ウェブではパスキーが必要です。';

  @override
  String get requireAppLockOwnFirst => '先にこのデバイスでアプリロックをオンにしてください。';

  @override
  String get permLocation => '位置情報';

  @override
  String get permLocationAlways => 'バックグラウンドでの位置情報';

  @override
  String get permCamera => 'カメラ';

  @override
  String get permMicrophone => 'マイク';

  @override
  String get permSpeech => '音声認識';

  @override
  String get permPhotos => '写真';

  @override
  String get permContacts => '連絡先';

  @override
  String get permCalendar => 'カレンダー';

  @override
  String get permHealth => 'ヘルスケア';

  @override
  String get permNotifications => '通知';

  @override
  String get permNotificationAccess => '通知へのアクセス';

  @override
  String get permAccessibility => 'アクセシビリティ';

  @override
  String get permScreenRecording => '画面収録';

  @override
  String get permAutomation => 'オートメーション';

  @override
  String get permFullDisk => 'フルディスクアクセス';

  @override
  String get permSharedFolders => '共有フォルダー';

  @override
  String get permLocalTools => 'ローカルツール';

  @override
  String get cardPermissions => '権限';

  @override
  String permissionsTitle(String device) {
    return '$deviceでこれらをオンにする';
  }

  @override
  String get permStateOn => 'オン';

  @override
  String get permStateOff => 'オフ';

  @override
  String get permStateNotAsked => '未リクエスト';

  @override
  String get permStateLimited => '制限付き';

  @override
  String get permStateUnknown => '不明';

  @override
  String get permStateUnavailable => 'このデバイスでは利用できません';

  @override
  String get permStateUpdate => 'ここでオンにするにはCasamaをアップデートしてください';

  @override
  String get permTurnOn => 'オンにする';

  @override
  String get permOpenSettings => '設定を開く';

  @override
  String get permOpenHealth => 'ヘルスケアを開く';

  @override
  String get permHealthIosHow =>
      '「ヘルスケア」で自分の写真をタップし、「App」→「Casama」の順に選んで、ボットに読み取りを許可する項目をオンにしてください。';

  @override
  String get permChoose => '選択';

  @override
  String get permRestart => 'Casamaを再起動';

  @override
  String get permRestartToFinish => '完了するにはCasamaを再起動してください';

  @override
  String permOpenedOn(String device) {
    return '$deviceで開きました';
  }

  @override
  String permSentTo(String device) {
    return '$deviceに送信しました：そちらの通知をタップしてください';
  }

  @override
  String permOffline(String device) {
    return '$deviceはオフラインです';
  }

  @override
  String permRestarting(String device) {
    return '$deviceでCasamaを再起動中';
  }

  @override
  String permOnlyOwner(String device) {
    return 'これらをオンにできるのは$deviceの所有者だけです';
  }

  @override
  String get permNotNowLine => '今はしない';

  @override
  String get permContinue => '続ける';

  @override
  String get permContinueMessage => 'オンにしました。進めてください。';

  @override
  String get permContinuedLine => 'オンにしました';

  @override
  String get permissionsScreenTitle => '権限';

  @override
  String get permissionsScreenHelp => 'ボットがこのデバイスで使える機能です。タップするまで許可は求められません。';

  @override
  String get permissionsRowHelp => 'このデバイス上の位置情報、画面、マイクなど';

  @override
  String permOtherDevice(String device) {
    return 'これは$device向けです。オンにするにはそちらでCasamaを開いてください。';
  }

  @override
  String get permAnotherDevice => '別のデバイス';

  @override
  String get permissionsNone => 'このデバイスでオンにする項目はありません。';

  @override
  String get widgetNeedsYou => '確認待ち';

  @override
  String get widgetAllClear => 'すべて完了';

  @override
  String get widgetAllow => '許可';

  @override
  String get widgetDeny => '拒否';

  @override
  String get widgetReview => '確認';

  @override
  String get widgetOpen => '開く';

  @override
  String get widgetDoIt => '実行';

  @override
  String get widgetRunNow => '今すぐ実行';

  @override
  String get widgetStarted => '開始済み';

  @override
  String get widgetStop => '停止';

  @override
  String get widgetAsk => '質問';

  @override
  String widgetAskBot(String bot) {
    return '$botに質問';
  }

  @override
  String get widgetTalk => '話す';

  @override
  String get widgetTry => '試す';

  @override
  String get widgetUpNext => '次の予定';

  @override
  String get widgetNoRoutines => 'ルーティンはまだありません';

  @override
  String get widgetWorking => '作業中';

  @override
  String get widgetWaiting => '返信待ち';

  @override
  String get widgetIdle => '待機中';

  @override
  String widgetRepliedAt(String time) {
    return '$timeに返信';
  }

  @override
  String get widgetBrief => 'ブリーフィング';

  @override
  String widgetBriefAt(String time) {
    return '$timeのブリーフィング';
  }

  @override
  String get widgetNoBrief => 'まだブリーフィングはありません';

  @override
  String get widgetToday => '今日';

  @override
  String get widgetCredits => 'クレジット';

  @override
  String widgetCreditsLeft(String amount) {
    return '残り$amount';
  }

  @override
  String widgetSpentToday(String amount) {
    return '今日$amount';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n%使用';
  }

  @override
  String widgetResetsAt(String time) {
    return 'リセット：$time';
  }

  @override
  String get widgetFinished => '完了';

  @override
  String get widgetLibrary => 'ライブラリ';

  @override
  String get widgetNoCreations => '作成したものはまだありません';

  @override
  String get widgetTasks => 'タスク';

  @override
  String get widgetTodo => '未着手';

  @override
  String get widgetInProgress => '進行中';

  @override
  String get widgetInReview => '確認中';

  @override
  String get widgetBlocked => 'ブロック中';

  @override
  String get widgetSignIn => 'Casamaを開いてサインイン';

  @override
  String get widgetNoBots => '最初のボットを作ってみよう';

  @override
  String widgetAsOf(String time) {
    return '$time時点';
  }

  @override
  String get widgetUpdateServer => 'このウィジェットを使うにはCasamaサーバーをアップデートしてください';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$botが確認を求めています';
  }

  @override
  String widgetSuggests(String bot) {
    return '$botからの提案';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$botが操作の交代を求めています';
  }

  @override
  String widgetNextBrief(String time) {
    return '次のブリーフィング：$time';
  }

  @override
  String get widgetNothingNext => '予定はありません';

  @override
  String get widgetsTitle => 'ウィジェット';

  @override
  String get widgetsRow => 'ホーム画面やロック画面にボットを表示';

  @override
  String get widgetsIntro =>
      'ウィジェットを使えば、Casamaを開かずにボットの作業状況やあなたへの確認待ちをチェックできます。';

  @override
  String get widgetNameBot => 'ボット';

  @override
  String get widgetNameRoutines => 'ルーティン';

  @override
  String get widgetDescNeedsYou => '確認待ちのボットを見る';

  @override
  String get widgetDescBot => '1体のボットの作業状況を見る';

  @override
  String get widgetDescAsk => 'ワンタップでボットに質問や通話';

  @override
  String get widgetDescRoutines => '次の予定を見てすぐ実行する';

  @override
  String get widgetDescToday => '大きなウィジェット1つで今日の予定全体を見る';

  @override
  String get widgetDescBrief => '朝のブリーフィングを読む';

  @override
  String get widgetDescLibrary => 'ボットが最近作ったものを見る';

  @override
  String get widgetDescTasks => 'タスクボードの状況を見る';

  @override
  String get widgetDescCredits => 'クレジット残量をチェックする';

  @override
  String get widgetsAddToHome => 'ホーム画面に追加';

  @override
  String get widgetsPinUnsupported =>
      'このランチャーからはウィジェットを追加できません。ホーム画面の何もない場所を長押しし、「ウィジェット」をタップしてCasamaを選んでください。';

  @override
  String get widgetsHowToAdd => '追加方法';

  @override
  String get widgetsHowToIos =>
      'ホーム画面の何もない場所を長押しし、「編集」→「ウィジェットを追加」の順にタップしてCasamaを選んでください。';

  @override
  String get widgetsHowToMac =>
      'メニューバーの日時をクリックし、「ウィジェットを編集」からCasamaを選んでください。またはデスクトップを右クリックして「ウィジェットを編集」を選びます。';

  @override
  String get widgetsLockScreen => 'ロック画面とコントロール';

  @override
  String get widgetsLockScreenHelp =>
      'ロック画面を長押しして「カスタマイズ」→「ロック画面」をタップし、時計の下のスペースをタップして「確認待ち」「次の予定」「ボット」「クレジット」を追加します。ロック解除までリクエスト内容は非表示になります。';

  @override
  String get widgetsControlsHelp =>
      'コントロールセンターを開いて長押しし、「コントロールを追加」をタップして「Casamaに質問」「ボットと話す」「ルーティンを実行」を選びます。ロック画面のコーナーやアクションボタンにも設定できます。';

  @override
  String get widgetsShowDetails => 'ウィジェットに詳細を表示';

  @override
  String get widgetsShowDetailsHelp =>
      'アプリロックがオンのとき、ウィジェットには件数とボット名のみが表示され、ボタンからCasamaを開きます。リクエストやメッセージ、ルーティン名も表示するにはオンにしてください。';

  @override
  String get widgetsShowDetailsNoLock =>
      'アプリロックがオンのときのみ適用されます。オフの場合は詳細が表示されます。';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspaceではアプリロックが必須のため、ウィジェットの詳細は非表示になります。';
  }

  @override
  String get widgetsPinBot => 'ボットをホーム画面にピン留め';

  @override
  String get widgetsPinBotHelp => 'ボット専用のアイコンをホーム画面に置きます。タップするとチャットが開きます。';

  @override
  String get widgetsPin => 'ピン留め';

  @override
  String get widgetNudgeNeedsYou => '「確認待ち」ウィジェットからホーム画面でリクエストに応答できます。';

  @override
  String get widgetNudgeRoutines => '「ルーティン」ウィジェットからホーム画面でルーティンを実行できます。';

  @override
  String get widgetNameCanvas => 'キャンバス';

  @override
  String get widgetDescCanvas => '毎日のひとことやカウントダウンなど、ボットが置いたものを表示します';

  @override
  String get canvasEmpty => 'ボットに何か表示するよう頼んでみよう';

  @override
  String get canvasTry => '例：ロック画面に毎日の名言を表示して';

  @override
  String get canvasAutomatic => '自動';

  @override
  String canvasIn(String time) {
    return 'あと$time';
  }

  @override
  String canvasSince(String time) {
    return '$time経過';
  }

  @override
  String get canvasNow => '今';

  @override
  String canvasLeft(String n) {
    return '残り$n';
  }

  @override
  String get canvasLeftUnit => '残り';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '日',
      one: '日',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'ウィジェット';

  @override
  String canvasPreviewAsk(String bot) {
    return '$botがウィジェットにこれを表示しようとしています';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return '一度「はい」と答えると、$botは確認なしで内容を更新できるようになります。設定の「ウィジェット」からいつでも停止できます。';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$botがウィジェットに表示しました';
  }

  @override
  String get canvasShow => 'ウィジェットに表示';

  @override
  String get canvasShowing => 'ウィジェットに表示中';

  @override
  String canvasNotShown(String bot) {
    return '表示しませんでした。$botはまた別の日に改めて提案できます。';
  }

  @override
  String get canvasGone => 'ウィジェットには表示されなくなりました';

  @override
  String get canvasNotPlaced => '表示するにはキャンバスウィジェットを追加してください。';

  @override
  String get canvasHowToIos =>
      'ホーム画面またはロック画面を長押しし、「編集」→「ウィジェットを追加」をタップしてCasamaから「キャンバス」を選んでください。';

  @override
  String get canvasHowToMac =>
      'デスクトップを右クリックし、「ウィジェットを編集」からCasamaの「キャンバス」を選んでください。';

  @override
  String get canvasHowToElsewhere =>
      '表示するにはスマートフォンまたはMacでCasamaのキャンバスウィジェットを追加してください。';

  @override
  String get canvasAdded => 'キャンバスウィジェットを追加しました';

  @override
  String get canvasLockScreen => 'ロック画面';

  @override
  String get widgetsFromBots => 'ボットから';

  @override
  String get widgetsFromBotsEmpty =>
      'まだ何もありません。ボットに「ロック画面に毎日の名言を表示して」のように頼んでみてください。';

  @override
  String canvasSetAt(String time) {
    return '$timeに設定';
  }

  @override
  String canvasOnDevices(String devices) {
    return '$devicesに表示中';
  }

  @override
  String get canvasNoWidget => 'キャンバスウィジェットがまだ配置されていません';

  @override
  String get canvasPausedLine => '一時停止中';

  @override
  String get canvasWaitingLine => 'あなたの承認待ち';

  @override
  String get canvasHideLocked => 'ロック中の画面では隠す';

  @override
  String get canvasPause => '一時停止';

  @override
  String get canvasResume => '再開';

  @override
  String get canvasClear => '消去';

  @override
  String canvasClearTitle(String name) {
    return '$nameを消去しますか？';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'ウィジェットから消去されます。$botは再び何かを表示できます。';
  }

  @override
  String get canvasAllowedBots => 'ウィジェットを使うボット';

  @override
  String get canvasMayShow => 'ウィジェットに表示できます';

  @override
  String canvasStopTitle(String bot) {
    return '$botを停止しますか？';
  }

  @override
  String canvasStopMessage(String bot) {
    return '$botがウィジェットに表示している内容は消去され、再表示には確認が必要になります。';
  }

  @override
  String get canvasStop => '停止';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Androidスマートフォン';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => '表示する';

  @override
  String get widgetLowRisk => '低リスク';

  @override
  String get widgetThisMonth => '今月';

  @override
  String get watchNow => '今';

  @override
  String get watchAsk => '質問';

  @override
  String watchAskBot(String bot) {
    return '$botに質問';
  }

  @override
  String get watchBots => 'ボット';

  @override
  String get watchUpNext => '次の予定';

  @override
  String get watchBrief => 'ブリーフィング';

  @override
  String get watchSettings => '設定';

  @override
  String get watchChat => 'チャット';

  @override
  String get watchTalk => '話す';

  @override
  String get watchCredits => 'クレジット';

  @override
  String get watchNeedsYou => '確認待ち';

  @override
  String get watchNeedsYouOne => '1件の確認待ち';

  @override
  String watchNeedsYouMany(String count) {
    return '$count件の確認待ち';
  }

  @override
  String get watchNeedsOk => '確認が必要';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$botが確認待ち';
  }

  @override
  String watchSuggests(String bot) {
    return '$botからの提案';
  }

  @override
  String get watchTakeOver => '操作の交代を依頼';

  @override
  String get watchAllClear => 'すべて完了';

  @override
  String get watchNothingWaiting => '確認待ちはありません';

  @override
  String get watchAllow => '許可';

  @override
  String get watchDeny => '拒否';

  @override
  String get watchHoldToAllow => '長押しで許可';

  @override
  String get watchHoldHint => '許可しますか？ダブルタップで許可します。';

  @override
  String get watchReview => '確認';

  @override
  String get watchReviewOnIphone => 'iPhoneで確認';

  @override
  String get watchReviewOnPhone => 'スマートフォンで確認';

  @override
  String get watchWhyHighRisk => '高リスク：スマートフォンで応答してください';

  @override
  String get watchWhyPayment => '支払いはスマートフォンで応答します';

  @override
  String get watchWhySetting => '設定によりスマートフォンでの応答が必要です';

  @override
  String get watchWhyWorkspace => 'ワークスペースの設定によりスマートフォンでの応答が必要です';

  @override
  String get watchWhyNotYours => 'このチャットを始めた人だけが許可できます';

  @override
  String get watchHighRisk => '高リスク';

  @override
  String get watchMediumRisk => '中リスク';

  @override
  String get watchLowRisk => '低リスク';

  @override
  String get watchAllowed => '許可済み';

  @override
  String get watchDenied => '拒否済み';

  @override
  String get watchDone => '完了';

  @override
  String get watchAlreadyAnswered => '応答済み';

  @override
  String get watchLockToAllow => 'ウォッチから許可するにはパスコードを設定してください';

  @override
  String get watchDoIt => '実行';

  @override
  String get watchNotNow => '今はしない';

  @override
  String get watchOpenOnIphone => 'iPhoneで開く';

  @override
  String get watchOpenOnPhone => 'スマートフォンで開く';

  @override
  String get watchSentToPhone => 'スマートフォンに送信済み';

  @override
  String get watchWorking => '作業中';

  @override
  String watchIsWorking(String bot) {
    return '$botが作業中';
  }

  @override
  String get watchWaitingForYou => '返信待ち';

  @override
  String watchRepliedAt(String time) {
    return '$timeに返信';
  }

  @override
  String get watchIdle => '待機中';

  @override
  String get watchOff => 'オフ';

  @override
  String watchStepCount(String count) {
    return 'ステップ$count';
  }

  @override
  String get watchStop => '停止';

  @override
  String get watchStopped => '停止しました';

  @override
  String get watchFinished => '完了';

  @override
  String get watchProblem => '問題で停止';

  @override
  String get watchCouldntFinish => '完了できませんでした';

  @override
  String get watchListening => '聞き取り中…';

  @override
  String get watchTapToStop => 'タップして停止';

  @override
  String get watchTypeInstead => '文字で入力';

  @override
  String get watchSending => '送信中…';

  @override
  String get watchHeard => '聞き取り済み';

  @override
  String get watchUndo => '取り消す';

  @override
  String get watchKeptOffline => '保存しました。オンラインに戻ると送信されます';

  @override
  String watchKeptOld(String time) {
    return '$timeの質問を送信しますか？';
  }

  @override
  String get watchSend => '送信';

  @override
  String get watchDiscard => '破棄';

  @override
  String get watchMicDenied => '音声で質問するには設定でマイクを許可してください';

  @override
  String get watchNoDictation => 'このサーバーには音声機能がありません。文字で入力してください';

  @override
  String get watchDidntCatch => '聞き取れませんでした。もう一度お試しください';

  @override
  String get watchReply => '返信';

  @override
  String get watchReadAloud => '読み上げる';

  @override
  String get watchStopReading => '読み上げを停止';

  @override
  String get watchContinuesOnIphone => 'iPhoneで続ける';

  @override
  String get watchContinuesOnPhone => 'スマートフォンで続ける';

  @override
  String get watchReplyReady => '返信準備完了';

  @override
  String get watchYou => 'あなた';

  @override
  String get watchQuickYes => 'はい';

  @override
  String get watchQuickNo => 'いいえ';

  @override
  String get watchQuickTellMore => '詳しく教えて';

  @override
  String get watchQuickNotNow => '今はしない';

  @override
  String get watchRunNow => '今すぐ実行';

  @override
  String get watchStarted => '開始済み';

  @override
  String watchInMinutes(String minutes) {
    return 'あと$minutes分';
  }

  @override
  String get watchNoRoutines => 'ルーティンはまだありません';

  @override
  String watchBriefAt(String time) {
    return '$timeのブリーフィング';
  }

  @override
  String watchBriefTomorrow(String time) {
    return '明日の$timeにブリーフィング';
  }

  @override
  String get watchNoBrief => 'ブリーフィング未設定';

  @override
  String get watchNoBots => 'ボットがまだいません。スマートフォンで作成してください';

  @override
  String get watchSigningIn => 'サインイン中';

  @override
  String watchSignedInAs(String name) {
    return '$nameとしてサインイン中';
  }

  @override
  String get watchOpenPhoneToFinishIphone => 'iPhoneでCasamaを開いて完了してください';

  @override
  String get watchOpenPhoneToFinish => 'スマートフォンでCasamaを開いて完了してください';

  @override
  String get watchUseCode => 'コードでサインイン';

  @override
  String get watchCodeHelp => 'スマートフォンやコンピューターのCasamaで入力：設定 → ウォッチ';

  @override
  String get watchNewCode => '新しいコード';

  @override
  String get watchSignedOut => 'このウォッチはサインアウト中です';

  @override
  String get watchOpenToSignIn => 'Casamaを開いてサインイン';

  @override
  String watchAsOf(String time) {
    return '$time時点';
  }

  @override
  String get watchOffline => 'オフライン';

  @override
  String get watchCouldntReach => 'Casamaに接続できません';

  @override
  String get watchTryAgain => '再試行';

  @override
  String get watchServerTooOld => 'ウォッチを使うにはCasamaサーバーをアップデートしてください';

  @override
  String get watchOutOfCredits => 'クレジット不足';

  @override
  String get watchTalkOnPhone => 'スマートフォンで通話を開始しています';

  @override
  String get watchSignOut => 'このウォッチからサインアウト';

  @override
  String get watchHideDetails => '手首を下げたら詳細を隠す';

  @override
  String get watchReadRepliesAloud => '返信を読み上げる';

  @override
  String get watchAskUses => '「質問」のボット';

  @override
  String get watchWorkspace => 'ワークスペース';

  @override
  String get watchSignedInAsLabel => 'サインイン中のアカウント';

  @override
  String get watchCompNeedsYou => '確認待ち';

  @override
  String get watchCompAsk => 'ボットに質問';

  @override
  String get watchCompBot => 'ボット';

  @override
  String get watchCompUpNext => '次の予定';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou => '待機中のリクエスト数と最初の1件';

  @override
  String get watchCompDescAsk => 'ワンタップで音声によりボットへ質問';

  @override
  String get watchCompDescBot => 'ボットの状況と作業内容';

  @override
  String get watchCompDescUpNext => '次のルーティンと実行時刻';

  @override
  String get watchCompDescCredits => '今期の使用クレジット';

  @override
  String get watchNeedYouShort => '確認待ち';

  @override
  String get watchControlAsk => 'Casamaに質問';

  @override
  String get watchControlTalk => 'ボットと話す';

  @override
  String get watchControlRun => 'ルーティンを実行';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count件の確認待ち。最初：$text';
  }

  @override
  String get watchPhoneTitle => 'ウォッチ';

  @override
  String get watchPhoneIntro => '手首からボットへ応答したり、音声で質問したり、作業状況を見たりできます。';

  @override
  String get watchPhoneWatches => 'サインイン済みのウォッチ';

  @override
  String get watchPhoneNone =>
      'まだサインイン済みのウォッチはありません。ウォッチでCasamaを開くと自動でサインインします。';

  @override
  String watchPhoneLastUsed(String time) {
    return '最終使用：$time';
  }

  @override
  String get watchPhoneNeverUsed => '未使用';

  @override
  String get watchPhoneRemove => '削除';

  @override
  String watchPhoneRemoveTitle(String name) {
    return '$nameを削除しますか？';
  }

  @override
  String get watchPhoneRemoveBody => 'すぐにサインアウトします。あとでまたサインインできます。';

  @override
  String get watchPhoneUseCode => 'コードでウォッチにサインイン';

  @override
  String get watchPhoneCodeHint => 'ウォッチ上のコード';

  @override
  String watchPhoneCodeAsk(String name) {
    return '$nameにサインインしますか？';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'あなたとして$workspaceにサインインします。自分のウォッチに表示されたコードだけを許可してください。';
  }

  @override
  String get watchPhoneCodeAllow => 'サインインする';

  @override
  String get watchPhoneCodeWrong => 'コードが一致しませんでした。ウォッチの表示を確認してください';

  @override
  String get watchPhoneCodeTaken =>
      'このウォッチはまだ別のアカウントにサインインしています。そちらの設定 → ウォッチから削除してから新しいコードを取得してください';

  @override
  String watchPhoneElsewhere(String workspace) {
    return '$workspaceにサインイン済み';
  }

  @override
  String get watchPhoneElsewhereUnknown => '別のワークスペースにサインイン済み';

  @override
  String watchPhoneSignedIn(String name) {
    return '$nameがサインインしました';
  }

  @override
  String get watchPhoneAllowTitle => 'ウォッチからの許可';

  @override
  String get watchPhoneAllowMedium => '低リスクと中リスク';

  @override
  String get watchPhoneAllowMediumBody =>
      '低リスクはワンタップ、中リスクは長押し。高リスクと支払いは常にスマートフォンが必要です。';

  @override
  String get watchPhoneAllowLow => '低リスクのみ';

  @override
  String get watchPhoneAllowNone => '許可しない';

  @override
  String get watchPhoneDetails => 'ウォッチに詳細を表示';

  @override
  String get watchPhoneDetailsBody => 'オフ：件数とボット名のみ表示し、ボットのメッセージ内容は表示しません。';

  @override
  String get watchPhoneQuickReplies => 'クイック返信';

  @override
  String get watchPhoneQuickRepliesBody => '返信通知から送れる短い返答です。最大6件まで設定できます。';

  @override
  String get watchPhoneQuickAdd => 'クイック返信を追加';

  @override
  String get watchPhoneQuickReset => '標準の返信を使う';

  @override
  String get watchPhoneHowTo => '文字盤にCasamaを追加';

  @override
  String get watchPhoneHowToApple =>
      '文字盤を長押しして「編集」をタップし、コンプリケーションにCasamaを選びます。文字盤上でDigital Crownを回すとスマートスタック内のCasamaを見つけられます。';

  @override
  String get watchPhoneHowToWear =>
      '文字盤を長押ししてCasamaのコンプリケーションを追加します。文字盤から左にスワイプして「+」をタップするとCasamaのタイルを追加できます。';

  @override
  String watchPhoneSigningInBanner(String name) {
    return '$nameにサインイン中…';
  }

  @override
  String get watchPhoneLockAsk => 'ウォッチにサインインしますか？';

  @override
  String get watchPhoneNudge => 'Casamaはウォッチでも使えます。手首からボットに応答できます。';

  @override
  String get watchPhoneHandoffTitle => 'ウォッチから';

  @override
  String get watchPhoneRow => 'Apple WatchまたはWear OSウォッチでボットを利用';

  @override
  String get watchPhoneAllowLowBody => '低リスクはワンタップで応答。それ以外はスマートフォンが必要です。';

  @override
  String get watchPhoneAllowNoneBody => 'ウォッチからは拒否のみ可能です。許可はスマートフォンで行ってください。';

  @override
  String get watchPhoneDetailsLockOff =>
      'アプリロックがオンのためオフになっており、ウォッチにチャットの内容は表示されません。表示するにはオンにしてください。';

  @override
  String get watchPhoneQuickHint => '短い返信';

  @override
  String get watchPhoneQuickTooLong => '40文字まで';

  @override
  String get watchPhoneQuickMoveUp => '上へ移動';

  @override
  String get watchPhoneQuickMoveDown => '下へ移動';

  @override
  String get watchPhoneQuickDelete => 'この返信を削除';

  @override
  String get watchPhoneCodeBody => 'ウォッチでCasamaを開き、「コードでサインイン」を選びます。';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking => '誰が作業中で何をしているか';

  @override
  String get watchCompDescBrief => '今朝のブリーフィング';

  @override
  String get watchCodeWaiting => 'コードを待っています…';

  @override
  String watchCodeA11y(String code) {
    return 'サインインコード：$code';
  }

  @override
  String get watchChooseBot => 'ボットを選択';

  @override
  String get watchChannelRequests => 'リクエスト';

  @override
  String get watchChannelReplies => '返信';

  @override
  String get watchChannelRuns => '作業中のボット';

  @override
  String get watchChannelOther => 'その他';

  @override
  String get watchOtherWorkspace => '別のワークスペースのリクエストです。スマートフォンで応答してください';

  @override
  String get watchReplySent => '送信済み';

  @override
  String get watchReplyNotSent => '返信を送信できませんでした';

  @override
  String watchAskDropped(String time) {
    return '$timeの質問を送信できませんでした';
  }

  @override
  String get watchNeedsHttps => 'このウォッチはhttpsまたは自宅ネットワーク経由でのみサーバーに接続できます';

  @override
  String get watchSignIn => 'サインイン';

  @override
  String get watchNotOnWatch => 'このリクエストにはウォッチから応答できません。スマートフォンで開いてください';

  @override
  String watchMoreOnPhone(String count) {
    return 'スマートフォンにほか$count件';
  }

  @override
  String get watchShareCrashReports => 'クラッシュレポートを共有';

  @override
  String get showList => '一覧を表示';

  @override
  String get hideList => '一覧を隠す';

  @override
  String get panePickLibrary => 'ライブラリから項目を選ぶとここに表示されます。';

  @override
  String get panePickSetting => '設定項目を選ぶとここに表示されます。';

  @override
  String get trackpad => 'トラックパッド';

  @override
  String get trackpadHint => '1本指でポインター移動、2本指でスクロール、タップでクリックします。';

  @override
  String get trackpadTakeControl => 'トラックパッドを使うには操作を代わってください。';

  @override
  String get foldScreenTitle => '折りたたみ画面';

  @override
  String get foldRowHelp => 'Casamaが認識しているこのデバイスの画面状態';

  @override
  String get foldScreenHelp =>
      '現在Casamaが認識しているデバイスの持ち方と折り目の位置です。デバイスを開閉したり折りたたんだりすると数値が追従します。画面表示がおかしいときはコピーしてください。';

  @override
  String get foldPose => '折りたたみ状態';

  @override
  String get foldWindow => 'ウィンドウ';

  @override
  String get foldInsets => 'セーフエリア';

  @override
  String get foldStrip => 'サイドストリップ';

  @override
  String get foldFold => '折り目';

  @override
  String get foldHinge => 'ヒンジ';

  @override
  String get foldSystemSays => 'システムからの報告内容';

  @override
  String get inviteGateLine => '現在Casama Cloudは招待制です。';

  @override
  String get inviteGateSelfHost => '自分のサーバーでCasamaを動かすことは、誰でもできます。';

  @override
  String get joinTheWaitlist => '順番待ちに登録';

  @override
  String get iHaveAnInvite => '招待コードを持っている';

  @override
  String get waitlistSubtitle => '少しずつ順番にご案内しています。順番が来たらメールを1通お送りします。';

  @override
  String get waitlistNote => '最初にボットに何を任せたいですか？';

  @override
  String get waitlistNoteHint => '任意';

  @override
  String get waitlistSelfHosting => '自分のサーバーでCasamaを動かしています';

  @override
  String get waitlistNewsletter => 'Casamaの月刊メールも受け取る（多くても月1回）';

  @override
  String get waitlistAppleRelay =>
      'これはAppleが作成した非公開メールアドレスです。Appleでサインインする場合はこのままにしてください。Appleがあなたの受信トレイへメールを転送します。';

  @override
  String get waitlistJoinedTitle => '登録が完了しました。';

  @override
  String get waitlistJoinedBody =>
      '少しずつ順番にご案内しています。順番が来たらメールを1通お送りします。月刊メールを希望されない限り、それ以外のメールは送りません。すでにCasamaを使っているお知り合いがいれば、招待を受けてすぐに始められます。';

  @override
  String get waitlistJoinedCode => '招待コードをお持ちですか？ここに入力してください。';

  @override
  String get waitlistJoinedSelfHost =>
      '待たずに使いたい場合：Casamaはオープンソースです。今すぐ自分のコンピューターで動かせます。';

  @override
  String get waitlistRunItYourself => '自分で動かす';

  @override
  String get inviteSubtitle => '招待コードを入力するか、招待リンクを貼り付けてください。';

  @override
  String get inviteCodeLabel => '招待コード';

  @override
  String get inviteNotFound => 'そのコードに一致する招待がありません。確認してもう一度お試しください。';

  @override
  String inviteFromName(String name) {
    return '$nameさんからCasamaへの招待';
  }

  @override
  String get inviteFromFriend => '友人からCasamaへの招待';

  @override
  String inviteFromCampaign(String label) {
    return 'あなたの招待：$label';
  }

  @override
  String get inviteFromCasama => 'Casamaへの招待';

  @override
  String get inviteChooseSignIn => '次にサインイン方法を選びます。アカウントに使うメールアドレスをご利用ください。';

  @override
  String get inviteGoneHelp =>
      'この招待枠はすべて使われました。メールアドレスを入力すると順番待ちリストの先頭近くに登録されます。';

  @override
  String get inviteEmailHelp => 'このメールアドレスを登録し、サインインリンクをお送りします。';

  @override
  String inviteCheckInbox(String email) {
    return '登録されました。$email宛てのサインインリンクを確認するか、コードを入力してください。';
  }

  @override
  String get inviteWaitlistedTitle => '順番待ちリストに登録されました';

  @override
  String get inviteWaitlisted => 'この招待枠は終了しましたが、優先的に順番待ちに登録されました。';

  @override
  String get inviteUseEmailHere =>
      'このデバイスでは「メールで続ける」を使ってください。AppleとGoogleでの招待利用はiPhone、Mac、Androidアプリで対応しています。';

  @override
  String get inviteDifferentCode => '別のコードを使う';

  @override
  String get inviteRefusedHelp =>
      '順番待ちに登録すると順番が来た際にメールをお送りします。招待コードをお持ちの場合は入力してください。';

  @override
  String get inviteRefusedWaitlisted =>
      '現在Casama Cloudは招待制です。順番が来たらメールでお知らせします。招待コードをお持ちの方は今すぐお使いいただけます。';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '招待残り$count件',
      one: '招待残り1件',
      zero: '残りの招待はありません',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$total件中$used件使用済み。1件につき友人が1つアカウントを作成できます。';
  }

  @override
  String get inviteFriendsInvitesLocked => '最初のチャットを完了すると招待が使えるようになります。';

  @override
  String get inviteWaitingTitle => 'あなたの招待を待っています';

  @override
  String get inviteWaitingUses => '承認するとあなたの招待を1件使用します。';

  @override
  String get inviteWaitingNoneLeft => '招待した友人が最初のチャットを終えると、招待枠が1件戻ります。';

  @override
  String get inviteWaitingLetIn => '参加を許可';

  @override
  String inviteWaitingLetInLabel(String email) {
    return '$emailを招待する';
  }

  @override
  String get inviteWaitingDone => '数分以内に登録案内メールが届きます。';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Casamaの招待（$count件）から1件取っておきました。',
      one: 'Casamaの招待を取っておきました。',
    );
    return '$_temp0現在Casamaは招待制ですが、この招待ですぐに参加できます：$link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Casamaの招待（$count件）から1件取っておきました。',
      one: 'Casamaの招待を取っておきました。',
    );
    return '$_temp0現在Casamaは招待制ですが、この招待ですぐに参加でき、最初のチャット後に$amount分の無料利用枠がもらえます：$link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$nameさん、$text';
  }

  @override
  String get inviteNameTitle => '誰宛てですか？';

  @override
  String get inviteNameHelp =>
      '名前（下の名前）を入れると招待ページで名前に合わせた挨拶が表示されます。空欄でもかまいません。';

  @override
  String get inviteNameHint => '下の名前';

  @override
  String get inviteNameShare => '招待を共有';

  @override
  String get inviteAskTitle => 'ほかに使ってくれそうな人はいますか？';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Casamaへの招待枠が$count件あります。1件につき友人1人をすぐ招待できます。',
      one: 'Casamaへの招待枠が1件あります。友人をすぐ招待できます。',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return '相手の最初のチャットが終わると、お互いに$amount分の無料利用枠がもらえます。';
  }

  @override
  String inviteAskReward(String amount) {
    return '相手の最初のチャットが終わると、$amount分の無料利用枠がもらえます。';
  }

  @override
  String get inviteAskSend => '招待を送る';

  @override
  String get inviteAskNotNow => '今はしない';

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
      other: '保存済みリセット$count件',
      one: '保存済みリセット1件',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return '使用期限：$date';
  }

  @override
  String get savedResetUse => 'リセットを使う';

  @override
  String get savedResetConfirmTitle => 'このリセットを使いますか？';

  @override
  String get savedResetConfirmDaily =>
      '今日の上限を解除してボットが今日また動けるようにします。この操作は取り消せません。';

  @override
  String get savedResetConfirmComputer => '今月のコンピューター利用時間を元に戻します。この操作は取り消せません。';

  @override
  String get savedResetOwnerRequired => '使用できるのはワークスペースのオーナーのみです。';

  @override
  String get savedResetPaused => '現在一時停止中です。あとでもう一度ご確認ください。';

  @override
  String get savedResetPeriodLimit => '今期のリセットはすでに使用済みです。このリセットは次の期間に使えます。';

  @override
  String get savedResetNothingToRefill =>
      'まだ補充する必要はありません。残量が少なくなったときのために取っておきましょう。';

  @override
  String get savedResetNoBillingPeriod => 'プランの準備が完了してから利用できます。';

  @override
  String get savedResetUnavailable => '現在利用できません。';

  @override
  String savedResetDone(String amount) {
    return 'リセットを使用しました：$amountを追加';
  }

  @override
  String get savedResetDoneNoCredits => 'リセット使用済み';

  @override
  String savedResetConfirm(String amount) {
    return '今期に含まれるクレジットの$amountを補充します。この操作は取り消せません。';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => '保存済みリセットを有効にする';

  @override
  String get resetsOffNote => 'オフ：保存済みリセットは誰にも配布されません。';

  @override
  String get resetsDecrease => '減らす';

  @override
  String get resetsIncrease => '増やす';

  @override
  String get resetsSettings => '設定';

  @override
  String get resetsCampaigns => 'キャンペーン';

  @override
  String get resetsStatLive => '実施中';

  @override
  String get resetsStatGiven => '付与済み';

  @override
  String get resetsStatUsed => '使用済み';

  @override
  String get resetsStatRefilled => '補充額';

  @override
  String get resetsFilterActive => '有効';

  @override
  String get resetsFilterEnded => '終了';

  @override
  String get resetsFilterAll => 'すべて';

  @override
  String get resetsStateDraft => '下書き';

  @override
  String get resetsStateScheduled => '予定済み';

  @override
  String get resetsStateLive => '実施中';

  @override
  String get resetsStatePaused => '一時停止';

  @override
  String get resetsStateEnded => '終了';

  @override
  String get resetsStateCancelled => 'キャンセル済み';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '予算$budget中$used使用';
  }

  @override
  String resetsGivenN(String count) {
    return '$count件付与';
  }

  @override
  String resetsUsedN(String count) {
    return '$count件使用';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return '開始：$start・終了：$end';
  }

  @override
  String get resetsToday => '今日';

  @override
  String get resetsTomorrow => '明日';

  @override
  String get resetsYesterday => '昨日';

  @override
  String get resetsAudienceEveryone => 'すべてのワークスペース';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のワークスペース',
      one: '1件のワークスペース',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return '$dateより前に参加';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '過去$days日以内に上限に到達',
      one: '今日上限に到達',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'キャンペーンをキャンセル';

  @override
  String get resetsCancelConfirm => 'このキャンペーンをキャンセルしますか？';

  @override
  String get resetsCancelConfirmBody => '保存済みリセットの配布を停止します。この操作は取り消せません。';

  @override
  String get resetsDeleteConfirm => 'このキャンペーンを削除しますか？';

  @override
  String get resetsDeleteConfirmBody => '下書きが完全に削除されます。';

  @override
  String get resetsNoCampaigns =>
      'まだキャンペーンはありません。複数のワークスペースにまとめて保存済みリセットを配るには新しく作成してください。';

  @override
  String get resetsNoMatches => 'ここにキャンペーンはありません。';

  @override
  String get resetsEditCampaign => 'キャンペーンを編集';

  @override
  String get resetsSectionBasics => '基本設定';

  @override
  String get resetsSectionAudience => '対象';

  @override
  String get resetsSectionTiming => '期間';

  @override
  String get resetsSectionRefill => '補充';

  @override
  String get resetsSectionWhat => 'リセット内容';

  @override
  String get resetsSectionNotify => '通知';

  @override
  String get resetsPreviewLabel => 'ユーザーへの表示';

  @override
  String get resetsMonthly => '月払い';

  @override
  String get resetsYearly => '年払い';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'プラン';

  @override
  String get resetsPlansHint => 'チェックを入れない場合はすべてのプランが対象になります。';

  @override
  String get resetsWorkspacesLabel => 'ワークスペース';

  @override
  String get resetsWorkspacesHint => '空欄の場合はすべてのワークスペースが対象になります。';

  @override
  String get resetsSearchWorkspaces => '名前でワークスペースを検索';

  @override
  String get resetsNoWorkspaceMatch => '一致するワークスペースがありません。';

  @override
  String resetsOnlyWorkspace(String name) {
    return '$nameのみ';
  }

  @override
  String get resetsJoinedBefore => 'この日時より前に参加';

  @override
  String get resetsLimitedDaysLabel => '過去N日以内に上限に到達';

  @override
  String get resetsStartsLabel => '開始日時';

  @override
  String get resetsEndsLabel => '有効期限';

  @override
  String resetsPercentValue(int percent) {
    return '含まれるクレジットの$percent%を補充';
  }

  @override
  String get resetsCapLabel => '1回あたりの上限';

  @override
  String get resetsBudgetLabel => '総予算';

  @override
  String get resetsOptional => '任意';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return '約$count件のワークスペースに到達・クレジット$credits・予想コスト約$cost';
  }

  @override
  String get resetsEstimating => '対象規模を計算中…';

  @override
  String get resetsEstimateNeedsFields => '対象規模を見るには各項目を入力してください。';

  @override
  String get resetsLockedNote =>
      'このキャンペーンは実施中のため、メッセージ、有効期限、予算、リマインダーのみ変更できます。';

  @override
  String get resetsRequired => '必須です。';

  @override
  String get resetsTooLong => '120文字以内で入力してください。';

  @override
  String get resetsDaysInvalid => '1〜365日で入力してください。';

  @override
  String get resetsMoneyInvalid => '0以上の値を入力してください。';

  @override
  String get resetsExpiryBeforeStart => '終了日時は開始日時よりあとにしてください。';

  @override
  String resetsGivenTo(String name) {
    return '$nameに保存済みリセットを付与しました';
  }

  @override
  String get resetsCampaignSaved => 'キャンペーンを保存しました';

  @override
  String get resetsDefaultMessage => 'Casamaからの保存済みリセットです。上限に達したときにお使いください。';

  @override
  String resetsGiveName(String name) {
    return '$name向けの保存済みリセット';
  }

  @override
  String get resetsOneWorkspace => '特定のワークスペース';

  @override
  String get resetsPickWorkspace => '保存済みリセットを見るワークスペースを選んでください。';

  @override
  String get resetsAllHistory => 'すべての履歴';

  @override
  String get resetsAllWorkspaces => 'すべてのワークスペース';

  @override
  String get resetsNoEvents => 'まだ履歴がありません。';

  @override
  String get resetsEventGiven => '保存済みリセットを付与';

  @override
  String get resetsEventUsed => '保存済みリセットを使用';

  @override
  String get resetsEventRevoked => '回収済み';

  @override
  String get resetsEventUndone => '補充を取り消し';

  @override
  String get resetsEventExpired => '未使用のまま期限切れ';

  @override
  String get resetsEventCreated => 'キャンペーン作成';

  @override
  String get resetsEventEdited => 'キャンペーン編集';

  @override
  String get resetsEventStarted => 'キャンペーン開始';

  @override
  String get resetsEventEnded => 'キャンペーン終了';

  @override
  String get resetsEventScheduled => 'キャンペーン予約';

  @override
  String get resetsEventPaused => 'キャンペーン一時停止';

  @override
  String get resetsEventResumed => 'キャンペーン再開';

  @override
  String get resetsEventCancelled => 'キャンペーンキャンセル';

  @override
  String get resetsEventDeleted => 'キャンペーン削除';

  @override
  String get resetsEventSettings => '設定変更';

  @override
  String get resetsRevokeConfirm => 'この保存済みリセットを回収しますか？';

  @override
  String get resetsRevokeConfirmBody => '使用される前にワークスペースから削除されます。';

  @override
  String get resetsUndoConfirm => 'この補充を取り消しますか？';

  @override
  String get resetsUndoConfirmBody => '追加されたクレジットが再び差し引かれます。';

  @override
  String get resetsPerPeriod => '1ワークスペースあたりの期間内使用回数';

  @override
  String get resetsMaxHeld => '保存済みリセットの上限数';

  @override
  String get resetsNotifyOwners => 'インスタンスオーナーに通知';

  @override
  String get resetsNewCampaign => '新規キャンペーン';

  @override
  String get resetsName => '名前';

  @override
  String get resetsMessage => 'ユーザーへのメッセージ';

  @override
  String get resetsPlans => 'プランコード（カンマ区切り、空欄ですべて）';

  @override
  String get resetsWorkspaces => 'ワークスペースID（カンマ区切り、空欄ですべて）';

  @override
  String get resetsBefore => '作成日時の上限（日時、任意）';

  @override
  String get resetsLimitedDays => '過去N日以内に上限到達（任意）';

  @override
  String get resetsStart => '開始（日時）';

  @override
  String get resetsExpiry => '有効期限（日時）';

  @override
  String get resetsPercent => '補充する付属クレジットの割合（%）';

  @override
  String get resetsCap => '1回あたりの最大金額（ドル、任意）';

  @override
  String get resetsBudget => 'クレジット総予算（ドル、任意）';

  @override
  String get resetsDaily => '今日のモデル上限を解除';

  @override
  String get resetsComputer => '今月のコンピューター時間を補充';

  @override
  String get resetsArrival => '付与時に通知';

  @override
  String get resetsReminder => '期限前にリマインド';

  @override
  String get resetsPreviewSave => 'プレビューして保存';

  @override
  String get resetsSchedule => '予約する';

  @override
  String get resetsPause => '一時停止';

  @override
  String get resetsResume => '再開';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ワークスペース$count件。最大補充額：$credits。推定コスト：$cost。',
      one: 'ワークスペース1件。最大補充額：$credits。推定コスト：$cost。',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace => 'ワークスペースID（空欄ですべての履歴）';

  @override
  String get resetsHistory => '履歴を読み込む';

  @override
  String get resetsGive => '保存済みリセットを付与';

  @override
  String get resetsCopyCsv => 'CSVをコピー';

  @override
  String get resetsRevoke => '回収';

  @override
  String get resetsUndo => '未使用の補充を取り消す';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention => '外部サービスに確認が必要です';

  @override
  String get vendorNotSetUp => '未設定';

  @override
  String get vendorCheckNow => '今すぐ確認';

  @override
  String get vendorLimit => '上限またはプリペイド額';

  @override
  String get vendorWarnAt => '警告ライン';

  @override
  String get vendorExpiry => '有効期限';

  @override
  String get vendorHistory => '最近の計測値';

  @override
  String get vendorSave => '保存';

  @override
  String get vendorEnabled => '監視を有効にする';

  @override
  String get vendorUnknown => '不明';

  @override
  String get vendorLow => '残少';

  @override
  String get vendorOut => '枯渇';

  @override
  String get vendorOk => '正常';

  @override
  String get vendorNoReading => 'まだ計測なし';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件要確認',
      one: '1件要確認',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count件正常';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count件未設定';
  }

  @override
  String get vendorNoVendors => '監視対象のサービスはまだありません。';

  @override
  String get vendorCheckAll => 'すべて確認';

  @override
  String vendorCheckingProgress(int done, int total) {
    return '$total件中$done件を確認中';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のサービスを確認しました',
      one: '1件のサービスを確認しました',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件の確認に失敗しました',
      one: '1件の確認に失敗しました',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => '要確認';

  @override
  String get vendorGroupHealthy => '正常';

  @override
  String get vendorGroupIdle => '未設定またはオフ';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'あと$count件表示',
      one: 'あと1件表示',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => '折りたたむ';

  @override
  String get vendorOff => 'オフ';

  @override
  String vendorPillPercent(String status, int percent) {
    return '$status・$percent%';
  }

  @override
  String vendorUsedOf(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String vendorLeft(String amount) {
    return '残り$amount';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return '$amount未満で警告';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'リセット：$when';
  }

  @override
  String vendorRenewsOn(String date) {
    return '更新日：$date';
  }

  @override
  String vendorExpiredOn(String date) {
    return '$dateに期限切れ';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count分後',
      one: '1分後',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count時間後',
      one: '1時間後',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count日後',
      one: '1日後',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return '確認：$when';
  }

  @override
  String get vendorSourceApi => 'サービスからの取得';

  @override
  String get vendorSourceOwnCount => 'Casamaによる集計';

  @override
  String get vendorSourceManual => '手動入力';

  @override
  String vendorReadingError(String error) {
    return '前回の確認に失敗：$error';
  }

  @override
  String get vendorNotSetUpHint => '確認を始めるにはサーバーにキーを追加してください。';

  @override
  String get vendorOffHint => '監視はオフです。';

  @override
  String get vendorPickOne => '詳細を見るサービスを選んでください。';

  @override
  String get vendorSectionStatus => '状態';

  @override
  String get vendorSectionActions => '操作';

  @override
  String get vendorSectionAlerts => 'アラート';

  @override
  String get vendorSectionPlan => 'プラン';

  @override
  String vendorWarnAtValue(int percent) {
    return '使用率$percent%で警告';
  }

  @override
  String get vendorWarnAtHelp => 'ここでメーターが黄色に変わります。';

  @override
  String get vendorPeriod => '期間';

  @override
  String get vendorPeriodNone => '未設定';

  @override
  String get vendorPeriodDay => '日次';

  @override
  String get vendorPeriodMonth => '月次';

  @override
  String get vendorPeriodBilling => '請求期間ごと';

  @override
  String get vendorPeriodPrepaid => 'プリペイド';

  @override
  String get vendorDateNotSet => '未設定';

  @override
  String get vendorClearDate => '日付を消去';

  @override
  String get vendorLimitInvalid => '0より大きい数を入力してください。';

  @override
  String get vendorAmountInvalid => '0以上の数を入力してください。';

  @override
  String get vendorMonthsInvalid => '1〜120か月で入力してください。';

  @override
  String get vendorWarnAtInvalid => '1%〜100%の間で指定してください。';

  @override
  String get vendorSaved => '設定を保存しました';

  @override
  String get vendorCheckDone => '確認しました';

  @override
  String get vendorHistoryEmpty => 'まだ計測結果はありません。';

  @override
  String get vendorCheckFailed => '確認に失敗しました';

  @override
  String get vendorResets => 'リセット日';

  @override
  String get vendorSource => '取得元';

  @override
  String get vendorBilling => '請求と補充';

  @override
  String get vendorBalanceWarning => '残高警告ライン';

  @override
  String get vendorPeriodStart => '期間開始日';

  @override
  String get vendorInvalidSettings => '正の上限値、0〜1の警告値、有効な日付を入力してください。';

  @override
  String get card24hRange => '24時間の値幅';

  @override
  String get card52wRange => '52週の値幅';

  @override
  String get cardAgain => 'もう一度';

  @override
  String get cardAgoSuffix => '前';

  @override
  String get cardAirQuality => '空気質';

  @override
  String get cardAqiAdviceBad => '屋外での長時間の激しい運動は避け、窓を閉めてお過ごしください。';

  @override
  String get cardAqiAdviceGood => '外出に最適な日です。';

  @override
  String get cardAqiAdviceModerate => 'ほとんどの人には問題ありませんが、特に敏感な方は無理を控えてください。';

  @override
  String get cardAqiAdviceSensitive => 'お子様、ご高齢の方、喘息のある方は屋外での長時間の運動を控えてください。';

  @override
  String get cardAqiGood => '良好';

  @override
  String get cardAqiHazardous => '危険';

  @override
  String get cardAqiModerate => '普通';

  @override
  String get cardAqiSensitive => '敏感なグループに悪影響';

  @override
  String get cardAqiUnhealthy => '健康に良くない';

  @override
  String get cardAqiVeryUnhealthy => '非常に不健康';

  @override
  String get cardBaggage => '手荷物';

  @override
  String get cardCalcAmount => '金額';

  @override
  String get cardCalcBill => '請求額';

  @override
  String get cardCalcDiscount => '割引';

  @override
  String get cardCalcDiscountTitle => '割引';

  @override
  String get cardCalcGross => '税込';

  @override
  String get cardCalcGrowth => '増加額';

  @override
  String get cardCalcInterest => '利息';

  @override
  String get cardCalcLoan => 'ローン';

  @override
  String get cardCalcMonthly => '毎月';

  @override
  String get cardCalcMonthlyPayment => '毎月の支払額';

  @override
  String get cardCalcNet => '税抜';

  @override
  String get cardCalcPeople => '人数';

  @override
  String get cardCalcPerPerson => '1人あたり';

  @override
  String get cardCalcPrice => '価格';

  @override
  String get cardCalcPrincipal => '元本';

  @override
  String get cardCalcRate => '年利';

  @override
  String get cardCalcSavings => '貯蓄';

  @override
  String get cardCalcStart => '初期金額';

  @override
  String get cardCalcTax => '税金';

  @override
  String get cardCalcTaxIncluded => '税込';

  @override
  String get cardCalcTaxRate => '税率';

  @override
  String get cardCalcTip => 'チップ';

  @override
  String get cardCalcTipAmount => 'チップ';

  @override
  String get cardCalcTipSplit => 'チップと割り勘';

  @override
  String get cardCalcTotal => '合計';

  @override
  String get cardCalcTotalInterest => '総利息';

  @override
  String get cardCalcTotalPaid => '支払総額';

  @override
  String get cardCalcUnits => '単位を変換';

  @override
  String get cardCalcValue => '値';

  @override
  String get cardCalcVat => '消費税';

  @override
  String get cardCalcYears => '年数';

  @override
  String get cardCalcYouPay => 'お支払い';

  @override
  String get cardCalcYouPutIn => '元手合計';

  @override
  String get cardCalcYouSave => '節約額';

  @override
  String get cardCall => '電話';

  @override
  String get cardCaloriesWord => 'カロリー';

  @override
  String get cardComparison => '比較';

  @override
  String get cardCondClear => '晴れ';

  @override
  String get cardCondCloudy => 'くもり';

  @override
  String get cardCondDrizzle => '霧雨';

  @override
  String get cardCondFog => '霧';

  @override
  String get cardCondHail => 'ひょう';

  @override
  String get cardCondHeavyRain => '大雨';

  @override
  String get cardCondHeavySnow => '大雪';

  @override
  String get cardCondLightRain => '小雨';

  @override
  String get cardCondLightSnow => '小雪';

  @override
  String get cardCondMostlyClear => 'おおむね晴れ';

  @override
  String get cardCondPartlyCloudy => '晴れ時々くもり';

  @override
  String get cardCondRain => '雨';

  @override
  String get cardCondShowers => 'にわか雨';

  @override
  String get cardCondSleet => 'みぞれ';

  @override
  String get cardCondSnow => '雪';

  @override
  String get cardCondThunder => '雷雨';

  @override
  String get cardCons => 'デメリット';

  @override
  String get cardCopied => 'コピー済み';

  @override
  String get cardCopy => 'テキストとしてコピー';

  @override
  String get cardCouldntUpdate => '更新できませんでした';

  @override
  String get cardCurrency => '通貨';

  @override
  String get cardDayLength => '昼の長さ';

  @override
  String get cardDayRange => '当日の値幅';

  @override
  String get cardDays => '日';

  @override
  String get cardDelay => '遅延';

  @override
  String get cardDictionary => '辞書';

  @override
  String get cardEmail => 'メール';

  @override
  String get cardFlightCancelled => '欠航';

  @override
  String get cardFlightDiverted => '目的地変更';

  @override
  String get cardFlightInAir => '飛行中';

  @override
  String get cardFlightIncident => '運行トラブル';

  @override
  String get cardFlightLanded => '着陸済み';

  @override
  String get cardFlightScheduled => '定刻通り';

  @override
  String cardStaysFromNight(String price) {
    return '1泊$price〜';
  }

  @override
  String get cardStaysANight => '1泊あたり';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n泊',
      one: '1泊',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n名',
      one: '1名',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n部屋',
      one: '1部屋',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'おすすめ順';

  @override
  String get cardStaysSortCheapest => '最安値順';

  @override
  String get cardStaysSortTopRated => '高評価順';

  @override
  String get cardStaysSortClosest => '近い順';

  @override
  String get cardStaysFilterFreeCancel => 'キャンセル無料';

  @override
  String get cardStaysFilterBreakfast => '朝食付き';

  @override
  String get cardStaysFilterPayAtHotel => '現地決済';

  @override
  String get cardStaysFilterStars => '4つ星以上';

  @override
  String get cardStaysFilterRated => '評価8以上';

  @override
  String get cardStaysList => 'リスト';

  @override
  String get cardStaysMap => '地図';

  @override
  String get cardStaysEdit => '編集';

  @override
  String cardStaysRating(String value, String max) {
    return '$value / $max';
  }

  @override
  String cardStaysKm(String km) {
    return '中心部から$km km';
  }

  @override
  String cardStaysStars(int n) {
    return '$nつ星';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n泊で$price',
      one: '1泊で$price',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ほか$nサイト',
      one: 'ほか1サイト',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'プランを見る';

  @override
  String get cardStaysView => '表示';

  @override
  String cardStaysShowAll(int n) {
    return '全$n件を表示';
  }

  @override
  String get cardStaysShowFewer => '折りたたむ';

  @override
  String get cardStaysNone => '条件に一致する結果はありません。';

  @override
  String get cardStaysNoMap => '地図上に表示できる場所がありません。';

  @override
  String get cardStaysNoDeals => 'この日程の料金が見つかりません。';

  @override
  String get cardStaysCheck => '予約サイトで料金を確認します。';

  @override
  String cardStaysCompare(int n) {
    return '比較（$n）';
  }

  @override
  String get cardStaysCompareHint => '最大4件まで選んで比較';

  @override
  String get cardStaysComparePick => '比較対象を選択';

  @override
  String get cardStaysCompareTitle => '比較';

  @override
  String get cardStaysRowNight => '1泊の料金';

  @override
  String get cardStaysRowTotal => '合計';

  @override
  String get cardStaysRowRating => '評価';

  @override
  String get cardStaysRowStars => '星ランク';

  @override
  String get cardStaysRowDistance => '距離';

  @override
  String get cardStaysYes => 'あり';

  @override
  String get cardStaysNo => 'なし';

  @override
  String get cardStaysTermFreeCancel => 'キャンセル無料';

  @override
  String get cardStaysTermBreakfast => '朝食付き';

  @override
  String get cardStaysTermNoBreakfast => '朝食なし';

  @override
  String get cardStaysTermPayAtHotel => '現地決済';

  @override
  String get cardStaysTermNonRefundable => '返金不可';

  @override
  String get cardStaysDetailsTitle => '宿泊先';

  @override
  String get cardStaysCheapest => '最安';

  @override
  String get cardStaysAmenities => '設備';

  @override
  String cardStaysCheckIn(String time) {
    return 'チェックイン：$time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'チェックアウト：$time';
  }

  @override
  String get cardStaysNearby => '周辺情報';

  @override
  String get cardStaysHotelSite => 'ホテル公式サイト';

  @override
  String get cardStaysBook => '予約を依頼';

  @override
  String cardStaysBookLabel(String name, String site) {
    return '$siteで$nameを予約';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return '写真$n/$total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place・月別の料金';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return '最安時期：$month、1泊約$price';
  }

  @override
  String get cardStaysTrendNote => '予測値であり、現在の実価格ではありません。';

  @override
  String get cardStaysTrendPick => '日程を選択';

  @override
  String get cardStaysSearchTitle => '宿泊先を探す';

  @override
  String get cardStaysSearchWhere => '場所';

  @override
  String get cardStaysSearchWhereHint => '都市、エリア、ホテル名';

  @override
  String get cardStaysSearchDates => '日程を選択';

  @override
  String get cardStaysSearchAdults => '大人';

  @override
  String get cardStaysSearchRooms => '部屋数';

  @override
  String get cardStaysSearchBudget => '1泊あたりの予算（任意）';

  @override
  String get cardStaysSearchNotNow => '今はしない';

  @override
  String get cardStaysSearchGo => '宿泊先を検索';

  @override
  String get cardStaysSearchSent => '検索中';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return '$whereの宿泊先（$dates）';
  }

  @override
  String cardStaysFewer(String label) {
    return '$labelを減らす';
  }

  @override
  String cardStaysMore(String label) {
    return '$labelを増やす';
  }

  @override
  String get cardStaysAmenityPool => 'プール';

  @override
  String get cardStaysAmenityParking => '駐車場';

  @override
  String get cardStaysAmenityPets => 'ペット可';

  @override
  String get cardStaysAmenityGym => 'ジム';

  @override
  String get cardStaysAmenitySpa => 'スパ';

  @override
  String get cardStaysAmenityKitchen => 'キッチン';

  @override
  String get cardStaysAmenityWifi => 'WiFi';

  @override
  String get cardStaysAmenityAirCon => 'エアコン';

  @override
  String get cardProductsTitle => '購入できる商品';

  @override
  String cardProductsFrom(String price) {
    return '$price〜';
  }

  @override
  String cardProductsUnder(String price) {
    return '$price以下';
  }

  @override
  String get cardProductsSortBest => 'おすすめ順';

  @override
  String get cardProductsSortCheapest => '最安値順';

  @override
  String get cardProductsSortTopRated => '高評価順';

  @override
  String get cardProductsOnSale => 'セール中';

  @override
  String get cardProductsRated => '評価4以上';

  @override
  String cardProductsOff(int pct) {
    return '−$pct%';
  }

  @override
  String get cardProductsOtherStores => 'ほか対象ストア';

  @override
  String cardProductsShowAll(int n) {
    return '全$n件を表示';
  }

  @override
  String get cardProductsShowFewer => '折りたたむ';

  @override
  String get cardProductsShowMore => 'もっと見る';

  @override
  String get cardProductsNone => '条件に一致する商品はありません。';

  @override
  String get cardProductsCheck => '価格はストアで確認します。';

  @override
  String get cardProductsBuy => '購入';

  @override
  String get cardProductsCompareStores => 'ストアを比較';

  @override
  String cardProductsCompareLabel(String title) {
    return '$titleのストアを比較';
  }

  @override
  String get cardProductsBuyForMe => '購入を依頼';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return '$storeで$titleを購入';
  }

  @override
  String get cardProductsRowPrice => '価格';

  @override
  String get cardProductsRowStore => 'ストア';

  @override
  String get cardProductsRowRating => '評価';

  @override
  String get cardProductsRowDelivery => '配送';

  @override
  String cardProductsDelivery(String text) {
    return '配送：$text';
  }

  @override
  String cardProductsBy(String brand) {
    return '$brand';
  }

  @override
  String get cardProductsOffers => 'ストア';

  @override
  String get cardProductsLowest => '最安合計';

  @override
  String cardProductsTotal(String price) {
    return '合計$price';
  }

  @override
  String get cardProductsOutOfStock => '在庫切れ';

  @override
  String get cardProductsFeatures => '詳細';

  @override
  String get cardProductsReviews => '購入者の声';

  @override
  String get cardCheckoutTitle => '支払い前に確認する';

  @override
  String get cardCheckoutTotal => '合計';

  @override
  String cardCheckoutQty(int n) {
    return '×$n';
  }

  @override
  String get cardCheckoutOpen => 'ページを開く';

  @override
  String get cardCheckoutCancel => 'キャンセル';

  @override
  String get cardCheckoutChange => '変更';

  @override
  String get cardCheckoutConfirm => '確定して支払う';

  @override
  String get cardCheckoutCancelLabel => 'キャンセルする';

  @override
  String get cardCheckoutChangeLabel => '内容を変更する';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return '$sellerでの$totalの支払いを確定';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return '$totalの支払いを確定';
  }

  @override
  String get cardCheckoutConfirmed => '確定済み';

  @override
  String get cardCheckoutChanging => '変更中';

  @override
  String get cardCheckoutCancelled => 'キャンセル済み';

  @override
  String get cardBookingTitle => 'あなたの予約';

  @override
  String cardBookingWith(String site) {
    return '$siteで予約';
  }

  @override
  String get cardBookingCheckIn => 'チェックイン';

  @override
  String get cardBookingCheckOut => 'チェックアウト';

  @override
  String get cardBookingConfirmation => '予約確認番号';

  @override
  String get cardBookingCopy => '予約確認番号をコピー';

  @override
  String get cardBookingPaid => '支払い済み';

  @override
  String get cardBookingPayAtHotel => '現地決済';

  @override
  String cardBookingCancelBy(String date) {
    return '$dateまでキャンセル無料';
  }

  @override
  String get cardBookingDirections => '経路';

  @override
  String get cardBookingManage => '予約を管理';

  @override
  String get cardBookingCalendar => 'カレンダーに追加';

  @override
  String cardBookingCalendarLabel(String name) {
    return '$nameをカレンダーに追加';
  }

  @override
  String cardOrderNumber(String id) {
    return '注文番号：$id';
  }

  @override
  String cardOrderPlaced(String date) {
    return '$dateに注文';
  }

  @override
  String get cardOrderStepOrdered => '注文済み';

  @override
  String get cardOrderStepShipped => '発送済み';

  @override
  String get cardOrderStepOut => '配達中';

  @override
  String get cardOrderStepDelivered => '配達完了';

  @override
  String get cardOrderCancelled => 'キャンセル済み';

  @override
  String get cardOrderReturned => '返品済み';

  @override
  String cardOrderArrives(String date) {
    return '$dateにお届け予定';
  }

  @override
  String get cardOrderTracking => '追跡番号';

  @override
  String get cardOrderCopy => '追跡番号をコピー';

  @override
  String get cardOrderTrack => '追跡';

  @override
  String cardOrderTrackLabel(String number) {
    return '$numberを追跡';
  }

  @override
  String get cardOrderPage => '注文ページ';

  @override
  String get cardFaresBest => 'おすすめ順';

  @override
  String get cardFaresCheapest => '最安値順';

  @override
  String get cardFaresFastest => '最短順';

  @override
  String get cardFaresDirectOnly => '直行便のみ';

  @override
  String get cardFaresDirect => '直行便';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '乗継$n回',
      one: '乗継1回',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => '予約';

  @override
  String cardFaresFromPrice(String price) {
    return '$price〜';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '旅行者$n名',
      one: '旅行者1名',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n泊',
      one: '1泊',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'エコノミー';

  @override
  String get cardFaresPremium => 'プレミアムエコノミー';

  @override
  String get cardFaresBusiness => 'ビジネス';

  @override
  String get cardFaresFirst => 'ファースト';

  @override
  String cardFaresTypical(String low, String high) {
    return 'この区間の相場：$low〜$high';
  }

  @override
  String get cardFaresLevelLow => '現在お得です';

  @override
  String get cardFaresLevelTypical => '現在標準的です';

  @override
  String get cardFaresLevelHigh => '現在高めです';

  @override
  String cardFaresShowAll(int n) {
    return '全$n件を表示';
  }

  @override
  String get cardFaresShowFewer => '折りたたむ';

  @override
  String get cardFaresNoDirect => 'この検索では直行便が見つかりませんでした。';

  @override
  String get cardFaresOutboundOnly => '価格は往復合計です。復路便はGoogleフライトで選択します。';

  @override
  String get cardFaresSeeAll => 'Googleフライトですべて見る';

  @override
  String get cardFaresCheck => '価格は旅行者全員分です。予約サイトで再度確認されます。';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '機内持込$cabin個・受託手荷物$checked個';
  }

  @override
  String get cardFaresAffiliate =>
      'これらのリンク経由で予約するとCasamaに紹介料が入る場合がありますが、価格は変わりません。';

  @override
  String cardFaresCompare(String site) {
    return '$siteで比較';
  }

  @override
  String get cardFaresWatch => '価格を監視';

  @override
  String cardFaresWatching(String date) {
    return '監視中・$dateまで';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return '$price以下を監視中・$dateまで';
  }

  @override
  String get cardFaresWatchStop => '停止';

  @override
  String get cardFaresWatchTitle => 'この価格を監視';

  @override
  String get cardFaresWatchBody =>
      'Casamaが1日に数回価格を確認し、値下がりしたら通知します。日付を過ぎるか60日経つと自動で終了します。';

  @override
  String get cardFaresWatchTarget => 'この価格以下になったら通知（任意）';

  @override
  String get cardFaresWatchAnyDrop => '大幅な値下がり全般を通知する場合は空欄にしてください';

  @override
  String get cardFaresWatchStart => '監視する';

  @override
  String get cardFaresWatchStarted => 'この価格の監視を始めました。値下がりすると通知が届きます。';

  @override
  String get cardFaresWatchStopped => 'この価格の監視を停止しました。';

  @override
  String get cardFaresWatchFull => 'すでに10件の価格を監視しています。先に設定 → カードで1件停止してください。';

  @override
  String get cardFaresWatchFailed => '価格監視を変更できませんでした。もう一度お試しください。';

  @override
  String get cardFaresFlagSeparate => '別々のチケット';

  @override
  String get cardFaresFlagOvernight => '夜間の乗り継ぎあり';

  @override
  String get cardFaresFlagAirport => '空港の変更あり';

  @override
  String get cardFaresFlagShort => '乗り継ぎ時間が短い';

  @override
  String get cardFaresFlagLong => '乗り継ぎ時間が長い';

  @override
  String get cardFaresNoteSeparate =>
      '往路または復路で航空会社が異なるため、別々のチケットになる場合があります。乗り遅れた場合、次の便が補償されないことがあります。予約サイトでご確認ください。';

  @override
  String get cardFaresNoteOvernight => '夜をまたぐ乗り継ぎがあります。';

  @override
  String get cardFaresNoteAirport => '乗り継ぎ便が別の空港から出発します。';

  @override
  String get cardFaresNoteShort => '乗り継ぎ時間が1時間未満です。';

  @override
  String get cardFaresNoteLong => '乗り継ぎ時間が8時間を超えます。';

  @override
  String get cardFaresOutbound => '往路';

  @override
  String get cardFaresReturn => '復路';

  @override
  String cardFaresEmissions(int kg) {
    return '旅行者1人あたりCO₂約$kg kg';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return '$placeで$timeの乗り継ぎ';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return '次の便は$place発です';
  }

  @override
  String get cardFaresViewFailed => '運賃を読み込めませんでした。';

  @override
  String get cardFaresTryAgain => '再試行';

  @override
  String get cardFaresMorning => '午前';

  @override
  String get cardFaresAfternoon => '午後';

  @override
  String get cardFaresEvening => '夕方';

  @override
  String get cardFaresNight => '夜間';

  @override
  String get cardFaresTime => '時間帯';

  @override
  String get cardFaresAirlines => '航空会社';

  @override
  String get cardFaresBagIncluded => '手荷物込み';

  @override
  String get cardFaresNoMatch => '条件に一致するフライトはありません。';

  @override
  String get cardFaresOpenInChat => 'チャットで開く';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return '$dateの$routeのフライトを表示';
  }

  @override
  String get cardFaresEdit => '検索条件を編集';

  @override
  String get cardFaresDetails => '詳細';

  @override
  String get cardFaresSinceStart => '監視開始時比';

  @override
  String get cardFareCalOneWay => '片道';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n泊で復路',
      one: '1泊で復路',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => '安値';

  @override
  String get cardFareCalUsual => '標準';

  @override
  String get cardFareCalHigh => '高値';

  @override
  String cardFareCalCheapest(String day, String price) {
    return '最安：$day・$price';
  }

  @override
  String get cardFareCalSeeFares => '運賃を見る';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day：$price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day：価格なし';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return '$from発・すべての場所';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return '$from発・海外';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return '$from発・国内';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return '$price以下';
  }

  @override
  String get cardFlightSearchTitle => 'フライトを検索';

  @override
  String get cardFlightSearchReturn => '往復';

  @override
  String get cardFlightSearchOneWay => '片道';

  @override
  String get cardFlightSearchFrom => '出発地';

  @override
  String get cardFlightSearchTo => '目的地';

  @override
  String get cardFlightSearchPlaceHint => '都市または空港';

  @override
  String get cardFlightSearchAnywhere => 'どこでも';

  @override
  String get cardFlightSearchSwap => '出発地と目的地を入れ替える';

  @override
  String get cardFlightSearchPickDates => '日程を選択';

  @override
  String get cardFlightSearchPickDate => '日付を選択';

  @override
  String get cardFlightSearchWholeMonth => '月全体';

  @override
  String get cardFlightSearchNights => '滞在日数';

  @override
  String get cardFlightSearchAdults => '大人';

  @override
  String get cardFlightSearchChildren => '小児（2〜11歳）';

  @override
  String get cardFlightSearchInfants => '幼児（2歳未満）';

  @override
  String get cardFlightSearchNotNow => '今はしない';

  @override
  String get cardFlightSearchSent => '検索中…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return '$routeのフライト（$dates）';
  }

  @override
  String get cardFareTrendNow => '現在の最安値';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '過去$n日間',
      one: '過去1日間',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return '$low〜$high';
  }

  @override
  String get cardFareTrendNote =>
      'これはこれまでの価格推移であり、予測ではありません。価格はいつでも変動する可能性があります。';

  @override
  String get cardFareWatchesTitle => '価格監視';

  @override
  String get cardFareWatchesNone => '監視中の運賃はありません。運賃カードの「価格を監視」をタップして開始できます。';

  @override
  String get cardFareWatchesNoPrice => 'まだ価格データがありません';

  @override
  String cardFareWatchesTarget(String price) {
    return '目標価格：$price';
  }

  @override
  String get cardFareWatchesAnyDrop => '大幅な値下がり';

  @override
  String cardFareWatchesLow(String price) {
    return '最安値：$price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return '$dateまで';
  }

  @override
  String get cardsFareWatches => '価格監視';

  @override
  String get cardsFareWatchesNone =>
      '価格監視はありません。航空券カードの「価格を監視」をタップすると値下がり時に通知が届きます。';

  @override
  String cardsFareWatchLine(String price, String date) {
    return '現在$price・$dateまで';
  }

  @override
  String get cardFromBot => 'ボットが作成した情報です。誤りがある場合があります';

  @override
  String get cardFullRecipe => 'レシピ全文';

  @override
  String get cardGate => '搭乗口';

  @override
  String get cardGo => 'スタート';

  @override
  String get cardHeads => '表';

  @override
  String get cardHolidays => '祝日';

  @override
  String get cardHoursShort => '時間';

  @override
  String get cardHumidity => '湿度';

  @override
  String get cardItsTime => '時間になりました！';

  @override
  String get cardJustNow => 'たった今';

  @override
  String get cardLast24h => '過去24時間';

  @override
  String get cardLast30Days => '過去30日間';

  @override
  String get cardListen => '聴く';

  @override
  String get cardLiveNow => '現在';

  @override
  String get cardLongWeekend => '連休';

  @override
  String get cardLostShort => '敗';

  @override
  String get cardMarket24h => '24時間取引';

  @override
  String get cardMarketCap => '時価総額';

  @override
  String get cardMarketClosed => '市場終了';

  @override
  String get cardMarketOpen => '取引中';

  @override
  String get cardMarketPost => '時間外取引';

  @override
  String get cardMarketPre => 'プレマーケット';

  @override
  String get cardMessage => 'メッセージ';

  @override
  String get cardMinutesShort => '分';

  @override
  String get cardMoonFirstQuarter => '上弦の月';

  @override
  String get cardMoonFull => '満月';

  @override
  String get cardMoonLastQuarter => '下弦の月';

  @override
  String get cardMoonNew => '新月';

  @override
  String get cardMoonWaningCrescent => '有明月';

  @override
  String get cardMoonWaningGibbous => '更待月';

  @override
  String get cardMoonWaxingCrescent => '三日月';

  @override
  String get cardMoonWaxingGibbous => '十三夜月';

  @override
  String get cardMore => 'もっと見る';

  @override
  String get cardNext24h => '今後24時間';

  @override
  String get cardNoAlerts => '警報なし';

  @override
  String get cardNoAlertsLong => '現在ここに発令されている気象警報はありません。';

  @override
  String get cardNoChart => 'この期間のチャートはありません';

  @override
  String get cardNoGames => '試合はありません';

  @override
  String get cardNoHolidays => '今年の残りの祝日はありません。';

  @override
  String get cardNoQuakes => '最近その規模の地震は発生していません。';

  @override
  String get cardNoStorms => '発生中の台風なし';

  @override
  String get cardNoStormsLong => '現在発生している熱帯低気圧・台風はありません。';

  @override
  String get cardNotAdvice => '投資助言ではありません';

  @override
  String get cardNow => '現在';

  @override
  String get cardNutritionFacts => '栄養成分表示';

  @override
  String get cardOpen => '開く';

  @override
  String get cardOpenSource => '出典を開く';

  @override
  String get cardParcel => '荷物';

  @override
  String get cardParcelDelivered => '配達完了';

  @override
  String get cardParcelInTransit => '輸送中';

  @override
  String get cardParcelOrdered => '送り状作成済み';

  @override
  String get cardParcelOut => '配達中';

  @override
  String get cardParcelProblem => '問題発生';

  @override
  String get cardParcelNoLive => 'ここでは最新の配達状況を表示できません。配送業者のページで最新情報をご確認ください。';

  @override
  String cardParcelTrackOn(String site) {
    return '$siteで追跡';
  }

  @override
  String get cardPin => 'ウィジェットにピン留め';

  @override
  String get cardPinFailed => 'このカードをピン留めできませんでした';

  @override
  String get cardPinned => 'ウィジェットにピン留めしました';

  @override
  String get cardPinnedWaiting => 'ピン留めしました。表示するにはこのボットにウィジェットの使用を許可してください';

  @override
  String get cardPlayedShort => '試';

  @override
  String get cardPointsShort => '勝点';

  @override
  String get cardPrevClose => '前日終値';

  @override
  String get cardPros => 'メリット';

  @override
  String get cardProsCons => 'メリットとデメリット';

  @override
  String get cardQuiz => 'クイズ';

  @override
  String get cardRain => '雨';

  @override
  String get cardRainChance => '降水確率';

  @override
  String get cardRandom => 'ランダム';

  @override
  String get cardReadMore => '続きを読む';

  @override
  String get cardReferenceRates => '中央銀行が毎日公表する基準為替レート';

  @override
  String get cardRefresh => '更新';

  @override
  String get cardReport => 'データの誤りを報告';

  @override
  String get cardReported => 'ご報告ありがとうございます。確認します';

  @override
  String get cardSameTime => '同時刻';

  @override
  String get cardScores => 'スコア';

  @override
  String get cardSecondsShort => '秒';

  @override
  String get cardServings => '人分';

  @override
  String get cardShareImage => '画像として共有';

  @override
  String get cardStandings => '順位表';

  @override
  String get cardStorms => '台風・熱帯低気圧';

  @override
  String get cardSunMoon => '太陽と月';

  @override
  String get cardSunrise => '日の出';

  @override
  String get cardSunset => '日の入り';

  @override
  String get cardSwap => '入れ替え';

  @override
  String get cardSynonyms => '類義語：';

  @override
  String get cardTails => '裏';

  @override
  String get cardTeam => 'チーム';

  @override
  String get cardTerminal => 'ターミナル';

  @override
  String get cardTimeIn => '各場所での時間';

  @override
  String get cardTimeline => 'タイムライン';

  @override
  String get cardToday => '今日';

  @override
  String get cardTomorrow => '明日';

  @override
  String get cardTranslation => '翻訳';

  @override
  String get cardTsunami => '津波';

  @override
  String get cardUnpin => 'ウィジェットから削除';

  @override
  String get cardUnpinned => 'ウィジェットから削除しました';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => '極端に強い';

  @override
  String get cardUvHigh => '強い';

  @override
  String get cardUvLow => '弱い';

  @override
  String get cardUvModerate => '中程度';

  @override
  String get cardUvVeryHigh => '非常に強い';

  @override
  String get cardVolume => '出来高';

  @override
  String get cardWatchlist => 'ウォッチリスト';

  @override
  String get cardWeather => '天気';

  @override
  String get cardWeatherAlerts => '気象警報';

  @override
  String get cardWebsite => 'Webサイト';

  @override
  String get cardWind => '風';

  @override
  String get cardWonShort => '勝';

  @override
  String get cardWorldClock => '世界時計';

  @override
  String get cardYesterday => '昨日';

  @override
  String get cardQuakesWorld => '今日の主な地震';

  @override
  String cardMinutesAgo(int n) {
    return '$n分前';
  }

  @override
  String cardHoursAgo(int n) {
    return '$n時間前';
  }

  @override
  String cardStale(String ago) {
    return '更新できませんでした・$ago時点';
  }

  @override
  String cardUpdated(String ago) {
    return '$agoに更新';
  }

  @override
  String cardDelayed(int minutes) {
    return '$minutes分遅延';
  }

  @override
  String cardHighLow(String high, String low) {
    return '最高$high・最低$low';
  }

  @override
  String cardFeelsLike(String temp) {
    return '体感$temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n日間';
  }

  @override
  String cardUntil(String when) {
    return '$whenまで';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '警報$n件発令中',
      one: '警報1件発令中',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return '主な汚染物質：$pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'ハンノキ花粉',
      'birch': 'シラカバ花粉',
      'grass': 'イネ科花粉',
      'mugwort': 'ヨモギ花粉',
      'olive': 'オリーブ花粉',
      'ragweed': 'ブタクサ花粉',
      'other': '花粉',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '$h時間$m分';
  }

  @override
  String cardGoldenHour(String time) {
    return 'ゴールデンアワー：$time〜';
  }

  @override
  String cardMoonLit(int pct) {
    return '輝面比$pct%';
  }

  @override
  String cardMoonrise(String time) {
    return '月の出：$time';
  }

  @override
  String cardMoonset(String time) {
    return '月の入り：$time';
  }

  @override
  String cardRangeChange(String range) {
    return '$rangeの変化';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up銘柄上昇・$down銘柄下落';
  }

  @override
  String cardRatesOf(String date) {
    return '$date時点のレート';
  }

  @override
  String cardAtTime(String when) {
    return '$when時点';
  }

  @override
  String cardInDays(int n) {
    return '$n日後';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct%到達';
  }

  @override
  String cardQuakesNear(String place) {
    return '$place付近の地震';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '地震$n件',
      one: '地震1件',
      zero: 'なし',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return '深さ$depth';
  }

  @override
  String cardAway(String distance) {
    return '$distance先';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n個発生中',
      one: '1個発生中',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return '$level警報';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n試合',
      one: '1試合',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n試合進行中';
  }

  @override
  String cardMinutes(int n) {
    return '$n分';
  }

  @override
  String cardExpected(String date) {
    return '$date予定';
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
      other: '$nステップ',
      one: '1ステップ',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return '$n勝';
  }

  @override
  String cardServingSize(String size) {
    return '1食分：$size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$total件中$passed件のチェックに合格';
  }

  @override
  String cardTotal(int n) {
    return '合計$n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return '$n年後';
  }

  @override
  String get cardsSettingsTitle => 'カード';

  @override
  String get cardsSettingsRow => '居住都市、単位、データソース';

  @override
  String get cardsSettingsIntro =>
      '天気、価格、為替レート、時刻などの質問に、ボットが最新のリアルデータを使ったカードで回答します。場所を指定せずに尋ねた場合は居住都市が使われます。';

  @override
  String get cardsSettingsSaveFailed => '保存できませんでした。もう一度お試しください。';

  @override
  String get cardsHomeCity => '居住都市';

  @override
  String get cardsHomeClear => '消去';

  @override
  String get cardsHomeNone => '未設定。都市を選ぶまでタイムゾーンの代表都市が使われます。';

  @override
  String get cardsHomeSearch => '都市を検索';

  @override
  String get cardsHomePrivacy => '都市名のみが保存され、住所は保存されません。天気サービスには丸めた座標が送信されます。';

  @override
  String get cardsUnits => '単位';

  @override
  String get cardsTemperature => '気温';

  @override
  String get cardsWind => '風速';

  @override
  String get cardsRain => '降水量';

  @override
  String get cardsDistance => '距離';

  @override
  String get cardsPrices => '価格表示';

  @override
  String get cardsRedUp => '上昇を赤で表示';

  @override
  String get cardsRedUpHint => '日本、中国、韓国の市場に合わせて、値上がりを赤、値下がりを緑で表示します。';

  @override
  String get cardsSources => 'データソース';

  @override
  String get cardsSourcesIntro => 'カードにはデータの取得元と取得時刻が表示されます。情報提供元は次のとおりです：';

  @override
  String get cardFewerServings => '人数を減らす';

  @override
  String get cardMoreServings => '人数を増やす';

  @override
  String get cropTitle => '移動と拡大縮小';

  @override
  String get cropDone => '完了';

  @override
  String get cropPosition => '画像の位置';

  @override
  String get cropMoveUp => '上へ移動';

  @override
  String get cropMoveDown => '下へ移動';

  @override
  String get cropMoveLeft => '左へ移動';

  @override
  String get cropMoveRight => '右へ移動';

  @override
  String get cropRotate => '回転';

  @override
  String get cropMirror => '左右反転';

  @override
  String get cropReset => 'リセット';

  @override
  String get cropZoom => 'ズーム';

  @override
  String get cropZoomIn => '拡大';

  @override
  String get cropZoomOut => '縮小';

  @override
  String get cropSoft => '拡大しすぎているため、画像がぼやける場合があります';

  @override
  String get cropAnimatedStill => 'アニメーション画像は静止画になります';

  @override
  String get cropBackground => '背景';

  @override
  String get cropBackgroundNone => 'なし';

  @override
  String cropBackgroundBot(String name) {
    return '$nameのカラー';
  }

  @override
  String get cropBackgroundWhite => '白';

  @override
  String get cropBackgroundBlack => '黒';

  @override
  String get cropUnreadable => 'この画像はここでは開けません。JPEGまたはPNGをお試しください。';

  @override
  String cropTooBig(String size) {
    return 'このファイルは$sizeで、40 MBの上限を超えています。';
  }

  @override
  String get botPicture => '画像';

  @override
  String botPictureTitle(String name) {
    return '$nameの画像';
  }

  @override
  String botPictureChange(String name) {
    return '$nameの画像を変更';
  }

  @override
  String get botPicturePaste => '画像を貼り付け';

  @override
  String get botPictureDraw => 'AIで作成';

  @override
  String get botPictureDrawHelp => 'Casamaが2つ作成して選べるようにします';

  @override
  String get botPictureRecrop => '切り抜き直す';

  @override
  String get botPictureMascot => '代わりにマスコットを使う';

  @override
  String get botPictureRemove => '画像を削除';

  @override
  String get botPictureRecent => '最近';

  @override
  String get botPictureUpdated => '画像を更新しました';

  @override
  String get botPictureRemoved => '画像を削除しました';

  @override
  String get botPictureFailed => '画像を保存できませんでした';

  @override
  String botPictureDrop(String name) {
    return 'ドロップして$nameの画像にする';
  }

  @override
  String botPictureUseAs(String name) {
    return '$nameの画像として使う';
  }

  @override
  String get botPictureUseAsBot => 'ボットの画像として使う';

  @override
  String get botPictureWhichBot => 'どのボットにこの画像を使いますか？';

  @override
  String botDrawTitle(String name) {
    return '$nameの画像';
  }

  @override
  String get botDrawIntro => 'スタイルを選び、お好みで説明を少し加えると、Casamaが選べる2枚の画像を描きます。';

  @override
  String get botDrawDescribe => '説明を入力（任意）';

  @override
  String get botDrawHint => '読書用のメガネをかけた親しみやすいフクロウ';

  @override
  String get botDrawMake => '2枚作成';

  @override
  String get botDrawMore => 'さらに2枚作成';

  @override
  String get botDrawPick => 'タップして使用';

  @override
  String get botDrawCost => '各画像は通常のCasama画像生成と同様に画像クレジットを消費します。';

  @override
  String get botDrawWorking => '作成中…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => 'ソフト3D';

  @override
  String get botDrawStyleWatercolor => '水彩画';

  @override
  String get botDrawStyleFlat => 'フラットアイコン';

  @override
  String get botDrawStylePixel => 'ピクセルアート';

  @override
  String get botDrawStyleLine => '線画';

  @override
  String get botDrawStylePhoto => '写真';

  @override
  String get sharePictureStays =>
      '画像は元のワークスペースに残ります：コピー版には以前のマスコットまたはイニシャルが使われます。';

  @override
  String savedResetRefills(String amount) {
    return 'クレジット$amountを補充';
  }

  @override
  String get savedResetClearsDaily => '今日の上限を解除';

  @override
  String get savedResetGivesHours => 'コンピューター時間を戻す';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '残り$count日',
      one: '残り1日',
      zero: '本日期限切れ',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'モデル';

  @override
  String get modelsRowHelp => 'Casamaのモデルまたは自分のキー';

  @override
  String get modelsIntro =>
      'Casamaにボットを実行させるか、自分のモデルキーを接続するかを選びます。キーは暗号化して保存され、二度と表示されません。';

  @override
  String get whoRunsYourBots => 'ボットの実行方法';

  @override
  String adminModelAccessPlan(String plan) {
    return '$plan plan (monthly, yearly and weekly)';
  }

  @override
  String get adminModelAccessFollowDefault => 'Follow default';

  @override
  String get whoRunsCasama => 'Casama';

  @override
  String get whoRunsCasamaHelp => 'プランに含まれており、ワークスペースのクレジットを使用します';

  @override
  String get whoRunsCasamaOffHelp => '現在のプランでは一時停止中です';

  @override
  String get whoRunsOwn => '自分のプロバイダー';

  @override
  String get whoRunsOwnHelp => 'プロバイダーから直接請求され、Casamaクレジットは消費しません';

  @override
  String get whoRunsCasamaShort => 'プランに含まれるCasamaのモデル';

  @override
  String get whoRunsCasamaCost => 'クレジットを使用';

  @override
  String get whoRunsOwnShort => '自分のキー（プロバイダーが請求）';

  @override
  String get whoRunsOwnCost => 'Casamaクレジット不要';

  @override
  String get whoRunsOwnNeedsKey =>
      '自分のプロバイダーを使うには、まず下の「キーを追加」からチャット用キーを追加してください。';

  @override
  String get whoRunsOwnNeedsModel => '切り替えるには下のこのキーからモデルを選択してください。';

  @override
  String get whoRunsAdminOnly => 'ボットの実行元を変更できるのはワークスペース管理者のみです。';

  @override
  String get botModelSource => 'モデルの取得元';

  @override
  String get botModelSourceWorkspace => 'ワークスペースの既定';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => '自分のキーの1つ';

  @override
  String get useCasamaFallback => 'プロバイダーが失敗したらCasamaのモデルを使う';

  @override
  String get useCasamaFallbackHelp =>
      'キーがレート制限や利用枠に達したとき、ワークスペースのクレジットを使ってCasamaのモデルへ切り替えます。';

  @override
  String get keyCoversOpenRouter => 'チャット、画像、動画、読み上げ、音声メッセージ、音声入力';

  @override
  String get keyCoversGoogle => 'チャットとライブ通話';

  @override
  String get keyCoversOpenAi => 'チャットとメモリー検索';

  @override
  String get keyCoversChat => 'チャット';

  @override
  String get ownProviderPrivacyNote =>
      '自分のプロバイダーを使う場合、ボットが送信する内容にはそのプロバイダーの規約が適用されます。Casamaの学習利用なし設定はCasamaのキー使用時のみ有効です。';

  @override
  String get creditsOwnProviderNote => '自分のプロバイダーのモデルではクレジットを消費しません。';

  @override
  String get routineWaitingForModel => 'モデル待機中';

  @override
  String get ownProviderRequiredTitle => 'チャットを続けるにはモデルを接続してください';

  @override
  String get ownProviderRequiredBody =>
      '現在このプランではCasamaのモデルを利用できません。自分のモデルキーを追加するか、プランをアップグレードしてください。';

  @override
  String get modelNoToolsWarning => 'このモデルはツールに対応していないため、ボットはテキストでのみ返信できます。';

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
  String get appBrowserTitle => 'このスマートフォンのブラウザー';

  @override
  String get appBrowserTitleMac => 'このMacのブラウザー';

  @override
  String get appBrowserTitleLinux => 'このコンピューターのブラウザー';

  @override
  String get appBrowserTitleWindows => 'このPCのブラウザー';

  @override
  String get appBrowserHelp =>
      '許可したボットが使えるCasama内の小さなブラウザーです。このスマートフォンでチャットを開いて見ている間だけ動作し、サインイン情報はこのスマートフォン内に留まります。';

  @override
  String get appBrowserHelpMac =>
      '許可したボットが使えるCasama内の小さなブラウザーです。このMacでCasamaを開いて見ている間だけ動作し、サインイン情報はこのMac内に留まります。';

  @override
  String get appBrowserHelpLinux =>
      '許可したボットが使えるCasama内の小さなブラウザーです。このコンピューターでCasamaを開いて見ている間だけ動作し、サインイン情報はこのコンピューター内に留まります。';

  @override
  String get appBrowserHelpWindows =>
      '許可したボットが使えるCasama内の小さなブラウザーです。このPCでCasamaを開いて見ている間だけ動作し、サインイン情報はこのPC内に留まります。';

  @override
  String get appBrowserSwitchHelp => '許可したボットがこのスマートフォンでチャットを開いている間にページを開けます。';

  @override
  String get appBrowserSwitchHelpMac => '許可したボットがこのMacでCasamaを開いている間にページを開けます。';

  @override
  String get appBrowserSwitchHelpLinux =>
      '許可したボットがこのコンピューターでCasamaを開いている間にページを開けます。';

  @override
  String get appBrowserSwitchHelpWindows =>
      '許可したボットがこのPCでCasamaを開いている間にページを開けます。';

  @override
  String get appBrowserOn => 'オン';

  @override
  String get appBrowserOff => 'オフ';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'オフになっています：$reason';
  }

  @override
  String get appBrowserReasonOff => 'まだ利用できません。';

  @override
  String get appBrowserReasonNotTester => '現在はテスターのみ利用できます。';

  @override
  String get appBrowserReasonSystemOff => 'このデバイスではまだ利用できません。';

  @override
  String get appBrowserReasonWorkspaceOff => '管理者がこのワークスペースでオフにしました。';

  @override
  String get appBrowserReasonUnavailable => 'このサーバーにはデバイス接続がありません。';

  @override
  String get appBrowserReasonUnsupported => 'このデバイスのブラウザーでは実行できません。';

  @override
  String get appBrowserReasonNeedsMacos14 => 'macOS 14以降が必要です。';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'ここでブラウザーを使うにはWebKitGTKをインストールしてください：$command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'ここでブラウザーを使うにはMicrosoft Edge WebView2をインストールまたは更新してください。';

  @override
  String get appBrowserGetWebview2 => 'WebView2を入手';

  @override
  String get appBrowserReasonNoToken =>
      '以前のインストールでペアリングされています。もう一度オンにしてこのデバイスをペアリングしてください。';

  @override
  String get appBrowserAllBots => 'すべてのボット';

  @override
  String get appBrowserAllBotsHelp =>
      'チャットできるすべてのボットがこのブラウザーを使えます。個別に選ぶにはオフにしてください。';

  @override
  String get appBrowserModeHeader => 'ボットがブラウザーを必要とするとき';

  @override
  String get appBrowserModeAlways => '常にこのデバイスを使う';

  @override
  String get appBrowserModeAlwaysHelp =>
      'チャットを開いている間、ボットはすべてのページをここで開きます。ボットのコンピューターはあなたが頼んだときだけ使われます。';

  @override
  String get appBrowserOpenTooltip => 'ブラウザーを開く';

  @override
  String get appBrowserBotsBrowseHere => 'ボットがここでブラウズ';

  @override
  String get appBrowserBotsBrowseHereHelp =>
      'チャット内のすべてのページが、見ている間にこのブラウザーで開きます';

  @override
  String get appBrowserModeAsk => '必要なときに確認する';

  @override
  String get appBrowserModeAskHelp =>
      'サイトにサインインが必要なときや、ボットのコンピューターがブロックされたときに選択肢を表示します。';

  @override
  String get appBrowserModeComputer => '常にボットのコンピューターを使う';

  @override
  String get appBrowserModeComputerHelp => 'チャットで頼まない限り、このデバイスのブラウザーは提案しません。';

  @override
  String get appBrowserModeDevice => 'このデバイスを優先する';

  @override
  String get appBrowserModeDeviceHelp =>
      'サインインが必要なサイトやブロックされたサイトでは、確認なしでこのデバイスのブラウザーを使います。';

  @override
  String get appBrowserNeverAsk => 'ボットのコンピューター（確認しない）';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Linuxコンピューター';

  @override
  String get appBrowserDeviceWindows => 'Windows PC';

  @override
  String get adminAppBrowserMacos => 'Mac (macOS 14+)';

  @override
  String get adminAppBrowserLinux => 'Linux (WebKitGTK 4.1+)';

  @override
  String get adminAppBrowserWindows => 'Windows (WebView2 120+)';

  @override
  String get browserWaiting => 'あなたを待っています。ブラウザーで続けるにはこのチャットを開いたままにしてください。';

  @override
  String browserWaitingSite(String site) {
    return 'あなたを待っています。ブラウザーで$siteを続けるにはこのチャットを開いたままにしてください。';
  }

  @override
  String get browserWaitEnded => 'ブラウザーの待機を終了しました。';

  @override
  String get browserHandBackWaiting =>
      'ブラウザーで操作してください。ページ上で操作を済ませたら「操作を戻す」をタップします。';

  @override
  String browserHandBackWaitingSite(String site) {
    return '$siteで操作してください。ページ上で操作を済ませたら「操作を戻す」をタップします。';
  }

  @override
  String get browserHandBackEnded => 'ブラウザーの操作を戻す待機を終了しました。';

  @override
  String get browserChoiceCardLabel => 'ブラウザーの選択';

  @override
  String browserChoiceTitle(String bot, String site) {
    return '$botは$siteをどこで開きますか？';
  }

  @override
  String get browserChoiceSubtitleSignIn => 'このサイトにはサインインが必要です。';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'このサイトは$botのコンピューターからのアクセスをブロックしました。';
  }

  @override
  String get browserChoiceOnPhone => 'このスマートフォンで開く';

  @override
  String get browserChoiceOnMac => 'このMacで開く';

  @override
  String get browserChoiceOnLinux => 'このコンピューターで開く';

  @override
  String get browserChoiceOnWindows => 'このPCで開く';

  @override
  String get browserChoiceOnDeviceHelp =>
      '画面を見ながら自分でサインインできます。読み取った内容はAIに送られます。';

  @override
  String get browserChoiceInChrome => '自分のChromeで開く';

  @override
  String get browserChoiceInChromeHelp => '各サイトにすでにサインイン済みです。';

  @override
  String browserChoiceOnComputer(String bot) {
    return '$botのコンピューターで開く';
  }

  @override
  String get browserChoiceOnComputerHelp => '画面を閉じてもそのまま動作します。';

  @override
  String browserChoiceRemember(String site) {
    return '$siteでの選択を記憶';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return 'このスマートフォンで$siteを開きました';
  }

  @override
  String browserChoicePickedMac(String site) {
    return 'このMacで$siteを開きました';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return 'このコンピューターで$siteを開きました';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return 'このPCで$siteを開きました';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return '自分のChromeで$siteを開きました';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return '$botのコンピューターで$siteを開きました';
  }

  @override
  String browserChoiceExpired(String bot) {
    return '時間内に応答がなかったため、$botのコンピューターのまま続行しました';
  }

  @override
  String get appBrowserConsentTitle => 'ボットにCasama内のブラウザー使用を許可しますか？';

  @override
  String get appBrowserConsentPages =>
      'ボットがここで読み取ったページは、ボット自身のコンピューターで読み取る場合と同じように、CasamaとそのボットのAIモデルに送信されます。';

  @override
  String get appBrowserConsentSignIns =>
      'サインイン情報はこのデバイスに留まります。パスワード、カード番号、認証コードは自分自身で入力するため、ボットに見えることはありません。';

  @override
  String get appBrowserConsentWatch =>
      'ここでボットのチャットを開いている間だけ動作します。いつでも様子を見たり、操作を代わったり、停止したりできます。';

  @override
  String get appBrowserConsentYours => '自分で閲覧した内容がどこかに送信されることはありません。';

  @override
  String get appBrowserBots => '使用できるボット';

  @override
  String get appBrowserBotsHelp => 'ここでオンにしたボットだけがこのデバイスのブラウザーを使用できます。';

  @override
  String get appBrowserNoBots => 'ボットはまだいません。';

  @override
  String get appBrowserSites => 'サイト';

  @override
  String get appBrowserSitesHelp =>
      '「常に許可」または「許可しない」と答えたサイトです。次回もう一度確認したい場合は削除してください。';

  @override
  String get appBrowserNoSites => 'サイトはまだありません。ボットが初めてサイトを開くときに確認します。';

  @override
  String appBrowserRemoveSite(String site) {
    return '$siteを削除';
  }

  @override
  String get appBrowserKinds => 'オフのままにするサイト';

  @override
  String get appBrowserKindsHelp =>
      'これらの種類のサイトはオンにしない限り開けません。オンにした場合でも、ボットは毎回確認を求めます。';

  @override
  String get appBrowserKindBanking => '銀行・決済';

  @override
  String get appBrowserKindHealth => 'ヘルスケア';

  @override
  String get appBrowserKindPasswords => 'パスワードマネージャー';

  @override
  String get appBrowserKindGovernment => '行政・本人確認';

  @override
  String get appBrowserSignIn => 'サイトにサインイン';

  @override
  String get appBrowserSignInHelp =>
      'サイトを開いて自分でサインインし、ボットが使えるようにします。この間に行った操作が送信されることはありません。';

  @override
  String get appBrowserClearData => '閲覧データを消去';

  @override
  String get appBrowserClearDataHelp =>
      'このブラウザーのすべてのサイトからサインアウトし、保存されたサイトデータを消去します。';

  @override
  String get appBrowserClearDataConfirm => 'このブラウザーのサインインとサイトデータを消去しますか？';

  @override
  String get appBrowserClearDataDone => '閲覧データを消去しました';

  @override
  String get appBrowserUnpair => 'このデバイスのペアリングを解除';

  @override
  String get appBrowserUnpairConfirm =>
      'このデバイスのブラウザーのペアリングを解除しますか？再びオンにするまでボットは使えません。';

  @override
  String appBrowserWorking(String bot) {
    return '$botが作業中';
  }

  @override
  String get appBrowserTakeOver => '操作を代わる';

  @override
  String get appBrowserHandBack => '操作を戻す';

  @override
  String get appBrowserYourTurn => 'あなたの操作';

  @override
  String appBrowserPaused(String bot) {
    return 'あなたがページを使っている間、$botは一時停止しています';
  }

  @override
  String get appBrowserAway => '一時停止：チャットが開いていません';

  @override
  String appBrowserDone(String bot) {
    return '$botが完了しました';
  }

  @override
  String appBrowserDoneFailed(String bot) {
    return '$botは完了する前に停止しました';
  }

  @override
  String get appBrowserDoneHint => '回答はチャットにあります。このページは開いたままなので、見て回ることもできます。';

  @override
  String get appBrowserBackToChat => 'チャットに戻る';

  @override
  String get appBrowserStayHere => 'このまま見る';

  @override
  String get appBrowserAddress => 'サイトのアドレス';

  @override
  String get appBrowserBack => '戻る';

  @override
  String get appBrowserForward => '進む';

  @override
  String get appBrowserReload => '再読み込み';

  @override
  String get appBrowserAllowSite => 'このサイトをボットに許可';

  @override
  String appBrowserSiteAdded(String site) {
    return '$siteを追加しました。ボットがここで使えます。';
  }

  @override
  String get appBrowserAddressRefused => 'そのアドレスはここでは開けません。';

  @override
  String get appBrowserSecure => '安全な接続';

  @override
  String get appBrowserNotSecure => '保護されていない通信';

  @override
  String get appBrowserCardLabel => 'アプリ内ブラウザー';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$botが$siteを開こうとしています';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'このデバイスのCasama内で、あなたのサインイン状態を使います。「常に許可」を選ぶと今後このサイトを開けるようになります。';

  @override
  String get appBrowserSiteAskHelpMac =>
      'このMac上で、あなたのサインイン状態を使います。「常に許可」を選ぶと今後このサイトを開けるようになります。';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'このコンピューター上で、あなたのサインイン状態を使います。「常に許可」を選ぶと今後このサイトを開けるようになります。';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'このPC上で、あなたのサインイン状態を使います。「常に許可」を選ぶと今後このサイトを開けるようになります。';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': '銀行・決済のサイトでは毎回確認します。',
      'health': 'ヘルスケアのサイトでは毎回確認します。',
      'passwords': 'パスワードマネージャーのサイトでは毎回確認します。',
      'government': '公的身分証のサイトでは毎回確認します。',
      'other': 'これらのサイトでは毎回確認します。',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => '今回のみ';

  @override
  String get appBrowserAlways => '常に許可';

  @override
  String get appBrowserNever => '許可しない';

  @override
  String appBrowserStepAskTitle(String bot) {
    return '$botにこの操作を許可しますか？';
  }

  @override
  String get appBrowserStepAskHelp => 'このデバイスのCasama内で、あなたのサインイン状態を使います。';

  @override
  String get appBrowserStepAskHelpMac => 'このMac上で、あなたのサインイン状態を使います。';

  @override
  String get appBrowserStepAskHelpLinux => 'このコンピューター上で、あなたのサインイン状態を使います。';

  @override
  String get appBrowserStepAskHelpWindows => 'このPC上で、あなたのサインイン状態を使います。';

  @override
  String appBrowserStepClick(String name) {
    return '「$name」をタップ';
  }

  @override
  String appBrowserStepType(String name) {
    return '「$name」に入力';
  }

  @override
  String appBrowserStepPress(String name) {
    return '「$name」でキーを押す';
  }

  @override
  String appBrowserStepUpload(String name) {
    return '「$name」にファイルをアップロード';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step：「$name」';
  }

  @override
  String get appBrowserDontAllow => '許可しない';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Androidスマートフォン';

  @override
  String get toolOnThisPhone => 'このデバイス上';

  @override
  String get appBrowserWorkspaceSwitch => 'メンバーのアプリ内ブラウザーでのボット利用';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'メンバーは画面を見ながら、自分のスマートフォンやコンピューター上のCasama内ブラウザーをボットに使わせることができます。';

  @override
  String appBrowserAwaySummary(String bot, int steps) {
    String _temp0 = intl.Intl.pluralLogic(
      steps,
      locale: localeName,
      other: '$stepsステップ',
      one: '1ステップ',
    );
    return '$botはアプリを離れている間も続行しました・$_temp0';
  }

  @override
  String appBrowserNeedsYouTitle(String bot) {
    return '$botが確認を待っています';
  }

  @override
  String get appBrowserNeedsYouBody => '続けるにはCasamaを開いてください。';

  @override
  String appBrowserStillUsingTitle(String bot) {
    return '$botがまだブラウザーを使用しています';
  }

  @override
  String get appBrowserStillUsingBody => '戻ると、ボットが完了できます。';

  @override
  String appBrowserFinishedTitle(String bot) {
    return '$botが完了しました';
  }

  @override
  String appBrowserFinishedOnSiteTitle(String bot, String site) {
    return '$botが$siteでの作業を完了しました';
  }

  @override
  String get appBrowserFinishedBody => 'タップして確認。';

  @override
  String get appBrowserKeepGoing => 'アプリを離れても続行する';

  @override
  String get appBrowserKeepGoingHelp =>
      '控えめな通知でバックグラウンドのブラウザー作業を完了します（最大10分、バッテリー残量が少ないときは一時停止）。';

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
  String get vendorRenewalUsd => '更新費用（USD）';

  @override
  String get vendorRenewalMonths => '更新でカバーされる月数';

  @override
  String get vendorSeeSpend => '支出を見る';

  @override
  String get costSpent => '支出';

  @override
  String get costCharged => '請求';

  @override
  String get costMargin => '利益';

  @override
  String get costMarginNone => '請求はありませんでした';

  @override
  String get costNotRecorded => '未記録';

  @override
  String get costNotRecordedHint => 'この意味と対象となるサービスを表示します';

  @override
  String get costNotRecordedHelp =>
      '一部のサービスは独自の合計金額を報告します。その金額がこのサーバーで記録された額より大きい場合、差額がここに表示されます。これはどの機能・キー・ワークスペースにもまだ紐づいていない実支出です。';

  @override
  String get costNotRecordedWhy => 'サービスからの報告がこれを超えている分';

  @override
  String get costNotRecordedNone => 'サービスの報告額と一致';

  @override
  String get costNotRecordedAllMatch => '合計を報告するすべてのサービスがこのサーバーの記録と一致しています。';

  @override
  String get costNotRecordedNoList => '現在サービス一覧を取得できません。しばらくしてからもう一度お試しください。';

  @override
  String get costNoVendorFigures => '合計を報告したサービスはありません';

  @override
  String get costNoVendorFiguresHelp => 'この期間の合計を独自に報告したサービスがないため、比較対象がありません。';

  @override
  String costNoFigureFrom(String names) {
    return '合計の報告なし：$names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count件のサービス',
      one: '1件のサービス',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'サービス側：$theirs・当方記録：$ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'サービス側：$theirs・当方記録：$ours・未記録$gap';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'サービス側：$theirs・当方記録：$ours・不足なし';
  }

  @override
  String get costNoVendorFigure => 'このサービスはこの期間の独自合計を報告していません。';

  @override
  String get costNoVendorFigureKind => 'このサービスは独自の合計を報告しません。';

  @override
  String costUpdated(String when) {
    return '更新：$when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '直前$days日間比',
      one: '前日比',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => '比較する前期間なし';

  @override
  String get costChangeNew => '新規';

  @override
  String get costChangeNewSpoken => 'この期間で新規';

  @override
  String get costChangeFlat => '変化なし';

  @override
  String costChangeUp(String amount) {
    return '$amount増加';
  }

  @override
  String costChangeDown(String amount) {
    return '$amount減少';
  }

  @override
  String costPoints(String count) {
    return '${count}pt';
  }

  @override
  String get costOther => 'その他';

  @override
  String get costNotLabelled => 'ラベルなし';

  @override
  String get costNotLabelledHelp =>
      'これらのコストはこの分類のラベルなしで記録されたため、これ以上分割できません。ただし合計には含まれます。';

  @override
  String get costGroupService => 'サービス';

  @override
  String get costGroupKey => 'キー';

  @override
  String get costGroupApp => 'アプリ & MCP';

  @override
  String get costGroupFeature => '機能';

  @override
  String get costGroupModel => 'モデル';

  @override
  String get costGroupWorkspace => 'ワークスペース';

  @override
  String get costGroupBy => 'グループ化';

  @override
  String get costFilters => 'フィルター';

  @override
  String get costNoFilters => 'なし。行を開いて「表に表示」を選ぶと絞り込めます。';

  @override
  String costFilterChip(String group, String value) {
    return '$group：$value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'フィルター$nameを削除';
  }

  @override
  String get costIncludeFixed => '固定費を含める';

  @override
  String get costIncludeFixedHelp => 'サブスクリプションと更新費用を対象期間の日数で均等割りして支出に加えます。';

  @override
  String get costOptions => '期間とフィルター';

  @override
  String get costPeriod => '期間';

  @override
  String costPeriodDays(int days) {
    return '$days日間';
  }

  @override
  String get costPeriodCustom => 'カスタム';

  @override
  String costLastDays(int days) {
    return '過去$days日間';
  }

  @override
  String get costChangeDates => '日付を変更';

  @override
  String get costDone => '完了';

  @override
  String get costDaysUtc => '日付はUTC基準です。';

  @override
  String get costDailySpend => '日別支出';

  @override
  String costStackedBy(String group) {
    return '$group別の積み上げ：上位の項目とその他。';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return '日別支出チャート、$days日間、合計$total。最高日は$peakDayで$peakAmount。';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return '日別支出チャート、$days日間、支出なし。';
  }

  @override
  String get costSourceMetered => '従量課金';

  @override
  String get costSourceCounted => '計測済み';

  @override
  String get costSourceFixed => '固定';

  @override
  String get costSourceEstimated => '推定';

  @override
  String get costSourceMeteredHelp => '呼び出しごとに記録された実コストです。';

  @override
  String get costSourceCountedHelp => 'このサーバー自身の回数に単価を掛けた値です。';

  @override
  String get costSourceFixedHelp => '請求額をカバー対象の日数で均等割りした金額です。';

  @override
  String get costSourceEstimatedHelp => '文字数から算出した値です。実際のコストは最低でもこの金額になります。';

  @override
  String get costEstimated => '推定';

  @override
  String get costColShare => '割合';

  @override
  String get costColChange => '変動';

  @override
  String get costColCalls => '呼び出し数';

  @override
  String get costColSource => '集計方法';

  @override
  String get costColFailed => '失敗';

  @override
  String get costColFees => '外部手数料';

  @override
  String get costColTokens => 'トークン費用';

  @override
  String get costTokenCost => 'トークン費用';

  @override
  String get costFailureRate => '失敗率';

  @override
  String costSortBy(String column) {
    return '$columnで並び替え';
  }

  @override
  String costSortedAscending(String column) {
    return '$column、昇順';
  }

  @override
  String costSortedDescending(String column) {
    return '$column、降順';
  }

  @override
  String get costOpenRowHint => '詳細を開きます';

  @override
  String costSpokenSpent(String amount) {
    return '支出$amount';
  }

  @override
  String costSpokenFees(String amount) {
    return '外部手数料$amount';
  }

  @override
  String costSpokenShare(String share) {
    return '全体の$share';
  }

  @override
  String costSpokenCalls(String count) {
    return '呼び出し$count回';
  }

  @override
  String costSpokenFailed(String rate) {
    return '失敗率$rate';
  }

  @override
  String costSpokenTokens(String amount) {
    return '推定トークン費用$amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return '請求$amount';
  }

  @override
  String costCallsCount(String count) {
    return '呼び出し$count回';
  }

  @override
  String costFailedShare(String rate) {
    return '失敗率$rate';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amountトークン（推定）';
  }

  @override
  String get costOpenBilling => '請求ページを開く';

  @override
  String get costByDay => '日別';

  @override
  String get costSplitBy => '分割基準';

  @override
  String get costShowInTable => '表に表示';

  @override
  String costShowInTableHelp(String name, String group) {
    return '表を$nameに絞り込み、$groupでグループ化します。';
  }

  @override
  String get costNothingRecorded => 'この期間の記録はありません。';

  @override
  String costLastUsed(String when) {
    return '最終使用：$when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ほか$count件あります。表に表示します。',
      one: 'ほか1件あります。表に表示します。',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => '用途';

  @override
  String get costKeyService => 'サービス';

  @override
  String get costKeySetting => '設定項目';

  @override
  String get costKeySetIn => '設定場所';

  @override
  String get costKeyVault => 'Vault項目';

  @override
  String get costKeyStatus => '状態';

  @override
  String get costKeyConfigured => '設定済み';

  @override
  String get costKeyNotConfigured => '未設定';

  @override
  String get costKeyLastUsed => '最終使用';

  @override
  String get costKeyNotUsed => 'この期間の使用なし';

  @override
  String get costKeyCap => '支出上限';

  @override
  String costKeyCapLeft(String left, String cap) {
    return '上限$cap中、残り$left';
  }

  @override
  String costKeyCapUsed(String share) {
    return '上限の$shareを使用';
  }

  @override
  String get costKeyNoCap => 'なし';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'この$days日間は支出がありませんでした',
      one: 'この日は支出がありませんでした',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'この期間に支出はありませんでした';

  @override
  String get costEmptyFiltered => 'これらのフィルターに一致する支出はありません';

  @override
  String get costEmptyGroup => 'このグループに一覧表示する項目はありません';

  @override
  String get costAppsNote =>
      'アプリおよびMCPサーバー：支出はベンダーからの請求額です。トークン費用はその結果をモデルトークンで処理した推定コストで、モデル支出にすでに含まれています。';

  @override
  String costFixedLeftOut(String amount) {
    return 'この期間の固定費$amountが除外されています。追加するには「固定費を含める」をオンにしてください。';
  }

  @override
  String costOwnKeys(String amount) {
    return 'ワークスペースは自分のキーで$amountを支払いました。このサーバーの費用ではないため除外されています。';
  }

  @override
  String get costOlderServerTitle => 'このサーバーはアップデートが必要です';

  @override
  String get costOlderServer =>
      'サービス別・キー別・アプリ別のコストは新しいサーバーバージョンで利用できます。サーバーをアップデートしてからもう一度ご確認ください。';

  @override
  String get costCheckAgain => '再確認';

  @override
  String get costSpendCardTitle => '過去30日間の支出';

  @override
  String get costSpendCardOpen => 'コスト';

  @override
  String get costSpendCardHint => 'コストタブを開きます';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return '過去30日間：支出$spent、請求$charged、利益$margin';
  }

  @override
  String get costSort => '並び替え';

  @override
  String get costSortName => '名前';

  @override
  String get costByWorkspace => 'ワークスペース別';

  @override
  String get costTopTools => 'よく使うツール';

  @override
  String get costToolList => 'モデルに送られるツール一覧';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ほか$count件のツールがあります。',
      one: 'ほか1件のツールがあります。',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'CasamaのTelegramボットを使う';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Telegramで$botと話せます。ワンタップで設定不要です。';
  }

  @override
  String get telegramOtherWorkspace =>
      'お使いのTelegramは別のワークスペースに接続されています。ここで接続すると移動します。';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram：$name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'そこからのメッセージは$botに届きます。';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'そこからのメッセージは現在$otherに届きます。タップして$botに切り替えます。';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Telegramのメッセージが$botに届くようになりました。';
  }

  @override
  String get telegramFinish => 'Telegramで完了する';

  @override
  String get telegramFinishHelp =>
      'Telegramで「開始」を押してください。必ず自分のTelegramアカウントで行ってください。接続が完了すると表示が更新されます。';

  @override
  String get telegramOpenAgain => 'Telegramをもう一度開く';

  @override
  String get telegramConnected => 'Telegramが接続されました';

  @override
  String telegramConnectedHelp(String name) {
    return '$nameとして接続しました。いつでもTelegramからボットにメッセージを送れます。会話はこちらの「一般」にも表示されます。';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'いつでもTelegramからボットにメッセージを送れます。会話はこちらの「一般」にも表示されます。';

  @override
  String get telegramConnect => 'Telegramを接続';

  @override
  String get telegramDisconnect => 'Telegramを切断';

  @override
  String get telegramDisconnectConfirm => 'Telegramを切断しますか？';

  @override
  String get telegramDisconnectHelp =>
      'ボットはTelegramでの返信を停止します。チャット履歴はこちらに残ります。';

  @override
  String get telegramPickBot => 'Telegramメッセージの送信先';

  @override
  String get telegramNeedsBot => '先にボットを作成してからTelegramを接続してください。';

  @override
  String get telegramNotOffered =>
      'このサーバーには専用のTelegramボットがありません。各ボットの「チャットアプリ」から自分のボットを接続できます。';

  @override
  String get chatAppsSettingsHelp =>
      '普段お使いのチャットアプリからボットと話せます。メッセージは「一般」チャットに届くため、ここでもやり取りを続けられます。';

  @override
  String get chatAppsPerBot =>
      'メールと自分のボットはボットごとに設定します：ボットを開いて「チャットアプリ」を選んでください。';

  @override
  String get chatAppsRowHelp => 'Telegram、Discord、Slackなど';

  @override
  String get chatAppsSlackHelp =>
      'SlackはSlackワークスペース単位で1体のボットに追加します。ボットを選んでから「Slackに追加」を押してください。';

  @override
  String get chatAppsSlackPickBot => 'Slackを追加する対象';

  @override
  String get slackAnyoneInWorkspace => 'このSlackワークスペースの全員';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      '一覧にある人だけでなく、ワークスペース内の全員がボットと話せます。ただし承認には一覧のユーザーが必要です。';

  @override
  String get discordUseCasama => 'CasamaのDiscordボットを使う';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Discordで$botと話せます。最初に一度Discordでサインインすれば、どこでもボットにメッセージしたり/askを使ったりできます。';
  }

  @override
  String get discordOtherWorkspace =>
      'お使いのDiscordは別のワークスペースに接続されています。ここで接続すると移動します。';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord：$name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Discordのメッセージが$botに届くようになりました。';
  }

  @override
  String get discordFinish => 'Discordで完了する';

  @override
  String get discordFinishHelp =>
      'ブラウザーでDiscordにサインインしてCasamaを許可してください。必ず自分のDiscordアカウントで行ってください。接続が完了すると表示が更新されます。';

  @override
  String get discordOpenAgain => 'Discordサインインをもう一度開く';

  @override
  String get discordConnected => 'Discordが接続されました';

  @override
  String discordConnectedHelp(String name) {
    return '$nameとして接続しました。DiscordでCasamaボットにメッセージするか、どこでも/askを使えます。会話はこちらの「一般」にも表示されます。';
  }

  @override
  String get discordConnectedHelpPlain =>
      'DiscordでCasamaボットにメッセージするか、どこでも/askを使えます。会話はこちらの「一般」にも表示されます。';

  @override
  String get discordConnect => 'Discordを接続';

  @override
  String get discordDisconnect => 'Discordを切断';

  @override
  String get discordDisconnectConfirm => 'Discordを切断しますか？';

  @override
  String get discordDisconnectHelp => 'ボットはDiscordでの返信を停止します。チャット履歴はこちらに残ります。';

  @override
  String get discordPickBot => 'Discordメッセージの送信先';

  @override
  String get discordNeedsBot => '先にボットを作成してからDiscordを接続してください。';

  @override
  String get discordNotOffered =>
      'このサーバーには専用のDiscordアプリがありません。各ボットの「チャットアプリ」から自分のDiscordアプリを接続できます。';

  @override
  String get inactiveAccountsNote =>
      'Casamaを使わなくなった場合：30日経つと、また使い始めるまでルーティンとウォッチャーが一時停止します。6か月後にコンピューターの保存ファイルが削除され、12か月後（お支払いをしたことがある場合は24か月後）にアカウントが削除されます。何かを削除する前に、必ずメールでお知らせします。有料プランのアカウントが影響を受けることはありません。';

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
  String get inactivityModeOff => 'オフ';

  @override
  String get inactivityModeReport => 'レポート';

  @override
  String get inactivityModeOn => 'オン';

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
    return '最終アクティブ：$when';
  }

  @override
  String get inactivityStateResting => '休止中';

  @override
  String get inactivityStateFilesSoon => 'まもなくファイル削除';

  @override
  String get inactivityStateRemovalSoon => 'まもなく削除';

  @override
  String get inactivityStateRemoving => '削除処理中';

  @override
  String get inactivityKept => '保持';

  @override
  String get keepAccount => 'このアカウントを保持する';

  @override
  String get keepAccountHelp => '未使用による休止や削除の対象にしません';

  @override
  String get computerFilesRemoved => '保存ファイルを削除しました';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'このコンピューターは6か月間使われなかったため、保存ファイルは$dateに削除されました。新しい状態で起動します。';
  }

  @override
  String get downloadSavedFiles => '保存ファイルをダウンロード';

  @override
  String get downloadSavedFilesHelp => '起動せずにホームフォルダーの.tar.gzを取得します';

  @override
  String get liveActivity => 'ライブアクティビティ';

  @override
  String get liveRowHelp => '順番待ち、登録、ダウンロードをリアルタイム表示';

  @override
  String get liveRefresh => '更新';

  @override
  String get liveTabActivity => 'アクティビティ';

  @override
  String get liveTabAlerts => 'アラート';

  @override
  String get liveGroupAll => 'すべて';

  @override
  String get liveGroupWaitlist => '順番待ち';

  @override
  String get liveGroupAccounts => 'アカウント';

  @override
  String get liveGroupMoney => 'マネー';

  @override
  String get liveGroupWebsite => 'Webサイト';

  @override
  String get liveGroupGrowth => 'グロース';

  @override
  String get liveGroupSupport => 'サポート';

  @override
  String get liveKindWaitlistJoined => '順番待ちに登録';

  @override
  String get liveKindWaitlistAdmitted => '順番待ちから招待承認';

  @override
  String get liveKindSignup => '新規アカウント';

  @override
  String get liveKindSignupRefused => '登録見送り';

  @override
  String get liveKindFirstChat => '初回チャット';

  @override
  String get liveKindMilestone => 'その他の初回利用（ボット、コンピューター、通話、ルーティン）';

  @override
  String get liveKindSubscription => '新規サブスクリプション';

  @override
  String get liveKindSubscriptionEnded => 'サブスクリプション終了';

  @override
  String get liveKindPurchase => 'クレジット購入';

  @override
  String get liveKindSupportTicket => 'サポートチケット';

  @override
  String get liveKindFeedback => 'フィードバック';

  @override
  String get liveKindAccountDeleted => 'アカウント削除';

  @override
  String get liveKindDownloadClick => 'ダウンロードクリック';

  @override
  String get liveKindQrOpen => 'ダウンロードQRコード表示';

  @override
  String get liveKindStartClick => '「無料で始める」クリック';

  @override
  String get liveKindInviteOpen => '招待リンクを開く';

  @override
  String get liveNow => '今';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes分前';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours時間前';
  }

  @override
  String get liveTestSent => 'デバイスにテストアラートを送信しました';

  @override
  String get liveTodayWaitlist => '今日の登録';

  @override
  String get liveTodaySignups => '今日のアカウント';

  @override
  String get liveTodayDownloads => '今日のダウンロード';

  @override
  String get liveTodayMoney => '今日の売上';

  @override
  String get liveRetry => '再試行';

  @override
  String get liveEmpty => 'まだ何もありません。新しい動きがあると数秒以内にここへ表示されます。';

  @override
  String get liveOlder => '以前の項目を表示';

  @override
  String get liveAlertsHelp =>
      'スマートフォン、Mac、ブラウザーにプッシュ通知する項目を選びます。同時に多く発生した場合は個別の通知ではなく1通のまとめが届きます。';

  @override
  String get livePauseAll => 'すべてのアラートを一時停止';

  @override
  String get livePauseAllHelp => 'アクティビティはここへ引き続き表示されます';

  @override
  String get liveSendTest => 'テストアラートを送信';

  @override
  String get liveSendTestHelp => 'このデバイスにアラートが届くか確認します';

  @override
  String get liveAlertsFooter =>
      'おやすみ時間（設定 → 通知）中はアラートを保留し、終了後に1つのまとめとして届きます。ブラウザーではこのサイトの通知を許可すると受け取れます。';

  @override
  String get liveStatusOn => 'ライブ：数秒ごとに更新中';

  @override
  String get liveStatusPaused => 'ライブ（アラート一時停止中）';

  @override
  String get liveGroupApp => 'アプリ';

  @override
  String get liveKindAppFirstOpen => 'アプリ初回起動';

  @override
  String get liveKindAppReinstall => 'アプリ再インストール';

  @override
  String get liveKindSigninStarted => 'サインイン開始';

  @override
  String get liveKindTrialStarted => 'トライアル開始';

  @override
  String get liveKindRenewal => 'サブスクリプション更新';

  @override
  String get liveKindRefund => '返金';

  @override
  String get liveKindDisputeOpened => '異議申し立て発生';

  @override
  String get liveKindPlanCancelFailed => 'プラン未解約';

  @override
  String get liveKindStoreReview => 'ストアレビュー';

  @override
  String get liveKindStoreCrashes => 'ストアクラッシュレポート';

  @override
  String get liveKindDay2Return => '2日目に復帰';

  @override
  String get liveKindWeek1Return => '1週目に復帰';

  @override
  String get liveKindDeviceGone => 'アプリ削除の可能性';

  @override
  String get liveKindPartnerInterest => 'クリエイターがPartnersに関心';

  @override
  String get liveKindCreatorOpen => 'クリエイターリンク開封';

  @override
  String get liveKindPartnerClaimed => 'クリエイターコード使用';

  @override
  String get liveKindGiftOpen => 'ギフトリンク開封';

  @override
  String get liveKindCompRedeemed => 'ギフトプラン引き換え';

  @override
  String get liveKindReferralRewarded => '招待が成立';

  @override
  String get liveKindNewsletterConfirmed => 'ニュースレター登録';

  @override
  String get liveKindTestimonialSubmitted => 'レビュー待ちの声';

  @override
  String get liveDailyDigest => '朝のサマリー';

  @override
  String get liveDailyDigestHelp => '昨日のファネルとダウンロード（あなたのタイムゾーンで9時）';

  @override
  String get liveFunnelClicks => 'クリック';

  @override
  String get liveFunnelOpens => '初回起動';

  @override
  String get liveFunnelSignups => 'アカウント';

  @override
  String get liveFunnelChats => '初回チャット';

  @override
  String get liveFunnelPaying => '有料化';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label・$percent%';
  }

  @override
  String get liveByPerson => 'ユーザー別';

  @override
  String get liveSearch => 'メール、国、流入元を検索';

  @override
  String get liveNoMatches => '検索に一致するものがありません';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countステップ',
      one: '1ステップ',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => '推定';

  @override
  String get liveStepClick => 'ダウンロードをクリック';

  @override
  String get liveStepOpen => 'アプリを開く';

  @override
  String get liveStepSignup => 'アカウントを作成';

  @override
  String get liveStepChat => '初回チャット';

  @override
  String get liveStepPaying => '課金中';

  @override
  String get liveJourneyTitle => '経緯';

  @override
  String get liveJourneyVisitor => '訪問者';

  @override
  String get liveJourneyWho => 'ユーザー';

  @override
  String get liveJourneyFrom => '流入元';

  @override
  String get liveJourneyDevice => 'デバイス';

  @override
  String get liveJourneyTimeline => 'タイムライン';

  @override
  String get liveJourneyNow => '現在';

  @override
  String get liveJourneySource => 'ソース';

  @override
  String get liveJourneyCampaign => 'キャンペーン';

  @override
  String get liveJourneyLanding => '最初のページ';

  @override
  String get liveJourneyClickedFrom => 'クリック元';

  @override
  String get liveJourneyPlatform => 'プラットフォーム';

  @override
  String get liveJourneyStore => '流入';

  @override
  String get liveJourneyVersion => 'バージョン';

  @override
  String get liveJourneyCountry => '国';

  @override
  String get liveJourneyLikelyHelp =>
      'リンクではなくデバイス、国、時刻からWebサイトのクリックと照合した情報です。目安としてご覧ください。';

  @override
  String get liveJourneyPlan => 'プラン';

  @override
  String get liveJourneyMessages => '送信メッセージ数';

  @override
  String get liveJourneyBots => 'ボット';

  @override
  String get liveJourneyDevices => 'サインイン中の端末';

  @override
  String get liveJourneyLastActive => '最終アクティブ';

  @override
  String get liveJourneyJoined => 'アカウント作成日';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap後';
  }

  @override
  String get liveJourneyNone => 'このユーザーについてわかっている情報はまだありません。';

  @override
  String get liveJourneyCopyEmail => 'メールをコピー';

  @override
  String get liveJourneyCopied => 'メールをコピーしました';

  @override
  String get liveJourneyOpenAdmin => '管理画面で開く';

  @override
  String get liveJourneyGone => '30日より前のデータのため、詳細は削除されています。';

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
  String get planChangeTitle => 'プラン変更の確認';

  @override
  String planChangeSwitchTo(String plan) {
    return '$planへ切り替え';
  }

  @override
  String get planChangeChargedNow => '今回の請求額';

  @override
  String planChangeTaxIncluded(String tax) {
    return '税金$tax込み';
  }

  @override
  String get planChangeCredit => '未使用期間分の充当額';

  @override
  String planChangeThen(String amount, String period) {
    return '次回から$amount/$period（税抜）';
  }

  @override
  String planChangeNextBilling(String date) {
    return '次回請求日：$date';
  }

  @override
  String get planChangeConfirmAndPay => '確定して支払う';

  @override
  String get planChangeHaveCode => 'コードをお持ちですか？';

  @override
  String get planChangeCodeLabel => '割引コード';

  @override
  String get planChangeCodeHint => 'コードを入力';

  @override
  String get planChangeApply => '適用';

  @override
  String get planChangeRemove => '削除';

  @override
  String get planChangeDiscountApplied => '割引を適用しました';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return '毎回の更新で$percent%オフ';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '更新$count回分が$percent%オフ',
      one: '更新1回分が$percent%オフ',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return '毎回の更新で$amountオフ';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '更新$count回分が$amountオフ',
      one: '更新1回分が$amountオフ',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return '毎回の更新で$percent%オフ（再びプラン変更すると終了）';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return '毎回の更新で$amountオフ（再びプラン変更すると終了）';
  }

  @override
  String get planChangeInvalidCode => 'そのコードはこのプランでは使えません。';

  @override
  String get planChangeCodeCostsMore => 'このコードを使うと現在の割引が置き換わり、支払い額が増えてしまいます。';

  @override
  String get planChangeCodeEndsLasting => 'このコードを使うと現在の継続割引が終了します。';

  @override
  String get planChangeCodeNotBetter => 'すでに同等以上の割引が適用されています。';

  @override
  String planChangeReplacesPercent(String percent) {
    return '現在の$percent%割引を置き換えます';
  }

  @override
  String get planChangeReplacesDiscount => '現在の割引を置き換えます';

  @override
  String get planChangePriceMoved =>
      '画面を開いてから合計金額が変わりました。新しい金額を確認してもう一度確定してください。';

  @override
  String get planChangePeriodWeek => '週';

  @override
  String get planChangePeriodMonth => '月';

  @override
  String get planChangePeriodYear => '年';

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
  String get partnerProgramTitle => '動画・記事・ニュースレターを発信していますか？';

  @override
  String get partnerProgramSubtitle => '紹介した方の支払い額の30%を1年間獲得できます';

  @override
  String get partnerYourCode => 'あなたのクリエイターコード';

  @override
  String get partnerPaused => '一時停止中';

  @override
  String get partnerPortal => '収益と支払い';

  @override
  String partnerShareText(String link, String code) {
    return 'あなたのために働くAIチームメイト、Casamaを使ってみませんか？登録時にコード$codeを入力してください：$link';
  }

  @override
  String partnerSentBy(String name) {
    return '$nameさんからのCasama紹介です。';
  }

  @override
  String get partnerClaimed => 'クリエイターコードを追加しました。Casamaへようこそ！';

  @override
  String partnerClaimedFrom(String name) {
    return '$nameさんの応援ありがとうございます。Casamaへようこそ！';
  }

  @override
  String get partnerErrNotFound => 'そのクリエイターコードは存在しません。確認してもう一度お試しください。';

  @override
  String get partnerErrOwnCode => 'これは自分のコードです。代わりに、フォロワーに共有してください。';

  @override
  String get partnerErrWindowClosed => 'クリエイターコードは登録後最初の数日間のみ入力できます。';

  @override
  String get partnerErrAlreadyPaying => 'クリエイターコードは初回お支払い前の新規アカウント向けです。';

  @override
  String get partnerErrAlready => 'すでにクリエイターコードを入力済みです。';

  @override
  String get partnerErrReferred => '友人からの招待で参加したため、クリエイターコードは追加できません。';

  @override
  String get partnerErrOff => 'このサーバーではクリエイターコードを利用できません。';

  @override
  String get referralHaveCodeAny => 'コードをお持ちですか？';

  @override
  String get referralCodeHintAny => '友人またはクリエイターのコード';

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
  String get testimonialStateLive => '公開中';

  @override
  String get testimonialStateDraft => '下書き';

  @override
  String get testimonialStateHidden => '非表示';

  @override
  String get testimonialStateWithdrawn => '取り下げ済み';

  @override
  String get testimonialPlaceSiteHome => 'casama.aiホーム';

  @override
  String get testimonialPlaceSitePricing => 'casama.ai料金ページ';

  @override
  String get testimonialPlaceAppPaywall => 'アプリ内プラン画面';

  @override
  String get testimonialPlaceAppSignin => 'アプリ内サインイン画面';

  @override
  String get testimonialSourceEmail => 'メール';

  @override
  String get testimonialSourceInApp => 'アプリ内';

  @override
  String get testimonialSourceOther => 'その他';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '星$countつ',
      one: '星1つ',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'Casama利用者の声';

  @override
  String get testimonialAskTitle => 'Casamaを気に入りましたか？';

  @override
  String get testimonialAskSubtitle => 'ひとことで感想を教えてください。';

  @override
  String get testimonialAskHint => 'どこが気に入っていますか？';

  @override
  String testimonialAskConsent(String name) {
    return 'この感想を「$name」として、casama.aiとアプリ内に引用掲載することに同意します';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'この感想をCasamaユーザーとして、casama.aiとアプリ内に引用掲載することに同意します';

  @override
  String get testimonialAskSend => '送信';

  @override
  String get testimonialAskNotNow => '今はしない';

  @override
  String get testimonialAskThanks => 'ありがとうございます！すべて目を通しています。';

  @override
  String get communityTitle => 'コミュニティ';

  @override
  String get communitySentence =>
      'Casamaはオープンソースです。役に立ったら、GitHubでスターを付けていただけるとほかの人にも見つけてもらいやすくなります。';

  @override
  String get communityStarOnGitHub => 'GitHubでスターを付ける';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp => 'チームやほかのCasamaユーザーとチャットする';

  @override
  String get starAskTitle => 'GitHub上のCasama';

  @override
  String get starAskNotNow => '今はしない';

  @override
  String get cloudSignInTitle => 'Casamaアカウントでサインイン';

  @override
  String get cloudSignInBody =>
      '無料の個人用ライセンスはCasamaアカウントから発行されます。このサーバーに送られるのはライセンスのみで、チャットはこのサーバー内に留まります。';

  @override
  String get cloudSignInEmail => 'メールアドレス';

  @override
  String get cloudSignInSendCode => 'コードを送信';

  @override
  String get cloudSignInCode => 'メールに届いたコード';

  @override
  String get cloudSignInVerify => 'サインイン';

  @override
  String cloudSignInCodeSent(String email) {
    return '$emailにコードを送信しました。ここに入力してください。';
  }

  @override
  String get licenseSetupTitle => '無料の個人用ライセンスを取得';

  @override
  String get licenseSetupBody =>
      'ボットを実行するにはこのサーバーにライセンスが必要です。1人での個人利用は無料です。Casamaアカウントでサインインすると、ライセンスは30日ごとにオンラインで自動更新されます。';

  @override
  String get licensePersonalButton => '無料の個人用ライセンスを取得';

  @override
  String get licensePersonalNote => '個人用：1名、個人利用のみ、自分のコンピューターまたはサーバー向け。';

  @override
  String get licenseBusinessTitle => 'またはビジネスキーを入力';

  @override
  String get licenseBusinessHint => 'ライセンスキーを貼り付け';

  @override
  String get licenseBusinessSave => 'このキーを使う';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return '仕事やチームでCasamaをお使いですか？Businessはアクティブユーザー1名あたり月額$monthlyPrice（年払いの場合は月額$yearlyMonthlyPrice）です。$emailまでお問い合わせください。';
  }

  @override
  String get licenseActivated => 'ライセンスが有効になりました。ボットを実行できます。';

  @override
  String get licenseOtherServer => '別のサーバーを使う';

  @override
  String get licenseRenew => '更新する';

  @override
  String get licenseRenewTitle => 'このサーバーのライセンスを更新';

  @override
  String licenseGraceBanner(String date) {
    return 'このサーバーのライセンスが切れています。$dateまではボットが引き続き動作します。それまでに更新してください。';
  }

  @override
  String get licenseGraceBannerSoon =>
      'このサーバーのライセンスが切れています。ボットを動かし続けるには早めに更新してください。';

  @override
  String get licenseExpiredBanner =>
      'このサーバーのライセンスが期限切れのため、新しいボットの実行は一時停止しています。データは安全に保護されており、サインインや閲覧、エクスポートは引き続き行えます。ボットを再開するには更新してください。';

  @override
  String get licenseErrorRequired =>
      'このサーバーにはまずライセンスが必要です。無料の個人用ライセンスを取得するか、ビジネスキーを入力してください。';

  @override
  String licenseErrorSeats(String email) {
    return 'このサーバーのライセンス座席数がすべて埋まっています。人数を増やすにはビジネスライセンスが必要です：$emailまでご連絡ください。';
  }

  @override
  String get licenseErrorExpired =>
      'このサーバーのライセンスが期限切れのため、新しいボットの実行は一時停止しています。データは安全です。ボットを再開するにはライセンスを更新してください。';

  @override
  String get licenseEditionPersonal => '個人用';

  @override
  String get licenseEditionTrial => 'トライアル';

  @override
  String get licenseEditionBusiness => 'ビジネス';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => '監査エクスポート';

  @override
  String get licenseFeatureAuditForwarding => '監査転送';

  @override
  String get licenseFeatureRoles => '高度なロール';

  @override
  String get setupLicenseTitle => '無料の個人用ライセンス';

  @override
  String get setupLicenseBody =>
      'Casamaアカウントでサインインしてこのサーバー用の無料個人用ライセンスを取得します（1名・個人利用）。あとから行うこともできます。';

  @override
  String get setupLicenseSignIn => 'Casamaでサインイン';

  @override
  String get setupLicenseReady => '無料の個人用ライセンスはこのサーバーに付属します。';

  @override
  String setupLicenseReadyFor(String email) {
    return '$emailとしてサインイン済みです。無料の個人用ライセンスはこのサーバーに付属します。';
  }

  @override
  String get setupLicenseSkipped => 'ライセンスはまだありません。起動時にサーバーがライセンスを求めます。';

  @override
  String setupLicenseFailed(String error) {
    return '個人用ライセンスを作成できませんでした（$error）。起動時にサーバーがライセンスを求めます。';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'CasamaのサーバーはDocker Desktop内で動作します。WSL 2を使ってPCのほかの環境から分離して動かす無料アプリです。';

  @override
  String get setupDockerStep1Windows =>
      'ダウンロードされたインストーラーを実行し、「Use WSL 2」をオンのままにしてください。';

  @override
  String localUpdateAvailable(String version) {
    return 'サーバーのアップデートがあります：$version';
  }

  @override
  String get localUpdateButton => 'アップデート';

  @override
  String get localUpdateLater => 'あとで';

  @override
  String localUpdateTitle(String version) {
    return 'サーバーを$versionにアップデート';
  }

  @override
  String get localUpdateBody =>
      '最初にデータベースをバックアップします。新しいバージョンが起動しない場合は、現在のバージョンに戻ります。';

  @override
  String localUpdateDone(String version) {
    return '$versionにアップデートしました。';
  }

  @override
  String get localUpdateRolledBack =>
      '新しいバージョンが起動しなかったため、サーバーは元のバージョンに戻りました。データは一切失われておらず、データベースのバックアップも保存されています。';

  @override
  String localUpdateFailed(String detail) {
    return 'アップデートに失敗しました：$detail';
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
  String get shCloudScreenTitle => 'Casama Cloudモデル';

  @override
  String get shCloudPitch => 'キー管理なしで使えるCasamaのモデルです。Casama Cloudのプランで支払います。';

  @override
  String get shCloudTurnOn => 'オンにする';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'オン・$workspaceが支払い';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud（$workspaceが支払い）';
  }

  @override
  String get shCloudMemberOff => 'オフです。オンにできるのはこのサーバーの管理者だけです。';

  @override
  String get shCloudManage => '管理';

  @override
  String get shCloudSignInBody =>
      'Casama Cloudモデルの支払い元を選ぶにはCasamaアカウントでサインインしてください。ボット、チャット、メモリーはこのサーバー内に留まります。';

  @override
  String shCloudSignedInAs(String email) {
    return 'Casama Cloudに$emailとしてサインイン済み';
  }

  @override
  String get shCloudOtherAccount => '別のアカウントを使う';

  @override
  String get shCloudContinue => '続ける';

  @override
  String get shCloudPayerTitle => '支払い元';

  @override
  String get shCloudPayerBody =>
      'Casama Cloudモデルの料金は、あなたが所有または管理するCasama Cloudワークスペースが支払います。プラン、含まれる利用枠、1日の上限はほかの利用分と共有されます。';

  @override
  String get shCloudPayerNone =>
      '管理しているCasama Cloudワークスペースがまだありません。支払い用に作成してください（空の状態で作成されます）。';

  @override
  String get shCloudCreateWorkspace => '作成する';

  @override
  String shCloudWorkspaceNamed(String name) {
    return '$nameのワークスペース';
  }

  @override
  String get shCloudNoPlan => 'まだプランがありません';

  @override
  String shCloudCovered(String plan) {
    return '$planプランの対象です。';
  }

  @override
  String get shCloudPlanTitle => 'プランを選択';

  @override
  String get shCloudPlanBody =>
      'Casama CloudのどのプランでもCasama Cloudモデルを利用できます。含まれる利用枠、1日の上限、追加チャージはCloudと同じです。セルフホスト向けの別料金はありません。';

  @override
  String get shCloudTryFirst => 'まずは試してみる';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'お試し無料枠：1つのCasamaアカウントにつき1回、約$amount分のメッセージを試せます。購入は不要です。';
  }

  @override
  String get shCloudTrialUsed =>
      'このCasamaアカウントのお試し無料枠は使い切りました。続けるにはプランを選んでください。';

  @override
  String get shCloudIntervalWeek => '週払い';

  @override
  String get shCloudIntervalMonth => '月払い';

  @override
  String get shCloudIntervalYear => '年払い';

  @override
  String get shCloudWaitingForPlan =>
      'ブラウザーで支払いを完了してください。プランが反映されるとこの画面は自動で進みます。';

  @override
  String get shCloudWaitingTimedOut => 'プランがまだ届いていません。支払いの反映には数分かかる場合があります。';

  @override
  String get shCloudCheckAgain => '再確認';

  @override
  String get shCloudGiftCode => 'ギフトコードをお持ちですか？';

  @override
  String get shCloudGiftCodeLabel => 'ギフトコード';

  @override
  String get shCloudRedeem => '引き換える';

  @override
  String get shCloudNoWayToBuy =>
      'このアプリではプランを購入できません。同じアカウントを使ってcasama.aiで購入してから、ここで再確認してください。';

  @override
  String get shCloudPurchasePending => '購入は承認待ちです。完了すると自動的に進みます。';

  @override
  String get shCloudPurchaseFailed => '購入は完了しませんでした。請求は発生していません。';

  @override
  String get shCloudConnecting => 'このサーバーをCasama Cloudに接続中…';

  @override
  String get shCloudLoading => '読み込み中…';

  @override
  String get shCloudReviewTitle => 'オンにする前に確認';

  @override
  String get shCloudReviewPays => '支払い元';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$workspaceの$plan（$email）';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return '$workspaceでのお試し無料枠（$email）';
  }

  @override
  String get shCloudReviewBots => '切り替えるボット';

  @override
  String get shCloudReviewAll => 'すべてのボット';

  @override
  String get shCloudReviewNoKey => '有効なキーがないボットのみ';

  @override
  String get shCloudReviewPick => 'ボットを選択';

  @override
  String get shCloudReviewNoBots =>
      'このサーバーにはまだボットがいません。新しいボットからCasama Cloudを使えます。';

  @override
  String get shCloudReviewDefault => '新しいボットもCasama Cloudを使う';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model（Casama Cloud）';
  }

  @override
  String get shCloudCloudModel => 'Casama Cloudのモデル';

  @override
  String get shCloudNoKeyYet => '有効なキーがありません';

  @override
  String shCloudStepDown(String from) {
    return '$fromよりも返答が短くなったり慎重さが下がったりする場合があります。まずは1体のボットでお試しください。';
  }

  @override
  String get shCloudReviewJobs => 'メモリー、画像、音声';

  @override
  String get shCloudJobMemory => 'メモリー検索';

  @override
  String get shCloudJobImages => '画像';

  @override
  String get shCloudJobTts => '読み上げ';

  @override
  String get shCloudJobStt => '音声入力';

  @override
  String get shCloudJobOwnKey => '自分のキー';

  @override
  String get shCloudJobMemoryOptIn => 'メモリーにもCasama Cloudを使う';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'メモリーはバックグラウンドでインデックスを作り直します。その間も検索は引き続き使えます。';

  @override
  String get shCloudJobLiveNote => 'リアルタイム音声通話、電話、ビデオでは引き続き自分のキーを使います。';

  @override
  String get shCloudWhatGoes => 'Casama Cloudに送信される内容';

  @override
  String get shCloudReviewPrivacy =>
      'モデルへのメッセージはCasama Cloudを通過しますが保存されません。利用状況（モデル、トークン、コスト）はCloudの請求書に表示されます。ボット、チャット、メモリー、ファイル、コンピューターはこのサーバー内に留まります。';

  @override
  String get shCloudWhatGoesLink => 'このサーバーが送信する内容';

  @override
  String get shCloudFallback => 'Casama Cloudが上限に達したときや接続できないときは自分のキーを使う';

  @override
  String get shCloudFallbackHelp => '自分のキーによる回答にはその旨が表示されます。';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return 'このサーバーを$usedString名が利用しており、$planプランに含まれるのは$seatsString名までです。追加の1名ごとにCasama Cloudの追加ユーザー料金が請求されます。';
  }

  @override
  String get shCloudApply => 'Casama Cloudをオンにする';

  @override
  String get shCloudPickOne => '少なくとも1体のボットを選ぶか、新しいボットで使えるようにしてください。';

  @override
  String get shCloudPolicyTitle => '利用を許可するユーザー';

  @override
  String get shCloudPolicyEveryone => 'このサーバーの全員';

  @override
  String get shCloudPolicyChosen => '選択したユーザーのみ';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString名を選択中',
      one: '1名を選択中',
      zero: 'まだ誰も選ばれていません',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => '1人あたりの1日の上限';

  @override
  String get shCloudNoLimit => '上限なし';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '1日あたり$amount';
  }

  @override
  String get shCloudPolicySaved => '保存しました';

  @override
  String get shCloudDoneTitle => 'Casama Cloudがオンになりました';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString体のボットがCasama Cloudを使うようになりました。',
      one: '1体のボットがCasama Cloudを使うようになりました。',
      zero: '新しいボットからCasama Cloudを使います。',
    );
    return '$_temp0利用状況はこのサーバーの「利用状況」画面とCloudの請求書に表示されます。';
  }

  @override
  String shCloudSayHi(String bot) {
    return '$botに挨拶する';
  }

  @override
  String get shCloudDone => '完了';

  @override
  String get shCloudUsageTitle => '利用状況';

  @override
  String shCloudIncludedLeft(String amount) {
    return '今月の付属利用枠の残り：$amount';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return '今日：$cap中$spend';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return '今日：$spend';
  }

  @override
  String shCloudCredits(String amount) {
    return 'クレジット残高：$amount';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return 'お試し無料枠の残り：$amount';
  }

  @override
  String get shCloudPriceNote =>
      'Casama Cloudの料金単価で計算されます。該当する呼び出しはCloudの請求書にこのサーバー名で記載されます。';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'あなたの今日：$limit中$spend';
  }

  @override
  String get shCloudWarnIncluded => 'Casama Cloudで今月の付属利用枠の80%を使いました。';

  @override
  String get shCloudWarnDaily => 'Casama Cloudで今日の上限の80%を使いました。';

  @override
  String get shCloudTopUp => '追加チャージ';

  @override
  String get shCloudUseOwnKey => '自分のキーを使う';

  @override
  String get shCloudStopOutOfCredits => '今月のCasama Cloudの利用枠を使い切りました。';

  @override
  String shCloudStopDailyCap(String time) {
    return '今日のCasama Cloudの上限に達しました。$timeにリセットされます。';
  }

  @override
  String get shCloudStopDailyCapSoon => '今日のCasama Cloudの上限に達しました。明日リセットされます。';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloudを使うには、$workspaceにプランが必要です。';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return '$workspaceのCasama Cloudプランが終了しました。';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return '$workspaceのプランはここでCasama Cloudを利用している全員分をカバーしていません。';
  }

  @override
  String get shCloudStopMemberLimit => 'このサーバーでの今日のCasama Cloud上限に達しました。';

  @override
  String get shCloudStopMemberNotAllowed =>
      '管理者はまだ、あなたにCasama Cloudの利用を許可していません。';

  @override
  String get shCloudStopDisconnected => 'このサーバーからCasama Cloudが切断されました。';

  @override
  String get shCloudStopUnreachable => '現在Casama Cloudに接続できません。再試行しています。';

  @override
  String get shCloudSeePlans => 'プランを見る';

  @override
  String get shCloudRenew => '更新する';

  @override
  String get shCloudAskAdmin => '管理者に依頼';

  @override
  String get shCloudAskAdminBody =>
      'Casama Cloudを変更できるのはこのサーバーの管理者だけです。管理者に依頼してください。問題が解消されればボットとルーティンは自動で再開します。';

  @override
  String get shCloudReconnect => '再接続';

  @override
  String get shCloudFallbackActive => 'その間は自分のキーで回答しており、各回答にその旨が表示されます。';

  @override
  String get shCloudUseOwnKeyTitle => 'その間、自分のキーを使いますか？';

  @override
  String get shCloudUseOwnKeyBody =>
      'Casama Cloudが応答できない間は、ボットが自分のキーで回答し、該当する各回答にその旨が表示されます。この画面でいつでもオフにできます。';

  @override
  String get shCloudAddKeyFirst => '先にモデル画面で自分のキーを追加してください。';

  @override
  String get shCloudRoutinesWait => 'ルーティンは待機しており、復旧すると自動で続行します。';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'メモリーを反映中：$totalString件中$doneString件';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'まだ再インデックスされていないメモリーの検索にはキーワード一致が使われます。';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'モデルへのメッセージは$workspaceが支払うCasama Cloud経由になりました。';
  }

  @override
  String get shCloudGotIt => '了解';

  @override
  String shCloudChipPaidBy(String workspace) {
    return '$workspaceが支払い';
  }

  @override
  String get shCloudPaidBy => '支払い元';

  @override
  String get shCloudChangePayer => '変更';

  @override
  String get shCloudChangeBots => 'ボットを変更';

  @override
  String get shCloudFallbackSection => 'Casama Cloudが応答できないとき';

  @override
  String get shCloudTurnOff => 'オフにする';

  @override
  String get shCloudOffTitle => 'Casama Cloudをオフにしますか？';

  @override
  String get shCloudOffBody =>
      'これらのボットは、以前のキーがまだ有効ならそちらに、そうでなければワークスペースの既定キーに戻ります。ほかに変更されるものはなく、いつでも再びオンにできます。';

  @override
  String get shCloudOffBotsNone => '現在Casama Cloudを使っているボットはありません。';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloudはオフです';

  @override
  String shCloudOffBackTo(String key) {
    return '$keyに戻りました';
  }

  @override
  String get shCloudOffNeedsKey => 'キーが必要です';

  @override
  String get shCloudAddKey => 'キーを追加';

  @override
  String get shCloudSignInAgain =>
      'Casama Cloudのサインインが切れました。続けるにはもう一度サインインしてください。';

  @override
  String get cloudAccountSection => 'Casama Cloudアカウント';

  @override
  String cloudAccountRow(String email) {
    return '$emailとしてサインイン中';
  }

  @override
  String get cloudAccountRowHelp => 'このサーバーのライセンスとCasama Cloudモデルに使用';

  @override
  String get cloudAccountSignOut => 'Casama Cloudからサインアウト';

  @override
  String get cloudAccountSignOutBody =>
      'このデバイスからCasama Cloudのサインイン情報を削除します。このサーバー、ライセンス、Casama Cloudモデルは引き続き動作します。';

  @override
  String get cloudAccountDelete => 'Casama Cloudアカウントを削除';

  @override
  String get cloudAccountDeleteHelp =>
      'Casama Cloud上のアカウントを削除します。このサーバーとそのデータは残ります。';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Casama Cloudアカウントを削除するには$emailと入力してください。あなただけが所有するクラウドワークスペースも一緒に削除され、それらのワークスペースが支払っているサーバーではCasama Cloudモデルが停止します。Webで購入したプランは自動で解約されます。App StoreまたはGoogle Playで購入したプランは解約されません。購入元のストアで解約してください。';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Casama Cloudアカウントを削除しました。データは$dateに完全に削除されます。';
  }

  @override
  String get wsMoveSettingsToCloud => 'Casama Cloudへ移動';

  @override
  String get wsMoveSettingsToServer => '自分のサーバーへ移動';

  @override
  String get wsMoveSettingsHelp => 'このワークスペースのボット、チャット、メモリー、ファイルを別のサーバーへ持ち出します';

  @override
  String get wsMoveTitle => 'このワークスペースを移動';

  @override
  String get wsMoveIntro =>
      'ボット、チャット、メモリー、ルーティン、ファイル、コンピューターまですべて移動します。移動先へ移ると、元のコピーは閲覧のみ可能となり動作を停止します。';

  @override
  String get wsMoveCloudOption => 'Casama Cloudへ移動';

  @override
  String get wsMoveCloudOptionHelp => 'Casamaアカウントでサインインして移動先を選びます。';

  @override
  String get wsMoveServerOption => '自分のサーバーへ移動';

  @override
  String get wsMoveServerOptionHelp =>
      '移動先のサーバーで「設定 › ワークスペースをここに移動」を開き、移動コードをコピーしてください。';

  @override
  String get wsMoveInstallServer => 'Casamaサーバーをインストール';

  @override
  String get wsMoveInstallServerHelp => 'まだサーバーがありませんか？まずこのコンピューター上で動かしてください。';

  @override
  String get wsMoveReceiveOption => 'ワークスペースをここに移動';

  @override
  String get wsMoveReceiveOptionHelp =>
      'このワークスペース用の移動コードを取得し、別のワークスペースがあるサーバー側で使います。';

  @override
  String get wsMoveOwnerOnly => 'ワークスペースを移動できるのはオーナーだけです。';

  @override
  String get wsMoveCloudPickTitle => 'どこへ移動しますか？';

  @override
  String get wsMoveCloudNew => '新しいワークスペース';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Casama Cloud上に「$name」という名前で空の状態から作成されます。';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      '移動された項目は既存項目の横に並びます。名前が重複する場合は「(moved)」が付きます。';

  @override
  String get wsMoveServerTitle => '自分のサーバーへ移動';

  @override
  String get wsMoveServerAddress => 'サーバーアドレス';

  @override
  String get wsMoveServerCode => '移動コード';

  @override
  String get wsMoveCheckButton => '確認';

  @override
  String get wsMoveReceiveTitle => 'ワークスペースをここに移動';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return '現在ワークスペースがあるサーバーで「設定 › 自分のサーバーへ移動」を開き、このアドレスとコードを入力してください。コードは$timeまで1回限り有効で、すべてを「$name」へ移動します。';
  }

  @override
  String get wsMoveReceiveAddress => 'このサーバーのアドレス';

  @override
  String get wsMoveReceiveCode => '移動コード';

  @override
  String get wsMoveCopy => 'コピー';

  @override
  String get wsMoveCopied => 'コピー済み';

  @override
  String get wsMoveCheckTitle => '移動の準備完了';

  @override
  String wsMoveCheckTo(String name) {
    return '移動先：$name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString分',
      one: '1分',
    );
    return 'コピー容量：$size・約$_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString分間',
      one: '1分間',
    );
    return '終盤でボットが約$_temp0一時停止し、その後移動先で再開します。';
  }

  @override
  String get wsMoveCheckLongPause => '停止時間が長めです。利用の少ない時間帯を選んでください。';

  @override
  String get wsMoveCheckComes => '一緒に移動するもの';

  @override
  String wsMoveCountBots(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'ボット$nString体',
      one: 'ボット1体',
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
      other: 'チャット$nString件',
      one: 'チャット1件',
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
      other: 'メモリー$nString件',
      one: 'メモリー1件',
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
      other: 'ルーティン$nString件',
      one: 'ルーティン1件',
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
      other: 'ファイル$nString件',
      one: 'ファイル1件',
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
      other: 'コンピューター$nString台',
      one: 'コンピューター1台',
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
      other: '$nString名',
      one: '1名',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => '移動後に確認が必要な項目';

  @override
  String wsMoveReconnect(String names) {
    return '移動先でこれらのアプリにもう一度サインインしてください：$names';
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
      other: '$nString名にメール招待が届きます',
      one: '1名にメール招待が届きます',
    );
    return '$_temp0';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name（招待済み）';
  }

  @override
  String get wsMoveChatgptPlans =>
      'ChatGPTのプランは引き継がれません。移動先でChatGPTにもう一度サインインしてください。';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'コンピューター$nString台が',
      one: 'コンピューター1台が',
    );
    return '$_temp0ホームフォルダーを復元した状態で新しく起動します。';
  }

  @override
  String get wsMoveResetNote => '承認、フルアクセス、デバイスへのアクセスは新しいサーバーの既定設定から始まります。';

  @override
  String get wsMoveBringKeys => 'キーも一緒に移動';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString個のキーも新しいサーバーだけが読み取れるように封印して移動します。',
      one: '1個のキーも新しいサーバーだけが読み取れるように封印して移動します。',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveNoKeysHelp => '移動先でモデルやチャットアプリのキーを再追加することになります。';

  @override
  String get wsMoveDoesntFit => 'このワークスペースは移動先のプランの上限を超えています';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$planなら収まります。Casama Cloudでそのプランを選んでから、もう一度確認してください。';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what：$limit中$have';
  }

  @override
  String get wsMoveOverPeople => '人数';

  @override
  String get wsMoveOverBots => 'ボット';

  @override
  String get wsMoveOverComputers => 'コンピューター';

  @override
  String get wsMoveOverStorage => 'ストレージ';

  @override
  String get wsMoveUpdateSource => '先にこのサーバーをアップデートしてください。移動先のサーバーより古いバージョンです。';

  @override
  String get wsMoveUpdateTarget => '先に移動先のサーバーのアップデートが必要です。';

  @override
  String get wsMoveStart => '移動を開始';

  @override
  String get wsMoveCheckAgain => '再確認';

  @override
  String get wsMoveProgressTitle => '移動中';

  @override
  String get wsMoveStepStarting => '準備中';

  @override
  String get wsMoveStepCopying => 'すべてを稼働させたままファイルをコピー中';

  @override
  String get wsMoveStepPausing => '最後の変更をコピーするためボットを一時停止中';

  @override
  String get wsMoveStepFinishing => 'チャット、メモリー、設定を送信中';

  @override
  String get wsMoveStepImporting => '新しいサーバーが取り込んでいます';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$total中$done';
  }

  @override
  String get wsMoveProgressLeave =>
      'アプリを閉じても大丈夫です。移動はバックグラウンドで続き、完了すると通知が届きます。';

  @override
  String get wsMoveFailedTitle => '移動が停止しました';

  @override
  String get wsMoveFailedBody => 'こちらは何も変更されていません：このワークスペースは引き続き動作します。';

  @override
  String get wsMoveTryAgain => '再試行';

  @override
  String get wsMoveNewCodeNeeded => 'もう一度試すには新しい移動コードを取得してください。';

  @override
  String get wsMoveDoneTitle => '移動完了';

  @override
  String wsMoveDoneBody(String server) {
    return 'すべて$serverに届きました。';
  }

  @override
  String get wsMoveDoneNeeds => '移動先であと少し対応が必要な項目があります：';

  @override
  String get wsMoveOpenThere => '移動先で開く';

  @override
  String wsMoveAfterReconnect(String name) {
    return '$nameにもう一度サインイン';
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
      other: '$nString名をメールで招待しました',
      one: '1名をメールで招待しました',
    );
    return '$_temp0';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return '$nameを再接続';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return '$nameの送信側に新しいWebhookアドレスを設定';
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
      other: '$nString日間',
      one: '1日間',
    );
    return 'こちらに届いたWebhookは$_temp0転送されます。';
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
      other: 'ボット$nString体',
      one: 'ボット1体',
    );
    return '$_temp0の承認設定を確認';
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
      other: 'ボット$nString体',
      one: 'ボット1体',
    );
    return '設定でCasama Cloudモデルを接続するか、$_temp0に別のモデルを選択';
  }

  @override
  String get wsMoveAfterKeys => '移動先でモデルキーを追加';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString件の項目が',
      one: '1件の項目が',
    );
    return '$_temp0「(moved)」に名前変更されました';
  }

  @override
  String get wsMoveAfterReindex => 'メモリー検索は数分で追いつきます。';

  @override
  String get wsMoveAfterNothing => 'ほかに必要な作業はありません。';

  @override
  String get wsMoveSubTitle => 'サブスクリプション';

  @override
  String get wsMoveSubToCloud =>
      'Casama Cloud上のボットはCloudプランで動作します。このサーバー用にビジネスライセンスをお支払い中の場合は、不要になった時点で解約してください。';

  @override
  String get wsMoveSubFromCloud =>
      'Casama Cloudプランは自動更新が継続します。自分のサーバーへの移行が落ち着いたら解約してください。';

  @override
  String get wsMoveSubManage => 'プランを管理';

  @override
  String get wsMovedTitle => 'このワークスペースは移動しました';

  @override
  String get wsMovedBodyCloud =>
      '現在はCasama Cloud上にあります。続けるにはそちらでサインインしてください。このコピーは読み取り専用です。';

  @override
  String wsMovedBodyServer(String host) {
    return '現在は$host上にあります。続けるにはそちらでサインインしてください。このコピーは読み取り専用です。';
  }

  @override
  String get wsMovedSignInCloud => 'Casama Cloudにサインイン';

  @override
  String wsMovedOpenServer(String host) {
    return '$hostを開く';
  }

  @override
  String get wsMovedViewOld => '古いコピーを表示';

  @override
  String get languageDevice => 'デバイスの言語';

  @override
  String get shortcutQuickAsk => 'クイック質問';

  @override
  String shortcutAskBot(String name) {
    return '$nameに質問';
  }

  @override
  String shortcutRunRoutine(String name) {
    return '$nameを実行';
  }

  @override
  String get settingsWordsWorkspace =>
      'ワークスペース 切り替え 変更 チーム 組織 ロール 権限 workspace switch team org';

  @override
  String get settingsWordsAboutYou =>
      'プロフィール 名前 写真 画像 アバター 代名詞 自己紹介 返信スタイル 事実 メモリー profile name photo avatar memory';

  @override
  String get settingsWordsPeople =>
      'メンバー 招待 チーム ユーザー 管理者 ロール 招待リンク 招待コード 参加 削除 members invite team users admins roles';

  @override
  String get settingsWordsWorkspaceSettings =>
      'ワークスペース 名前 アイコン ロゴ 暗号化 メモリー 支払い stripe カード パスワードマネージャー ボット間 chrome 拡張機能 ギャラリー フルアクセス 権限 承認 確認 スキップ workspace name encryption memory payments gallery approvals';

  @override
  String get settingsWordsSettingsDomains =>
      'ドメイン webサイト サイト カスタム dns 購入 接続 domain website custom dns buy connect sites';

  @override
  String get settingsWordsUsage =>
      'コスト 支出 費用 お金 クレジット 上限 制限 cost spend money credits limits';

  @override
  String get settingsWordsBilling =>
      'プラン サブスクリプション アップグレード pro plus max 支払い 請求書 カード 料金 価格 plan subscription upgrade invoice pricing';

  @override
  String get settingsWordsInviteFriends =>
      '紹介 クレジット 報酬 共有 referral credit reward share';

  @override
  String get settingsWordsAdminConsole => '管理者 管理コンソール コンソール admin console';

  @override
  String get settingsWordsAppearance =>
      'テーマ ダークモード ライトモード 夜 色 カラー フォント 文字サイズ 背景 壁紙 スタイル 効果 モーション アニメーション theme dark light colors fonts wallpaper look style 触覚 バイブ バイブレーション 振動 フィードバック トラックパッド haptics vibration vibrate feedback trackpad';

  @override
  String get settingsWordsQuietHours =>
      'おやすみモード 通知オフ 睡眠 ミュート 消音 通知 スケジュール do not disturb dnd sleep mute silence notifications';

  @override
  String get settingsWordsPushPrefsTitle =>
      '通知 プッシュ アラート 返信 サウンド 音 notifications push alerts replies sounds';

  @override
  String get settingsWordsCallFullScreenTitle =>
      '通話 電話 着信 鳴る ロック画面 全画面 着信応答 応答 calls phone ring lock screen incoming answer';

  @override
  String get settingsWordsEmailTips =>
      'メール ニュースレター ヒント ニュース 配信停止 解除 email newsletter tips news unsubscribe';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'メール ギャラリー ダイジェスト 月次 おすすめ email gallery digest monthly';

  @override
  String get settingsWordsNewsletterTitle =>
      'メール ニュースレター 月刊 ニュース 更新 購読 配信停止 email newsletter monthly updates subscribe unsubscribe';

  @override
  String get settingsWordsWakeWord =>
      '音声 呼びかけ ハンズフリー マイク 聞き取り voice hands free microphone mic';

  @override
  String get settingsWordsShowBotSteps =>
      'ステップ ツール 詳細 進捗 steps tools details progress';

  @override
  String get settingsWordsShowReplyUsage => 'コスト 価格 利用状況 返信ごと cost price usage';

  @override
  String get settingsWordsCheckForUpdates =>
      'アップデート 更新 バージョン アップグレード ダウンロード 自動 update updates version upgrade download automatic';

  @override
  String get settingsWordsOpenAtLogin =>
      'スタートアップ 起動 ログイン 自動起動 startup launch login boot start';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'ライブアクティビティ dynamic island ロック画面 ほかのデバイス 別の端末 live activity lock screen';

  @override
  String get settingsWordsShowBotsInNotch =>
      'ノッチ メニューバー dynamic island notch menu bar';

  @override
  String get settingsWordsNotchOnHover => 'ノッチ ホバー マウス notch hover mouse';

  @override
  String get settingsWordsLanguage =>
      '言語 ロケール 日本語 英語 翻訳 language locale english translation';

  @override
  String get settingsWordsIntegrations =>
      'アプリ 接続 gmail google slack カレンダー プラグイン ツール mcp apps connect connections plugins tools';

  @override
  String get settingsWordsSkills =>
      'スキル カタログ 機能 指示 skills catalog abilities instructions';

  @override
  String get settingsWordsCasamaLink =>
      'リモートアクセス アドレス トンネル セルフホスト スマートフォン remote access address tunnel self host';

  @override
  String get settingsWordsServiceKeys =>
      'api キー 検索 地図 データ api keys search maps data';

  @override
  String get settingsWordsModelsTitle =>
      'api キー openai anthropic openrouter gemini モデル プロバイダー ollama ローカルモデル api keys models providers';

  @override
  String get settingsWordsModelKeys =>
      'api キー openai anthropic openrouter gemini モデル プロバイダー ollama ローカルモデル api keys models providers';

  @override
  String get settingsWordsAccount =>
      'メール メールアドレス変更 パスワード すべての端末からサインアウト ログイン email password sign out login';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2段階認証 2要素認証 多要素認証 認証アプリ totp otp セキュリティコード 2fa mfa authenticator';

  @override
  String get settingsWordsPairDevice =>
      'qrコード スキャン サインイン ペアリング スマートフォン 別端末 qr code scan pair phone';

  @override
  String get settingsWordsPasskeys =>
      'パスキー face id touch id 指紋 生体認証 passkey biometric fingerprint';

  @override
  String get settingsWordsWidgetsTitle =>
      'ウィジェット ホーム画面 ロック画面 コントロール コントロールセンター ピン留め ショートカット widgets home screen lock screen controls';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'カード 天気 単位 摂氏 華氏 居住都市 位置 通貨 株価 赤 緑 データソース cards weather units celsius fahrenheit currency stocks';

  @override
  String get settingsWordsAppLock =>
      'アプリロック pin パスコード face id touch id 指紋 生体認証 windows hello スクリーンショット プライバシー ロック画面 app lock privacy';

  @override
  String get settingsWordsPrivacy =>
      'データ エクスポート ダウンロード アカウント削除 分析 トラッキング 履歴 保存期間 ブロック data export download delete analytics privacy';

  @override
  String get settingsWordsSecrets =>
      'シークレット パスワード 認証情報 vault 環境変数 secrets passwords credentials environment variables';

  @override
  String get settingsWordsComputers =>
      'コンピューター マシン docker サンドボックス デスクトップ computers docker sandbox desktop';

  @override
  String get settingsWordsDeviceConnections =>
      'デバイス 位置情報 ヘルスケア 場所 フォルダー ウォッチアプリ ブラウザー chrome拡張機能 スマートフォン 権限 devices location health places folders browser permissions';

  @override
  String get settingsWordsUseThisComputer =>
      'コンパニオン このコンピューター mac ローカルファイル companion this computer local files';

  @override
  String get settingsWordsHelpAndSupport =>
      'ヘルプ サポート お問い合わせ チケット バグ報告 フィードバック ドキュメント コミュニティ github スター オープンソース discord アイデア ステータス help support contact ticket bug feedback docs';

  @override
  String get settingsWordsSignOut => 'ログアウト サインアウト log out logout sign out';

  @override
  String get notifDoIt => '実行';

  @override
  String get notifNotNow => '今はしない';

  @override
  String get notifAllow => '許可';

  @override
  String get notifDeny => '拒否';

  @override
  String get notifApprove => '承認';

  @override
  String get notifReview => '確認';

  @override
  String get notifReply => '返信';

  @override
  String get notifSend => '送信';

  @override
  String get notifReplyPlaceholder => '返信…';

  @override
  String get notifChannelReplies => '返信';

  @override
  String get notifChannelRepliesDescription => 'ボットが質問に回答しました';

  @override
  String get notifChannelNeedsYou => '確認待ち';

  @override
  String get notifChannelNeedsYouDescription => 'ボットが待っている承認、パスワード、操作の交代';

  @override
  String get notifChannelRoutines => 'ルーティンとブリーフィング';

  @override
  String get notifChannelRoutinesDescription => 'ルーティンの結果と朝のブリーフィング';

  @override
  String get notifChannelSuggestions => '提案';

  @override
  String get notifChannelSuggestionsDescription => 'ボットからの実行提案';

  @override
  String get notifChannelAccount => 'アカウント';

  @override
  String get notifChannelAccountDescription => 'クレジット、プロジェクト、サーバー';

  @override
  String get notifCallChannel => '通話';

  @override
  String get notifCallLive => '通話中';

  @override
  String get notifCallMuted => 'ミュート中';

  @override
  String get notifCallReconnecting => '再接続中';

  @override
  String get notifCallMute => 'ミュート';

  @override
  String get notifCallUnmute => 'ミュート解除';

  @override
  String get notifCallEnd => '通話を終了';

  @override
  String get notifFromYourWatch => 'ウォッチから';

  @override
  String get notifLiveOpen => '開く';

  @override
  String get notifLiveStop => '停止';

  @override
  String get notifLiveReview => '確認';

  @override
  String get notifLiveAllow => '許可';

  @override
  String get notifLiveDeny => '拒否';

  @override
  String get notifLiveNeedsOk => '確認が必要';

  @override
  String get notifLiveNeedsYou => '確認待ち';

  @override
  String get notifLiveWorking => '作業中';

  @override
  String get notifLiveTakeOver => '操作の交代を依頼';

  @override
  String get notifLiveFinished => '完了';

  @override
  String get notifLiveProblem => '問題により停止';

  @override
  String get notifLiveBotWorking => 'ボットが作業中';

  @override
  String get notifLiveBotsAtWork => '作業中のボット';

  @override
  String get notifLiveStepOne => '1ステップ';

  @override
  String notifLiveSteps(int count) {
    return '$countステップ';
  }

  @override
  String get notifAlarmTitle => 'Casamaアラーム';

  @override
  String get notifAlarmStop => '停止';

  @override
  String get widgetIosNeedsYouDescription => '確認待ちのボットを見て、簡単なものに応答できます。';

  @override
  String get widgetIosBotDescription => 'ボットの作業状況をいつでも確認できます。';

  @override
  String get widgetIosAskDescription => 'ワンタップでボットに質問や通話を開始できます。';

  @override
  String get widgetIosRoutinesDescription => '次の予定を確認し、今すぐルーティンを実行できます。';

  @override
  String get widgetIosTodayDescription => '確認待ち、次の予定、クレジットを1か所で確認できます。';

  @override
  String get widgetIosBriefDescription => '今朝ボットから届いた内容を読めます。';

  @override
  String get widgetIosLibraryDescription => 'ボットが最近作成したものを開けます。';

  @override
  String get widgetIosTasksDescription => '確認待ちを先頭に、ボードの状況を確認できます。';

  @override
  String get widgetIosCreditsDescription => 'クレジットの使用状況を確認できます。';

  @override
  String get widgetIosInlineDescription => '時計の上で最も重要な1件を確認できます。';

  @override
  String get widgetIosCanvasDescription =>
      '名言、カウントダウン、連続記録、リスト、画像などボットが置いたものを表示します。';

  @override
  String get widgetMacNeedsYouDescription => 'どのボットがあなたを待っているか確認できます。';

  @override
  String get widgetMacRoutinesDescription => '次に何が実行されるか確認できます。';

  @override
  String get widgetAskCasama => 'Casamaに質問';

  @override
  String get widgetControlAskDescription => 'キーボードを表示した状態でクイック質問を開きます。';

  @override
  String get widgetTalkToBot => 'ボットと話す';

  @override
  String widgetTalkToName(String name) {
    return '$nameと話す';
  }

  @override
  String get widgetControlTalkDescription => '選んだボットと音声通話を始めます。';

  @override
  String get widgetRunRoutine => 'ルーティンを実行';

  @override
  String get widgetControlRunDescription => 'Casamaを開かずに選んだルーティンを実行します。';

  @override
  String widgetFallbackAskBot(String bot) {
    return '$botに何でも質問';
  }

  @override
  String get widgetFallbackBrief => '朝のブリーフィング';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$botが$titleを完了';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return '$time時点';
  }

  @override
  String get widgetFallbackNothingNext => '今後の予定はありません';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$botが操作の交代を求めています';
  }

  @override
  String get widgetFallbackDay => '日';

  @override
  String get widgetFallbackDays => '日';

  @override
  String get widgetSampleVerse => '静まって、わたしこそ神であることを知れ。';

  @override
  String get widgetSampleVerseRef => '詩46:10';

  @override
  String get widgetSampleVerseShort => '静まって、わたしこそ神であることを知れ。・詩46:10';

  @override
  String get widgetSampleVerseTiny => '静まって、わたしこそ…';

  @override
  String get widgetSampleCanvasName => '今日の聖句';

  @override
  String get widgetSampleNeedFlights => 'リスボン行きのフライトを検索';

  @override
  String get widgetSampleNeedDentist => '歯医者を金曜日に変更しますか？';

  @override
  String get widgetSampleBotText => '3通のメールに返信が必要で、Acme社の請求書が期限を2日過ぎています。';

  @override
  String get widgetSampleStep => '受信トレイを確認中';

  @override
  String get widgetSampleRoutineInbox => '受信トレイの整理';

  @override
  String get widgetSampleRoutineBrief => '朝のブリーフィング';

  @override
  String get widgetSampleRoutineWeekly => '週次レポート';

  @override
  String get widgetSampleWeekdays => '平日';

  @override
  String get widgetSampleEveryDay => '毎日';

  @override
  String get widgetSampleFridays => '毎週金曜16:00';

  @override
  String get widgetSampleBrief =>
      '3通のメールに返信が必要で、Acme社の請求書が期限を2日過ぎています。15時から雨のため、16:30のお迎えには早めに出てください。最初の会議は10:00にDanaとあります。';

  @override
  String get widgetSamplePricing => 'Q4料金ページ';

  @override
  String get widgetSampleLogoIdeas => 'ロゴ案';

  @override
  String get widgetSampleTripPlan => '旅行プラン';

  @override
  String get widgetSampleLaunchPost => 'リリース投稿の下書きを作成';

  @override
  String get widgetSampleStarterInbox => '受信トレイを要約して';

  @override
  String get widgetSampleStarterFriday => '金曜日の予定を立てて';

  @override
  String get widgetSampleWorking => '作業中・2:14';

  @override
  String get widgetSampleCreditsLeft => '残り\$5.70';

  @override
  String get widgetSampleSpentToday => '今日\$0.80';

  @override
  String get widgetSampleMorning =>
      'おはようございます。今日は会議が2件あり、最初は10:00にデザインチームとです。15時以降は雨なのでコートをお持ちください。金曜日のリスボン行きフライトは確定しています。';

  @override
  String get widgetSampleLisbonPlan => 'リスボン旅行プラン';

  @override
  String get widgetSampleAgo => 'Milo・2時間前';

  @override
  String get widgetSampleLaunchEmail => 'リリースメールの下書きを作成';

  @override
  String get widgetSampleInReviewBy => '確認中・Ada';

  @override
  String get widgetSampleNeedAndroid => 'Miloがリスボン行きの航空券価格を検索したがっています';

  @override
  String get widgetSampleUpNextAt => '次の予定・9:00';

  @override
  String get widgetSampleInMinutes => 'Ada・18分後';

  @override
  String get widgetSampleDate => '11月18日（水）';

  @override
  String get widgetSampleNeedsCount => '確認待ち・1';

  @override
  String get widgetSampleSearchFlights => 'リスボン行きの航空券価格を検索';

  @override
  String get widgetSampleAskAda => 'Adaに質問';

  @override
  String get widgetSampleAskMilo => 'Miloに質問';

  @override
  String get widgetSamplePlanDay => '☀️今日の予定を立てて';

  @override
  String get widgetSampleWhatsNew => '✉️受信トレイの新着は？';

  @override
  String get widgetAndroidBotDescription => 'ボットが今していることを追えます';

  @override
  String get widgetAndroidTodayDescription => 'ボットとの1日を1か所にまとめます';

  @override
  String get widgetAndroidBriefDescription => '朝のブリーフィングを一目で読めます';

  @override
  String get widgetAndroidLibraryDescription => 'ボットが最近作ったものを開けます';

  @override
  String get widgetAndroidTasksDescription => 'タスクボードの進捗を追えます';

  @override
  String get widgetAndroidCreditsDescription => '使用状況を確認できます';

  @override
  String get widgetAndroidCanvasDescription => '名言やカウントダウンなど、ボットが置いたものを表示します';

  @override
  String get widgetConfigBotTitle => 'ボットを選択';

  @override
  String get widgetConfigRoutinesTitle => 'ルーティンを選択';

  @override
  String get widgetConfigRoutinesHint => '手動で実行するものを最大4つまで選べます';

  @override
  String get widgetConfigAutomatic => '自動';

  @override
  String get widgetConfigAutomaticHint => 'すべてのボットの次の実行';

  @override
  String get widgetConfigDone => '完了';

  @override
  String get widgetConfigSignedOutTitle => 'まだ選べる項目がありません';

  @override
  String get widgetConfigSignedOut => 'Casamaを開いてサインインしてからここで選んでください。';

  @override
  String get widgetConfigCanvasTitle => 'キャンバスを選択';

  @override
  String get widgetConfigCanvasAutomaticHint => 'ボットが最も最近設定したもの';

  @override
  String get widgetConfigCanvasNone => 'まだキャンバスはありません。ボットに何か表示するよう頼んでみてください。';

  @override
  String get iosUsageTracking =>
      '許可すると、FacebookやInstagramでCasamaの広告を見たあとにインストール、登録、定期購入を行ったことをMetaに通知し、広告効果の測定に役立てます。Casamaに広告が表示されることはなく、チャットやファイルが共有されることもありません。';

  @override
  String get iosUsageContacts => '「デバイス接続」で「連絡先」をオンにした場合のみ、ボットが知人を検索できます。';

  @override
  String get iosUsagePhotoLibrary =>
      'ボットに送る写真やプロフィール用の写真を選ぶときに、Casamaが写真ライブラリを開きます。';

  @override
  String get iosUsageLocationAlways =>
      'Casamaを閉じていても、登録した場所への到着や出発をボットに知らせることができます。共有されるのは場所の名前と時刻のみで、移動経路は共有されません。';

  @override
  String get iosUsageLocationWhenInUse =>
      '自宅や職場などの場所を登録し、次の予定に合わせて出発時刻をボットからお知らせできます。「デバイス接続」で「場所」をオンにした場合のみ使用されます。';

  @override
  String get iosUsageCamera => 'ボットに送る写真やプロフィール用の写真を撮影するときに、Casamaがカメラを使用します。';

  @override
  String get iosUsageCalendars =>
      '「デバイス接続」で「カレンダー」をオンにした場合のみ、ボットが予定に関する質問に答えたり予定を追加したりできます。';

  @override
  String get iosUsageSpeech =>
      'Casamaの音声入力サービスに接続できないとき、デバイス標準の音声認識で話した内容をテキストに変換します。';

  @override
  String get iosUsageAlarmKit =>
      '「デバイス接続」で「アラーム」を許可した場合のみ、ボットが消音モードでも鳴るアラームやタイマーを設定できます。';

  @override
  String get iosUsageHomeKit =>
      '「デバイス接続」で「ホーム」を許可した場合のみ、ボットがHomeKitの住まいを確認・操作できます。変更には常に事前の承認が必要です。';

  @override
  String get iosUsageMicrophone =>
      '音声入力やボットとのライブ通話のためにCasamaがマイクを使用します。同意した場合にのみ、音声が回答のためにAIプロバイダー（通話はGoogle Gemini、音声入力のテキスト変換はOpenAI）へ送信されます。';

  @override
  String get iosUsageHealthUpdate =>
      'CasamaはAppleヘルスケアのデータの読み取りのみを行い、書き込みは一切行いません。';

  @override
  String get iosUsageFaceId =>
      'アプリロックをオンにした際のロック解除や、重要な操作の本人確認のためにCasamaがFace IDを使用します。';

  @override
  String get iosUsageHealthShare =>
      '「デバイス接続」で「Appleヘルスケア」をオンにした場合のみ、ボットがヘルスケアから睡眠、アクティビティ、ワークアウト、心臓の1日ごとの概要を参照できます。Casamaがヘルスケアに書き込んだり広告に利用したりすることはありません。';

  @override
  String get iosUsageWatchMicrophone =>
      'ボットに質問すると、Casamaは音声を録音してお使いのCasamaサーバーに送信します。サーバー側でAIプロバイダー（Casama CloudではOpenAI）がボット向けのテキストに変換します。';

  @override
  String get macUsageContacts => '「デバイス接続」で「連絡先」をオンにした場合のみ、ボットが知人を検索できます。';

  @override
  String get macUsageSpeech =>
      'Casamaの音声入力サービスに接続できないとき、デバイス標準の音声認識で話した内容をテキストに変換します。';

  @override
  String get macUsageMicrophone =>
      '音声入力やボットとのライブ通話のためにCasamaがマイクを使用します。同意した場合にのみ、音声が回答のためにAIプロバイダー（通話はGoogle Gemini、音声入力のテキスト変換はOpenAI）へ送信されます。';

  @override
  String get macUsageAppleEvents =>
      'ショートカットを押したときに限り、クイック質問が最前面ウィンドウのタイトルとブラウザーの現在のタブを読み取ります。';

  @override
  String get nativeNameFileProvider => 'Casamaコンピューター';

  @override
  String get nativeNameNotifications => 'Casama通知';

  @override
  String get nativeNameSafari => 'Casama for Safari';

  @override
  String get nativeNameAskCasama => 'Casamaに質問';

  @override
  String get nativeComputer => 'コンピューター';

  @override
  String get nativeSafariSignInIos =>
      'このデバイスのCasamaで 設定 -> 別のデバイスでサインイン を開くか、下にサインインリンクを貼り付けてください。';

  @override
  String get nativeSafariSignInMac =>
      'このMacのCasamaで 設定 -> 別のデバイスでサインイン を開くか、下にサインインリンクを貼り付けてください。';

  @override
  String get linuxDesktopComment => 'お持ちのあらゆる画面で仕事をこなすボット';

  @override
  String get linuxDesktopKeywords => 'AI;ボット;チャット;自動化;仕事;';

  @override
  String macMenuAbout(String appName) {
    return '$appNameについて';
  }

  @override
  String get macMenuPreferences => '環境設定…';

  @override
  String get macMenuServices => 'サービス';

  @override
  String macMenuHide(String appName) {
    return '$appNameを非表示';
  }

  @override
  String get macMenuHideOthers => 'ほかを非表示';

  @override
  String get macMenuShowAll => 'すべてを表示';

  @override
  String macMenuQuit(String appName) {
    return '$appNameを終了';
  }

  @override
  String get macMenuEdit => '編集';

  @override
  String get macMenuUndo => '取り消す';

  @override
  String get macMenuRedo => 'やり直す';

  @override
  String get macMenuCut => 'カット';

  @override
  String get macMenuCopy => 'コピー';

  @override
  String get macMenuPaste => 'ペースト';

  @override
  String get macMenuPasteAndMatchStyle => 'ペーストしてスタイルを合わせる';

  @override
  String get macMenuDelete => '削除';

  @override
  String get macMenuSelectAll => 'すべてを選択';

  @override
  String get macMenuFind => '検索';

  @override
  String get macMenuFindEllipsis => '検索…';

  @override
  String get macMenuFindAndReplace => '検索と置換…';

  @override
  String get macMenuFindNext => '次を検索';

  @override
  String get macMenuFindPrevious => '前を検索';

  @override
  String get macMenuUseSelectionForFind => '選択部分を検索に使用';

  @override
  String get macMenuJumpToSelection => '選択部分へジャンプ';

  @override
  String get macMenuSpellingAndGrammar => 'スペルと文法';

  @override
  String get macMenuSpelling => 'スペル';

  @override
  String get macMenuShowSpelling => 'スペルと文法を表示';

  @override
  String get macMenuCheckDocumentNow => '書類を今すぐチェック';

  @override
  String get macMenuCheckSpellingWhileTyping => '入力中にスペルチェック';

  @override
  String get macMenuCheckGrammar => 'スペルと一緒に文法をチェック';

  @override
  String get macMenuCorrectSpelling => 'スペルを自動的に修正';

  @override
  String get macMenuSubstitutions => '自動置換';

  @override
  String get macMenuShowSubstitutions => '自動置換を表示';

  @override
  String get macMenuSmartCopyPaste => 'スマートコピー/ペースト';

  @override
  String get macMenuSmartQuotes => 'スマート引用符';

  @override
  String get macMenuSmartDashes => 'スマートダッシュ記号';

  @override
  String get macMenuSmartLinks => 'スマートリンク';

  @override
  String get macMenuDataDetectors => 'データ検出';

  @override
  String get macMenuTextReplacement => 'テキスト置換';

  @override
  String get macMenuTransformations => '変換';

  @override
  String get macMenuMakeUpperCase => '大文字にする';

  @override
  String get macMenuMakeLowerCase => '小文字にする';

  @override
  String get macMenuCapitalize => '語頭を大文字にする';

  @override
  String get macMenuSpeech => 'スピーチ';

  @override
  String get macMenuStartSpeaking => '読み上げを開始';

  @override
  String get macMenuStopSpeaking => '読み上げを停止';

  @override
  String get macMenuView => '表示';

  @override
  String get macMenuEnterFullScreen => 'フルスクリーンにする';

  @override
  String get macMenuWindow => 'ウインドウ';

  @override
  String get macMenuMinimize => 'しまう';

  @override
  String get macMenuZoom => '拡大/縮小';

  @override
  String get macMenuBringAllToFront => 'すべてを手前に移動';

  @override
  String get macMenuHelp => 'ヘルプ';

  @override
  String get macMenuCheckForUpdates => 'アップデートを確認…';

  @override
  String get macMenuSettings => '設定…';

  @override
  String get macMenuFile => 'ファイル';

  @override
  String get macMenuNewChat => '新規チャット';

  @override
  String get macMenuNewBot => '新規ボット…';

  @override
  String get macMenuQuickAsk => 'クイック質問';

  @override
  String get macMenuSearch => '検索…';

  @override
  String get macMenuCloseWindow => 'ウインドウを閉じる';

  @override
  String get macMenuGo => '移動';

  @override
  String get macMenuBots => 'ボット';

  @override
  String get macMenuInbox => '受信トレイ';

  @override
  String get macMenuBoard => 'ボード';

  @override
  String get macMenuComputer => 'コンピューター';

  @override
  String get macMenuPages => 'ページ';

  @override
  String get macMenuCasamaHelp => 'Casamaヘルプ';

  @override
  String get macMenuSendFeedback => 'フィードバックを送信…';

  @override
  String get siriBot => 'ボット';

  @override
  String get siriRoutine => 'ルーティン';

  @override
  String get siriRoutines => 'ルーティン';

  @override
  String get siriCanvas => 'キャンバス';

  @override
  String get siriAutomatic => '自動';

  @override
  String get siriAutomaticSubtitle => 'ボットが最も最近設定したもの';

  @override
  String get siriChooseCanvas => 'キャンバスを選択';

  @override
  String get siriChooseCanvasDescription =>
      'ボットが最も最近設定したもの、または特定のキャンバスを1つ表示します。';

  @override
  String get siriChooseBot => 'ボットを選択';

  @override
  String get siriChooseBotDescription => 'このウィジェットに表示するボットを選びます。';

  @override
  String get siriChooseRoutines => 'ルーティンを選択';

  @override
  String get siriChooseRoutinesDescription =>
      '次の実行予定、または自分で選んだ最大4つのルーティンを表示します。';

  @override
  String get siriOpenCasama => 'Casamaを開く';

  @override
  String get siriWhere => '開く場所';

  @override
  String get siriTalkToBot => 'ボットと話す';

  @override
  String get siriTalkToBotDescription => '選んだボットと音声通話を始めます。';

  @override
  String get siriRunRoutine => 'ルーティンを実行';

  @override
  String get siriRunRoutineControlDescription => 'Casamaを開かずに選んだルーティンを実行します。';

  @override
  String get siriCallAction => '通話操作';

  @override
  String get siriAction => '操作';

  @override
  String get siriStopBot => 'ボットを停止';

  @override
  String get siriRun => '実行';

  @override
  String get siriAnswerRequest => 'ボットのリクエストに応答';

  @override
  String get siriRequest => 'リクエスト';

  @override
  String get siriAllow => '許可';

  @override
  String get siriFromWidget => 'ウィジェットから';

  @override
  String get siriRunRoutineNow => '今すぐルーティンを実行';

  @override
  String get siriAcceptSuggestion => 'ボットの提案を実行';

  @override
  String get siriSuggestion => '提案';

  @override
  String get siriBotStatusDescription => 'ボットの状況と作業内容';

  @override
  String get siriNextRoutineDescription => '次のルーティンと実行時刻';

  @override
  String get siriAskCasama => 'Casamaに質問';

  @override
  String get siriAskVoiceDescription => '音声でボットに質問します';

  @override
  String get siriWhatWaiting => '確認待ちの項目';

  @override
  String get siriAsk => '質問';

  @override
  String get siriShortNeedsYou => '確認待ち';

  @override
  String get siriOpeningToFinish => '完了するためCasamaを開いています。';

  @override
  String get siriName => '名前';

  @override
  String get siriTitle => 'タイトル';

  @override
  String get siriChat => 'チャット';

  @override
  String get siriBotSubtitle => 'チャットできるAIボット（Casama）';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Casamaで$botが実行するルーティン';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Casamaでの$botとのチャット';
  }

  @override
  String get siriBotInCasama => 'Casamaのボット';

  @override
  String siriRoutineDot(String bot) {
    return 'ルーティン・$bot';
  }

  @override
  String siriChatWith(String bot) {
    return '$botとのチャット';
  }

  @override
  String get siriKeywordBot => 'ボット';

  @override
  String get siriKeywordRoutine => 'ルーティン';

  @override
  String get siriKeywordChat => 'チャット';

  @override
  String get siriAskBot => 'ボットに質問';

  @override
  String get siriAskBotDescription =>
      'Casamaボットに新しいチャットで質問を送り、返答を読み上げます。ボットを指定しない場合は最後に話したボットが答えます。';

  @override
  String get siriCategoryBots => 'ボット';

  @override
  String get siriAskBotParamDescription =>
      'どのボットに質問するか指定します。空欄の場合は最後に話したボットになります。';

  @override
  String get siriQuestion => '質問';

  @override
  String get siriQuestionDescription => 'ボットに聞く内容（自由に入力）';

  @override
  String get siriWhatShouldIAsk => '何を聞きましょうか？';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return '$botに「$question」と質問';
  }

  @override
  String get siriRestOnScreen => '続きは画面に表示されています。';

  @override
  String get siriRestOnScreenEllipsis => '…続きは画面に表示されています。';

  @override
  String get siriRunRoutineDescription =>
      'Casamaボットのルーティンを今すぐ実行します。自動で実行されたときと同様に、結果はアプリ内と通知で届きます。';

  @override
  String get siriRoutineParamDescription => '今すぐ実行するルーティン。';

  @override
  String siriSummaryRun(String routine) {
    return '$routineを実行';
  }

  @override
  String get siriWhatNeedsMe => '確認待ちの確認';

  @override
  String get siriWhatNeedsMeDescription =>
      'Casamaであなたを待っている承認、操作交代、提案の件数を知らせます。応答はアプリで行います。';

  @override
  String get siriOpenBot => 'ボットを開く';

  @override
  String get siriOpenBotDescription => 'Casamaボットとのチャットを開きます。';

  @override
  String get siriOpenBotPersonDescription => 'Casamaボットのチャットを開きます。';

  @override
  String get siriOpenChat => 'チャットを開く';

  @override
  String get siriOpenChatDescription => 'Casamaボットとのチャットを開きます。';

  @override
  String get siriOpenRoutine => 'ルーティンのボットを開く';

  @override
  String get siriOpenRoutineDescription => 'Casamaのルーティンを実行しているボットを開きます。';

  @override
  String get siriTalkDescription => 'Casamaボットとの音声モードを開きます。アクションボタンから使えます。';

  @override
  String get siriAskGetReply => 'ボットに質問して返答を取得';

  @override
  String get siriAskGetReplyDescription =>
      'Casamaボットに質問を送り、ショートカットで続けて使えるように返答テキストを返します。';

  @override
  String get siriGetLastReply => '最新の返答を取得';

  @override
  String get siriGetLastReplyDescription => 'Casamaボットのチャットから最新の返答テキストを返します。';

  @override
  String get siriStartComputer => 'コンピューターを起動';

  @override
  String get siriStartComputerDescription => '確認のあとCasamaコンピューターを起動します。';

  @override
  String get siriComputerName => 'コンピューター名';

  @override
  String get siriYourComputer => 'Casamaコンピューター';

  @override
  String siriStartConfirm(String computer) {
    return '$computerを起動しますか？';
  }

  @override
  String get siriOpenToStartComputer => 'コンピューターを起動するにはCasamaを開いてください。';

  @override
  String get siriFocusTitle => 'Casamaの集中モードフィルタを設定';

  @override
  String get siriFocusDescription =>
      'この集中モードがオンの間、選んだボットだけを表示し、必要に応じてボットからの自発的な声かけを保留します。';

  @override
  String get siriFocusBots => '表示するボット';

  @override
  String get siriFocusHold => '自発的な声かけを保留';

  @override
  String get siriFocusShowOne => 'ボットを1体表示';

  @override
  String siriFocusShowMany(int count) {
    return 'ボットを$count体表示';
  }

  @override
  String get siriFocusHoldCheckIns => '声かけを保留';

  @override
  String get siriFocusAllowCheckIns => '声かけを許可';

  @override
  String get siriFocusAllBots => 'すべてのボット';

  @override
  String get siriFocusAllVisible => 'すべてのボットを表示';

  @override
  String get siriToolAsk => 'Casamaボットに質問';

  @override
  String get siriToolAskDescription => 'ユーザーのCasamaボットに質問し、その返答を返します。';

  @override
  String get siriCategoryAssistants => 'ボット';

  @override
  String get siriToolBotDescription => 'どのCasamaボットに質問するか。';

  @override
  String get siriToolQuestionDescription => 'ボットへの質問内容。';

  @override
  String get siriToolRun => 'Casamaのルーティンを実行';

  @override
  String get siriToolRunDescription => '保存されたCasamaルーティンをユーザーに確認してから実行します。';

  @override
  String get siriCategoryAutomation => 'オートメーション';

  @override
  String get siriToolRoutineDescription => '実行するルーティン。';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return '$botで$routineを実行しますか？';
  }

  @override
  String get siriToolNeeds => 'Casamaで確認待ちを確認';

  @override
  String get siriToolNeedsDescription => 'Casamaで待機中の承認、操作の交代、提案の件数を確認します。';

  @override
  String get siriOpenToCheck => '確認待ちをチェックするにはCasamaを開いてください。';

  @override
  String get siriToolStop => 'Casamaボットを停止';

  @override
  String get siriToolStopDescription => 'Casamaでタスクを実行中のボットを停止します。';

  @override
  String get siriToolStopBotDescription => '停止するボット。';

  @override
  String siriStoppedBot(String bot) {
    return '$botを停止しました。';
  }

  @override
  String get siriToolCall => 'Casamaボットに通話';

  @override
  String get siriToolCallDescription => 'Casamaを開き、選んだボットとライブ音声通話を始めます。';

  @override
  String get siriCategoryCommunication => 'コミュニケーション';

  @override
  String get siriToolCallBotDescription => '通話するボット。';

  @override
  String siriCalling(String bot) {
    return '$botに発信しています。';
  }

  @override
  String siriBotIn(String app) {
    return '$appのボット';
  }

  @override
  String get siriMe => '自分';

  @override
  String get siriABot => 'ボット';

  @override
  String get siriFavorited => 'お気に入り';

  @override
  String siriSentTo(String bot) {
    return '$botに送信済み';
  }

  @override
  String get siriMessage => 'メッセージ';

  @override
  String get siriNone => 'なし';

  @override
  String get siriErrorOneBot => 'Casamaは一度に1体のボットに送信します。どのボットにしますか？';

  @override
  String get siriErrorTextOnly =>
      'Siriはボットにテキストのみ送信できます。ファイル、写真、場所はCasamaから追加してください。';

  @override
  String get siriErrorNoBot => 'そのボットがCasamaで見つかりませんでした。';

  @override
  String get siriWhatShouldISend => '何を送りますか？';

  @override
  String get siriAskCasamaBot => 'Casamaボットに質問';

  @override
  String siriAskName(String bot) {
    return '$botに質問';
  }

  @override
  String get siriAskAboutThis => 'これについてCasamaに質問';

  @override
  String siriPhraseAsk(String app) {
    return '$appに聞く';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return '$appのボットに聞く';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return '$appの$botに聞く';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return '$appのボットと話す';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return '$appの$botと話す';
  }

  @override
  String siriPhraseRunIn(String app) {
    return '$appでルーティンを実行';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return '$appで$routineを実行';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return '$appの確認待ちを教えて';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return '$appで待っているものを教えて';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return '$appにちょっと聞く';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return '$appで$routineを実行して';
  }

  @override
  String get siriABotSubject => 'ボット';

  @override
  String siriBotNeedsOk(String bot) {
    return '$botが確認を求めています。';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$botが操作の交代を求めています。';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$botから提案があります。';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$botが確認を待っています。';
  }

  @override
  String get siriOneThingNeedsYou => '1件の確認待ちがあります。';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count件の確認待ちがあります。';
  }

  @override
  String get siriUnlockPhone => 'スマートフォンのロックを解除してもう一度お試しください。';

  @override
  String get siriGeminiOff =>
      'このスマートフォンではCasamaに対するGeminiが無効になっています（Casama → 設定 → プライバシー）。';

  @override
  String get suggestionActionTurnOn => 'オンにする';

  @override
  String suggestionActionRemindMe(String date) {
    return '$dateにリマインド';
  }

  @override
  String get suggestionActionPickTime => '時間を選択';

  @override
  String get suggestionActionPutAwayAll => 'すべてしまう';

  @override
  String suggestionActionPutAwayAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アイデア$count件をすべてしまう',
      one: 'アイデア1件をしまう',
    );
    return '$_temp0';
  }

  @override
  String get suggestionActionOpen => '開く';

  @override
  String get suggestionActionGotIt => '了解';

  @override
  String get suggestionActionLater => 'あとで';

  @override
  String get suggestionActionSomethingElse => 'その他';

  @override
  String get suggestionTurnedOn => 'オンにしました';

  @override
  String suggestionReminderSet(String date) {
    return '$dateにリマインダーを設定しました';
  }

  @override
  String get suggestionSnoozed => 'あとで確認するよう保存しました';

  @override
  String get suggestionSnoozedExpired => '2回スヌーズしたためしまいました';

  @override
  String suggestionPutAwayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アイデア$count件をしまいました',
      one: 'アイデア1件をしまいました',
    );
    return '$_temp0';
  }

  @override
  String get suggestionUndo => '取り消す';

  @override
  String get suggestionLaterTomorrow => '明日の朝';

  @override
  String get suggestionLaterEvening => '今日の夕方';

  @override
  String get suggestionLaterNextWeek => '来週';

  @override
  String suggestionMoreWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'あと$count件のアイデアが待機中',
      one: 'あと1件のアイデアが待機中',
    );
    return '$_temp0';
  }

  @override
  String botIdeasGrouped(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name・アイデア$count件',
      one: '$name・アイデア1件',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutine(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name・今日のルーティン結果$count件',
      one: '$name・今日のルーティン結果1件',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNotice(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name・今日のアップデート$count件',
      one: '$name・今日のアップデート1件',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutinePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '今日のルーティン結果$count件',
      one: '今日のルーティン結果1件',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNoticePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '今日のアップデート$count件',
      one: '今日のアップデート1件',
    );
    return '$_temp0';
  }

  @override
  String briefSinceYesterday(String summary) {
    return '昨日以降：$summary';
  }

  @override
  String briefSincePages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ページ$count件',
      one: 'ページ1件',
    );
    return '$_temp0';
  }

  @override
  String briefSinceRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ルーティン結果$count件',
      one: 'ルーティン結果1件',
    );
    return '$_temp0';
  }

  @override
  String briefSinceUpdates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'アップデート$count件',
      one: 'アップデート1件',
    );
    return '$_temp0';
  }

  @override
  String get notifTurnOn => 'オンにする';

  @override
  String get notifOpen => '開く';

  @override
  String get notifGotIt => '了解';

  @override
  String get notifRemindMe => 'リマインド';

  @override
  String get notifLater => 'あとで';

  @override
  String get watchTurnOn => 'オンにする';

  @override
  String get watchGotIt => '了解';

  @override
  String get watchRemindMe => 'リマインド';

  @override
  String get watchLater => 'あとで';

  @override
  String get watchOpen => '開く';

  @override
  String get costModeLabel => 'コスト表示';

  @override
  String get costModePaid => '実費';

  @override
  String get costModeEstimated => '見積もり';

  @override
  String get costPaid => '実費';

  @override
  String get costEstimatedTitle => '見積もり';

  @override
  String get costMarginListPrices => '定価ベースの利益率';

  @override
  String get costFreePlan => '無料プラン';

  @override
  String costFreePlanCalls(String count) {
    return '無料プラン · $count回';
  }

  @override
  String costCapUsage(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String get costShareOfOwnServers => '自社サーバー分';

  @override
  String costIncludedCredit(String amount) {
    return '月$amount分込み';
  }

  @override
  String costAtListPrices(String amount) {
    return '定価で$amount';
  }

  @override
  String costEmptyPaidDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'この$days日間の支払いはありません',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyPaidRange => 'この期間の支払いはありません';

  @override
  String get costEmptyPaidFiltered => 'この条件に一致する支払いはありません';

  @override
  String costSpokenPaid(String amount) {
    return '実費 $amount';
  }

  @override
  String costSpokenEstimated(String amount) {
    return '見積もり $amount';
  }

  @override
  String costSpendCardPaidSemantics(
    String paid,
    String charged,
    String margin,
  ) {
    return '過去30日間の支出: 実費 $paid、請求 $charged、定価ベース利益率 $margin';
  }

  @override
  String get vendorBillingFree => '無料プラン';

  @override
  String get vendorBillingMetered => '従量課金';

  @override
  String get vendorBillingFreeHelp => '上限で停止するため、実費は\$0として計算されます。';

  @override
  String get vendorBillingMeteredHelp => '記録されたコストがそのまま実費として計算されます。';

  @override
  String get vendorIncludedUsd => '月間込みクレジット (USD)';

  @override
  String get vendorIncludedUsdHelp => '各暦月のこの金額までの利用は実費\$0として計算されます。';

  @override
  String upgradePromptIncludedIn(String plan) {
    return '$plan以上のプランに含まれます。';
  }

  @override
  String get payFeedbackTitle => '簡単な質問';

  @override
  String get payFeedbackPrompt => '何があれば、Casamaにお金を払う価値があると感じますか？';

  @override
  String get payFeedbackHint => '喜んでお金を払える機能、上限、ワークフローなど…';

  @override
  String get suggestBrowserLookup => 'ブラウザーで今日の注目テックニュースを調べて、ベスト3の記事をまとめて。';

  @override
  String get suggestMorningBrief => '明日の8時に優先事項と天気を含めた朝のブリーフィングを設定して。';
}
