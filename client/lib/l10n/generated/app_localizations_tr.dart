// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

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
  String get tabTitleChat => 'Sohbet';

  @override
  String get tabTitleCall => 'Arama';

  @override
  String get tabTitleProject => 'Proje';

  @override
  String get tabTitleGroupChat => 'Grup sohbeti';

  @override
  String get loading => 'Yükleniyor…';

  @override
  String get retry => 'Yeniden dene';

  @override
  String get keepGoing => 'Devam et';

  @override
  String get keepGoingMessage => 'Durduğun yerden devam et.';

  @override
  String get startOver => 'Baştan başla';

  @override
  String get continueRunHint =>
      'İsteği baştan başlatmak yerine, yeni bir bütçeyle kaldığı yerden devam eder.';

  @override
  String get cancel => 'İptal';

  @override
  String get save => 'Kaydet';

  @override
  String get delete => 'Sil';

  @override
  String get edit => 'Düzenle';

  @override
  String get close => 'Kapat';

  @override
  String get create => 'Oluştur';

  @override
  String get continueLabel => 'Devam et';

  @override
  String get somethingWentWrong => 'Bir sorun oluştu';

  @override
  String get errorViewHint => 'Uygulamayı yeniden başlatmak sorunu çözebilir.';

  @override
  String get signInTitle => 'Casama\'ya giriş yapın';

  @override
  String get signUpTitle => 'Hesabınızı oluşturun';

  @override
  String get email => 'E-posta';

  @override
  String get password => 'Parola';

  @override
  String get signIn => 'Giriş yap';

  @override
  String get signUp => 'Hesap oluştur';

  @override
  String get haveAccount => 'Hesabınız var mı? Giriş yapın';

  @override
  String get needAccount => 'Yeni misiniz? Hesap oluşturun';

  @override
  String get magicLink => 'E-postayla giriş bağlantısı gönder';

  @override
  String get magicLinkSent => 'Giriş bağlantısı için e-postanızı kontrol edin.';

  @override
  String get continueWithGoogle => 'Google ile devam et';

  @override
  String get continueWithApple => 'Apple ile devam et';

  @override
  String get continueWithEmail => 'E-posta ile devam et';

  @override
  String get moreSignInOptions => 'Diğer seçenekler';

  @override
  String get usePasswordInstead => 'Bunun yerine parola kullan';

  @override
  String get checkInboxTitle => 'Gelen kutunuzu kontrol edin';

  @override
  String checkInboxBody(String email) {
    return '$email adresine bir giriş bağlantısı ve 6 haneli bir kod gönderdik. Bağlantıya dokunun veya kodu buraya yazın.';
  }

  @override
  String get emailCodeLabel => '6 haneli kod';

  @override
  String get resendLink => 'Tekrar gönder';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString sn içinde tekrar gönder';
  }

  @override
  String get useDifferentEmail => 'Farklı bir e-posta kullan';

  @override
  String get authWrongPassword =>
      'Bu e-posta ve parola eşleşmiyor. Tekrar deneyin veya bunun yerine e-posta bağlantısıyla giriş yapın.';

  @override
  String get authEmailNotConfirmed =>
      'Önce e-postanızı doğrulayın: size gönderdiğimiz bağlantıyı açın.';

  @override
  String get authCodeInvalid =>
      'Bu kod hatalı veya süresi dolmuş. En son e-postayı kontrol edin ya da yeni bir kod gönderin.';

  @override
  String get authTooManyTries =>
      'Çok fazla deneme yapıldı. Bir dakika bekleyip tekrar deneyin.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds saniye',
      one: '1 saniye',
    );
    return 'Aynı anda çok fazla istek. $_temp0 içinde tekrar deneyin.';
  }

  @override
  String get tooManyRequestsReady => 'Artık tekrar deneyebilirsiniz.';

  @override
  String computerInUseBy(String name) {
    return '$name bu bilgisayarı kullanıyor';
  }

  @override
  String get authAccountExists =>
      'Bu e-posta adresiyle zaten bir hesap var. Bunun yerine giriş yapın.';

  @override
  String get authSignupDisabled => 'Bu sunucu yeni kayıt kabul etmiyor.';

  @override
  String get useMagicLinkInstead => 'Bunun yerine e-postayla bağlantı gönder';

  @override
  String get invalidEmail => 'Geçerli bir e-posta adresi girin';

  @override
  String get passwordTooShort => 'En az 6 karakter kullanın';

  @override
  String get signOut => 'Çıkış yap';

  @override
  String get onboardingTitle => 'Çalışma alanınızı kurun';

  @override
  String get createWorkspace => 'Çalışma alanı oluştur';

  @override
  String get workspaceName => 'Çalışma alanı adı';

  @override
  String get joinWorkspace => 'Davet koduyla katıl';

  @override
  String get inviteCode => 'Davet kodu';

  @override
  String get join => 'Katıl';

  @override
  String get addModelKeyTitle => 'Model anahtarı ekle';

  @override
  String get addModelKeyBody =>
      'Botlar kendi model sağlayıcı anahtarınızı kullanır. Anahtar şifrelenerek saklanır ve bir daha gösterilmez.';

  @override
  String get provider => 'Sağlayıcı';

  @override
  String get label => 'Etiket';

  @override
  String get apiKey => 'API anahtarı';

  @override
  String get baseUrl => 'Temel URL';

  @override
  String get testKey => 'Anahtarı test et';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'Anahtar çalışıyor ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return 'Anahtar testi başarısız: $error';
  }

  @override
  String get createFirstBot => 'İlk botunuzu oluşturun';

  @override
  String get botName => 'Bot adı';

  @override
  String get model => 'Model';

  @override
  String get persona => 'Talimatlar';

  @override
  String get personaHint =>
      'Bu botun ne yaptığı ve nasıl çalışması gerektiği. Bir karakter seçildiğinde burası dolar; dilediğiniz gibi düzenleyebilirsiniz.';

  @override
  String get modelKey => 'Model anahtarı';

  @override
  String get navComputer => 'Bilgisayar';

  @override
  String get navChats => 'Sohbetler';

  @override
  String get navTasks => 'Görevler';

  @override
  String get settingsConnectionsSection => 'Bağlantılar';

  @override
  String get advanced => 'Gelişmiş';

  @override
  String get settingsAdvancedSummary =>
      'Gizli anahtarlar, bilgisayarlar, cihazlar';

  @override
  String get bots => 'Botlar';

  @override
  String get newBot => 'Yeni bot';

  @override
  String get noBots => 'Henüz bot yok';

  @override
  String get botStatusIdle => 'Boşta';

  @override
  String get botStatusWorking => 'Çalışıyor';

  @override
  String get botStatusWaiting => 'Yanıtınızı bekliyor';

  @override
  String sidebarMoreWorking(int count) {
    return '$count bot daha çalışıyor';
  }

  @override
  String get botStatusDisabled => 'Devre dışı';

  @override
  String costToday(String cost) {
    return 'Bugün $cost';
  }

  @override
  String get newChat => 'Yeni sohbet';

  @override
  String get conversations => 'Sohbetler';

  @override
  String messageHint(String bot) {
    return '$bot botuna mesaj yazın';
  }

  @override
  String messageHintWithApps(String bot) {
    return '$bot botuna mesaj yazın · Uygulama etiketlemek için @';
  }

  @override
  String get mentionSectionBots => 'Botlar';

  @override
  String get mentionSectionApps => 'Uygulamalar';

  @override
  String get mentionSectionAddToBot => 'Bu bota ekle';

  @override
  String get mentionSectionConnect => 'Bağla';

  @override
  String get mentionSectionStartGroup => 'Grup sohbeti başlat';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'Uygulama';

  @override
  String get mentionAddAction => 'Ekle';

  @override
  String get mentionConnectAction => 'Bağla';

  @override
  String get mentionMaxApps =>
      'Mesaj başına en fazla 3 uygulamadan bahsedebilirsiniz.';

  @override
  String get mentionRemovedApp => 'Kaldırılan uygulama';

  @override
  String get send => 'Gönder';

  @override
  String get stop => 'Durdur';

  @override
  String get thinking => 'Düşünüyor…';

  @override
  String get checkingItsWork => 'Yaptığını kontrol ediyor…';

  @override
  String get mapFullScreen => 'Tam ekran';

  @override
  String get mapTitle => 'Harita';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Durduruldu.';

  @override
  String emptyChat(String bot) {
    return '$bot botuna merhaba deyin.';
  }

  @override
  String get toolRunning => 'Çalışıyor';

  @override
  String get toolFailedLabel => 'Başarısız';

  @override
  String get toolOutput => 'Çıktı';

  @override
  String get remembered => 'Bir şey hatırlandı';

  @override
  String skillLoaded(String name) {
    return '$name becerisi yüklendi';
  }

  @override
  String checkpointSaved(String label) {
    return 'Geri yükleme noktası kaydedildi: $label';
  }

  @override
  String computerState(String state) {
    return 'Bilgisayar $state';
  }

  @override
  String get activity => 'Etkinlik';

  @override
  String get timelineTitle => 'Çalıştırma zaman çizelgesi';

  @override
  String get allEvents => 'Tümü';

  @override
  String get filterTools => 'Araçlar';

  @override
  String get filterMessages => 'Mesajlar';

  @override
  String get filterSystem => 'Sistem';

  @override
  String get restore => 'Geri yükle';

  @override
  String get restoreConfirm =>
      'Bu geri yükleme noktasına dönülsün mü? O zamandan beri değişen dosyalar değiştirilecek.';

  @override
  String get restored => 'Geri yükleme noktası geri yüklendi.';

  @override
  String get noRuns => 'Henüz çalıştırma yok.';

  @override
  String get computerTitle => 'Bilgisayar';

  @override
  String get computerStart => 'Başlat';

  @override
  String get computerSleep => 'Uyut';

  @override
  String get screen => 'Ekran';

  @override
  String get terminal => 'Terminal';

  @override
  String get files => 'Dosyalar';

  @override
  String get noScreen =>
      'Ekranda henüz bir şey yok. Botun tarayıcı sayfası burada görünür.';

  @override
  String get refresh => 'Yenile';

  @override
  String get upload => 'Yükle';

  @override
  String get download => 'İndir';

  @override
  String get emptyFolder => 'Bu klasör boş';

  @override
  String get noCheckpoints =>
      'Riskli değişikliklerden önce otomatik olarak kaydedilirler; böylece geri alabilirsiniz.';

  @override
  String get computerAsleep =>
      'Bilgisayar uyku modunda. Dosyaları güvende ve gerektiğinde uyanır.';

  @override
  String get connectTerminal => 'Bağlan';

  @override
  String get terminalDisconnected => 'Bağlantı kesildi.';

  @override
  String get terminalReconnecting =>
      'Sunucu yeniden başlatılıyor, yeniden bağlanıyor…';

  @override
  String get memory => 'Hafıza';

  @override
  String get noMemories => 'Henüz hatırlanan bir şey yok.';

  @override
  String get noMemoriesMatch => 'Eşleşen hafıza kaydı yok.';

  @override
  String get clearSearch => 'Temizle';

  @override
  String get addMemory => 'Hafıza ekle';

  @override
  String get addMemoryHelp =>
      'Botun sizin veya işiniz hakkında her zaman bilmesi gereken bir şey.';

  @override
  String get addMemoryFactHint => 'Örneğin: Mali yılımız Nisan ayında başlar.';

  @override
  String get addMemoryPreferenceHint =>
      'Örneğin: Özetleri beş maddeyi geçmeyecek şekilde tut.';

  @override
  String get memoryAdded => 'Hafıza eklendi';

  @override
  String get pin => 'Sabitle';

  @override
  String get unpin => 'Sabitlemeyi kaldır';

  @override
  String get deleteMemoryConfirm => 'Bu unutulsun mu? Bu işlem geri alınamaz.';

  @override
  String get skills => 'Beceriler';

  @override
  String get noSkills =>
      'Henüz beceri yok. Beceriler, botların gerektiğinde yüklediği talimatlardır.';

  @override
  String get newSkill => 'Yeni beceri';

  @override
  String get skillName => 'Ad (küçük harf, tireli)';

  @override
  String get skillDescription => 'Tek satırlık açıklama';

  @override
  String get skillBody => 'Talimatlar (Markdown)';

  @override
  String get enabled => 'Etkin';

  @override
  String get settings => 'Ayarlar';

  @override
  String get workspace => 'Çalışma alanı';

  @override
  String get switchWorkspace => 'Çalışma alanını değiştir';

  @override
  String get modelKeys => 'Model anahtarları';

  @override
  String get moreProviders => 'Diğer sağlayıcılar';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, özel sunucular';

  @override
  String get toolPermissions => 'Araç izinleri';

  @override
  String get devicesAdvancedSummary =>
      'Ne kadar süre saklandığı, özel modeller, erişimi olan botlar';

  @override
  String get companionAdvancedSummary =>
      'Komutlar, yerel araçlar (MCP), kodlama ajanları';

  @override
  String get noKeys => 'Henüz model anahtarı yok.';

  @override
  String get addKey => 'Anahtar ekle';

  @override
  String get usage => 'Kullanım';

  @override
  String get language => 'Dil';

  @override
  String inviteSent(String email) {
    return '$email adresine davet gönderildi.';
  }

  @override
  String get botProfile => 'Bot profili';

  @override
  String get groupMembers => 'Bu sohbetteki botlar';

  @override
  String get groupMembersHelp =>
      'Her biri kendi hafızasını ve ayarlarını korur. Profilini açmak için birine dokunun.';

  @override
  String get botAdvancedSummary =>
      'Sohbet uygulamaları, bağlantılar, kurallar, takipler, eklentiler, etkinlik';

  @override
  String get botActivityRow => 'Her çalıştırma, adım adım';

  @override
  String get createBotAdvancedSummary => 'Model anahtarı ve model';

  @override
  String get botProfileSection => 'Profil';

  @override
  String get botBrain => 'Zihin';

  @override
  String get botAbilities => 'Yetenekler';

  @override
  String get botSchedule => 'Zamanlama';

  @override
  String get chatComputerLive => 'Bilgisayarında çalışıyor';

  @override
  String get autonomy => 'Otonomi';

  @override
  String get autonomyAskAlways => 'Hareket etmeden önce sor';

  @override
  String get autonomyAskRisky => 'Riskli işlemlerde sor';

  @override
  String get autonomyAutonomous => 'Kendi başına hareket et';

  @override
  String get saved => 'Kaydedildi.';

  @override
  String get justNow => 'az önce';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString dakika önce',
      one: '1 dakika önce',
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
      other: '$nString saat önce',
      one: '1 saat önce',
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
      other: '$nString gün önce',
      one: 'dün',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'Bir bot';

  @override
  String get addIntegration => 'Entegrasyon ekle';

  @override
  String get addSecret => 'Gizli anahtar ekle';

  @override
  String get allowedHosts => 'İzin verilen ana bilgisayarlar';

  @override
  String get allowedHostsHelp => 'Virgülle ayrılmış, örneğin api.github.com';

  @override
  String get alwaysAllow => 'Her zaman izin ver';

  @override
  String get approval => 'Onay';

  @override
  String get approvalAlreadyDecided =>
      'Bu istek zaten karara bağlandı veya süresi doldu.';

  @override
  String get approvals => 'Onaylar';

  @override
  String get approve => 'Onayla';

  @override
  String get approved => 'Onaylandı';

  @override
  String get authHeaderOptional => 'Yetkilendirme üstbilgisi (isteğe bağlı)';

  @override
  String get authSecretName =>
      'Kimlik doğrulama gizli anahtar adı (isteğe bağlı)';

  @override
  String get authSecretNameHelp =>
      'Ayarlar › Gizli anahtarlar bölümündeki bir gizli anahtarın adı; bearer token olarak gönderilir';

  @override
  String get baseUrlOptional => 'Temel URL (isteğe bağlı)';

  @override
  String get blankBot => 'Boş';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Bir model seçin';

  @override
  String get createBotNeedsModel =>
      'Bu botu oluşturmak için yukarıdan bir model seçin.';

  @override
  String get createBotKeyRejected =>
      'Sağlayıcı bu anahtarı reddetti. Ayarlar → Model anahtarları bölümünden kontrol edin veya başka bir anahtar seçin.';

  @override
  String get createBotDiscardTitle => 'Bu bottan vazgeçilsin mi?';

  @override
  String get createBotDiscardBody => 'Buraya girdiğiniz bilgiler kaybolacak.';

  @override
  String get searchModels => 'Model arayın veya bir model kimliği yazın';

  @override
  String get recommendedModels => 'Önerilen';

  @override
  String get allModels => 'Tüm modeller';

  @override
  String useCustomModel(String id) {
    return '\"$id\" kullan';
  }

  @override
  String modelListFallback(String reason) {
    return 'Önerilen modeller gösteriliyor. $reason Yine de herhangi bir model kimliği yazabilirsiniz.';
  }

  @override
  String get noModelsFound => 'Eşleşen model yok.';

  @override
  String get addModelKeyFirst =>
      'Önce bir model anahtarı ekleyin. Botunuz bunu düşünmek için kullanır; şifrelenerek saklanır ve bir daha gösterilmez.';

  @override
  String get composioToolkits =>
      'Araç setleri (virgülle ayrılmış, örneğin github, gmail)';

  @override
  String get copySecret => 'Gizli anahtarı kopyala';

  @override
  String get cronExpression => 'Cron ifadesi';

  @override
  String get cronHelp => 'dakika saat gün ay haftanın günü';

  @override
  String get denied => 'Reddedildi';

  @override
  String get deny => 'Reddet';

  @override
  String get everyHour => 'Her saat';

  @override
  String get expired => 'Süresi doldu';

  @override
  String get inbox => 'Gelen Kutusu';

  @override
  String get integrationName => 'Ad';

  @override
  String get integrationNameHelp => 'Küçük harfler, rakamlar ve alt çizgiler';

  @override
  String get integrationType => 'Tür';

  @override
  String get integrations => 'Entegrasyonlar';

  @override
  String get kindMcp => 'MCP sunucusu';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Tümünü okundu olarak işaretle';

  @override
  String get newRoutine => 'Yeni rutin';

  @override
  String get noIntegrationsForBot =>
      'Önce Ayarlar\'dan entegrasyonları ekleyin, ardından bu bot için buradan açın.';

  @override
  String get noRoutines => 'Henüz rutin yok';

  @override
  String get noSecrets => 'Henüz gizli anahtar yok';

  @override
  String get notifications => 'Bildirimler';

  @override
  String get openInbox => 'Gelen Kutusunu Aç';

  @override
  String get pipedreamApps => 'Uygulamalar (virgülle ayrılmış)';

  @override
  String get pipedreamClientId => 'İstemci kimliği';

  @override
  String get pipedreamClientSecret => 'İstemci gizli anahtarı';

  @override
  String get pipedreamProject => 'Proje kimliği';

  @override
  String get riskHigh => 'Yüksek risk';

  @override
  String get riskLow => 'Düşük risk';

  @override
  String get riskMedium => 'Orta risk';

  @override
  String get routineGithub => 'GitHub olaylarında';

  @override
  String get routineInstructions => 'Talimatlar';

  @override
  String get routineInstructionsHint => 'Bot her seferinde ne yapmalı?';

  @override
  String get routineName => 'Ad';

  @override
  String get routineEditTitle => 'Rutini düzenle';

  @override
  String get routineEditSubtitle =>
      'Ne yaptığını ve ne zaman çalıştığını değiştirin.';

  @override
  String get routineRecentRuns => 'Son çalıştırmalar';

  @override
  String get routineNoRuns => 'Henüz çalışmadı.';

  @override
  String get routineSaved => 'Rutin kaydedildi';

  @override
  String get routineStarted => 'Rutin başlatıldı';

  @override
  String get routineWebhook => 'Webhook üzerinde';

  @override
  String get routines => 'Rutinler';

  @override
  String get routineAdvancedSummary =>
      'GitHub ve webhook tetikleyicileri, cron, saat dilimi';

  @override
  String get routineRepeatDaily => 'Her gün';

  @override
  String get routineRepeatWeekdays => 'Hafta içi';

  @override
  String get routineRepeatWeekly => 'Her hafta';

  @override
  String get routineDay => 'Gün';

  @override
  String get routineTimeLabel => 'Saat';

  @override
  String get routineRunsAt => 'Çalışma saati';

  @override
  String routineTimesIn(String timezone) {
    return 'Saatler $timezone saat dilimindedir';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Özel: $schedule';
  }

  @override
  String get routineOtherTriggers => 'Diğer tetikleyiciler';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Her $nString dakikada bir',
      one: 'Her dakika',
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
      other: 'Her $nString saatte bir',
      one: 'Her saat',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'Her saat :$minute geçe';
  }

  @override
  String cronDailyAt(String time) {
    return 'Her gün $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'Hafta içi $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Hafta sonu $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Her ayın $day. günü saat $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items ve $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Her pazar',
      'mon': 'Her pazartesi',
      'tue': 'Her salı',
      'wed': 'Her çarşamba',
      'thu': 'Her perşembe',
      'fri': 'Her cuma',
      'sat': 'Her cumartesi',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Pazar',
      'mon': 'Pazartesi',
      'tue': 'Salı',
      'wed': 'Çarşamba',
      'thu': 'Perşembe',
      'fri': 'Cuma',
      'sat': 'Cumartesi',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Botunuzu canlı çalışırken izleyin';

  @override
  String get headlessScreenEmpty =>
      'Bu bilgisayar hafif kalmak için yalnızca tarayıcı modunda çalışır. Bir web sayfası açtığında burada görürsünüz. Uygulamaları da izleyip kontrol etmek için masaüstüne geçin.';

  @override
  String get headlessScreenChecking =>
      'Birkaç saniyede bir sayfalar kontrol ediliyor';

  @override
  String get headlessBrowserOnly => 'Yalnızca tarayıcı';

  @override
  String get switchedToDesktopHere =>
      'Masaüstüne geçildi. Açıldığında ekranı burada görünür.';

  @override
  String get desktopBarLabel => 'Masaüstü · daha fazla bellek kullanır';

  @override
  String get switchToBrowserOnly => 'Yalnızca tarayıcıya geç';

  @override
  String get switchingToBrowserOnly => 'Yalnızca tarayıcıya geçiliyor…';

  @override
  String get switchedToBrowserOnly =>
      'Yalnızca tarayıcıya geçildi. Artık daha az bellek kullanıyor.';

  @override
  String get runNow => 'Şimdi çalıştır';

  @override
  String get secretName => 'Ad';

  @override
  String get secretNameHelp => 'Büyük harflerle, örneğin GITHUB_TOKEN';

  @override
  String get secretValue => 'Değer';

  @override
  String get secrets => 'Gizli anahtarlar';

  @override
  String get serverUrl => 'Sunucu URL\'si';

  @override
  String get specUrl => 'OpenAPI belirtim URL\'si';

  @override
  String get startFrom => 'Karakter';

  @override
  String get storedEncrypted => 'Şifrelenerek saklanır; bir daha gösterilmez';

  @override
  String get taskBlocked => 'Engellendi';

  @override
  String get taskDoing => 'Devam ediyor';

  @override
  String get taskDone => 'Tamamlandı';

  @override
  String get taskTodo => 'Yapılacak';

  @override
  String get test => 'Test et';

  @override
  String get timezone => 'Saat dilimi';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Tekrar';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'Çalıştırmayı görüntüle';

  @override
  String get webhookCreated => 'Webhook oluşturuldu';

  @override
  String get webhookSecret => 'İmzalama gizli anahtarı';

  @override
  String get webhookShownOnce =>
      'İmzalama gizli anahtarını şimdi kopyalayın. Yalnızca bir kez gösterilir.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Bağlantı başarısız: $error';
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
      other: 'Bağlandı, $nString araç',
      one: 'Bağlandı, 1 araç',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Sonraki: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Yalnızca $hosts adresine gönderildi';
  }

  @override
  String requestedAgo(String when) {
    return '$when istendi';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return 'İçerdiği rutinler: $names.';
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
      other: '$nString araç',
      one: '1 araç',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'Bot kontrolü geri aldı';

  @override
  String get botComputer => 'Bilgisayar';

  @override
  String get botComputerDefault =>
      'Varsa kendi özel bilgisayarı, yoksa ekip bilgisayarı';

  @override
  String get botInControl => 'Kontrol botta';

  @override
  String get computerName => 'Ad';

  @override
  String get computers => 'Bilgisayarlar';

  @override
  String get connectingLive => 'Bağlanıyor…';

  @override
  String get dismiss => 'Kapat';

  @override
  String get renameTopic => 'Yeniden adlandır';

  @override
  String get library => 'Kitaplık';

  @override
  String get navLibrary => 'Kitaplık';

  @override
  String get librarySearchHint => 'Kitaplıkta ara';

  @override
  String get libraryFilterAll => 'Tümü';

  @override
  String get libraryFilterPages => 'Siteler ve oyunlar';

  @override
  String get libraryFilterImages => 'Görseller';

  @override
  String get libraryFilterVideos => 'Videolar';

  @override
  String get libraryFilterAudio => 'Sesler';

  @override
  String get libraryFilterDocuments => 'Belgeler';

  @override
  String get libraryFilterFiles => 'Dosyalar';

  @override
  String get creationKindPage => 'Sayfa';

  @override
  String get creationKindImage => 'Görsel';

  @override
  String get creationKindVideo => 'Video';

  @override
  String get creationKindAudio => 'Ses';

  @override
  String get creationKindDocument => 'Belge';

  @override
  String get creationKindFile => 'Dosya';

  @override
  String get libraryPinned => 'Sabitlenenler';

  @override
  String get libraryToday => 'Bugün';

  @override
  String get libraryYesterday => 'Dün';

  @override
  String get libraryThisWeek => 'Bu hafta';

  @override
  String get libraryEarlier => 'Daha önce';

  @override
  String get videoCantPlay => 'Bu video bu cihazda oynatılamıyor.';

  @override
  String get libraryEmptyTitle => 'Önce ne yapalım?';

  @override
  String get libraryEmptyBody =>
      'Birini seçin, botunuz başlasın. Botlarınızın yaptığı her şey otomatik olarak buraya düşer.';

  @override
  String get libraryNoMatch => 'Burada eşleşen bir şey yok.';

  @override
  String get libraryStarterGame => 'Küçük bir oyun';

  @override
  String get libraryStarterGamePrompt =>
      'Tarayıcıda oynayabileceğim küçük bir oyun yap.';

  @override
  String get libraryStarterLogo => 'Bir logo';

  @override
  String get libraryStarterLogoPrompt => 'Projem için bir logo tasarla.';

  @override
  String get libraryStarterSite => 'Tek sayfalık bir site';

  @override
  String get libraryStarterSitePrompt =>
      'İşim için tek sayfalık bir web sitesi yap.';

  @override
  String get libraryStarterVideo => 'Kısa bir video';

  @override
  String get libraryStarterVideoPrompt => 'Şunun hakkında kısa bir video yap: ';

  @override
  String get libraryStarterCard => 'Bir doğum günü kartı';

  @override
  String get libraryStarterCardPrompt =>
      'Şunun için bir doğum günü kartı yap: ';

  @override
  String get libraryStarterReport => 'Bir rapor';

  @override
  String get libraryStarterReportPrompt =>
      'Şunun hakkında araştırma yap ve rapor yaz: ';

  @override
  String get libraryStarterElse => 'Başka bir şey…';

  @override
  String get creationOpen => 'Aç';

  @override
  String get creationPlay => 'Oynat';

  @override
  String get creationView => 'Görüntüle';

  @override
  String get creationChangeIt => 'Değiştir';

  @override
  String creationChangeDraft(String title) {
    return '“$title” hakkında: ';
  }

  @override
  String creationMadeBy(String bot) {
    return '$bot tarafından yapıldı';
  }

  @override
  String creationVersion(int n) {
    return 'sürüm $n';
  }

  @override
  String creationFromChat(String bot) {
    return '$bot ile sohbetinizden';
  }

  @override
  String creationFromBot(String bot) {
    return '$bot tarafından yapıldı';
  }

  @override
  String get creationFromHelp => 'Sohbete git';

  @override
  String get creationDetails => 'Ayrıntılar';

  @override
  String get creationAlongside => 'Birlikte yapıldı';

  @override
  String creationDeleted(String title) {
    return '“$title” silindi';
  }

  @override
  String get showInLibrary => 'Kitaplıkta göster';

  @override
  String get pinInLibrary => 'Kitaplıkta sabitle';

  @override
  String get libraryItemNotFound =>
      'Bu henüz Kitaplıkta değil. Birazdan tekrar deneyin.';

  @override
  String creationPinned(String title) {
    return '“$title” sabitlendi';
  }

  @override
  String creationUnpinned(String title) {
    return '“$title” sabitlemesi kaldırıldı';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Güncellendi · sürüm $version';
  }

  @override
  String get madeHere => 'Burada yapılanlar';

  @override
  String madeHereEmpty(String bot) {
    return '$bot henüz bir şey yapmadı.';
  }

  @override
  String get madeHereThisChat => 'Bu sohbette';

  @override
  String madeHereByBot(String bot) {
    return '$bot tarafından yapıldı';
  }

  @override
  String madeHereElsewhere(String bot) {
    return '$bot botunun yaptığı diğer şeyler';
  }

  @override
  String madeHereCount(String count) {
    return 'Burada yapılanlar ($count)';
  }

  @override
  String get sidePanelComputer => 'Bilgisayar';

  @override
  String get madeForTicket => 'Bu talep için yapıldı';

  @override
  String get libraryCantChangePicked =>
      'Bunları yalnızca yapıldığı kişi veya botun yöneticileri değiştirebilir.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe silindi',
      one: '1 öğe silindi',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count seçili',
      one: '1 seçili',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'En yeni';

  @override
  String get librarySortOpened => 'Son açılanlar';

  @override
  String get librarySortName => 'Ad';

  @override
  String get libraryScopeMine => 'Benim için yapılanlar';

  @override
  String get libraryScopeWorkspace => 'Tüm çalışma alanı';

  @override
  String get libraryFilterSort => 'Sırala ve filtrele';

  @override
  String get creationWhoCanSee => 'Kimler görebilir';

  @override
  String get libraryTile => 'Kitaplık';

  @override
  String get libraryTileHelp => 'Yaptıkları';

  @override
  String get regenerateReply => 'Yeniden oluştur';

  @override
  String get deleteMessage => 'Mesajı sil';

  @override
  String get deleteMessageTitle => 'Bu mesaj silinsin mi?';

  @override
  String get deleteMessageBody =>
      'Bu sohbetteki herkes için kaldırılır. Etrafındaki mesajlar kalır.';

  @override
  String get messageDeleted => 'Mesaj silindi';

  @override
  String get findInChat => 'Sohbette bul';

  @override
  String get findInChatHint => 'Bu sohbette bul';

  @override
  String findInChatCount(int index, int count) {
    return '$index / $count';
  }

  @override
  String get findInChatNone => 'Eşleşme yok';

  @override
  String get findPrevious => 'Önceki eşleşme';

  @override
  String get findNext => 'Sonraki eşleşme';

  @override
  String get closeFind => 'Bulmayı kapat';

  @override
  String get pinTopic => 'Sabitle';

  @override
  String get unpinTopic => 'Sabitlemeyi kaldır';

  @override
  String get inAppAlertReview => 'İncele';

  @override
  String get forBot => 'Bot için';

  @override
  String get handBack => 'Geri ver';

  @override
  String get handBackNote => 'Bot için not (isteğe bağlı)';

  @override
  String get handBackNoteHint => 'Örneğin: Giriş yaptım, devam et';

  @override
  String get live => 'Canlı';

  @override
  String get liveView => 'Canlı görünüm';

  @override
  String get liveViewHelp =>
      'Bu bilgisayarı canlı izleyin ve gerektiğinde kontrolü alın.';

  @override
  String get newComputer => 'Yeni bilgisayar';

  @override
  String get newComputerHelp =>
      'Özel bilgisayar tek bir bota aittir. Dosyaları ekip bilgisayarından ayrı tutulur.';

  @override
  String get openLiveView => 'Canlı Görünümü Aç';

  @override
  String get liveExpand => 'Tam ekran';

  @override
  String get liveCopy => 'Kopyala';

  @override
  String get liveScreenshot => 'Ekran görüntüsü';

  @override
  String get liveScreenshots => 'Ekran görüntüleri';

  @override
  String get liveScreenshotsHelp =>
      'Canlı video bu ağdan geçemiyor, bu yüzden ekran yaklaşık saniyede bir güncellenir.';

  @override
  String get liveReconnecting => 'Yeniden bağlanıyor…';

  @override
  String get liveReconnectingHelp =>
      'Canlı video kesildi (sunucu yeniden başlatılıyor olabilir). Yeniden deneniyor; bu sırada ekran görüntüleri gösteriliyor.';

  @override
  String get liveTryAgain => 'Yeniden dene';

  @override
  String get liveDroppedHelp =>
      'Canlı video geri gelemedi, bu yüzden ekran yaklaşık saniyede bir güncellenir. Yeniden dene\'ye dokunun.';

  @override
  String get liveMore => 'Daha fazla';

  @override
  String get liveSaveScreenshot => 'Ekran görüntüsünü kaydet';

  @override
  String get liveCopyFromComputer => 'Bilgisayardan kopyala';

  @override
  String get livePasteToComputer => 'Bilgisayara yapıştır';

  @override
  String get liveRotateHint =>
      'Daha büyük bir ekran için telefonunuzu yan çevirin';

  @override
  String get liveWatching => 'İzleniyor';

  @override
  String get liveCopied => 'Bilgisayardan kopyalandı.';

  @override
  String get liveNothingCopied =>
      'Hiçbir şey kopyalanmadı. Önce bilgisayarda bir şey seçin.';

  @override
  String get livePasteEmpty => 'Panonuz boş.';

  @override
  String get liveMinimize => 'Yan panele dön';

  @override
  String get liveShownFullScreen => 'Canlı görünüm tam ekranda açık.';

  @override
  String get liveStillWatching => 'Hâlâ izliyor musunuz?';

  @override
  String get liveStillWatchingHelp =>
      'Güç tasarrufu için kimse izlemediğinde bilgisayar uyku moduna geçer.';

  @override
  String get liveKeepWatching => 'İzlemeye devam et';

  @override
  String get livePausedToSavePower => 'Güç tasarrufu için duraklatıldı';

  @override
  String get livePausedToSavePowerHelp =>
      'Kimse izlemiyordu, bu yüzden bilgisayar dinlenebilir. Sürdür yeniden uyandırır.';

  @override
  String get liveResume => 'Sürdür';

  @override
  String get paused => 'Duraklatıldı';

  @override
  String get pausedUserInControl =>
      'Duraklatıldı: Ekranı bir kişi kontrol ediyor';

  @override
  String get letBotUseTerminal => 'Terminal ve dosyaları kullanmasına izin ver';

  @override
  String get screenHandedBack => 'Ekran geri verildi';

  @override
  String get privateComputer => 'Özel bilgisayar';

  @override
  String get profileDesktop => 'Masaüstü';

  @override
  String get profileHeadless => 'Masaüstüsüz';

  @override
  String get rename => 'Yeniden adlandır';

  @override
  String get rightClickNextTap => 'Sonraki dokunuşta sağ tık';

  @override
  String get screenshotMode =>
      'Ekran görüntüleri (bu ağda canlı video kullanılamıyor)';

  @override
  String get showKeyboard => 'Klavye';

  @override
  String get someoneElseInControl => 'Başka biri kontrol ediyor';

  @override
  String get switchToDesktop => 'Masaüstüne geç';

  @override
  String get switchToHeadless => 'Masaüstüsüz moda geç';

  @override
  String get switchProfileConfirm =>
      'Mod değiştirmek için bilgisayar yeniden başlar. Dosyalarınız korunur, ancak şu anda çalışan her şey durur.';

  @override
  String get switchProfileButton => 'Değiştir';

  @override
  String get switchingToDesktop => 'Masaüstüne geçiliyor…';

  @override
  String get switchingToHeadless => 'Masaüstüsüz moda geçiliyor…';

  @override
  String get switchedToDesktop =>
      'Masaüstüne geçildi. Ekranını izlemek için Canlı Görünümü açın.';

  @override
  String get switchedToHeadless =>
      'Masaüstüsüz moda geçildi. Artık daha az bellek kullanıyor.';

  @override
  String get takeControl => 'Kontrolü al';

  @override
  String get takeoverCompleted => 'Geri verildi';

  @override
  String get takeoverDismissed => 'Reddedildi';

  @override
  String get takeoverPrivacy =>
      'Kontrol sizdeyken bot duraklatılır ve yazdığınız ya da gördüğünüz hiçbir şey ona gönderilmez.';

  @override
  String get liveShellOnTooltip =>
      'Kontrol sizdeyken botun terminal ve dosyaları kullanmaya devam etmesine izin verin';

  @override
  String get liveShellOffTooltip =>
      'Kontrol sizdeyken botun terminal ve dosyalarını da duraklatın';

  @override
  String get liveShellOnNote =>
      'Bot terminalini ve dosyalarını kullanmaya devam edebilir. Siz geri verene kadar ekranı hâlâ göremez veya kullanamaz.';

  @override
  String get liveShellOffNote =>
      'Siz geri verene kadar bot tamamen duraklatılır.';

  @override
  String get teamComputer => 'Ekip bilgisayarı';

  @override
  String get withDesktop => 'Masaüstü ile';

  @override
  String get withDesktopHelp =>
      'Canlı izleyebileceğiniz bir ekran ekler; daha fazla bellek kullanır';

  @override
  String get youAreInControl => 'Kontrol sizde';

  @override
  String botAsksForHelp(String reason) {
    return 'Bot soruyor: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot yardımınızı istiyor';
  }

  @override
  String deleteComputerConfirm(String name) {
    return '$name bilgisayarı silinsin mi? Dosyaları, anlık görüntüleri ve geri yükleme noktaları da silinir.';
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
    return '$bot botunun bilgisayarı';
  }

  @override
  String get micPermissionNeeded =>
      'Dikte etmek için mikrofon erişimine izin verin.';

  @override
  String get dictationEmpty => 'Konuşma algılanmadı. Tekrar deneyin.';

  @override
  String get startCall => 'Sesli arama başlat';

  @override
  String get stopDictation => 'Durdur ve metne dök';

  @override
  String get dictate => 'Dikte et';

  @override
  String get dictateOnDevice => 'Bu cihazla dikte et';

  @override
  String get stopListening => 'Dinlemeyi durdur';

  @override
  String get dictationRetry => 'Yeniden dene';

  @override
  String get dictationSayAgain => 'Tekrar söyleyin';

  @override
  String get dictationFailed => 'Metne dönüştürülemedi.';

  @override
  String get dictationFailedUseDevice =>
      'Metne dönüştürülemedi. Tekrar söyleyin, cihazınız dinlesin.';

  @override
  String get dictationNoServiceUseDevice =>
      'Bu çalışma alanı için dikte ayarlı değil. Bunun yerine cihazınız dinleyebilir.';

  @override
  String get dictationDeviceFailed =>
      'Cihazınızın diktesi çalışmayı durdurdu, bu nedenle mikrofon tekrar Casama\'nın diktesine geçti.';

  @override
  String get dictationDevicePermission =>
      'Bu cihazla dikte etmek için konuşma tanımaya izin verin.';

  @override
  String get readAloud => 'Sesli oku';

  @override
  String get callConnecting => 'Bağlanıyor…';

  @override
  String get callLive => 'Canlı';

  @override
  String get callEnded => 'Arama sona erdi';

  @override
  String get callEndedIdle =>
      '2 dakika sessizlikten sonra sesli arama sonlandırıldı.';

  @override
  String get callFailed => 'Sesli arama bağlanamadı.';

  @override
  String get callListening => 'Dinliyor';

  @override
  String get callSpeaking => 'Konuşuyor';

  @override
  String get callWorking => 'Üzerinde çalışıyor';

  @override
  String get callMutedState => 'Sessize alındı';

  @override
  String get callCaptions => 'Altyazılar';

  @override
  String get callSpeaker => 'Hoparlör';

  @override
  String get callEarpiece => 'Telefon';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Kulaklık';

  @override
  String get callAudioOutput => 'Sesli aramayı buradan çal';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Resmini değiştiriyor',
      'memory_search': 'Anılarınızda arıyor',
      'memory_write': 'Hafızaya kaydediyor',
      'memory': 'Hafızasını güncelliyor',
      'knowledge_search': 'Bilgilerinize bakıyor',
      'web_search': 'Web\'de arıyor',
      'web': 'Bir web sayfasını okuyor',
      'browser_open': 'Bir web sitesi açıyor',
      'browser_click': 'Sayfaya tıklıyor',
      'browser_type': 'Sayfaya yazıyor',
      'browser_press': 'Bir tuşa basıyor',
      'browser_scroll': 'Sayfayı kaydırıyor',
      'browser_look': 'Sayfaya bakıyor',
      'desktop_click': 'Ekrana tıklıyor',
      'desktop_type': 'Yazıyor',
      'desktop_press': 'Tuşlara basıyor',
      'desktop_launch': 'Bir uygulama açıyor',
      'desktop_look': 'Ekrana bakıyor',
      'shell': 'Bilgisayarında çalışıyor',
      'files_read': 'Bir dosya okuyor',
      'files_write': 'Bir dosya yazıyor',
      'files_list': 'Dosyalara bakıyor',
      'files_search': 'Dosyalarda arıyor',
      'files_from_chat': 'Sohbetten dosya alıyor',
      'http': 'Bir hizmetle iletişim kuruyor',
      'data_search': 'Veri arıyor',
      'data_call': 'Veri alıyor',
      'skills_load': 'Bir beceriyi hazırlıyor',
      'skills_create': 'Yeni bir beceri öğreniyor',
      'skills_update': 'Bir beceriyi geliştiriyor',
      'checkpoint': 'Geri yükleme noktası kaydediyor',
      'computer_restart': 'Bilgisayarını yeniden başlatıyor',
      'takeover': 'Kontrolü devralmanızı istiyor',
      'delegate': 'Bir yardımcıya soruyor',
      'routines_list': 'Rutinlerinizi kontrol ediyor',
      'routines_create': 'Bir rutin kuruyor',
      'routines_update': 'Bir rutini güncelliyor',
      'routines_delete': 'Bir rutini kaldırıyor',
      'watchers_create': 'Bir takip oluşturuyor',
      'watchers_list': 'Takiplerinizi kontrol ediyor',
      'watchers_delete': 'Bir takibi kaldırıyor',
      'tasks_list': 'Görevlerinizi kontrol ediyor',
      'tasks_create': 'Bir görev ekliyor',
      'tasks': 'Görevlerinizi güncelliyor',
      'notify_user': 'Size bir not gönderiyor',
      'usage_report': 'Kullanımı kontrol ediyor',
      'device_read': 'Cihaz verilerinizi okuyor',
      'device_access': 'Cihaz erişimi istiyor',
      'pages_publish': 'Bir sayfa yayınlıyor',
      'pages': 'Bir sayfayı güncelliyor',
      'media': 'Bir görsel oluşturuyor',
      'media_video': 'Bir video oluşturuyor',
      'bots_create': 'Yeni bir bot oluşturuyor',
      'bots_update': 'Bir botu güncelliyor',
      'bots_list': 'Botlarınızı kontrol ediyor',
      'bots_archive': 'Bir botu arşivliyor',
      'channel_send': 'Bir mesaj gönderiyor',
      'links_ask': 'Bir kişinin asistanına soruyor',
      'logins_list': 'Kayıtlı giriş bilgilerini kontrol ediyor',
      'replay_run': 'Kayıtlı adımları tekrarlıyor',
      'replay_save': 'Bu adımları kaydediyor',
      'setup_apply': 'Bir kurulum öneriyor',
      'sidebar_organize': 'Kenar çubuğunuzu düzenliyor',
      'suggestions_add': 'Bir öneri ekliyor',
      'teach_save_draft': 'Taslak beceri kaydediyor',
      'welcome_name': 'Bir ad seçiyor',
      'secrets_request': 'Sizden gizli bir bilgi istiyor',
      'pages_list': 'Sayfalarınızı kontrol ediyor',
      'pages_share': 'Sayfayı kimlerin görebileceğini değiştiriyor',
      'projects_create': 'Bir proje başlatıyor',
      'projects_status': 'Bir projeyi kontrol ediyor',
      'projects_update': 'Bir projeyi güncelliyor',
      'projects': 'Bir proje planlıyor',
      'payments': 'Ödeme yapmak için onay istiyor',
      'voice_call': 'Bir işletmeyi arıyor',
      'voice_call_user': 'Sizi arıyor',
      'tools_load': 'Hazırlanıyor',
      'ui_show': 'Size bir şey gösteriyor',
      'start_task': 'Bunu sohbette başlatıyor',
      'adult_sites_turn_on':
          'Yetişkinlere yönelik siteleri açmak için izin istiyor',
      'connections_attach': 'Bir uygulamayı kullanmaya başlıyor',
      'other': 'Üzerinde çalışıyor',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Resmini değiştirdi',
      'memory_search': 'Anılarınızda aradı',
      'memory_write': 'Hafızaya kaydetti',
      'memory': 'Hafızasını güncelledi',
      'knowledge_search': 'Bilgilerinize baktı',
      'web_search': 'Web\'de aradı',
      'web': 'Bir web sayfasını okudu',
      'browser_open': 'Bir web sitesi açtı',
      'browser_click': 'Sayfaya tıkladı',
      'browser_type': 'Sayfaya yazdı',
      'browser_press': 'Bir tuşa bastı',
      'browser_scroll': 'Sayfayı kaydırdı',
      'browser_look': 'Sayfaya baktı',
      'desktop_click': 'Ekrana tıkladı',
      'desktop_type': 'Yazdı',
      'desktop_press': 'Tuşlara bastı',
      'desktop_launch': 'Bir uygulama açtı',
      'desktop_look': 'Ekrana baktı',
      'shell': 'Bilgisayarında çalıştı',
      'files_read': 'Bir dosya okudu',
      'files_write': 'Bir dosya yazdı',
      'files_list': 'Dosyalara baktı',
      'files_search': 'Dosyalarda aradı',
      'files_from_chat': 'Sohbetten dosya aldı',
      'http': 'Bir hizmetle iletişim kurdu',
      'data_search': 'Veri aradı',
      'data_call': 'Veri aldı',
      'skills_load': 'Bir beceri kullandı',
      'skills_create': 'Yeni bir beceri öğrendi',
      'skills_update': 'Bir beceriyi geliştirdi',
      'checkpoint': 'Geri yükleme noktası kaydetti',
      'computer_restart': 'Bilgisayarını yeniden başlattı',
      'takeover': 'Kontrolü devralmanızı istedi',
      'delegate': 'Bir yardımcıya sordu',
      'routines_list': 'Rutinlerinizi kontrol etti',
      'routines_create': 'Bir rutin kurdu',
      'routines_update': 'Bir rutini güncelledi',
      'routines_delete': 'Bir rutini kaldırdı',
      'watchers_create': 'Bir takip oluşturdu',
      'watchers_list': 'Takiplerinizi kontrol etti',
      'watchers_delete': 'Bir takibi kaldırdı',
      'tasks_list': 'Görevlerinizi kontrol etti',
      'tasks_create': 'Bir görev ekledi',
      'tasks': 'Görevlerinizi güncelledi',
      'notify_user': 'Size bir not gönderdi',
      'usage_report': 'Kullanımı kontrol etti',
      'device_read': 'Cihaz verilerinizi okudu',
      'device_access': 'Cihaz erişimi istedi',
      'pages_publish': 'Bir sayfa yayınladı',
      'pages': 'Bir sayfayı güncelledi',
      'media': 'Bir görsel oluşturdu',
      'media_video': 'Bir video oluşturdu',
      'bots_create': 'Yeni bir bot oluşturdu',
      'bots_update': 'Bir botu güncelledi',
      'bots_list': 'Botlarınızı kontrol etti',
      'bots_archive': 'Bir botu arşivledi',
      'channel_send': 'Bir mesaj gönderdi',
      'links_ask': 'Bir kişinin asistanına sordu',
      'logins_list': 'Kayıtlı giriş bilgilerini kontrol etti',
      'replay_run': 'Kayıtlı adımları tekrarladı',
      'replay_save': 'Bu adımları kaydetti',
      'setup_apply': 'Bir kurulum önerdi',
      'sidebar_organize': 'Kenar çubuğunuzu düzenledi',
      'suggestions_add': 'Bir öneri ekledi',
      'teach_save_draft': 'Taslak beceri kaydetti',
      'welcome_name': 'Bir ad seçti',
      'secrets_request': 'Sizden gizli bir bilgi istedi',
      'pages_list': 'Sayfalarınızı kontrol etti',
      'pages_share': 'Sayfayı kimlerin görebileceğini değiştirdi',
      'projects_create': 'Bir proje başlattı',
      'projects_status': 'Bir projeyi kontrol etti',
      'projects_update': 'Bir projeyi güncelledi',
      'projects': 'Bir proje planladı',
      'payments': 'Ödeme yapmak için onay istedi',
      'voice_call': 'Bir işletmeyi aradı',
      'voice_call_user': 'Sizi aradı',
      'tools_load': 'Hazırlandı',
      'ui_show': 'Size bir şey gösterdi',
      'start_task': 'Sohbette başlattı',
      'adult_sites_turn_on':
          'Yetişkinlere yönelik siteleri açmak için izin istedi',
      'connections_attach': 'Bir uygulamayı kullanmaya başladı',
      'other': 'Tamamlandı',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return '$app kullanılıyor';
  }

  @override
  String toolUsedApp(String app) {
    return '$app kullanıldı';
  }

  @override
  String get toolDetails => 'Ayrıntılar';

  @override
  String approvalAsking(String bot) {
    return '$bot önce soruyor';
  }

  @override
  String get approvalLookClosely => 'İzin vermeden önce dikkatlice inceleyin';

  @override
  String approvalAttachConnection(String app) {
    return 'Bu çalışma alanında zaten bağlı olan $app uygulamasını kullanmaya başla';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return '$bot bunu sormadan yapabilsin';
  }

  @override
  String get pageShareToPublic =>
      'Bağlantıya sahip olan herkes bunu açabilecek';

  @override
  String get pageShareToWorkspace =>
      'Bu çalışma alanındaki herkes bunu açabilecek';

  @override
  String get pageShareToPrivate => 'Bunu yalnızca siz açabileceksiniz';

  @override
  String approvalAllowedLine(String what) {
    return 'İzin verildi: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Reddedildi: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'Süresi doldu, yanıt verilmedi: $what';
  }

  @override
  String get callToolFailed => 'Bu işe yaramadı';

  @override
  String get callToolNeedsOk => 'Devam etmek için onayınız gerekiyor';

  @override
  String get callToolAllow => 'İzin ver';

  @override
  String get callToolNotNow => 'Şimdi değil';

  @override
  String get callToolAllowed => 'İzin verildi. Sonuç sohbette görünecek';

  @override
  String get callToolDeclined => 'Şimdi değil dediniz';

  @override
  String get callToolBackground => 'Hâlâ çalışıyor. Sonuç sohbette görünecek';

  @override
  String get callToolInChat => 'Sonuç sohbette görünecek';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString sn';
  }

  @override
  String get callNeedsKeyTitle =>
      'Sesli aramalar için Google AI anahtarı gerekir';

  @override
  String get callNeedsKeyBody =>
      'Canlı aramalar Google\'ın Gemini Live hizmeti üzerinde çalışır, bu nedenle bu çalışma alanı için bir Google AI anahtarı gerekir. Yalnızca aramalar için kullanılır: sesli okuma, dikte, görseller ve videolar OpenRouter üzerinde çalışır. Google, AI Studio\'da ücretsiz bir anahtar verir: orada oluşturun, ardından Model anahtarları altına ekleyin; aramalar hemen çalışır. Yalnızca çalışma alanı sahipleri ve yöneticileri anahtar ekleyebilir.';

  @override
  String get callAddKey => 'Google AI anahtarı ekle';

  @override
  String get callGetFreeKey => 'Google\'dan ücretsiz anahtar alın';

  @override
  String get callMicUnmute => 'Mikrofonu aç';

  @override
  String get videoUnmute => 'Sesi aç';

  @override
  String get callMicMute => 'Mikrofonu kapat';

  @override
  String get videoMute => 'Sesi kapat';

  @override
  String get hangUp => 'Kapat';

  @override
  String callWith(String bot) {
    return '$bot ile arama';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return '$from ile sesli arama sonlandırılıp $to aransın mı?';
  }

  @override
  String get callSwitchBody =>
      'Aynı anda yalnızca bir aramada olabilirsiniz. Mevcut arama önce kendi sohbetine kaydedilir.';

  @override
  String get callSwitchConfirm => 'Bitir ve ara';

  @override
  String get callVoiceConsentTitle => 'Sesiniz Google\'a gönderilir';

  @override
  String get callVoiceConsentBody =>
      'Bir sesli aramada Casama, sesinizi ve söylediklerinizi Google Gemini\'ye gönderir; Gemini sizi duyar ve botunuzun yanıtlarını seslendirir. Aramadaki sözleriniz ayrıca OpenRouter üzerinden botunuzun kullandığı yapay zeka modeline gider. Siz kabul edene kadar hiçbir şey gönderilmez. Bunu istediğiniz zaman Ayarlar › Gizlilik bölümünden durdurabilirsiniz.';

  @override
  String get callVoiceConsentAgree => 'Kabul et ve ara';

  @override
  String get callVoiceConsentNotNow => 'Şimdi değil';

  @override
  String get callEndedLost =>
      'Bağlantı çok uzun süre kesildiği için sesli arama sona erdi.';

  @override
  String get callMinimize => 'Küçült';

  @override
  String get callEndCall => 'Sesli aramayı bitir';

  @override
  String get callEndAndAnswer => 'Bitir ve yanıtla';

  @override
  String get callReconnecting => 'Yeniden bağlanıyor…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dakika',
      one: '1 dakika',
      zero: 'bir dakikadan az',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return '$bot ile arama, $time, dönmek için dokunun';
  }

  @override
  String callReturnBar(String bot) {
    return '$bot ile sesli aramadasınız, dönmek için dokunun';
  }

  @override
  String get callOpen => 'Aramayı aç';

  @override
  String get callOnHold => 'Beklemede';

  @override
  String get callNotificationLive => 'Sesli aramada';

  @override
  String get callNotificationMuted => 'Sessize alındı';

  @override
  String get callNotificationChannel => 'Aramalar';

  @override
  String callTabTitle(String time) {
    return 'Sesli aramada · $time';
  }

  @override
  String get callMenuShow => 'Aramayı göster';

  @override
  String get callJobWorking => 'Üzerinde çalışıyor';

  @override
  String callJobStrip(String task) {
    return 'Üzerinde çalışılan: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'Sizden yanıt bekliyor: $task';
  }

  @override
  String get callTileWatching => 'Canlı görünüm';

  @override
  String get callTileDone => 'Tamamlandı';

  @override
  String get callTileNeedsYou => 'Yanıt bekliyor';

  @override
  String callTileLabel(String state) {
    return 'Botun ekranı, $state. Tam boyutta görmek için dokunun';
  }

  @override
  String get callTileHide => 'Ekranı gizle';

  @override
  String get screenCardLive => 'canlı';

  @override
  String screenCardLabel(String bot, String state) {
    return '$bot botunun ekranı, $state';
  }

  @override
  String get screenCardOpen => 'Tam ekran aç';

  @override
  String get screenCardYouHave => 'Ekran sizde';

  @override
  String screenCardHeldBy(String name) {
    return 'Ekran $name kişisinde';
  }

  @override
  String get screenCardMore => 'Diğer seçenekler';

  @override
  String screenCardIntro(String bot) {
    return '$bot botunun ekranı. İzlemek için dokunun, taşımak için sürükleyin.';
  }

  @override
  String get screenCardHideForNow => 'Şimdilik gizle';

  @override
  String get screenCardDontShow => 'Otomatik gösterme';

  @override
  String get screenCardTurnedOff =>
      'Ekran kartı kapalı. Ayarlar\'dan tekrar açabilirsiniz.';

  @override
  String get screenCardOfferOff =>
      'Ekran kartını sık sık gizliyor musunuz? Kapatabilirsiniz.';

  @override
  String get screenCardTurnOff => 'Kapat';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot ekranda yardımınızı bekliyor';
  }

  @override
  String callRecapTitle(String length) {
    return 'Arama · $length';
  }

  @override
  String get callRecapStarted => 'Sesli aramada başlatıldı';

  @override
  String get callRecapTaskDone => 'Tamamlandı';

  @override
  String get callRecapTaskFailed => 'Tamamlanamadı';

  @override
  String get callRecapTaskStopped => 'Durduruldu';

  @override
  String get callRecapTaskRunning => 'Hâlâ çalışıyor';

  @override
  String get callRecapOpenRun => 'Ne yaptığını gör';

  @override
  String get summarizeCalls => 'Aramaları özetle';

  @override
  String get summarizeCallsHelp =>
      'Her aramadan sonra kartı, aramanın ne hakkında olduğunu ve sıradaki adımı gösterir. Botun küçük modelinden çok az kullanır.';

  @override
  String callCardVoice(String length) {
    return 'Sesli arama · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Telefon araması · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Arama düştü · $length';
  }

  @override
  String callCardMissed(String name) {
    return '$name botundan cevapsız arama';
  }

  @override
  String callCardLive(String name) {
    return '$name ile sesli aramada';
  }

  @override
  String get callCardLiveElsewhere => 'Başka bir cihazda sesli aramada';

  @override
  String get callCardReturn => 'Aramaya dön';

  @override
  String callCardBotHungUp(String name) {
    return '$name aramayı kapattı';
  }

  @override
  String get callCardEndedQuiet => 'Sessizlik sonrası sona erdi';

  @override
  String get callCardEndedLimit => 'Sesli arama sınırında sona erdi';

  @override
  String get callCardWritingSummary => 'Özet yazılıyor…';

  @override
  String callCardSummaryBy(String name) {
    return '$name tarafından özet';
  }

  @override
  String get callCardNextSteps => 'Sıradaki adımlar';

  @override
  String get callCardDoIt => 'Yap';

  @override
  String get callCardDismissStep => 'Kapat';

  @override
  String get callCardStepStarted => 'Başlatıldı';

  @override
  String get callCardStepFailed => 'Bu başlatılamadı. Tekrar deneyin.';

  @override
  String get callCardDoneOnCall => 'Sesli aramada yapıldı';

  @override
  String callCardMore(int count) {
    return '$count tane daha';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Döküm · $count konuşma',
      one: 'Döküm · 1 konuşma',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Döküm';

  @override
  String get callCardSearchTranscript => 'Dökümde ara';

  @override
  String get callCardNoMatches => 'Eşleşme yok';

  @override
  String get callCardYou => 'Siz';

  @override
  String get callCardCallBack => 'Geri ara';

  @override
  String get callCardCopy => 'Kopyala';

  @override
  String get callCardCopied => 'Kopyalandı';

  @override
  String get callCardShare => 'Paylaş';

  @override
  String get callCardMoreActions => 'Daha fazla';

  @override
  String get callCardDelete => 'Aramayı sil';

  @override
  String get callCardDeleteTitle => 'Bu sesli arama silinsin mi?';

  @override
  String get callCardDeleteBody =>
      'Kartı ve dökümü bu sohbetten kaldırılır. Başlattığı işlerin sonuçları korunur.';

  @override
  String get callCardDeleted => 'Arama silindi';

  @override
  String get callCardDeleteFailed => 'Sesli arama silinemedi';

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

    return 'Yanıt $msString ms içinde başladı';
  }

  @override
  String get voiceSettings => 'Ses';

  @override
  String get voiceSettingsHelp =>
      'Sesli okuma sesi ve botun aramalarda sahip olduğu araçlar';

  @override
  String get callTools => 'Aramalardaki araçlar';

  @override
  String get callToolsHelp =>
      'Aramalar zaten hafıza, web araması, size notlar, rutinler ve talepleri içerir; daha büyük işleri sohbete aktarır. Botun canlı olarak kullanması gereken bağlı uygulama araçlarını ekleyin; her biri arama maliyetine küçük bir miktar ekler.';

  @override
  String get callToolsNone =>
      'Bu bot için henüz etkinleştirilmiş bağlı uygulama yok. Entegrasyonlar bölümünden birini açın, ardından araçlarını buradan seçin.';

  @override
  String get openIntegrations => 'Entegrasyonları aç';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bağlı uygulama aracı eklendi',
      one: '1 bağlı uygulama aracı eklendi',
      zero: 'Yalnızca yerleşik ses araçları',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'Ses kimliği (isteğe bağlı)';

  @override
  String get voiceIdHelp =>
      'Kore veya Puck gibi bir Gemini ses adı; boş bırakılırsa Kore kullanılır';

  @override
  String get useThisComputer => 'Botlar için bu bilgisayarı kullan';

  @override
  String get companionDesktopOnly =>
      'Yalnızca masaüstü uygulaması (macOS, Windows, Linux) bot bilgisayarı olarak çalışabilir.';

  @override
  String get companionIntro =>
      'Seçtiğiniz botların bu bilgisayarda çalışmasına izin verin: komut çalıştırabilir, seçtiğiniz klasörlerdeki dosyaları düzenleyebilir, tarayıcıda gezinebilir ve uygulamaları kullanabilirler. Yaptıkları her şey ekranda görünür ve durdurulabilir. Siz her yetkiyi onaylayana kadar kapalıdır.';

  @override
  String get thisComputer => 'Bu bilgisayar';

  @override
  String get companionOnline =>
      'Açık: izin verdiğiniz botlar bu bilgisayarı kullanabilir';

  @override
  String get companionError => 'Casama\'ya ulaşılamıyor; yeniden deneniyor';

  @override
  String get companionOff => 'Kapalı';

  @override
  String get companionCapabilities => 'Botların yapabilecekleri';

  @override
  String get companionCapabilitiesHelp =>
      'Her birini onaylayın. Botun otonomisi ne olursa olsun, riskli işlemler için her zaman sorulur.';

  @override
  String get capShell => 'Komut çalıştır (paylaşılan klasörler içinde)';

  @override
  String get capFiles => 'Paylaşılan klasörlerdeki dosyaları oku ve düzenle';

  @override
  String get capBrowser =>
      'Tarayıcı kullan (sizinkinden ayrı, kendi tarayıcısı)';

  @override
  String get capDesktop => 'Masaüstü uygulamalarını kullan';

  @override
  String get sharedFolders => 'Paylaşılan klasörler';

  @override
  String get sharedFoldersHelp => 'Botlar yalnızca bu klasörlere erişebilir.';

  @override
  String get addFolder => 'Klasör ekle';

  @override
  String get botsAllowed => 'İzin verilen botlar';

  @override
  String get botsAllowedHelp =>
      'İzin verilen botlar bu bilgisayarda da çalışabilir. Her biri kendi bilgisayarını korur ve bir görev bunu gerektirmediği sürece onu kullanır.';

  @override
  String get worksOnTitle => 'Çalıştığı yer';

  @override
  String worksOnSubtitle(String bot) {
    return '$bot botunun sizin için komut çalıştırdığı, dosya kullandığı ve gezindiği yer.';
  }

  @override
  String get worksOnAuto => 'Otomatik';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot her adım için seçer: görev sizinkini gerektirmediği sürece kendi bilgisayarı.';
  }

  @override
  String get worksOnBot => 'Yalnızca botun bilgisayarı';

  @override
  String get worksOnBotHelp => 'Sizin bilgisayarınız hiç kullanılmaz.';

  @override
  String get worksOnMine => 'Yalnızca benim bilgisayarım';

  @override
  String get worksOnMineHelp =>
      'Her şey sizin bilgisayarınızda gerçekleşir, bu yüzden açık olması gerekir.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Her şey $computer üzerinde gerçekleşir, bu yüzden açık olması gerekir.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Çalıştığı yer: $mode';
  }

  @override
  String placesTitle(String bot) {
    return '$bot botunun çalıştığı yer';
  }

  @override
  String get placesSubtitle =>
      'Burada bakılacak bilgisayarı seçin. Çalıştığı yer ayarı, botun işini nerede yapacağını belirler.';

  @override
  String placesBarLabel(String computer, String mode) {
    return '$computer gösteriliyor. Çalıştığı yer: $mode. Değiştir';
  }

  @override
  String get placeYoursOnline => 'Bilgisayarınız · Çevrimiçi';

  @override
  String get placeYoursOffline => 'Bilgisayarınız · Çevrimdışı';

  @override
  String get placeTeamComputer => 'Ekip bilgisayarı';

  @override
  String placeBotsOwn(String bot) {
    return '$bot botunun kendi bilgisayarı';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$computer üzerinde $action';
  }

  @override
  String get botYourComputer => 'Bilgisayarınız';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone =>
      'Bilgisayarlarınızın hiçbirinde izin verilmedi';

  @override
  String botYourComputerHow(String bot) {
    return '$bot botunun bilgisayarınızda da çalışmasına izin vermek için o bilgisayarda Casama\'yı açın ve Ayarlar → Botlar için bu bilgisayarı kullan → İzin verilen botlar altından etkinleştirin. Her iki durumda da kendi bilgisayarını korur.';
  }

  @override
  String get routineWhere => 'Çalıştığı yer';

  @override
  String get routineWhereHelp =>
      'Bu rutinin komutları nerede çalıştıracağı ve dosyaları nerede kullanacağı.';

  @override
  String get routineWhereBot => 'Botun bilgisayarı';

  @override
  String get routineWhereBotHelp =>
      'Bilgisayarınız açık olsa da olmasa da çalışır.';

  @override
  String get routineWhereMine => 'Açık olduğunda benim bilgisayarım';

  @override
  String get routineWhereMineHelp =>
      'Kendi dosya ve uygulamalarınızdaki işler için. Bilgisayar kapalı olduğunda çalıştırma bunu bildirir.';

  @override
  String get routineUsesComputer => 'Bilgisayar kullanır';

  @override
  String get routineUsesComputerOn =>
      'Dosya kaydedebilir, komut çalıştırabilir ve sayfalara göz atabilir.';

  @override
  String get routineUsesComputerOff =>
      'Yalnızca uygulamalarınızı, webi ve hafızayı okur. Daha hızlıdır ve bilgisayar uyandırmaz.';

  @override
  String get computerBotsAllowed => 'İzin verilen botlar';

  @override
  String get unpairComputer =>
      'Bu bilgisayarı kullanmayı bırak ve eşleştirmeyi kaldır';

  @override
  String botActingHere(String bot, String action) {
    return '$bot bu bilgisayarda çalışıyor: $action';
  }

  @override
  String get quickAsk => 'Hızlı sor';

  @override
  String get quickAskHint => 'Bir bota istediğinizi sorun…';

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
  String get cloudModelsTitle => 'Bulut modelleri';

  @override
  String get cloudModelsHelp =>
      'Tüm Cloud sunucularına saniyeler içinde uygulanır.';

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
  String get connectionsTitle => 'Uygulama bağlantıları';

  @override
  String get connectionsServerComposio => 'Casama\'nın Composio hesabı';

  @override
  String get connectionsServerComposioHelp =>
      'Kendi girişi olmayan uygulamalar bu sunucunun Composio hesabı üzerinden tek tıkla bağlanır.';

  @override
  String get connectionsOwnAccounts => 'Kişilerin kendi hesapları';

  @override
  String get connectionsOwnAccountsHelp =>
      'Herkes kendi Composio, Pipedream veya Zapier hesabını kullanır.';

  @override
  String get connectionsNoComposioKey =>
      'Casama\'nın hesabını kullanmak için bu sunucuya COMPOSIO_API_KEY ekleyin.';

  @override
  String get connectionsGoogleTitle => 'Google uygulamaları';

  @override
  String get connectionsGoogleComposio => 'Composio üzerinden';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Takvim, Drive ve daha fazlası hemen çalışır.';

  @override
  String get connectionsGoogleDirect => 'Google\'ın kendi sunucuları';

  @override
  String get connectionsGoogleDirectHelp =>
      'Google Workspace Developer Preview kaydı gerektirir.';

  @override
  String get notInstanceOwner =>
      'Yönetici konsolunu yalnızca sunucu sahibi açabilir.';

  @override
  String get runs24h => 'Çalıştırmalar (24 sa.)';

  @override
  String get failedRuns24h => 'Başarısız çalıştırmalar (24 sa.)';

  @override
  String get cost24h => 'Harcama (24 sa.)';

  @override
  String get computersRunning => 'Çalışan bilgisayarlar';

  @override
  String get devicesOnline => 'Çevrimiçi kişisel bilgisayarlar';

  @override
  String get editQuotas => 'Kotaları düzenle';

  @override
  String get maxBots => 'Bot sınırı';

  @override
  String get monthlyUsd => 'Aylık harcama sınırı (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'Casama $latest sürümü mevcut (siz $current çalıştırıyorsunuz)';
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
      other: '$nString çalışma alanı',
      one: '1 çalışma alanı',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'giriş: $when';
  }

  @override
  String quotasFor(String name) {
    return '$name için kotalar';
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
      other: '$nString üye',
      one: '1 üye',
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
    return '30 günde $usd';
  }

  @override
  String get connectingToServer => 'Casama\'ya bağlanılıyor…';

  @override
  String get cannotReachServer => 'Casama sunucunuza ulaşılamıyor';

  @override
  String get connectionFailed =>
      'Casama sunucunuza ulaşılamadı. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get serverNotResponding =>
      'Casama sunucunuz şu anda yanıt vermiyor. Birazdan tekrar deneyin.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Bağlantınızı veya $url adresindeki sunucunun çalışıp çalışmadığını kontrol edin.';
  }

  @override
  String get serverUnreachableBody =>
      'Çevrimiçi olup olmadığınızı kontrol edin. Çevrimiçiyseniz sunucu yeniden başlatılıyor olabilir; denemeye devam edeceğiz.';

  @override
  String retryingIn(int seconds) {
    return '$seconds sn içinde tekrar deneniyor';
  }

  @override
  String get retryingNow => 'Deneniyor…';

  @override
  String get upgradeTitle => 'Planınızı yükseltin';

  @override
  String get notNow => 'Şimdi değil';

  @override
  String get seePlans => 'Planları gör';

  @override
  String get billing => 'Faturalandırma';

  @override
  String get billingOffSelfHosted =>
      'Bu sunucuda faturalandırma kapalı. Kendi lisansı ile çalışır: bir kişi için kişisel kullanım ücretsizdir, ekipler ise Business lisansı kullanır.';

  @override
  String get restorePurchases => 'Satın alımları geri yükle';

  @override
  String get restoreStarted => 'Satın alımlarınız kontrol ediliyor…';

  @override
  String get plans => 'Planlar';

  @override
  String get currentPlan => 'Mevcut plan';

  @override
  String subscribeFor(String price) {
    return '$price karşılığında abone ol';
  }

  @override
  String get subscribeOnWeb => 'Web üzerinden abone ol';

  @override
  String get credits => 'Krediler';

  @override
  String get creditHistory => 'Kredi geçmişi';

  @override
  String get creditReasonPurchase => 'Kredi satın alındı';

  @override
  String get creditReasonGrant => 'Kredi eklendi';

  @override
  String get creditReasonRefund => 'İade';

  @override
  String get creditReasonAdjustment => 'Düzeltme';

  @override
  String get creditReasonExpire => 'Kredilerin süresi doldu';

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
  String get limitBotsUnlimited => 'Sınırsız bot';

  @override
  String get unlimitedValue => 'Sınırsız';

  @override
  String trialDaysFree(int n) {
    return '$n gün ücretsiz';
  }

  @override
  String get extraPeople => 'Ek kişiler';

  @override
  String extraPeopleHelp(String price, int seats) {
    return 'Planınızın içerdiği $seats kişiye ek olarak kişi başı aylık $price.';
  }

  @override
  String get extraPeopleSaved => 'Ek kişiler güncellendi';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return 'Aylık $hoursString bilgisayar saati';
  }

  @override
  String limitCredits(String amount) {
    return 'Aylık $amount kredi';
  }

  @override
  String get viaWeb => 'Web üzerinden faturalandırılır';

  @override
  String get viaAppStore => 'App Store üzerinden faturalandırılır';

  @override
  String get viaGooglePlay => 'Google Play üzerinden faturalandırılır';

  @override
  String get yourPlan => 'Planınız';

  @override
  String planEndsOn(String date) {
    return '$date tarihinde sona erer';
  }

  @override
  String planRenewsOn(String date) {
    return '$date tarihinde yenilenir';
  }

  @override
  String creditsBalance(String amount) {
    return 'Kredi: $amount';
  }

  @override
  String get manageSubscription => 'Aboneliği yönet';

  @override
  String get compViaCasama => 'Casama\'dan ücretsiz';

  @override
  String compFreeUntil(String date) {
    return '$date tarihine kadar ücretsiz';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Test satın alımı. Test kullanıcısı sınırları geçerlidir: aylık $credits kredi ve günlük $daily.';
  }

  @override
  String compKeepPlan(String plan) {
    return '$plan planını koru';
  }

  @override
  String get haveGiftCode => 'Hediye kodunuz var mı?';

  @override
  String get redeemCodeTitle => 'Hediye kodu kullan';

  @override
  String get redeemCodeIntro =>
      'Size verilen kodu girin. Plan, hiçbir ücret ödemeden seçtiğiniz çalışma alanına tanımlanır.';

  @override
  String get redeemCodeLabel => 'Hediye kodu';

  @override
  String get redeemCodeChecking => 'Kontrol ediliyor…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months ay ücretsiz $plan',
      one: '1 ay ücretsiz $plan',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid =>
      'Bu kod mevcut değil veya artık kullanılamıyor.';

  @override
  String get redeemCodeWorkspace => 'Çalışma alanı';

  @override
  String get redeemCodeSubmit => 'Kullan';

  @override
  String get redeemCodeFinePrint =>
      'Kişi başına bir hediye kodu. Süresi dolduğunda bir plan seçmezseniz çalışma alanı Ücretsiz plana geçer.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan sizin';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Çalışma alanınız $date tarihine kadar ücretsiz $plan planına sahip. Kullanmak için Casama\'yı herhangi bir cihazda açın.';
  }

  @override
  String get redeemCodeOpenBilling => 'Faturalandırmayı aç';

  @override
  String get redeemCodeNoWorkspace =>
      'Hediye kodu sahibi olduğunuz bir çalışma alanına uygulanır. Önce bir tane oluşturun, ardından bağlantıyı tekrar açın.';

  @override
  String get redeemCodeUnavailable =>
      'Bu özellik uygulamanın bu sürümünde kullanılamıyor.';

  @override
  String usageComputerHours(String hours) {
    return 'Bulut bilgisayarları: $hours sa.';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Canlı görünüm: $minutes dk.';
  }

  @override
  String get thisMonth => 'Bu ay';

  @override
  String get noBillableUsage => 'Henüz faturalandırılabilir kullanım yok.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Kendi sunucunuzda barındırılan Casama\'yı bu çalışma alanına bağlayın. Herkese açık bir adres ve bildirimler ücretsizdir; bulut bilgisayarları ve model kredileri buradan faturalandırılır.';

  @override
  String get linkCloudNewKey => 'Yeni Casama Link anahtarı';

  @override
  String get linkCloudKeyCreated => 'Anahtar oluşturuldu';

  @override
  String get linkCloudKeyOnce =>
      'Şimdi kopyalayın; yalnızca bir kez gösterilir. Sunucunuzda CASAMA_CLOUD_URL ile ayarlayın.';

  @override
  String get copy => 'Kopyala';

  @override
  String get revoke => 'İptal et';

  @override
  String get instanceName => 'Sunucu adı';

  @override
  String get server => 'Sunucu';

  @override
  String get serverAddress => 'Sunucu adresi';

  @override
  String get serverAddressInvalid =>
      'https://casama.example.com veya http://192.168.1.20:8080 gibi bir sunucu adresi girin.';

  @override
  String get connect => 'Bağlan';

  @override
  String get changeServer => 'Farklı bir sunucu kullan';

  @override
  String serverIs(String host) {
    return 'Sunucu: $host';
  }

  @override
  String get continueWithSso => 'SSO ile devam et';

  @override
  String get workEmail => 'İş e-postası';

  @override
  String get privacy => 'Gizlilik';

  @override
  String get exportMyData => 'Verilerimi dışa aktar';

  @override
  String get exportMyDataHelp =>
      'Botlar, sohbetler, çalıştırmalar, anılar ve ayarlar. Gizli anahtarlar hariç.';

  @override
  String exportReady(String kb) {
    return 'Dışa aktarım hazır ($kb KB)';
  }

  @override
  String get runHistoryRetention => 'Çalıştırma geçmişini saklama süresi';

  @override
  String get runHistoryRetentionHelp =>
      'Daha eski çalıştırma olayları otomatik olarak silinir.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString gün',
      one: '1 gün',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Hesabımı sil';

  @override
  String get deleteAccountHelp =>
      'Kısa bir bekleme süresinin ardından verilerinizi siler.';

  @override
  String get deleteAccountQuestion => 'Hesabınız silinsin mi?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Tek sahibi olduğunuz çalışma alanları, botları ve bilgisayarları dahil hesabınızla birlikte silinir. Web üzerinden alınan bir plan otomatik olarak iptal edilir. App Store veya Google Play\'den alınan bir plan ise iptal edilmez: ilgili mağazadan iptal edin. Onaylamak için $email yazın.';
  }

  @override
  String get accountDeleted => 'Hesabın silinmesi planlandı';

  @override
  String accountDeletedBody(String date) {
    return 'Çıkış yapıldı. Verileriniz $date tarihinde silinecek.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString adım',
      one: '1 adım',
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
      other: 'Önceki $countString adımı göster',
      one: 'Önceki 1 adımı göster',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Kopyalandı';

  @override
  String get jumpToLatest => 'En sona git';

  @override
  String get chatViewFullTable => 'Tam tabloyu görüntüle';

  @override
  String get chatShowMore => 'Daha fazla göster';

  @override
  String get chatShowLess => 'Daha az göster';

  @override
  String get chatTableTitle => 'Tablo';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Başlamak için $bot botuna istediğiniz her şeyi sorun veya aşağıdaki bir fikre dokunun.';
  }

  @override
  String get suggestPlanDay => 'Günümü planlamama yardım et';

  @override
  String get suggestWriteMessage => 'Bir mesaj yazmama yardım et';

  @override
  String get suggestExplain => 'Bir konuyu araştırıp basitçe açıkla';

  @override
  String get suggestCapabilities =>
      'Bana hangi konularda yardımcı olabilirsin?';

  @override
  String connectedAppSummary(String app) {
    return '$app bağlandı';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama bu sunucuyu doğrulamadı. Yalnızca $host adresine güveniyorsanız bağlayın.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama bu sunucuyu doğrulamadı. Yalnızca onu çalıştıran kişiye güveniyorsanız bağlayın.';

  @override
  String get serverAddressLabel => 'Sunucu adresi';

  @override
  String get serverAddressHelp =>
      'Sunucunun adresini yapıştırın. İçinde bir anahtar varsa şifrelenerek saklanır ve sohbetin dışında kalır.';

  @override
  String get serverChecking => 'Sunucu kontrol ediliyor…';

  @override
  String serverSignInOn(String host) {
    return '$host üzerinden giriş yapacaksınız.';
  }

  @override
  String get serverUseKey => 'Bunun yerine anahtar kullan';

  @override
  String get serverUseSignIn => 'Bunun yerine giriş yap';

  @override
  String serverSignInUnavailable(String name) {
    return '$name bu Casama sunucusundan tarayıcı girişi kabul edemiyor. Bir anahtar kullanın.';
  }

  @override
  String get serverNoSignIn => 'Bu sunucu giriş yapmadan çalışır.';

  @override
  String get serverHeaderLabel => 'Üstbilgi adı (isteğe bağlı)';

  @override
  String get serverToolsTitle => 'Kullanabileceği araçlar';

  @override
  String get serverToolsHelp =>
      'İstemediklerinizi kapatın. Botlar riskli adımlardan önce yine de sorar.';

  @override
  String addedInChatBy(String bot) {
    return 'Sohbette $bot tarafından eklendi';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name kendi bilgisayarınızda çalışır. Eklemek için o bilgisayarda Casama\'yı açın ve Bu bilgisayarı kullan ayarını etkinleştirin.';
  }

  @override
  String get connectAppsTitle => 'Uygulamalarınızı bağlayın';

  @override
  String get moreApps => 'Daha fazla';

  @override
  String addAppTile(String app) {
    return '$app uygulamasını bu bota ekle';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$app, $bot botuna eklendi';
  }

  @override
  String get connectAppsHint =>
      'Zaten kullandığınız araçlarda okuyup işlem yapmama izin verin.';

  @override
  String connectAppTile(String app) {
    return '$app bağla';
  }

  @override
  String get showComputer => 'Bilgisayarı göster';

  @override
  String get hideComputer => 'Bilgisayarı gizle';

  @override
  String get moreActions => 'Daha fazla';

  @override
  String get noConversations => 'Henüz sohbet yok';

  @override
  String get untitledChat => 'Yeni sohbet';

  @override
  String get listening => 'Dinliyor…';

  @override
  String get orLabel => 'veya';

  @override
  String get notificationsPrimerBubble => 'Hiçbir şeyi kaçırmayın!';

  @override
  String get notificationsPrimerTitle => 'Bildirimleri açın';

  @override
  String get notificationsPrimerBody =>
      'Botlarınız sizden bir karar gerektiğinde veya işleri hazır olduğunda size haber verir.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome bu site için bildirimleri engelliyor. Adres çubuğundaki kilit simgesinden izin verin, ardından Aç\'a tekrar dokunun.';

  @override
  String get notificationsTurnOn => 'Aç';

  @override
  String get autoUpdates => 'Otomatik güncelle';

  @override
  String get autoUpdatesHelp => 'Çıktığınızda yeni sürümleri yükler.';

  @override
  String get upToDate => 'Casama güncel';

  @override
  String get noReleasesToCheck =>
      'Bu bilgisayar için henüz bir sürüm yayınlanmadı, bu yüzden bu sürümle karşılaştırılacak bir şey yok.';

  @override
  String updateReady(String version) {
    return 'Casama $version mevcut';
  }

  @override
  String appVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Casama $version yenilikleri';
  }

  @override
  String get whatsNewGotIt => 'Anladım';

  @override
  String get whatsNewSubtitle => 'Son güncellemenizden bu yana değişenler:';

  @override
  String get whatsNew010Calls =>
      'Botlarınızı arayın ve konuları konuşarak halledin. Altyazılı olarak sesli yanıt verirler.';

  @override
  String get whatsNew010Looks =>
      'Casama\'yı kendinize göre özelleştirin: Ayarlar → Görünüm bölümünde temalar, renk düzenleri, yazı tipleri ve duvar kağıtları; galeride daha fazlası var.';

  @override
  String get whatsNew010AboutYou =>
      'Ayarlar → Hakkınızda bölümünde botlarınıza kendinizden bir kez bahsedin: size nasıl hitap edeceklerini ve yanıtları nasıl sevdiğinizi anlatın.';

  @override
  String get whatsNew010SignIn =>
      'Geçiş anahtarı, Apple, Google veya e-postanıza gelen bir kodla giriş yapın.';

  @override
  String get openAtLogin => 'Oturum açıldığında aç';

  @override
  String get openAtLoginHelp => 'Hızlı sor kısayolu için hazır.';

  @override
  String get signInTagline =>
      'Siz uygulamayı kapattıktan sonra da çalışmaya devam eden ekip arkadaşları.';

  @override
  String get signInTagline2 => 'Yapay zeka ekibinizle tanışın.';

  @override
  String get signInTagline3 =>
      'Sadece konuşmakla kalmayan yapay zeka. İşleri halleder.';

  @override
  String get signInTagline4 =>
      'Hareket etmeden önce soran yetenekli ekip arkadaşları.';

  @override
  String get signInTagline5 => 'İşi devredin. Döndüğünüzde bitmiş olsun.';

  @override
  String get noBotsHelp =>
      'Bot, kendi bilgisayarına sahip bir ekip arkadaşıdır. Sohbet etmeye başlamak için bir tane oluşturun.';

  @override
  String get newBotSubtitle =>
      'Kendi bilgisayarına ve hafızasına sahip bir ekip arkadaşı.';

  @override
  String get appearance => 'Görünüm';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI veya uyumlu başka bir sağlayıcı';

  @override
  String get signOutConfirm =>
      'İstediğiniz zaman tekrar giriş yapabilirsiniz; botlarınız çalışmaya devam eder.';

  @override
  String get roleOwner => 'Sahip';

  @override
  String get roleAdmin => 'Yönetici';

  @override
  String get roleMember => 'Üye';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeDark => 'Koyu';

  @override
  String get createWorkspaceBody =>
      'Çalışma alanı botlarınızı, bilgisayarlarını ve birlikte çalıştığınız kişileri barındırır.';

  @override
  String get workspaceNameHint => 'Ekibim';

  @override
  String get orJoinWithCode => 'veya davet koduyla katılın';

  @override
  String get getOpenRouterKey => 'OpenRouter anahtarı al';

  @override
  String get createFirstBotBody =>
      'Ona bir ad ve model verin. İkisini de daha sonra değiştirebilirsiniz.';

  @override
  String stepOf(int step, int total) {
    return 'Adım $step / $total';
  }

  @override
  String get providerHintOpenRouter => 'önerilen: sohbet, görsel, video, ses';

  @override
  String get providerHintGoogle => 'yalnızca canlı sesli aramalar';

  @override
  String get providerHintCompatible => 'OpenAI uyumlu herhangi bir API';

  @override
  String get providerHintSearch => 'web araması';

  @override
  String get noRoutinesHelp =>
      'Rutin, bir botun daha sonra kendi başına yaptığı bir iştir: seçtiğiniz bir saatte bir kez, belirli bir düzende veya bir webhook geldiğinde.';

  @override
  String get routineOnce => 'Bir kez';

  @override
  String lastRun(String when) {
    return 'Son: $when';
  }

  @override
  String get routineOff => 'Kapalı';

  @override
  String get routineEnds => 'Bitiş';

  @override
  String get routineEndsNever => 'Hiçbir zaman';

  @override
  String get routineEndsOnDate => 'Belirli bir tarihte';

  @override
  String get routineEndsAfterRuns => 'Belirli sayıda çalıştırmadan sonra';

  @override
  String get routineEndDate => 'Son gün';

  @override
  String get routineRunCountLabel => 'Çalıştırmalar';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n çalıştırma',
      one: '1 çalıştırma',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return 'Bitiş: $when';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n çalıştırma kaldı',
      one: '1 çalıştırma kaldı',
      zero: 'Kalan çalıştırma yok',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'Ne zaman biteceği';

  @override
  String get routineEndTitle => 'Ne zaman biteceği';

  @override
  String get routineEndSubtitle =>
      'O zaman kendini kapatır. Yeni bir çalıştırma sayısı şu andan itibaren sayılır.';

  @override
  String deleteRoutineTitle(String name) {
    return '“$name” silinsin mi?';
  }

  @override
  String get deleteRoutineBody =>
      'Bir daha çalışmayacak. Daha önce paylaştığı sonuçlar sohbetlerinde kalır.';

  @override
  String get triggerOnce => 'Bir kez';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString dk içinde';
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
      other: '$nString saat içinde',
      one: '1 saat içinde',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Yarın $time';
  }

  @override
  String get integrationNeedsName => 'En az bir harf içeren bir ad verin.';

  @override
  String integrationNeedsField(String field) {
    return 'Kaydetmek için $field alanını doldurun.';
  }

  @override
  String integrationSavedAs(String name) {
    return '$name olarak kaydedildi';
  }

  @override
  String get integrationUrlInvalid =>
      'https:// ile başlayan tam bir adres kullanın';

  @override
  String get openFile => 'Aç';

  @override
  String get saveFile => 'Kaydet';

  @override
  String get shareFile => 'Paylaş';

  @override
  String savedFile(String name) {
    return '$name kaydedildi';
  }

  @override
  String noAppToOpen(String name) {
    return 'Bu cihazda $name dosyasını açan bir uygulama yok. Bunun yerine kaydedin.';
  }

  @override
  String get previewUnavailable =>
      'Bu dosya türü için önizleme yok. Görüntülemek için açın veya kaydedin.';

  @override
  String get openInSystemPlayer => 'Video oynatıcınızda açın';

  @override
  String get playMedia => 'Oynat';

  @override
  String get fullScreen => 'Tam ekran';

  @override
  String get exitFullScreen => 'Tam ekrandan çık';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '1 sayfa',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Tarayıcıda aç';

  @override
  String get convertingToPdf => 'Önizleme hazırlanıyor…';

  @override
  String tableFirstRows(int count) {
    return 'İlk $count satır gösteriliyor';
  }

  @override
  String get imageCouldNotLoad => 'Bu resim yüklenemedi';

  @override
  String get mediaKindImage => 'Görsel';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaKindAudio => 'Ses';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Dosyayı aç';

  @override
  String get attach => 'Ekle';

  @override
  String get attachFiles => 'Dosyalar';

  @override
  String get attachPhotos => 'Fotoğraf kitaplığı';

  @override
  String get attachCamera => 'Fotoğraf çek';

  @override
  String get attachScan => 'Belge tara';

  @override
  String get scanFailed => 'Belge taranamadı. Tekrar deneyin.';

  @override
  String get dropToAttach => 'Eklemek için dosyaları bırakın';

  @override
  String uploadFailed(String name) {
    return '$name yüklenemedi';
  }

  @override
  String attachFailed(String name, String reason) {
    return '$name eklenemedi: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return '$name eklenemedi';
  }

  @override
  String get sendWithoutIt => 'Onsuz gönder';

  @override
  String get sendWithoutThem => 'Onlarsız gönder';

  @override
  String get removeAttachment => 'Kaldır';

  @override
  String get editPhoto => 'Fotoğrafı düzenle';

  @override
  String get retryUpload => 'Yeniden dene';

  @override
  String get uploadingAttachments => 'Yükleniyor…';

  @override
  String get notSent => 'Gönderilmedi';

  @override
  String get deleteChat => 'Sohbeti sil';

  @override
  String get deleteChatTitle => 'Bu sohbet silinsin mi?';

  @override
  String deleteChatBody(String bot) {
    return 'Mesajları, görebilen herkes için silinir. $bot botunun burada yaptıkları Kitaplıkta kalır, kullanım kayıtları kalır ve buradan hatırladıkları hafızasında kalır.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Burada yapılan $count öğeyi de sil',
      one: 'Burada yapılan 1 öğeyi de sil',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp => 'Kapalıysa Kitaplıkta kalırlar.';

  @override
  String get chatDeleted => 'Sohbet silindi';

  @override
  String get deleteAllChats => 'Tüm sohbetleri sil';

  @override
  String get deleteAllChatsRow =>
      'Temiz bir geçmişle baştan başlayın. Hafıza korunur.';

  @override
  String deleteAllChatsTitle(String bot) {
    return '$bot ile tüm sohbetler silinsin mi?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return '$bot ile silebildiğiniz tüm sohbetler; mesajları, fotoğrafları ve dosyalarıyla birlikte silinir. Grup sohbetleri kalır. Kullanım kayıtları kalır ve $bot botunun hatırladıkları hafızasında kalır.';
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
      other: '$nString sohbet silindi.',
      one: '1 sohbet silindi.',
      zero: 'Silinecek sohbet yok.',
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
      other: 'Bot içlerinde hâlâ çalıştığı için $nString sohbet korundu.',
      one: 'Bot içinde hâlâ çalıştığı için 1 sohbet korundu.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          'Bu sohbette $n bot var. Her biri kendi hafızasını ve ayarlarını korur.',
      one:
          'Bu sohbette $n bot var. Her biri kendi hafızasını ve ayarlarını korur.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention =>
      'Bir bota doğrudan sormak için @ ve adını yazın.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone: önce $lead yanıtlar ve bölünecek iş varsa parçaları dağıtır; yoksa her bot sırayla yanıtlar ve sonuncusu toparlar.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Etiketleme yoksa en son konuşan bot yanıt verir (başlangıçta $lead).';
  }

  @override
  String get messageNotSent =>
      'Dosyalarınız yüklenemediği için mesaj gönderilmedi. Mesajınız kutuda bekliyor.';

  @override
  String get chatSendsWhenDone => 'Bu yanıt bittiğinde gönderilir';

  @override
  String get noComputerForFiles =>
      'Bu botun dosya saklayabileceği bir bilgisayarı yok.';

  @override
  String fileTooLarge(String name) {
    return '$name 25 MB\'tan büyük olduğu için eklenemiyor. Bunun yerine Google Drive, Dropbox, iCloud veya herhangi bir bulut depolamadan bağlantısını gönderin.';
  }

  @override
  String get secretsHelp =>
      'Botlar isteklerde bir gizli anahtarı adıyla kullanır. Yalnızca izin verdiğiniz ana bilgisayarlara gönderilir ve model bunu asla görmez.';

  @override
  String deleteSecretTitle(String name) {
    return '$name silinsin mi?';
  }

  @override
  String get deleteSecretBody =>
      'Bunu kullanan botlar artık o hizmete erişemeyecek.';

  @override
  String get hide => 'Gizle';

  @override
  String get show => 'Göster';

  @override
  String get deleteMemoryTitle => 'Bu hafıza kaydı silinsin mi?';

  @override
  String get noMemoriesHelp =>
      'Sohbet ettikçe bot önemli olanları tutar: gerçekleri, tercihleri ve geçmiş işlerin özetlerini.';

  @override
  String get memoryHelp =>
      'Sabitlenen anılar her zaman botun bağlamında yer alır. Yanlış olanları düzenleyin; sildiğiniz anılar geri getirilemez.';

  @override
  String get memoryFact => 'Bilgi';

  @override
  String get memoryPreference => 'Tercih';

  @override
  String get memorySummary => 'Özet';

  @override
  String get memoryEpisode => 'Olay';

  @override
  String get pinned => 'Sabitlendi';

  @override
  String get editMemory => 'Hafızayı düzenle';

  @override
  String get editMemoryHelp =>
      'Bot bunu bir sonraki ilgili olduğunda kullanır.';

  @override
  String get modelKeysIntro =>
      'Botlar kendi model sağlayıcı anahtarlarınızla düşünür. Anahtarlar şifrelenerek saklanır ve bir daha gösterilmez.';

  @override
  String get casamaCloudKeyHint => 'Kredilerinizden ödenir';

  @override
  String get casamaCloudIncluded => 'Dahil';

  @override
  String get casamaCloudModelLocked => 'Bu modeli Casama seçer.';

  @override
  String get serverVoiceSetUp =>
      'Bu sunucu ses sağlar, bu yüzden eklenecek anahtar yoktur. Önce çalışma alanının kendi anahtarı kullanılır.';

  @override
  String modelKeysFor(String workspace) {
    return 'Anahtarlar tek bir çalışma alanına aittir. Bunlar $workspace içindir.';
  }

  @override
  String get yourKeys => 'Anahtarlarınız';

  @override
  String get keyWorking => 'Çalışıyor';

  @override
  String get keyFailing => 'Başarısız';

  @override
  String get keyUntested => 'Test edilmedi';

  @override
  String get skillsHelp =>
      'Beceri, bir görev gerektirdiğinde botun yüklediği talimatlardır; örneğin raporlar için kurum içi stiliniz gibi.';

  @override
  String get skillsForAllBots => 'Tüm botlar';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Yalnızca $bot için';
  }

  @override
  String get skillsRemovedBot => 'Kaldırılan bir bot';

  @override
  String deleteSkillTitle(String name) {
    return '“$name” becerisi silinsin mi?';
  }

  @override
  String get editSkill => 'Beceriyi düzenle';

  @override
  String get deleteSkill => 'Beceriyi sil';

  @override
  String get skillDescriptionHelp =>
      'Botlar becerinin ne zaman uygulanacağına karar vermek için bunu okur.';

  @override
  String get skillBodyHint => '# Adımlar\n1. …';

  @override
  String get computersHelp =>
      'Her bot bir bilgisayarda çalışır: herkesin paylaştığı ekip bilgisayarı veya özel bir bilgisayar. Dosyalar sohbetler arasında burada kalır.';

  @override
  String get computersEmptyTitle => 'Henüz bilgisayar yok';

  @override
  String get thisDevice => 'Bu cihaz';

  @override
  String get personalComputerConnected => 'Bağlı';

  @override
  String get personalComputerOffline => 'Çevrimdışı';

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
    return '$size disk';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Son kullanım: $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Son görülme: $when';
  }

  @override
  String get computerSaved => 'Kaydedildi';

  @override
  String get computerSavedHelp => 'Durdurulduğunda dosyaları korunur';

  @override
  String computerCanUse(Object list) {
    return 'Kullanabilecek botlar: $list';
  }

  @override
  String get computerCanUseNothing => 'Botlar henüz bunu kullanamıyor';

  @override
  String get computerCapShell => 'Terminal';

  @override
  String get computerCapFiles => 'Dosyalar';

  @override
  String get computerCapBrowser => 'Tarayıcı';

  @override
  String get computerCapDesktop => 'Ekran';

  @override
  String get computerCapMcp => 'Yerel araçlar';

  @override
  String get computerCapMessages => 'Mesajlar';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name çevrimdışı. Üzerinde Casama\'yı açın ve \"Botlar için bu bilgisayarı kullan\" ayarını etkinleştirin. Kendi bilgisayarınız hiçbir zaman planınızın bilgisayar saatlerini kullanmaz.';
  }

  @override
  String get yourComputerOffline => 'Bilgisayarınız çevrimdışı';

  @override
  String get howToFix => 'Nasıl düzeltilir';

  @override
  String get computerHoursUsedTitle => 'Bilgisayar saatleri tükendi';

  @override
  String get personalScreenNote =>
      'Bu sizin kendi bilgisayarınız olduğundan, canlı görünüm yerine birkaç saniyede bir yeni bir ekran görüntüsü görürsünüz.';

  @override
  String get renameComputer => 'Bilgisayarı yeniden adlandır';

  @override
  String deleteComputerTitle(String name) {
    return '$name silinsin mi?';
  }

  @override
  String get privacyIntro =>
      'Sohbetleriniz, anılarınız ve dosyalarınız size aittir. İstediğiniz zaman dışa aktarabilir veya hesabınızı silebilirsiniz.';

  @override
  String get yourData => 'Verileriniz';

  @override
  String get shareAnalytics => 'Kullanım verilerini paylaş';

  @override
  String get shareAnalyticsHelp =>
      'Kullanım ve çökme raporları. Mesajlarınız veya dosyalarınız asla paylaşılmaz.';

  @override
  String get measureAds => 'Reklamlarımızı ölçmeye yardım et';

  @override
  String get measureAdsHelp =>
      'Reklamımızı gören biri katıldığında veya abone olduğunda Casama\'nın bunu Meta\'ya bildirmesini sağlar. Casama hiçbir zaman reklam göstermez.';

  @override
  String get measureAdsNeedsUsageData =>
      'Bunu kullanmak için Kullanım verilerini paylaş ayarını açın.';

  @override
  String get trackingTile => 'İzlemeye İzin Ver';

  @override
  String get trackingAllowed =>
      'İzin verildi. Bu cihazda Meta\'nın SDK\'sı çalışır ve reklamımızı gördükten sonra katıldığınızda veya abone olduğunuzda Casama bunu Meta\'ya bildirebilir. Bunu Ayarlar uygulamasından değiştirebilirsiniz.';

  @override
  String get trackingNotAllowed =>
      'İzin verilmedi. Bu cihazdan Meta\'ya hiçbir şey gönderilmez. Bunu Ayarlar uygulamasından değiştirebilirsiniz.';

  @override
  String get trackingNotAsked =>
      'Casama henüz sormadı. Siz izin verene kadar bu cihazdan Meta\'ya hiçbir şey gönderilmez.';

  @override
  String get trackingOpenSettings => 'Ayarları aç';

  @override
  String get workspaceAnalytics => 'Bu çalışma alanı için kullanım verileri';

  @override
  String get workspaceAnalyticsHelp =>
      'Bu çalışma alanı için kullanım verileri. Çökme raporları açık kalır.';

  @override
  String get dangerZone => 'Tehlikeli bölge';

  @override
  String get quotasHelp => 'Sınır olmaması için alanı boş bırakın.';

  @override
  String get serviceOff => 'Kapalı';

  @override
  String get serviceDown => 'Çalışmıyor';

  @override
  String get serviceOk => 'Tamam';

  @override
  String get sendInvite => 'Davet gönder';

  @override
  String get thinking0 => 'Model';

  @override
  String get saveChanges => 'Değişiklikleri kaydet';

  @override
  String get autonomyAskAlwaysHelp =>
      'Bir şeyi değiştiren her işlemden önce size danışır.';

  @override
  String get autonomyAskRiskyHelp =>
      'Kendi başına çalışır, ancak dosya silme veya para harcama gibi riskli işlemlerden önce sorar.';

  @override
  String get autonomyAutonomousHelp =>
      'Sormadan hareket eder. Güvendiğiniz rutinler için en iyisidir.';

  @override
  String get usageSubtitle => 'Bu ayki model harcaması';

  @override
  String get skillsRowHelp =>
      'Bir görev gerektirdiğinde botların yüklediği talimatlar';

  @override
  String get integrationsRowHelp => 'MCP sunucuları ve bağlı uygulamalar';

  @override
  String get secretsRowHelp =>
      'Tokenlar ve parolalar, yalnızca izin verdiğiniz yerlere gönderilir';

  @override
  String get computersRowHelp => 'Ekip bilgisayarı ve özel bilgisayarlar';

  @override
  String get companionRowHelp =>
      'Botların bu cihazdaki uygulamaları ve dosyaları kullanmasına izin verin';

  @override
  String get privacyRowHelp =>
      'Verilerinizi dışa aktarın veya hesabınızı silin';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'Henüz entegrasyon yok';

  @override
  String get integrationsHelp =>
      'Entegrasyonlar botlara daha fazla araç kazandırır: bir MCP sunucusu, bir OpenAPI kaynağı, Composio veya Pipedream. Her araç, bağlı olduğu entegrasyonun adını alır.';

  @override
  String get botIntegrationsHelp =>
      'Bu botun kullanabileceği entegrasyonları açın. Araçları bir sonraki çalıştırmada görünür.';

  @override
  String get openSettings => 'Ayarları aç';

  @override
  String get noRunsHelp =>
      'Bu bot bir sohbette, rutinde veya webhook\'ta her çalıştığında, ne yaptığı ve ne kadara mal olduğuyla çalıştırma burada görünür.';

  @override
  String get runCompleted => 'Tamamlandı';

  @override
  String get runWaiting => 'Bekliyor';

  @override
  String get runWorking => 'Çalışıyor';

  @override
  String get triggerChat => 'Sohbet';

  @override
  String get triggerRoutine => 'Rutin';

  @override
  String get noEventsForFilter => 'Bu çalıştırmada bu türde bir şey yok.';

  @override
  String get runStatusFailed => 'Başarısız';

  @override
  String get runStatusStopped => 'Durduruldu';

  @override
  String get quickAskIntro =>
      'Hızlı bir istek gönderin. Seçtiğiniz botla yeni bir sohbet başlatır.';

  @override
  String quickAskIntroBot(String name) {
    return 'Hızlı bir istek gönderin. $name ile yeni bir sohbet başlatır.';
  }

  @override
  String quickAskHintBot(String bot) {
    return '$bot ne yapmalı?';
  }

  @override
  String get stateProvisioning => 'Kuruluyor';

  @override
  String get stateStarting => 'Başlatılıyor';

  @override
  String get computerRestoringFiles => 'Dosyalar geri yükleniyor…';

  @override
  String get stateRunning => 'Çalışıyor';

  @override
  String get stateIdle => 'Boşta';

  @override
  String get stateSleeping => 'Uyku modunda';

  @override
  String get stateStopped => 'Durduruldu';

  @override
  String get stateError => 'Hata';

  @override
  String get terminalHelp =>
      'Bu bilgisayarda bir kabuk. Botlar da aynısını kullanır, böylece ne yaptıklarını görüp düzeltebilirsiniz.';

  @override
  String get up => 'Yukarı';

  @override
  String get emptyFolderHelp =>
      'Botlarınızın oluşturduğu ve sizin yüklediğiniz dosyalar burada görünür.';

  @override
  String deleteFileTitle(String name) {
    return '$name silinsin mi?';
  }

  @override
  String get botComputerAuto => 'Otomatik';

  @override
  String get botComputerHelp =>
      'Botun kendi bilgisayarı: komut çalıştırdığı, gezindiği ve dosyalarını sakladığı yer.';

  @override
  String get billingOffTitle => 'Burada faturalandırma yok';

  @override
  String revokeKeyTitle(String name) {
    return '$name için anahtar iptal edilsin mi?';
  }

  @override
  String get revokeKeyBody =>
      'O sunucu bulut bilgisayarlarını ve kredileri kullanmayı hemen durdurur.';

  @override
  String get handBackHelp =>
      'Bot kaldığınız yerden devam eder. Yardımcı olacaksa ne yaptığınızı ona söyleyin.';

  @override
  String get serverHelp =>
      'Kendi Casama sunucunuzu kullanın. Sizin veya yöneticinizin kurduğu adresi girin.';

  @override
  String get ssoHelp =>
      'İş e-postanızı girin; sizi şirketinizin giriş sayfasına yönlendirelim.';

  @override
  String get colorScheme => 'Renk düzeni';

  @override
  String get searchThemes => 'Düzenlerde ara';

  @override
  String get noThemesFound => 'Eşleşen düzen yok.';

  @override
  String get noAppsMatch =>
      'Eşleşen uygulama yok. Gelişmiş altından kendi sunucunuzu ekleyebilirsiniz.';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uygulama',
      one: '1 uygulama',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => 'Tümü';

  @override
  String get familyPurple => 'Mor';

  @override
  String get familyBlue => 'Mavi';

  @override
  String get familyTeal => 'Turkuaz';

  @override
  String get familyGreen => 'Yeşil';

  @override
  String get familyWarm => 'Sıcak';

  @override
  String get familyRed => 'Kırmızı ve pembe';

  @override
  String get familyNeutral => 'Nötr';

  @override
  String get background => 'Arka plan';

  @override
  String get backgroundPattern => 'Desen';

  @override
  String get backgroundColors => 'Renkler';

  @override
  String get backgroundThemeColors => 'Tema';

  @override
  String get patternStrength => 'Desen yoğunluğu';

  @override
  String get wallpaperEverywhere => 'Her ekranda göster';

  @override
  String get wallpaperEverywhereHelp =>
      'Yalnızca sohbetlerin arkasında tutmak için kapatın.';

  @override
  String get resetBackground => 'Varsayılana sıfırla';

  @override
  String get copyMessage => 'Kopyala';

  @override
  String get selectText => 'Metni seç';

  @override
  String get shareMessage => 'Paylaş';

  @override
  String get messageCopied => 'Kopyalandı';

  @override
  String get botUiBroken => 'Yanıtın bu kısmı gösterilemedi.';

  @override
  String get botUiSent => 'Gönderildi';

  @override
  String get botUiConnected => 'Bağlandı';

  @override
  String get draftNewEmail => 'Yeni e-posta';

  @override
  String get draftNewMessage => 'Yeni mesaj';

  @override
  String get draftNewPost => 'Yeni gönderi';

  @override
  String get draftReadyToSend => 'Gönderilmeye hazır';

  @override
  String get draftReadyToPost => 'Paylaşılmaya hazır';

  @override
  String get draftEdited => 'Düzenlendi';

  @override
  String get draftSendEmail => 'E-posta gönder';

  @override
  String get draftSend => 'Gönder';

  @override
  String get draftPost => 'Paylaş';

  @override
  String get draftDiscard => 'Sil';

  @override
  String get draftEdit => 'Düzenle';

  @override
  String get draftDoneEditing => 'Bitti';

  @override
  String get draftFrom => 'Kimden';

  @override
  String get draftTo => 'Kime';

  @override
  String get draftCc => 'Bilgi';

  @override
  String get draftBcc => 'Gizli';

  @override
  String get draftSubject => 'Konu';

  @override
  String get botCardNewEvent => 'Yeni etkinlik';

  @override
  String get botCardEvent => 'Etkinlik';

  @override
  String get botCardReadyToAdd => 'Eklenmeye hazır';

  @override
  String get botCardAddToCalendar => 'Takvime ekle';

  @override
  String get botCardChange => 'Değiştir';

  @override
  String get botCardSkip => 'Atla';

  @override
  String get botCardAllDay => 'Tüm gün';

  @override
  String botCardMore(int count) {
    return '+$count tane daha';
  }

  @override
  String get botCardAgenda => 'Ajanda';

  @override
  String get botCardMessages => 'Mesajlar';

  @override
  String botCardUnread(int count) {
    return '$count okunmamış';
  }

  @override
  String get botCardReply => 'Yanıtla';

  @override
  String botCardReplyTo(String name) {
    return '$name kişisine yanıtla';
  }

  @override
  String get botCardTasks => 'Görevler';

  @override
  String botCardDoneOf(int done, int total) {
    return '$done / $total tamamlandı';
  }

  @override
  String get botCardSaveChanges => 'Değişiklikleri kaydet';

  @override
  String get botCardChoose => 'Seç';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'Kimi kastediyorsunuz?';

  @override
  String get botCardNoneOfThese => 'Hiçbiri';

  @override
  String get botCardReminder => 'Hatırlatıcı';

  @override
  String get botCardRoutine => 'Rutin';

  @override
  String get botCardWatcher => 'Takip ediyor';

  @override
  String get botCardScheduled => 'Ayarlandı';

  @override
  String botCardNext(String when) {
    return 'Sonraki: $when';
  }

  @override
  String get botCardCancelIt => 'İptal et';

  @override
  String get botIcon => 'Simge';

  @override
  String get botIconInitials => 'Baş harfler';

  @override
  String get errorDetailsTitle => 'Ne ters gitti';

  @override
  String get exportLabel => 'Dışa aktar';

  @override
  String get openTimeline => 'Çalıştırma zaman çizelgesini aç';

  @override
  String get details => 'Ayrıntılar';

  @override
  String get themes => 'Temalar';

  @override
  String get myThemes => 'Temalarınız';

  @override
  String get saveTheme => 'Mevcut temayı kaydet';

  @override
  String get themeName => 'Tema adı';

  @override
  String get importTheme => 'Tema içe aktar';

  @override
  String get themeCode => 'Tema kodu';

  @override
  String get themeCodeHelp =>
      'Birisinin sizinle paylaştığı bir kodu yapıştırın. casama-theme: ile başlar';

  @override
  String get invalidThemeCode => 'Bu bir Casama tema kodu değil.';

  @override
  String themeImported(String name) {
    return '$name temalarınıza eklendi';
  }

  @override
  String get themeCodeCopied =>
      'Tema kodu kopyalandı. Herkes bunu Görünüm → Tema içe aktar bölümüne yapıştırabilir.';

  @override
  String get shareTheme => 'Kodu paylaş';

  @override
  String deleteThemeTitle(String name) {
    return '$name silinsin mi?';
  }

  @override
  String get fonts => 'Yazı tipleri';

  @override
  String get headingFont => 'Başlıklar';

  @override
  String get bodyFont => 'Metin';

  @override
  String get fontsHelp =>
      'Google Sans ve Noto Serif uygulamayla birlikte gelir ve çevrimdışı çalışır. Diğer Google Fonts yazı tipleri ilk seçtiğinizde indirilir.';

  @override
  String get searchFonts => 'Tüm Google Fonts\'ta ara';

  @override
  String get suggestedFonts => 'Önerilen';

  @override
  String get allFonts => 'Tüm Google Fonts yazı tipleri';

  @override
  String get noFontsFound => 'Bu adda yazı tipi yok';

  @override
  String get resetFonts => 'Varsayılanları kullan';

  @override
  String get fontSample => 'Botlarınız, sizinle birlikte çalışıyor.';

  @override
  String get backgroundPhoto => 'Fotoğraf';

  @override
  String get yourPhoto => 'Fotoğrafınız';

  @override
  String get browsePhotos => 'Fotoğraflara göz at';

  @override
  String get removePhoto => 'Fotoğrafı kaldır';

  @override
  String get photoBlur => 'Bulanıklık';

  @override
  String get photoDim => 'Karartma';

  @override
  String photoBy(String name) {
    return 'Unsplash üzerinde $name fotoğrafı';
  }

  @override
  String get searchPhotos => 'Fotoğraf ara';

  @override
  String get photosUnavailable => 'Fotoğraflar yüklenemedi.';

  @override
  String get noPhotos => 'Fotoğraf bulunamadı';

  @override
  String get photoHelp =>
      'Fotoğraf desenlerin altına yerleşir. Bulanıklık ve karartma, üstteki metnin okunaklı kalmasını sağlar.';

  @override
  String get periodToday => 'Bugün';

  @override
  String get periodWeek => 'Bu hafta';

  @override
  String get periodYear => 'Bu yıl';

  @override
  String get totalSpend => 'Harcama';

  @override
  String get tokensIn => 'Gelen tokenlar';

  @override
  String get tokensOut => 'Giden tokenlar';

  @override
  String get runsLabel => 'Çalıştırmalar';

  @override
  String get spendByDay => 'Güne göre harcama';

  @override
  String get byBot => 'Bota göre';

  @override
  String get byModel => 'Modele göre';

  @override
  String get everythingMetered => 'Ölçülen her şey';

  @override
  String get bySource => 'Kaynağa göre';

  @override
  String get byPerson => 'Kişiye göre';

  @override
  String get usageAllBots => 'Tüm botlar';

  @override
  String get usageAllModels => 'Tüm modeller';

  @override
  String get usageAllSources => 'Tüm kaynaklar';

  @override
  String get usageEveryone => 'Herkes';

  @override
  String get usageJustMe => 'Yalnızca ben';

  @override
  String get usageClearFilters => 'Temizle';

  @override
  String get usageFilterBot => 'Bota göre filtrele';

  @override
  String get usageFilterModel => 'Modele göre filtrele';

  @override
  String get usageFilterSource => 'Kaynağa göre filtrele';

  @override
  String get usageFilterPerson => 'Kişiye göre filtrele';

  @override
  String get usageSourceChat => 'Sohbetler';

  @override
  String get usageSourceChatApp => 'Sohbet uygulamaları';

  @override
  String get usageSourceRoutine => 'Rutinler';

  @override
  String get usageSourceApi => 'API ve diğer ajanlar';

  @override
  String get usageSourceOther => 'Diğer';

  @override
  String get usageNoPerson => 'Otomatik';

  @override
  String get usageUnnamedPerson => 'Adsız üye';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n çalıştırma',
      one: '1 çalıştırma',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'CSV dışa aktar';

  @override
  String get exportJson => 'JSON dışa aktar';

  @override
  String get askBotAboutUsage => 'Bunu bir bota sor';

  @override
  String get noUsageYet => 'Bu dönemde henüz kullanım yok.';

  @override
  String get otherModel => 'Bilgisayarlar ve diğer';

  @override
  String get deletedBot => 'Bir bota bağlı değil';

  @override
  String get usageHelp =>
      'Maliyetler, token sayıları ve yayınlanan fiyatlara göre tahmindir. Son söz model sağlayıcınızın faturasındadır.';

  @override
  String usageAskPrompt(String period, String summary) {
    return '$period dönemindeki Casama kullanımım burada. Paranın nereye gittiğini ve nasıl daha az harcayabileceğimi anlamama yardım et. Canlı sayıları kullanım aracınla da kontrol edebilirsin.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Model girdisi';

  @override
  String get kindTokensOut => 'Model çıktısı';

  @override
  String get kindComputer => 'Bulut bilgisayarı süresi';

  @override
  String get kindModels => 'Yapay zeka modelleri';

  @override
  String get creditsThisMonth => 'Bu ayki krediler';

  @override
  String creditsUsedPercent(int percent) {
    return '%$percent kullanıldı';
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
      other: 'Her zamanki maliyetinizle yaklaşık $nString çalıştırma daha',
      one: 'Her zamanki maliyetinizle yaklaşık 1 çalıştırma daha',
      zero: 'Her zamanki maliyetinizle bir çalıştırmadan az',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'Krediniz tükendi. Botlarınızın çalışmaya devam etmesi için daha fazla ekleyin.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 kredi = $price. Planınız her ay $amount ekler; kullanılmayan krediler bir sonraki aya devreder.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 kredi = $price. App Store veya Google Play\'den alınan kredi paketlerinin süresi asla dolmaz; web üzerinden alınan kredi paketleri 12 ay geçerlidir.';
  }

  @override
  String get creditsDailyLabel => 'Bugünkü sınır';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used / $cap';
  }

  @override
  String get creditsDailyExplainer =>
      'Kalan krediniz ne olursa olsun, planınızın Casama modelleri, ses ve uygulamalarda her gün harcayabileceği tutar.';

  @override
  String get creditsDailyReached =>
      'Bugünkü sınıra ulaşıldı, bu nedenle botlarınız duraklatıldı. Daha yüksek günlük sınır için planınızı yükseltin.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Yaklaşık $n saat içinde sıfırlanır.',
      one: 'Yaklaşık 1 saat içinde sıfırlanır.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => 'Bir saatten kısa sürede sıfırlanır.';

  @override
  String get creditsHoursLabel => 'Bilgisayar saatleri';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used / $limit sa.';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Botlarınızın bilgisayarlarının bu ay çalıştığı süre. Süre dolduğunda sohbet çalışmaya devam eder; yalnızca bilgisayar durur. $date tarihinde sıfırlanır.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'Bu ayki bilgisayar saatleri tükendi, bu yüzden bilgisayarınız başlatılamıyor. Sohbet hâlâ çalışır. $date tarihinde sıfırlanır. Daha fazla saat için planınızı yükseltin.';
  }

  @override
  String get kindStream => 'Canlı görünüm';

  @override
  String get kindTts => 'Sesli okuma';

  @override
  String get computerMissingTitle => 'Bilgisayar bulunamadı';

  @override
  String get computerMissingHelp =>
      'Kaldırılmış olabilir veya liste güncel değildir. Tekrar kontrol etmek için yenileyin.';

  @override
  String get computerMissingBotHelp =>
      'Bu botun bilgisayarı kaldırılmış olabilir veya liste güncel değildir. Yenileyin ya da bu bot için başka bir bilgisayar seçin.';

  @override
  String get computerChoose => 'Bir bilgisayar seçin';

  @override
  String get personaWork => 'İş';

  @override
  String get personaResearch => 'Araştırma';

  @override
  String get personaBuild => 'Geliştirme';

  @override
  String get personaCreate => 'Üretim';

  @override
  String get personaLife => 'Yaşam';

  @override
  String get personaOther => 'Diğer';

  @override
  String get blankBotHelp =>
      'Sıfırdan başlayın ve kendi talimatlarınızı yazın.';

  @override
  String get browse => 'Göz at';

  @override
  String get browseAllPersonas => 'Tümüne göz at';

  @override
  String get botIdentity => 'Ad ve simge';

  @override
  String get serviceKeys => 'Hizmet anahtarları';

  @override
  String get noServiceKeys => 'Henüz hizmet anahtarı yok.';

  @override
  String get serviceKeysHelp => 'Kendi arama, harita veya veri anahtarlarınız';

  @override
  String get serviceKeysIntro =>
      'Casama modelleri, sesi ve görselleri sizin için çalıştırır. Buraya yalnızca kendi arama, harita veya veri hizmetinizi kullanmak için anahtar ekleyin. Anahtarlar şifrelenerek saklanır ve bir daha gösterilmez.';

  @override
  String get choosePersona => 'Bir karakter seçin';

  @override
  String get choosePersonaHelp =>
      'Her biri talimatlar, bir görünüm teması ve bazen beceriler ile rutinlerle gelir. Sonrasında her şeyi değiştirebilirsiniz.';

  @override
  String get searchPersonas => 'Karakterlerde ara';

  @override
  String get noPersonasFound => 'Bununla eşleşen karakter yok';

  @override
  String get previewPersona => 'Önizleme';

  @override
  String get personaInstructions => 'Talimatlar';

  @override
  String get personaTryAsking => 'Şunu sormayı deneyin';

  @override
  String usePersona(String name) {
    return '$name kullan';
  }

  @override
  String get loadPersona => 'Karakter yükle';

  @override
  String get replaceInstructionsTitle => 'Talimatlar değiştirilsin mi?';

  @override
  String replaceInstructionsBody(String name) {
    return 'Botun mevcut talimatları, $name karakterinin talimatlarıyla değiştirilecek. Beceriler ve rutinler olduğu gibi kalır.';
  }

  @override
  String get replace => 'Değiştir';

  @override
  String get appsTitle => 'Uygulamalar';

  @override
  String get appsSubtitle =>
      'Botlarınıza ekibinizin zaten kullandığı araçları verin.';

  @override
  String get connectedTab => 'Bağlı';

  @override
  String get browseTab => 'Göz at';

  @override
  String get searchApps => 'Uygulamalarda ara';

  @override
  String get popularApps => 'Popüler';

  @override
  String get allApps => 'Tüm uygulamalar';

  @override
  String get appCatDeveloper => 'Geliştirici';

  @override
  String get appCatProductivity => 'Üretkenlik';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Ödemeler';

  @override
  String get appCatDesign => 'Tasarım';

  @override
  String get appCatSales => 'Satış ve destek';

  @override
  String get appCatData => 'Veri ve arama';

  @override
  String get appCatAutomation => 'Otomasyon';

  @override
  String get authOneClick => 'Tek tık';

  @override
  String get authApiKey => 'API anahtarı';

  @override
  String get authNone => 'Giriş gerekmez';

  @override
  String get authAdminSetup => 'Kurulum gerekiyor';

  @override
  String get connectedBadge => 'Bağlı';

  @override
  String get whatBotsCanDo => 'Botlarınızın yapabilecekleri';

  @override
  String continueWith(String app) {
    return '$app ile devam et';
  }

  @override
  String get signInTab => 'Giriş yap';

  @override
  String get connectNoSignIn => 'Bu uygulama giriş yapmadan çalışır.';

  @override
  String finishSignIn(String app) {
    return '$app girişini tamamlayın';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app tarayıcınızda açıldı. Orada erişimi onaylayın; burası kendiliğinden güncellenir.';
  }

  @override
  String get reopenSignIn => 'Giriş sayfasını tekrar aç';

  @override
  String appConnected(String app) {
    return '$app bağlandı';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app bu çalışma alanında zaten bağlı. O bağlantıyı kullanın veya başka bir hesap ekleyin.';
  }

  @override
  String get useConnection => 'Bunu kullan';

  @override
  String get addAnotherAccount => 'Başka bir hesap ekle';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Botlarınız için $countString araç hazır.',
      one: 'Botlarınız için 1 araç hazır.',
      zero: 'Kullanıma hazır.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'Hangi botlar kullanabilir?';

  @override
  String get whichBotsHelp =>
      'Botlar riskli bir işlemden önce yine de size sorar.';

  @override
  String get doneLabel => 'Tamam';

  @override
  String openApp(String app) {
    return '$app uygulamasını aç';
  }

  @override
  String get pasteLabel => 'Yapıştır';

  @override
  String get connectingLabel => 'Bağlanıyor…';

  @override
  String get connectFailedTitle => 'Bağlanamadı';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'Veya $app uygulamasını bunlardan biri üzerinden bağlayın. Bir kez giriş yapın, ardından botunuzdan $app kullanmasını isteyin.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'Giriş bilgileri şifrelenerek saklanır ve bir daha gösterilmez. İstediğiniz zaman bağlantıyı kesebilirsiniz.';

  @override
  String get composioHelp =>
      'Sizin yerinize giriş yapılarak yüzlerce uygulama.';

  @override
  String get pipedreamHelp => 'Pipedream Connect üzerinden binlerce uygulama.';

  @override
  String get customServer => 'Özel sunucu';

  @override
  String get customServerHelp =>
      'Herhangi bir MCP sunucusu veya OpenAPI belirtimi. Geliştiriciler için.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bot kullanıyor',
      one: '1 bot kullanıyor',
      zero: 'Henüz hiçbir bota verilmedi',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Hazır';

  @override
  String get statusNeedsAttention => 'İlgi gerekiyor';

  @override
  String get statusChecking => 'Kontrol ediliyor';

  @override
  String get toolsHelp =>
      'Salt okunur araçlar kendiliğinden çalışır. Değişiklik yapan araçlar, bot güvenilmeyen bir şey okuduğunda önce sorar; “Her zaman sor” olarak işaretlenenler her seferinde sizden onay bekler.';

  @override
  String get botsWithAccess => 'Erişimi olan botlar';

  @override
  String get reconnect => 'Yeniden bağlan';

  @override
  String get disconnect => 'Bağlantıyı kes';

  @override
  String disconnectTitle(String app) {
    return '$app bağlantısı kesilsin mi?';
  }

  @override
  String get disconnectBody =>
      'Botlar bu uygulamanın araçlarını hemen kaybeder ve kayıtlı giriş bilgileri silinir.';

  @override
  String get testConnection => 'Bağlantıyı test et';

  @override
  String get signedInOAuth => 'Hesabınızla giriş yapıldı';

  @override
  String get signedInKey => 'API anahtarıyla bağlandı';

  @override
  String get signedInNone => 'Giriş gerekmez';

  @override
  String get noConnectionsTitle => 'İlk uygulamanızı bağlayın';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail ve daha fazlası. Çoğu tek tıkla bağlanır.';

  @override
  String get browseApps => 'Uygulamalara göz at';

  @override
  String providerSetupTitle(String provider) {
    return '$provider bağla';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider uygulamalara sizin yerinize giriş yapar, böylece anahtarlarıyla hiç uğraşmazsınız.';
  }

  @override
  String get getFreeKey => 'Ücretsiz anahtar al';

  @override
  String connectedThroughHub(String provider) {
    return '$provider üzerinden';
  }

  @override
  String providerAppsTitle(String provider) {
    return '$provider üzerinden uygulamalar';
  }

  @override
  String get addAnApp => 'Uygulama ekle';

  @override
  String searchProviderApps(String provider) {
    return '$provider uygulamalarında ara';
  }

  @override
  String get accountConnected => 'Giriş yapıldı';

  @override
  String get accountPending => 'Giriş bekleniyor';

  @override
  String get accountError => 'Giriş sorunu';

  @override
  String get providerReconnectHint =>
      'Daha düşük uygulama çağrısı maliyetleri için doğrudan Casama ile giriş yapın';

  @override
  String get noProviderAccounts =>
      'Henüz uygulama yok. Bir tane ekleyin ve giriş yapın.';

  @override
  String get projectId => 'Proje kimliği';

  @override
  String get toolRiskLow => 'Salt okunur';

  @override
  String get toolRiskMedium => 'Değişiklik yapar';

  @override
  String get toolRiskHigh => 'Her zaman sorar';

  @override
  String get askWhichBot => 'Buna hangi bot bakmalı?';

  @override
  String get computerWake => 'Uyandır';

  @override
  String get computerAsleepTitle => 'Bilgisayar uyku modunda';

  @override
  String get computerAsleepFilesHelp =>
      'Dosyalarını görmek ve yüklemek için uyandırın.';

  @override
  String get computerFilesTimedOut =>
      'Dosyaların yüklenmesi çok uzun sürdü. Bilgisayarın açık olduğunu kontrol edip tekrar deneyin.';

  @override
  String get computerGoingToSleep => 'Uyku moduna geçiyor';

  @override
  String get liveViewWakesHelp =>
      'Bu bilgisayar uyku modunda. Canlı görünümü açmak onu uyandırır; bir süre kullanılmazsa tekrar uyku moduna geçer.';

  @override
  String get wakeAndWatch => 'Uyandır ve canlı izle';

  @override
  String get chatGptPlan => 'ChatGPT planı';

  @override
  String get continueWithChatGpt => 'ChatGPT ile devam et';

  @override
  String get chatGptConnectHelp =>
      'API anahtarı yerine botlarınızı ChatGPT planınızla çalıştırın. Model çağrıları planınızın sınırlarından düşülür ve bunu yalnızca siz kullanabilirsiniz.';

  @override
  String get chatGptDesktopOnly =>
      'ChatGPT planınızı bağlamak için masaüstü uygulamasını açın veya CLI\'da \"casama credential chatgpt\" komutunu çalıştırın.';

  @override
  String get chatGptWaiting => 'Tarayıcınızda ChatGPT ile girişi tamamlayın…';

  @override
  String chatGptConnected(String account) {
    return 'ChatGPT planınız bağlandı ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'Giriş yaptınız ancak plan kullanımına izin verilmedi. Yeniden bağlanıp izin verin veya bir API anahtarı ekleyin.';

  @override
  String get orAddApiKey => 'Veya bir API anahtarı ekleyin';

  @override
  String get planOnlyYou => 'Yalnızca siz kullanabilirsiniz';

  @override
  String get planOtherMember => 'Başka bir üyenin planı';

  @override
  String get planConnected => 'Bağlı';

  @override
  String get planUsageOff => 'Plan kullanımı kapalı';

  @override
  String get planNeedsReconnect => 'Tekrar giriş yap';

  @override
  String get useNextModelAtLimit =>
      'Plan sınırımda botun sonraki modelini kullan';

  @override
  String get useNextModelAtLimitHelp =>
      'Kapalı: ChatGPT sınırınıza ulaşıldığında çalıştırma durur. Açık: botun sonraki modeliyle devam eder ve bu ücretli olabilir.';

  @override
  String get manageUsage => 'Kullanımı yönet';

  @override
  String get removeKey => 'Kaldır';

  @override
  String removeKeyConfirm(String label) {
    return '$label kaldırılsın mı? Bunu kullanan botlar, onlara başka bir anahtar verene kadar çalışmayı durdurur.';
  }

  @override
  String get removeKeyChatGptNote => 'ChatGPT girişiniz de iptal edilir.';

  @override
  String modelFallbackNotice(String message) {
    return 'Sonraki modele geçildi: $message';
  }

  @override
  String get twoStepSignIn => 'İki adımlı giriş';

  @override
  String get twoStepHelp =>
      'Her giriş yaptığınızda kimlik doğrulayıcı uygulamasından kod isteyin.';

  @override
  String get signInWithPasskey => 'Geçiş anahtarıyla giriş yap';

  @override
  String get account => 'Hesap';

  @override
  String get accountRow => 'E-posta, parola ve tüm cihazlardan çıkış yapma';

  @override
  String get forgotPassword => 'Parolanızı mı unuttunuz?';

  @override
  String get newPassword => 'Yeni parola';

  @override
  String get newPasswordAgain => 'Yeni parola tekrar';

  @override
  String get passwordsDontMatch => 'Parolalar eşleşmiyor';

  @override
  String get newPasswordTitle => 'Yeni bir parola seçin';

  @override
  String get newPasswordBody =>
      'Giriş yaptınız. E-postanızla giriş yapmak için yeni bir parola seçin.';

  @override
  String get savePassword => 'Parolayı kaydet';

  @override
  String get passwordSaved => 'Parola kaydedildi.';

  @override
  String get passwordTitle => 'Parola';

  @override
  String get passwordRow =>
      'E-postanızla giriş yapmak için parolayı ayarlayın veya değiştirin';

  @override
  String get passwordHelp =>
      'En az 6 karakter kullanın. Google, Apple, geçiş anahtarı veya e-posta bağlantısıyla yine de giriş yapabilirsiniz.';

  @override
  String passwordCodeSent(String email) {
    return 'Hesabınızı güvende tutmak için $email adresine az önce gönderdiğimiz kodu girin.';
  }

  @override
  String get changeEmailTitle => 'E-postayı değiştir';

  @override
  String get changeEmailHelp =>
      'Mevcut adresinize ve yeni adrese bir onay bağlantısı göndereceğiz. Değişiklik her ikisi de onaylandığında gerçekleşir.';

  @override
  String get newEmail => 'Yeni e-posta';

  @override
  String get changeEmailSend => 'Onay gönder';

  @override
  String get changeEmailRow => 'Giriş yaptığınız e-postayı değiştirin';

  @override
  String changeEmailSent(String email) {
    return 'Her iki gelen kutusunu da kontrol edin. Her iki bağlantı da onaylandığında $email yeni e-postanız olur.';
  }

  @override
  String changeEmailPending(String email) {
    return 'Onay bekleniyor: $email';
  }

  @override
  String get signOutEverywhere => 'Tüm cihazlardan çıkış yap';

  @override
  String get signOutEverywhereHelp =>
      'Bu cihaz dahil tüm telefonlar, bilgisayarlar ve tarayıcılar';

  @override
  String get signOutEverywhereConfirm =>
      'Bu cihaz dahil tüm cihazlardan çıkış yapılsın mı? Bir cihazınızı kaybettiyseniz veya başka birinin oturum açtığını düşünüyorsanız bunu kullanın.';

  @override
  String get passkeySuggestTitle =>
      'Bir dahaki sefere daha hızlı giriş yapmak ister misiniz?';

  @override
  String get passkeySuggestBody =>
      'Bir geçiş anahtarı ekleyin ve Face ID, parmak izi veya ekran kilidinizle giriş yapın. Parola veya e-posta gerekmez.';

  @override
  String get passkeys => 'Geçiş anahtarları';

  @override
  String get passkeysRow =>
      'Face ID, parmak izi veya ekran kilidinizle giriş yapın';

  @override
  String get passkeysHelp =>
      'Geçiş anahtarı, parola veya e-posta olmadan Face ID, parmak izi veya ekran kilidinizle giriş yapmanızı sağlar. Her telefon, bilgisayar veya parola yöneticisi kendi anahtarını saklar.';

  @override
  String get passkeyAdd => 'Geçiş anahtarı ekle';

  @override
  String get passkeyAddAnother => 'Başka geçiş anahtarı ekle';

  @override
  String get passkeyAdded =>
      'Geçiş anahtarı eklendi. Bir dahaki sefere onunla giriş yapın.';

  @override
  String get passkeyRename => 'Yeniden adlandır';

  @override
  String get passkeyRenameTitle => 'Geçiş anahtarını yeniden adlandır';

  @override
  String get passkeyNameLabel => 'Ad';

  @override
  String get passkeyRemove => 'Kaldır';

  @override
  String passkeyRemoveConfirm(String name) {
    return '“$name” kaldırılsın mı? Artık bununla giriş yapamayacaksınız.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Eklenme: $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Son kullanım: $when';
  }

  @override
  String get twoStepSetUp => 'Kimlik doğrulayıcı uygulaması kur';

  @override
  String get twoStepAddAnother => 'Başka bir kimlik doğrulayıcı ekle';

  @override
  String get twoStepScan =>
      'Bu kodu bir kimlik doğrulayıcı uygulamasıyla (1Password, Google Authenticator veya Authy gibi) tarayın ya da kurulum anahtarını yazın, ardından gösterdiği 6 haneli kodu girin.';

  @override
  String get twoStepKey => 'Kurulum anahtarı';

  @override
  String get twoStepCode => '6 haneli kod';

  @override
  String get twoStepVerify => 'Doğrula';

  @override
  String get twoStepNowOn => 'İki adımlı giriş açık.';

  @override
  String get twoStepAuthenticators => 'Kimlik doğrulayıcı uygulamaları';

  @override
  String get twoStepRename => 'Yeniden adlandır';

  @override
  String get twoStepRenameTitle => 'Kimlik doğrulayıcıyı yeniden adlandır';

  @override
  String get twoStepNameLabel => 'Ad';

  @override
  String get twoStepNameHint => 'Örneğin: İş telefonu';

  @override
  String get twoStepRemove => 'Kaldır';

  @override
  String get twoStepRemoveConfirm =>
      'Bu kimlik doğrulayıcı uygulaması kaldırılsın mı? Tek uygulamanız buysa yalnızca parolanızla giriş yaparsınız.';

  @override
  String get twoStepPromptTitle => 'Kodunuzu girin';

  @override
  String get twoStepPromptBody =>
      'Kimlik doğrulayıcı uygulamanızı açın ve girişi tamamlamak için 6 haneli kodu girin.';

  @override
  String get twoStepPromptAccount => 'Giriş yapılan hesap';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'Yeni parola:';

  @override
  String get connectAiAppAccount => 'Şunlara erişim alır:';

  @override
  String joinAsAccount(String email, String server) {
    return '$server üzerinde $email olarak katılacaksınız.';
  }

  @override
  String get requireTwoStep =>
      'Sahipler ve yöneticiler için iki adımlı girişi zorunlu tut';

  @override
  String get requireTwoStepHelp =>
      'Sahipler ve yöneticiler bunu kullanmalıdır. Önce sizinkini açın.';

  @override
  String get twoStepNeededForAdmin =>
      'Bu çalışma alanı, sahipler ve yöneticiler için iki adımlı giriş gerektiriyor. Yönetici ayarlarını kullanmak için bunu kurun veya kodunuzla yeniden giriş yapın.';

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
  String get suspendWorkspace => 'Askıya al';

  @override
  String get unsuspendWorkspace => 'Askıyı kaldır';

  @override
  String get suspendReason => 'Neden';

  @override
  String get suspendWorkspaceHelp =>
      'Bilgisayarları durur ve botları çalışmayı durdurur. Hiçbir şey silinmez ve askıyı istediğiniz zaman kaldırabilirsiniz.';

  @override
  String workspaceSuspended(String reason) {
    return 'Askıya alındı: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'Bu çalışma alanı askıya alındı, bu yüzden botlar çalışamaz ve bilgisayarlar başlatılamaz. Bu sunucuyu yöneten kişiyle iletişime geçin.';

  @override
  String get abuseKind_mining_pool => 'Kripto madenciliği engellendi';

  @override
  String get abuseKind_blocked_port => 'Posta bağlantı noktası engellendi';

  @override
  String get abuseKind_egress_flood => 'Trafik taşması';

  @override
  String get abuseKind_signup_blocked => 'Kayıt reddedildi';

  @override
  String get abuseKind_suspended => 'Çalışma alanı askıya alındı';

  @override
  String get abuseKind_unsuspended => 'Askı kaldırıldı';

  @override
  String get kindLocalMcp => 'Bir bilgisayarda';

  @override
  String get capMcp => 'Yerel araçlar (MCP)';

  @override
  String get localMcpServers => 'Yerel araçlar (MCP)';

  @override
  String get localMcpHelp =>
      'Bu bilgisayarda veya ağınızda botlarınızın kullanabileceği T3 Code, Claude Code, Codex ya da tasarım uygulamaları gibi MCP sunucuları. Tokenları ve oturumları bu bilgisayarda kalır.';

  @override
  String get localMcpAdd => 'Yerel MCP sunucusu ekle';

  @override
  String get localMcpEmpty => 'Henüz yerel MCP sunucusu yok.';

  @override
  String get localMcpName => 'Ad';

  @override
  String get localMcpStdio => 'Bir komut';

  @override
  String get localMcpLoopback => 'Bir adres';

  @override
  String get localMcpCommand => 'Komut';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Adres';

  @override
  String get localMcpFolder => 'Çalışma klasörü (isteğe bağlı)';

  @override
  String get localMcpEnv =>
      'Ortam (satır başına bir ANAHTAR=değer, bu bilgisayarda tutulur)';

  @override
  String get localMcpNeedsCapability =>
      'Botların bunları kullanabilmesi için yukarıdan Yerel araçlar (MCP) seçeneğini açın.';

  @override
  String get localMcpBadUrl =>
      'Bu bilgisayarda veya kendi ağınızda http://127.0.0.1:3845/mcp gibi bir http:// adresi ya da bir https:// adresi kullanın.';

  @override
  String get localMcpBadFolder =>
      'Paylaşılan klasörlerden birinin içindeki bir klasörü seçin.';

  @override
  String get codingAgents => 'Kodlama ajanları';

  @override
  String get codingAgentsHelp =>
      'Botlar kodlama görevlerini bu bilgisayardaki bu ajanlara devredebilir. Sizin kendi oturumlarınızı kullanırlar ve paylaştığınız klasörlerde çalışırlar.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString kodlama ajanı bulundu',
      one: '1 kodlama ajanı bulundu',
      zero: 'Kodlama ajanı bulunamadı',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'Bu sunucu henüz çalışma alanına kaydedilmedi. Kaldırıp yeniden ekleyin.';

  @override
  String get localMcpSignInKind => 'Giriş';

  @override
  String get localMcpAuthNone => 'Yok';

  @override
  String get localMcpAuthToken => 'Token';

  @override
  String get localMcpAuthHeader => 'Üstbilgi';

  @override
  String get localMcpAuthOAuth => 'Tarayıcı';

  @override
  String get localMcpToken => 'Token (bu bilgisayarda tutulur)';

  @override
  String get localMcpHeaderName => 'Üstbilgi adı';

  @override
  String get localMcpHeaderValue => 'Üstbilgi değeri (bu bilgisayarda tutulur)';

  @override
  String get localMcpOAuthHelp =>
      'Casama, bu sunucuya giriş yapabilmeniz için tarayıcınızı açar. Giriş bilgileri bu bilgisayarda kalır.';

  @override
  String get localMcpNetworkWarning =>
      'Bu sunucu bu bilgisayarda değil. Bu bilgisayarı kullanabilen botlar ona erişebilir.';

  @override
  String get localMcpSignIn => 'Giriş yap';

  @override
  String get localMcpNeedsSignIn => 'Giriş gerekiyor';

  @override
  String get localMcpEdit => 'Yerel MCP sunucusunu düzenle';

  @override
  String get localMcpImport => 'Diğer uygulamalardan ekle';

  @override
  String get localMcpImportHelp =>
      'Bu bilgisayarda T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex veya Windsurf içinde zaten kurulu MCP sunucuları.';

  @override
  String get localMcpImportNone =>
      'Bu bilgisayardaki diğer uygulamalarda MCP sunucusu bulunamadı.';

  @override
  String get localMcpImportAdded => 'Zaten eklendi';

  @override
  String get localMcpImportRemote =>
      'İnternet üzerinde, bu yüzden genellikle Bağlantılar altına eklenir. Yalnızca bu bilgisayar erişebiliyorsa buraya ekleyin.';

  @override
  String get mcpQuestionDecline => 'Reddet';

  @override
  String get mcpQuestionSend => 'Gönder';

  @override
  String get cardMcpQuestion => 'Soru';

  @override
  String get cardMcpSignIn => 'Giriş';

  @override
  String get mcpSignInHereHelp =>
      'Botlarınızın tekrar kullanabilmesi için giriş yapın.';

  @override
  String localMcpSignedIn(String name) {
    return '$name oturumu açıldı';
  }

  @override
  String localMcpImportFrom(String source) {
    return '$source kaynağından';
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
      other: '$nString sunucu ekle',
      one: '1 sunucu ekle',
      zero: 'Ekle',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (bu bilgisayarda tutulur)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name için giriş yapmanız gerekiyor';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return '$device cihazında Casama\'yı açın ve oradan giriş yapın.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Bu aracın çalıştığı bilgisayarda Casama\'yı açın ve oradan giriş yapın.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection soruyor';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return '$connection yanıtlandı';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return '$connection sorusu reddedildi';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return '$connection sorusu kapandı';
  }

  @override
  String get codingAgentsNone =>
      'Kodlama ajanı bulunamadı. Onlara kodlama görevleri vermek için Claude Code, Codex veya Cursor\'ın komut satırı ajanını yükleyin.';

  @override
  String get codingAgentsNeedShell =>
      'Kodlama ajanları komut olarak çalışır, bu yüzden Komut çalıştır ayarının açık olması gerekir.';

  @override
  String get allowCommands => 'Aç';

  @override
  String get codingAgentAllow => 'İzin ver';

  @override
  String get codingAgentAllowed => 'İzin verildi';

  @override
  String get codingAgentsAllowHelp =>
      'Yanında İzin ver yazan bir ajan bu bilgisayarda henüz çalışmadı. Bir kez izin verin, botlar ona görev devredebilir.';

  @override
  String get ownAgentsAdd => 'Özel ajan ekle';

  @override
  String get ownAgentYours => 'Sizinki';

  @override
  String get ownAgentNotFound => 'Bu bilgisayarda bulunamadı';

  @override
  String get ownAgentsHelp =>
      'Kendi ajanlarınız yalnızca bu bilgisayarda, sizin adınıza işlem yapan sohbetlerde çalışır. Çalışma alanındaki başka hiç kimse onları göremez veya değiştiremez.';

  @override
  String get ownAgentFormTitle => 'Kendi ajanınızı ekleyin';

  @override
  String get ownAgentEditTitle => 'Ajanınızı düzenleyin';

  @override
  String get ownAgentName => 'Ad';

  @override
  String get ownAgentBin => 'Komut adı';

  @override
  String get ownAgentCommand => 'Komut';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Görevin gideceği yere $task koyun; Casama bunu tırnak içine alır. İçindeki her komut, komut adıyla başlar. Ayrıca $folder ve ajan yanıtını bir dosyaya yazıyorsa $result_file yer tutucularını da kullanabilirsiniz.';
  }

  @override
  String get ownAgentResult => 'Yanıtı okuma';

  @override
  String get ownAgentResultTail => 'Çıktısının sonu';

  @override
  String get ownAgentResultJson => 'result alanı içeren bir JSON satırı';

  @override
  String get ownAgentResultStream => 'Bir JSON satırları akışı';

  @override
  String get ownAgentResultField => 'Bir JSON alanı';

  @override
  String get ownAgentResultFile => 'Bir dosyaya yazıldı';

  @override
  String get ownAgentResultFieldName => 'Alan adı';

  @override
  String get ownAgentTimeLimit => 'Zaman sınırı (dakika)';

  @override
  String get ownAgentTest => 'Test et';

  @override
  String get ownAgentTestHelp =>
      'Test, ondan bu bilgisayarda yalnızca pong kelimesiyle yanıt vermesini ister ve yazdırdığını gösterir.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'Şöyle yanıt verdi: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'Beklendiği gibi yanıt vermedi (çıkış $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'Zamanında bitmedi.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Bir ad, bir komut adı ve $task içeren bir komut girin.';
  }

  @override
  String get board => 'Pano';

  @override
  String get newTicket => 'Yeni talep';

  @override
  String get newTicketSubtitle =>
      'Botlarınızdan biri için, panoda takip edilen bir görev.';

  @override
  String get allProjects => 'Tüm projeler';

  @override
  String get manageProjects => 'Projeleri yönet';

  @override
  String get filterByProject => 'Projeye göre filtrele';

  @override
  String get moveTo => 'Taşı';

  @override
  String get noMatchingTickets => 'Eşleşen talep yok';

  @override
  String get noMatchingTicketsHelp => 'Bu filtrelerle eşleşen talep yok.';

  @override
  String get clearFilters => 'Filtreleri temizle';

  @override
  String get ticketTitle => 'Başlık';

  @override
  String get ticketDetails => 'Ayrıntılar';

  @override
  String get taskInReview => 'İncelemede';

  @override
  String get priority => 'Öncelik';

  @override
  String get priorityUrgent => 'Acil';

  @override
  String get priorityHigh => 'Yüksek';

  @override
  String get priorityMedium => 'Orta';

  @override
  String get priorityLow => 'Düşük';

  @override
  String get priorityNone => 'Öncelik yok';

  @override
  String get filterAll => 'Tümü';

  @override
  String get filterMine => 'Bana ait';

  @override
  String get filterBots => 'Botlar';

  @override
  String get assignee => 'Atanan kişi';

  @override
  String get unassigned => 'Atanmamış';

  @override
  String get assignToMe => 'Ben';

  @override
  String get reviewRequired => 'İnceleme gerekiyor';

  @override
  String get reviewRequiredHelp =>
      'Bot işi tamamlandı yerine incelemede olarak bitirir.';

  @override
  String get comments => 'Yorumlar';

  @override
  String get addComment => 'Yorum ekle';

  @override
  String get sendComment => 'Gönder';

  @override
  String get openThread => 'Botun konusunu aç';

  @override
  String get deleteTicket => 'Talebi sil';

  @override
  String get ticketResult => 'Sonuç';

  @override
  String get noCommentsYet =>
      'Henüz yorum yok. Bot veya ekibiniz için bir not bırakın.';

  @override
  String get noTickets => 'Botlarınıza yapacak bir iş verin';

  @override
  String get noTicketsHelp =>
      'Tek bir işi veya bütün bir hedefi devredin. İlerlemesini buradan izleyebilirsiniz.';

  @override
  String get tasksStartTicket => 'Talep ekle';

  @override
  String get tasksStartTicketHelp =>
      'Tek bir iş. Bir bota atayın, hemen başlasın.';

  @override
  String get tasksStartProject => 'Proje başlat';

  @override
  String get tasksStartProjectHelp =>
      'Daha büyük bir hedef. Bir bot bunu talepler halinde planlar ve onayınızı bekler.';

  @override
  String get tasksExamples => 'Veya bunlardan biriyle başlayın';

  @override
  String get tasksExampleResearch => 'İlk üç rakibimi araştır';

  @override
  String get tasksExampleDraft => 'Bir lansman duyurusu taslağı hazırla';

  @override
  String get tasksExampleTidy => 'Dosyalarımı düzenle';

  @override
  String get ticketStatus => 'Durum';

  @override
  String get spaces => 'Çalışma alanları';

  @override
  String get newWorkspace => 'Yeni çalışma alanı';

  @override
  String get newWorkspaceSubtitle =>
      'Botları, sohbetleri ve kişileriyle bir ekip için ayrı bir alan.';

  @override
  String get joinWorkspaceHelp =>
      'Birisinin size gönderdiği davet bağlantısını yapıştırın.';

  @override
  String get inviteLinkField => 'Davet bağlantısı';

  @override
  String get workspaceIcon => 'Simge';

  @override
  String get workspaceColor => 'Renk';

  @override
  String get workspaceSettings => 'Çalışma alanı ayarları';

  @override
  String get workspaceSettingsHelp => 'Ad, simge, renk ve davet bağlantıları';

  @override
  String get inviteLinks => 'Davet bağlantıları';

  @override
  String get inviteLinksHelp =>
      'Bağlantıya sahip herkes, süresi dolana, kullanım hakkı bitene veya siz iptal edene kadar giriş yaptıktan sonra katılabilir.';

  @override
  String get createInviteLink => 'Bağlantı oluştur';

  @override
  String get linkExpires => 'Bitiş';

  @override
  String get linkNever => 'Hiçbir zaman';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$daysString gün içinde',
      one: '1 gün içinde',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Kullanım sayısı';

  @override
  String get linkUnlimited => 'Sınırsız';

  @override
  String linkUses(String uses) {
    return '$uses kullanıldı';
  }

  @override
  String get linkRevoked => 'İptal edildi';

  @override
  String get revokeLink => 'İptal et';

  @override
  String get linkCopied => 'Davet bağlantısı kopyalandı.';

  @override
  String get inviteRole => 'Rol';

  @override
  String get shareLinkLabel => 'Paylaş';

  @override
  String get botFolder => 'Klasör';

  @override
  String get noFolder => 'Klasör yok';

  @override
  String get newFolder => 'Yeni klasör…';

  @override
  String get folderName => 'Klasör adı';

  @override
  String get archiveBot => 'Botu arşivle';

  @override
  String archiveBotTitle(String name) {
    return '$name arşivlensin mi?';
  }

  @override
  String get archiveBotBody =>
      'Kenar çubuğundan kaldırılır ve çalışmayı durdurur. Sohbetleri ve geçmişi korunur; Arşivlenen botlar bölümünden geri getirebilirsiniz.';

  @override
  String get archive => 'Arşivle';

  @override
  String get archivedBots => 'Arşivlenen botlar';

  @override
  String get unarchive => 'Geri getir';

  @override
  String botArchived(String name) {
    return '$name arşivlendi.';
  }

  @override
  String get deleteBot => 'Botu sil';

  @override
  String deleteBotTitle(String name) {
    return '$name silinsin mi?';
  }

  @override
  String deleteBotBody(String name) {
    return '$name ile yapılan tüm sohbetler mesajları, fotoğrafları ve dosyalarıyla birlikte kalıcı olarak silinir; $name çalışmayı durdurur ve kenar çubuğundan kaldırılır. Grup sohbetleri ve kullanım kayıtları kalır. Ayarları ve hafızası Arşivlenen botlar bölümüne taşınır.';
  }

  @override
  String botDeleted(String name) {
    return '$name silindi.';
  }

  @override
  String get settingsHistory => 'Ayar geçmişi';

  @override
  String get settingsHistoryHelp =>
      'Bu botun ayarlarında yapılan her değişiklik ve kimin yaptığı';

  @override
  String get noHistory => 'Henüz değişiklik yok.';

  @override
  String get restoreSettings => 'Bu ayarları geri yükle';

  @override
  String restoreSettingsBody(String fields) {
    return '$fields bu değişiklikten önceki haline döndürülsün mü? Mevcut ayarlar geçmişte kalır.';
  }

  @override
  String changedByBot(String name) {
    return '$name tarafından değiştirildi';
  }

  @override
  String get changedByPerson => 'Bir kişi tarafından değiştirildi';

  @override
  String get changedBySystem => 'Casama tarafından değiştirildi';

  @override
  String get fieldName => 'ad';

  @override
  String get fieldInstructions => 'talimatlar';

  @override
  String get fieldModel => 'model';

  @override
  String get fieldAutonomy => 'otonomi';

  @override
  String get fieldBudget => 'bütçe';

  @override
  String get fieldComputer => 'bilgisayar';

  @override
  String get fieldArchived => 'arşivlendi';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot için bir $service anahtarı gerekiyor';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Yalnızca $hosts için';
  }

  @override
  String get secretRequestHelp =>
      'Doğrudan kasaya gider. Bot bunu asla görmez.';

  @override
  String secretSaved(String name) {
    return '$name kaydedildi';
  }

  @override
  String get secretDeclined => 'Reddedildi';

  @override
  String secretWhat(String service) {
    return '$service anahtarı';
  }

  @override
  String totpWhat(String service) {
    return '$service giriş kodu';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Geri verildi: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return '$host için giriş bilgileriniz paylaşıldı';
  }

  @override
  String get shareLogin => 'Giriş bilgilerini paylaş';

  @override
  String get shareLoginUsername => 'E-posta veya kullanıcı adı';

  @override
  String get shareLoginPassword => 'Parola';

  @override
  String get shareLoginRemember => 'Bir dahaki sefere hatırla';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Yalnızca $host üzerinde kullanılır. $bot parolanızı asla görmez.';
  }

  @override
  String get shareLoginSave => 'Kaydet ve giriş yap';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot, $host adresine giriş yapmanızı istiyor';
  }

  @override
  String get signInOnPage => 'Sayfada giriş yap';

  @override
  String loginOnPageLine(String host) {
    return 'Sayfada $host girişi yapılıyor';
  }

  @override
  String get loginOnPageHelp =>
      'Sayfada giriş yapın, ardından Geri ver\'e dokunun.';

  @override
  String get back => 'Geri';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Paylaşılmadı: takviminiz',
      'reminders': 'Paylaşılmadı: anımsatıcılarınız',
      'contacts': 'Paylaşılmadı: kişileriniz',
      'places': 'Paylaşılmadı: yerleriniz',
      'photos': 'Paylaşılmadı: fotoğraflarınız',
      'health': 'Paylaşılmadı: sağlık verileriniz',
      'notifications': 'Paylaşılmadı: bildirimleriniz',
      'activity': 'Paylaşılmadı: bilgisayar etkinliğiniz',
      'browserTab': 'Paylaşılmadı: geçerli tarayıcı sekmeniz',
      'browserHistory':
          'Paylaşılmadı: tarayıcı geçmişiniz ve yer işaretleriniz',
      'alarm': 'Paylaşılmadı: alarmlarınız',
      'home': 'Paylaşılmadı: Ev aksesuarlarınız',
      'other': 'Paylaşılmadı: cihaz verileriniz',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Reddet';

  @override
  String get signInCode => 'Giriş kodu';

  @override
  String get secretKindValue => 'Anahtar veya parola';

  @override
  String get totpSeedLabel =>
      'Kurulum anahtarı, otpauth:// bağlantısı veya şu an gördüğünüz kod';

  @override
  String get totpSeedHelp =>
      'Sitenin iki adımlı kurulumundan alınan bir kurulum anahtarı, botun sonraki her kodu üretmesini sağlar (bot anahtarı asla görmez). Veya şu an gördüğünüz kodu yazın: doğrudan bota gider.';

  @override
  String get scanQrCode => 'QR kodu tara';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot için bir $service giriş kodu gerekiyor';
  }

  @override
  String get search => 'Ara';

  @override
  String get searchHint => 'Sohbet, hafıza, beceri, talep ve dosyalarda ara';

  @override
  String get searchEmptyPrompt => 'En az 2 karakter yazın.';

  @override
  String searchNoResults(String query) {
    return '“$query” için sonuç bulunamadı.';
  }

  @override
  String get searchMessages => 'Mesajlar';

  @override
  String get searchChats => 'Sohbetler';

  @override
  String get searchTickets => 'Talepler';

  @override
  String get searchFiles => 'Dosyalar';

  @override
  String get searchFilesAsleep =>
      'Uyku modundaki bilgisayarlardaki dosyalar aranmaz. Dosyalarını dahil etmek için bir bilgisayarı başlatın.';

  @override
  String get searchSearching => 'Aranıyor…';

  @override
  String get searchJumpHint => 'Ara veya atla…';

  @override
  String get searchRecent => 'Son aramalar';

  @override
  String get searchClearRecent => 'Temizle';

  @override
  String get searchRemoveRecent => 'Son aramalardan kaldır';

  @override
  String get searchJumpBackIn => 'Kaldığınız yerden devam edin';

  @override
  String get searchNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n öğe sizden yanıt bekliyor',
      one: '1 öğe sizden yanıt bekliyor',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Git';

  @override
  String get searchTopHits => 'En iyi sonuçlar';

  @override
  String get searchScopeAll => 'Tümü';

  @override
  String get searchMemories => 'Anılar';

  @override
  String get searchKeepTyping =>
      'Mesajlarda, hafızada ve dosyalarda aramak için yazmaya devam edin.';

  @override
  String searchAskBot(String bot, String query) {
    return '$bot botuna “$query” hakkında sor';
  }

  @override
  String get searchAskBotHelp => 'Bu soruyla yeni bir sohbet başlatır';

  @override
  String get searchKeysHint => '↑ ↓ gezin   ↵ aç   esc kapat';

  @override
  String get searchClear => 'Aramayı temizle';

  @override
  String get installFor => 'Şunun için kur:';

  @override
  String get wholeWorkspace => 'Tüm çalışma alanı';

  @override
  String get skillCatalog => 'Beceri kataloğu';

  @override
  String get searchSkills => 'Becerilerde ara';

  @override
  String get all => 'Tümü';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString dosya',
      one: '1 dosya',
    );
    return '$_temp0';
  }

  @override
  String get install => 'Kur';

  @override
  String skillInstalled(String name) {
    return '$name kuruldu.';
  }

  @override
  String get noResults => 'Sonuç yok.';

  @override
  String get importFromGitHub => 'GitHub\'dan içe aktar';

  @override
  String get importFromGitHubHelp =>
      'SKILL.md dosyası içeren bir klasörün bağlantısını yapıştırın. Kurulumdan önce her dosyayı görürsünüz. Özel depolar, api.github.com için izin verilen bir GITHUB_TOKEN gizli anahtarını kullanır.';

  @override
  String get preview => 'Önizleme';

  @override
  String get skillScriptsNote =>
      'Bir becerideki betikler hiçbir zaman sunucuda değil, yalnızca botun bilgisayarında çalışır.';

  @override
  String get binaryFile => '(ikili dosya)';

  @override
  String skillUpdate(String name) {
    return '$name güncelle';
  }

  @override
  String get checkingForUpdates => 'Güncellemeler kontrol ediliyor…';

  @override
  String get skillUpToDate => 'Zaten güncel.';

  @override
  String get update => 'Güncelle';

  @override
  String get filesAdded => 'Eklendi';

  @override
  String get filesChanged => 'Değiştirildi';

  @override
  String get filesRemoved => 'Kaldırıldı';

  @override
  String get fromCatalog => 'Katalogdan';

  @override
  String get savedByBot => 'Bir bot tarafından kaydedildi';

  @override
  String get checkForUpdates => 'Güncellemeleri kontrol et';

  @override
  String get attachSkill => 'Beceri ekle';

  @override
  String get rerunSetup => 'Kurulumu tekrar çalıştır';

  @override
  String get rerunSetupHelp =>
      'Kurulum sorularını yeniden yanıtlayın ve yeni bir öneriyi inceleyin';

  @override
  String get trace => 'İzleme';

  @override
  String get openTrace => 'İzlemeyi aç';

  @override
  String get editMessage => 'Düzenle';

  @override
  String get editMessageHelp =>
      'Göndermek, sohbeti buradan yeniden başlatır. Orijinal sürüm kalır; oklarla geçiş yapın.';

  @override
  String get previousVersion => 'Önceki sürüm';

  @override
  String get nextVersion => 'Sonraki sürüm';

  @override
  String get quietHours => 'Sessiz saatler';

  @override
  String get quietHoursHelp =>
      'Bildirimler sessiz saatler bitene kadar bekler; gelen kutunuz yine de dolar. İçinde bulunduğunuz bir sohbetin onayları yine de gelir.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start – $end';
  }

  @override
  String get off => 'Kapalı';

  @override
  String get botNotifications => 'Bu bottan bildirimler';

  @override
  String get botNotificationsHelp =>
      'Bu botun sessiz saatlerinize uyup uymayacağı';

  @override
  String get botMayCall => 'Beni arayabilir';

  @override
  String get botMayCallHelp =>
      'Bu bot, aramaya değer bir durum olduğunda sizi telefonla arayabilir. Kapalıysa bunun yerine bildirim gönderir.';

  @override
  String get quietDefault => 'Sessiz saatlerime uy';

  @override
  String get quietAlways => 'Her zaman bana bildir';

  @override
  String get quietCustom => 'Kendi sessiz saatleri';

  @override
  String get from => 'Başlangıç';

  @override
  String get until => 'Bitiş';

  @override
  String get shareAsTemplate => 'Şablon olarak paylaş';

  @override
  String get shareAsTemplateRow =>
      'Talimatları, becerileri ve rutinleriyle bir dosya veya bağlantı';

  @override
  String get shareAsTemplateHelp =>
      'Talimatları, becerileri, rutinleri ve kullandığı hizmetleri içerir. Anahtarları veya gizli bilgileri asla içermez.';

  @override
  String get copyLink => 'Bağlantıyı kopyala';

  @override
  String get includeMemories => 'Hafızayı dahil et';

  @override
  String get includeMemoriesHelp =>
      'Sizin hakkınızda öğrendikleri. Dikkatli paylaşın.';

  @override
  String get saveAsFile => 'Dosya olarak kaydet';

  @override
  String get notABotTemplate => 'Bu dosya bir Casama bot şablonu değil.';

  @override
  String get importBot => 'Bot içe aktar';

  @override
  String botImported(String name) {
    return '$name hazır.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name hazır. Kullanabilmesi için Entegrasyonlar bölümünden $services bağlantısını kurun.';
  }

  @override
  String get whatComesWithIt => 'Birlikte gelenler';

  @override
  String get connectAfterImport => 'İçe aktardıktan sonra bağla';

  @override
  String get importRoutines => 'Rutinlerini zamanla';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hafıza kaydını koru',
      one: '1 hafıza kaydını koru',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Rutin başlatılıyor…';

  @override
  String get offlineSaved => 'Çevrimdışı. Kayıtlı mesajlar gösteriliyor.';

  @override
  String get loadEarlierMessages => 'Önceki mesajlar';

  @override
  String get chatLoadFailedTitle => 'Bu sohbet yüklenmedi';

  @override
  String get chatLoadFailedBody => 'Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get projects => 'Projeler';

  @override
  String get newProject => 'Yeni proje';

  @override
  String get noProjects => 'Henüz proje yok';

  @override
  String get projectsHelp =>
      'Proje bir işi bir arada tutar: sohbeti, planı, yapılacakları, dosyaları ve onun için yapılan her şey. Bir botla birlikte çalışın veya botun planlayıp kendi başına çalışmasına izin verin.';

  @override
  String get newProjectHelp =>
      'Bir işi bir arada tutar: sohbeti, planı, yapılacakları, dosyaları ve onun için yapılan her şey.';

  @override
  String get startPlanning => 'Planlamaya başla';

  @override
  String get projectTitle => 'Başlık';

  @override
  String get projectGoal => 'Hedef';

  @override
  String get projectDoneWhen => 'Tamamlanma ölçütü';

  @override
  String get projectLead => 'Lider bot';

  @override
  String get projectBudget => 'Bütçe';

  @override
  String get projectGoalHint =>
      'Sonunda ne ortaya çıkmalı? Alan adımda yayında olan bir açılış sayfası…';

  @override
  String get projectDoneHint => 'İsteğe bağlı. Bittiğini nasıl anlayacaksınız';

  @override
  String get projectBudgetHint =>
      'İsteğe bağlı. Harcandığında çalışma duraklatılır';

  @override
  String get projectThread => 'Proje sohbeti';

  @override
  String get approvePlan => 'Planı onayla';

  @override
  String get pause => 'Duraklat';

  @override
  String get resume => 'Sürdür';

  @override
  String get milestones => 'Kilometre taşları';

  @override
  String get needsSignoff => 'onayınızı bekliyor';

  @override
  String get signOff => 'Onayla';

  @override
  String get projectPlan => 'Plan';

  @override
  String get tickets => 'Talepler';

  @override
  String get projectTimeline => 'Zaman çizelgesi';

  @override
  String get projectPlanning => 'Planlanıyor';

  @override
  String get projectActive => 'Etkin';

  @override
  String get projectPaused => 'Duraklatıldı';

  @override
  String get projectBlocked => 'Engellendi';

  @override
  String get projectDone => 'Tamamlandı';

  @override
  String get projectCancelled => 'İptal edildi';

  @override
  String get projectName => 'Ad';

  @override
  String get projectNameHint => 'Uzay Kaçışı, Bahar bülteni…';

  @override
  String get createProject => 'Proje oluştur';

  @override
  String projectWorksAlone(String bot) {
    return '$bot üzerinde kendi başına çalışsın';
  }

  @override
  String get projectWorksAloneHelp =>
      'Onaylamanız için bir plan taslağı hazırlar, ardından hedefe ulaşılana kadar oturumlar halinde çalışır. Siz onaylamadan hiçbir şey başlamaz.';

  @override
  String get projectWorksAloneOn =>
      'Hedefe ulaşılana kadar oturumlar halinde çalışır.';

  @override
  String get projectWorksAloneOff => 'Sohbetinde birlikte çalışırsınız.';

  @override
  String get projectMade => 'Bu projede yapılanlar';

  @override
  String projectMadeEmpty(String bot) {
    return 'Henüz bir şey yok. $bot botunun bu projenin sohbetinde yaptıkları burada görünür.';
  }

  @override
  String get projectSeeAll => 'Tümünü gör';

  @override
  String get projectTodos => 'Yapılacaklar';

  @override
  String get projectFiles => 'Dosyalar';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$bot botunun bilgisayarında $folder';
  }

  @override
  String get projectMarkDone => 'Tamamlandı olarak işaretle';

  @override
  String get projectReopen => 'Yeniden aç';

  @override
  String get projectCover => 'Kapak';

  @override
  String get projectCoverNone => 'Yok';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Yelkenli',
      'mountain': 'Dağ',
      'seedling': 'Fide',
      'compass': 'Pusula',
      'lantern': 'Fener',
      'telescope': 'Teleskop',
      'map': 'Harita',
      'chess': 'Satranç',
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
      other: '$countString öğe',
      one: '1 öğe',
      zero: 'Henüz bir şey yok',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Proje';

  @override
  String get creationMoveToProject => 'Projeye taşı';

  @override
  String get creationNoProject => 'Proje yok';

  @override
  String get makeProject => 'Bunu proje yap';

  @override
  String get makeProjectTitle => 'Bu konuyu proje yap';

  @override
  String makeProjectHelp(String bot) {
    return '$bot botunun bu konuda yaptıkları proje altına kaydedilir; bundan sonra burada yapacakları da öyle.';
  }

  @override
  String get openProject => 'Projeyi aç';

  @override
  String get theBot => 'bot';

  @override
  String get forYou => 'Sizin için';

  @override
  String get inboxNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Sizden yanıt bekliyor ($nString)';
  }

  @override
  String get inboxBriefs => 'Özetler';

  @override
  String get inboxUpdates => 'Güncellemeler';

  @override
  String get inboxEmptyHelp =>
      'Botlarınızdan gelen istekler, sabah özetleri, bildirimler ve yeni sayfalar burada görünür.';

  @override
  String get inboxNeedsYouEmpty => 'Şu anda yanıtınızı bekleyen bir şey yok';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'Bir bot bir karara veya yardımınıza ihtiyaç duyduğunda ya da bir fikri olduğunda burada görünür.';

  @override
  String get noBriefs => 'Henüz sabah özeti yok';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot, “$title” sayfasını yayınladı';
  }

  @override
  String get forYouEmpty => 'Şu anda sizin için bir şey yok';

  @override
  String get forYouEmptyHelp =>
      'Sabah özeti ve gün içinde öneriler için bir botun ayarlarından bilgilendirmeleri açın.';

  @override
  String morningBriefFrom(String name) {
    return '$name botundan sabah özeti';
  }

  @override
  String get suggestions => 'Öneriler';

  @override
  String suggestedBy(String name) {
    return '$name tarafından önerildi';
  }

  @override
  String get dismissSuggestion => 'Bu öneri kapatılsın mı?';

  @override
  String dismissSuggestionHelp(String bot) {
    return '$bot botunun bunu tekrar gündeme getirip getiremeyeceğini seçin.';
  }

  @override
  String get justThisOnce => 'Yalnızca bu seferlik';

  @override
  String justThisOnceHelp(String bot) {
    return 'Şimdilik gizle. Daha sonra hâlâ önemliyse $bot bunu tekrar önerebilir.';
  }

  @override
  String get dontSuggestAgain => 'Bir daha önerme';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Kalıcı olarak kaldırılır. $bot istemediğinizi hatırlar.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Anlaşıldı. $bot bunu bir daha önermeyecek.';
  }

  @override
  String get doIt => 'Yap';

  @override
  String get checkins => 'Bilgilendirmeler';

  @override
  String get checkinsHelp =>
      'Bir sabah özeti ve birkaç saatte bir sizden yanıt bekleyen şeyler için bir kontrol. Varsayılan olarak kapalıdır.';

  @override
  String get briefTime => 'Sabah özeti saati';

  @override
  String get scanEvery => 'Kontrol sıklığı';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString saat',
      one: '1 saat',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => 'Günlük sınır';

  @override
  String get on => 'Açık';

  @override
  String get actionRules => 'Eylem kuralları';

  @override
  String get actionRulesRow => 'Sormadan yapabilecekleri';

  @override
  String get actionRulesHelp =>
      'Kurallar eylem başına karar verir: izin ver, sınırlar içinde izin ver, önce sor veya tamamlamanız için size devret. En belirli kural geçerli olur; kural yoksa botun otonomisi belirler. Botlar kendi kurallarını değiştiremez.';

  @override
  String get addRule => 'Kural ekle';

  @override
  String get addRuleHelp =>
      'Botun ne yaptığını ve bunu nasıl ele alması gerektiğini seçin.';

  @override
  String get noRules => 'Henüz kural yok. Botun otonomi düzeyi belirler.';

  @override
  String get otherTools => 'Belirli araçlar';

  @override
  String get workspaceRule => 'Çalışma alanı kuralı';

  @override
  String get catSend => 'Mesaj gönderme';

  @override
  String get catPay => 'Ödemeler';

  @override
  String get catDelete => 'Silme';

  @override
  String get catPublish => 'Yayınlama';

  @override
  String get catShare => 'Paylaşma ve davetler';

  @override
  String get catSignIn => 'Giriş yapma';

  @override
  String get whenTheBot => 'Bot şunu yaparken';

  @override
  String get itShould => 'Şunu yapmalı';

  @override
  String get ruleAllow => 'Devam etsin';

  @override
  String get ruleAllowLimits => 'Sınırlar içinde devam etsin';

  @override
  String get ruleAsk => 'Önce bana sorsun';

  @override
  String get ruleHandOff => 'Tamamlamam için bana devretsin';

  @override
  String get ruleDomains => 'Yalnızca bu alan adlarına (virgülle ayrılmış)';

  @override
  String get ruleMaxAmount => 'Şu tutara kadar';

  @override
  String get ruleForWorkspace => 'Çalışma alanındaki her bot için';

  @override
  String get watchers => 'Takipler';

  @override
  String get watchersRow => 'Gözünü üzerinde tuttuğu şeyler';

  @override
  String get noWatchers => 'Hiçbir şeyi takip etmiyor';

  @override
  String get watchersHelp =>
      'Bota \"bana haber ver…\" deyin; bir sayfayı, yanıtı, sonucu veya saati takip etsin. Bir şey değişene kadar kontroller ücretsizdir.';

  @override
  String get watcherActive => 'Takip ediyor';

  @override
  String get watcherPaused => 'Duraklatıldı';

  @override
  String get watcherDone => 'Tamamlandı';

  @override
  String get watcherExpired => 'Süresi doldu';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kez tetiklendi',
      one: '1 kez tetiklendi',
      zero: 'henüz tetiklenmedi',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'Bir yapay zeka uygulaması bağla';

  @override
  String connectAiAppAsk(String app) {
    return '$app Casama\'yı kullanmak istiyor';
  }

  @override
  String get connectAiAppHelpShort =>
      'Sizin adınıza botlarınızı listeleyebilir, onlardan bir şeyler yapmasını isteyebilir ve seçtiğiniz çalışma alanındaki sonuçları okuyabilir. Botlarınızın onayları ve kuralları geçerli olmaya devam eder.';

  @override
  String get connectAiAppSendsTo => 'İzin verdikten sonra şuraya dönersiniz';

  @override
  String get connectAiAppUnknown =>
      'Casama bu adresi tanımıyor. Herkes herhangi bir uygulamaya herhangi bir ad verebilir; bu yüzden yalnızca bu bağlantıyı kendiniz başlattıysanız ve bu siteye güveniyorsanız izin verin.';

  @override
  String get connectAiAppDone =>
      'Tamamlandı. Yapay zeka uygulamasına dönebilirsiniz.';

  @override
  String get refuse => 'Reddet';

  @override
  String get allow => 'İzin ver';

  @override
  String get connectAiApps => 'Yapay zeka uygulamalarını bağla';

  @override
  String get connectAiAppsHelp =>
      'MCP destekleyen uygulamalar bu adrese bağlanıp oturum açar veya bir API anahtarı kullanır. Onları bağlayan kişi olarak hareket ederler.';

  @override
  String get connectedAiApps => 'Bağlı yapay zeka uygulamaları';

  @override
  String get connectedAiAppsHelp =>
      'Oturum açarak bağladığınız uygulamalar. Birinin bağlantısını keserseniz bu çalışma alanına erişimini hemen kaybeder.';

  @override
  String get connectedAiAppsAdminHelp =>
      'Bu çalışma alanındaki kişilerin oturum açarak bağladığı uygulamalar. Birinin bağlantısını keserseniz erişimi hemen kesilir.';

  @override
  String get noConnectedAiApps => 'Henüz bağlı bir yapay zeka uygulaması yok.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Kullanıldı: $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Bağlandı: $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'Bu çalışma alanında çalışmayı hemen durdurur. Tekrar kullanmak için uygulamadan yeniden bağlayın.';

  @override
  String get mcpApprovals => 'Yapay zeka uygulamalarından onaylara izin ver';

  @override
  String get mcpApprovalsHelp =>
      'Bağlı uygulamalar botlarınızın eylemlerini onaylayabilir.';

  @override
  String get newApiKey => 'Yeni API anahtarı';

  @override
  String get apiKeyName => 'Ad';

  @override
  String get newGroupChat => 'Yeni grup sohbeti';

  @override
  String get groupChats => 'Grup sohbetleri';

  @override
  String groupWhoAnswers(String names) {
    return '$names yanıtlayacak';
  }

  @override
  String get groupEveryoneAnswers => 'Herkes yanıtlayacak';

  @override
  String get groupMentionHint =>
      'Bir botu @ ile etiketleyin veya @everyone yazın';

  @override
  String routineRan(String name) {
    return '“$name” rutini çalıştı';
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
      other: '$countString şey sizden yanıt bekliyor',
      one: '1 şey sizden yanıt bekliyor',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Tek bir sohbete 2 ila 10 bot getirin. @Ad tek bir bota sorar; @everyone liderden plan yapmasını ve işi paylaştırmasını ister.';

  @override
  String get groupCreate => 'Grup sohbeti oluştur';

  @override
  String get groupCrewEmpty => 'Grubu oluşturmak için aşağıdan botları seçin.';

  @override
  String get groupLeadShort => 'Lider';

  @override
  String get groupMakeLead => 'Lider yap';

  @override
  String groupRemoveBot(String name) {
    return '$name botunu kaldır';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bot daha seçin',
      one: '1 bot daha seçin',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'Bir grupta en fazla 10 bot olabilir.';

  @override
  String get groupLeadHint =>
      '@everyone yazdığınızda lider işi planlar. Başka bir botu lider yapmak için üstten ona dokunun.';

  @override
  String groupLeadIs(String name) {
    return '$name lider: @everyone yazdığınızda işi planlar. Başka bir botu lider yapmak için üstten ona dokunun.';
  }

  @override
  String groupPickOneMoreLead(String name) {
    return '1 bot daha seçin. $name lider; başka bir botu lider yapmak için üstten ona dokunun.';
  }

  @override
  String get groupNeedTwoBots =>
      'Bir grup sohbeti için en az iki bot gerekir. Önce başka bir bot oluşturun.';

  @override
  String get groupSearchBots => 'Botları ara';

  @override
  String get groupNoMatch => 'Bu adla eşleşen bot yok.';

  @override
  String get groupTitle => 'Ad (isteğe bağlı)';

  @override
  String get groupPickBots => 'Botlar';

  @override
  String get groupLead => 'Gruba liderlik eder';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Sayfalar';

  @override
  String get pagesRow => 'Yayınladığı raporlar ve panolar';

  @override
  String get noPages => 'Henüz sayfa yok';

  @override
  String get pagesHelp =>
      'Bir bottan rapor, pano veya takip aracı isteyin; bunu bir sayfa olarak yayınlayabilir. Sayfalar tarayıcınızda açılır ve siz paylaşana kadar gizli kalır.';

  @override
  String get pagePrivate => 'Yalnızca ben';

  @override
  String get pageWorkspace => 'Çalışma alanı';

  @override
  String get pagePublic => 'Bağlantıya sahip olan herkes';

  @override
  String get pageRefreshes => 'Programlı olarak yenilenir';

  @override
  String get pageCardOpen => 'Sayfa · Açmak için dokunun';

  @override
  String get exportPdf => 'PDF dışa aktar';

  @override
  String get pageMakePublicTitle => 'Bu sayfa herkese açık yapılsın mı?';

  @override
  String get pageMakePublicBody =>
      'Bağlantıya sahip olan herkes üzerindeki veriler dahil sayfayı açabilir. İstediğiniz zaman geri alabilirsiniz; bağlantı çalışmayı durdurur.';

  @override
  String get pageMakePublic => 'Herkese açık yap';

  @override
  String get pagePublicLinkTitle => 'Herkese açık bağlantı';

  @override
  String get pagePublicLinkBody =>
      'Kopyalandı. Arama motorlarında listelenmez.';

  @override
  String deletePageTitle(String title) {
    return '\"$title\" silinsin mi?';
  }

  @override
  String get openPages => 'Sayfalarda aç';

  @override
  String get discard => 'Vazgeç';

  @override
  String get discardChangesTitle => 'Değişikliklerden vazgeçilsin mi?';

  @override
  String get discardChangesBody => 'Düzenlemeleriniz kaydedilmedi.';

  @override
  String get keepEditing => 'Düzenlemeye devam et';

  @override
  String get teachTask => 'Bir görev öğret';

  @override
  String get teachWhichBot => 'Bunu hangi bot öğrensin?';

  @override
  String get teachRecording => 'Kaydediliyor';

  @override
  String get teachRecordingPaused => 'Kayıt durduruldu';

  @override
  String get teachRecordingHelp =>
      'Görevi normalde yaptığınız gibi yapın. Her adım ekrandakilerle birlikte kaydedilir; parola alanları asla kaydedilmez.';

  @override
  String get teachStop => 'Durdur';

  @override
  String get teachMarkSecret => 'Gizli olarak işaretle';

  @override
  String get teachMarkSecretHelp =>
      'Az önce yazdıklarınız kayıttan silinir ve botun isteyeceği gizli bir girdi haline gelir.';

  @override
  String get teachDraftTitle => 'Yeni beceri';

  @override
  String get teachDrafting => 'Kaydınızdan bir beceri yazılıyor…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString adım',
      one: '1 adım',
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
      other: '$countString adım',
      one: '1 adım',
    );
    return 'Gösterdikleriniz ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Adımları, girdileri ve başarı kontrollerini gözden geçirin, ardından kaydedin. Hemen deneyebilirsiniz.';

  @override
  String get teachDraftFailed =>
      'Bot bir taslak yazamadı. Adımları aşağıdaki kayıttan kendiniz yazın veya kayıttan vazgeçin.';

  @override
  String get teachAlreadySaved => 'Bu beceri kaydedildi';

  @override
  String get teachSaveAndTry => 'Kaydet ve dene';

  @override
  String teachSaved(String name) {
    return '$name kaydedildi';
  }

  @override
  String get teachDiscardTitle => 'Bu kayıttan vazgeçilsin mi?';

  @override
  String get teachDiscardBody =>
      'Yakaladığı tüm adımlar, anlık görüntüler ve ekran görüntüleri silinir.';

  @override
  String teachStepClick(int x, int y) {
    return '$x, $y konumuna tıkla';
  }

  @override
  String teachStepType(String text) {
    return '“$text” yaz';
  }

  @override
  String teachStepSecret(String name) {
    return 'Gizli $name bilgisini yaz';
  }

  @override
  String teachStepKey(String key) {
    return '$key tuşuna bas';
  }

  @override
  String get teachStepScroll => 'Kaydır';

  @override
  String get plugins => 'Eklentiler';

  @override
  String get pluginsRow => 'Eklenti paketlerinden beceriler ve araçlar';

  @override
  String get noPlugins => 'Henüz eklenti yok';

  @override
  String get pluginsHelp =>
      'Eklentiler GitHub üzerindeki Agent Plugins 1.0 paketleridir. Beceriler ve MCP araçları getirebilirler; sunucuları Casama\'nın sunucularında değil, bu botun bilgisayarında çalışır.';

  @override
  String get addPlugin => 'Bir eklenti ekle';

  @override
  String get addPluginHelp =>
      'Eklentinin klasörüne giden bir GitHub bağlantısı yapıştırın. Hiçbir şey yüklenmeden önce neleri eklediğini göreceksiniz.';

  @override
  String get pluginAdds => 'Ekledikleri';

  @override
  String pluginStdio(String command) {
    return 'Botun bilgisayarında çalışır: $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Şuraya bağlanır: $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'İletişim kurduğu adresler: $hosts';
  }

  @override
  String get pluginSkill => 'Beceri';

  @override
  String get pluginHosts => 'Ağ';

  @override
  String get pluginServerError => 'Başlatılamadı';

  @override
  String get pluginRunsOnComputer => 'Botun bilgisayarında çalışır';

  @override
  String get pluginWhereToolsRun => 'Araçlarının çalıştığı yer';

  @override
  String get pluginWhereToolsRunHelp =>
      'Kendi bilgisayarınızda araçlar oradaki şeyleri kullanabilir ve bunları yalnızca kendi sohbetlerinizden siz kullanabilirsiniz. İnternetteki sunucular etkilenmez.';

  @override
  String get pluginPlaceBot => 'Botun bilgisayarı';

  @override
  String pluginPlaceMine(String name) {
    return 'Bilgisayarım: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return '$name üzerinde çalışır';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'Araçları yalnızca bilgisayarın sahibi olan kişiyle yapılan sohbetlerde çalışır';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Çevrimdışı: Casama uygulaması orada açık olduğunda araçları yeniden çalışır';

  @override
  String get pluginUpToDate => 'Zaten güncel';

  @override
  String get checkForUpdate => 'Güncellemeleri denetle';

  @override
  String get uninstall => 'Kaldır';

  @override
  String uninstallPluginTitle(String name) {
    return '$name kaldırılsın mı?';
  }

  @override
  String get uninstallPluginBody =>
      'Becerileri, araçları, dosyaları ve kayıtlı gizli bilgileri bu bottan kaldırılır.';

  @override
  String updatePluginTitle(String name) {
    return '$name eklentisini güncelle';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'Yeni beceriler: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Değişen beceriler: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Kaldırılan beceriler: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'Yeni araç sunucuları: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Değişen araç sunucuları: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Kaldırılan araç sunucuları: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'İletişim kurduğu yeni ana bilgisayarlar: $hosts';
  }

  @override
  String get pluginDiffNone => 'Eklediklerinde değişiklik yok.';

  @override
  String get next => 'İleri';

  @override
  String get botNameLabel => 'Ad';

  @override
  String get importAgent => 'Bir aracı içe aktar';

  @override
  String get importAgentHelp =>
      'OpenClaw veya Hermes Agent üzerinden bir bot getirin ya da Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark veya Instinct üzerinden bir kurulum yapıştırın: karakteri, becerileri, zamanlamaları ve anıları. Oluşturulmadan önce her şeyi incelersiniz. Anahtarlar ve ayar dosyaları asla okunmaz.';

  @override
  String get importAgentPickFolder => 'Klasörünü seç';

  @override
  String get importAgentPickZip => 'Klasörünün ZIP dosyasını yükle';

  @override
  String get importPasteChoice => 'Bir botun kurulumunu yapıştır';

  @override
  String get importPasteChoiceHelp =>
      'Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct veya başka bir uygulamadan';

  @override
  String get importPasteTitle => 'Bir botun kurulumunu yapıştır';

  @override
  String get importPasteHelp =>
      'Aşağıdaki istemi botunuza gönderin, ardından yanıtının tamamını yapıştırın. Yeni bot oluşturulmadan önce her şeyi incelersiniz.';

  @override
  String get importPasteSource => 'Botunuz şu anda nerede?';

  @override
  String get importPasteOther => 'Başka bir yerde';

  @override
  String get importPasteStep1 => '1. Botunuza bu istemi gönderin';

  @override
  String get importPasteReply => '2. Yanıtını yapıştırın';

  @override
  String get importPasteSafety =>
      'Anahtar, parola veya kart numarasına benzeyen satırlar kaldırılır. İçe aktardıktan sonra uygulamalarına tekrar giriş yapın.';

  @override
  String get importPasteSubtitle => 'Yapıştırılan kurulum';

  @override
  String get agentImportReviewHelp =>
      'İstemediğiniz öğelerin işaretini kaldırın. Siz içe aktarana kadar hiçbir şey oluşturulmaz.';

  @override
  String get agentImportNoPersona => 'Karakter dosyası bulunamadı.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString beceri',
      one: '1 beceri',
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
      other: '$countString rutin',
      one: '1 rutin',
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
      other: '$countString hafıza kaydı',
      one: '1 hafıza kaydı',
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
      other: 'Diğer $countString dosyayı',
      one: 'Diğer 1 dosyayı',
    );
    return '$_temp0 botun bilgisayarındaki ~/imported/ klasörüne kopyala';
  }

  @override
  String agentImportSkipped(String files) {
    return 'İçe aktarılmadı: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$name içe aktarıldı ve $countString dosya bilgisayarına kopyalandı';
  }

  @override
  String agentImportedFilesLater(String name) {
    return '$name içe aktarıldı. Diğer dosyaları henüz kopyalanamadı; kopyalamak için ona bir bilgisayar verin ve tekrar içe aktarın.';
  }

  @override
  String get importMemoryTitle =>
      'ChatGPT veya Claude\'dan hafıza kayıtlarını içe aktar';

  @override
  String get importMemoryHelp =>
      'Bu istemi ChatGPT veya Claude\'a kopyalayın, ardından yanıtını aşağıya yapıştırın.';

  @override
  String get importMemoryPick =>
      'Doğru olanları tutun; geri kalanının işaretini kaldırın.';

  @override
  String get importMemoryPaste => 'Yanıtı';

  @override
  String get importMemoryNone => 'Bu yanıtta hafıza kaydı bulunamadı.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hafıza kaydı eklendi',
      one: '1 hafıza kaydı eklendi',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => 'Dosya olarak rutinler ve beceriler';

  @override
  String get routinesAsFilesHelp =>
      'Her rutin ve beceri bir Markdown dosyası olarak: dışa aktarın, istediğiniz yerde düzenleyin, geri içe aktarın veya bir GitHub deposunda saklayın.';

  @override
  String get exportFiles => 'Dosya olarak dışa aktar';

  @override
  String get importFiles => 'Dosyaları içe aktar';

  @override
  String get importFilesApply => 'Uygula';

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

    return '$createdString yeni, $updatedString değişti, $unchangedString değişmedi';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'İçe aktarıldı: $createdString yeni, $updatedString değişti';
  }

  @override
  String get gitSync => 'Git eşitleme';

  @override
  String get gitSyncOff => 'Kapalı';

  @override
  String get gitSyncHelp =>
      'Casama\'daki değişiklikler depoya işlenir ve depoya yapılan göndermeler kontrol edildikten sonra Casama\'yı günceller. Bir dosya her iki yerde de değiştiyse Casama kendi sürümünü korur ve bir çekme isteği açar. api.github.com için izin verilen bir GITHUB_TOKEN gizli anahtarı gerekir.';

  @override
  String get gitSyncNeedsToken => 'GITHUB_TOKEN gizli anahtarı gerekiyor';

  @override
  String gitSyncedWhen(String when) {
    return 'Son eşitleme: $when';
  }

  @override
  String get gitSyncPr => 'Sizi bekleyen çekme isteği';

  @override
  String get syncNow => 'Şimdi eşitle';

  @override
  String get syncQueued => 'Bir dakika içinde eşitlenecek';

  @override
  String get gitBranch => 'Dal';

  @override
  String get gitFolder => 'Depodaki klasör (isteğe bağlı)';

  @override
  String get gitSyncOn => 'Eşitleme açık';

  @override
  String get gitSyncRemove => 'Eşitlemeyi durdur';

  @override
  String get gitWebhookTitle => 'Bu webhook\'u depoya ekleyin';

  @override
  String get gitWebhookHelp =>
      'Deponun ayarlarında, bu adres ve gizli anahtarla push olayları için bir webhook ekleyin (içerik türü application/json). Gizli anahtar yalnızca şimdi gösterilir.';

  @override
  String get gitWebhookUrl => 'Yük URL\'si';

  @override
  String get gitWebhookSecret => 'Gizli anahtar';

  @override
  String get knowledge => 'Bilgi';

  @override
  String get knowledgeRow => 'Arayabileceği ve alıntılayabileceği belgeler';

  @override
  String get noKnowledge => 'Henüz bilgi yok';

  @override
  String get knowledgeHelp =>
      'Dosyalar, bir web sitesi veya bir GitHub deposu verin. İlgili olduğunda bunlarda arama yapar ve yanıtın hangi belgeden geldiğini size söyler.';

  @override
  String get addKnowledge => 'Bilgi ekle';

  @override
  String get addKnowledgeHelp =>
      'PDF, Word, Markdown, HTML, CSV veya metin dosyaları; bir web sitesi (robots.txt dosyasına uyarak tek bir alan adı); ya da bir deponun belgeleri. Web siteleri ve depolar her gün yenilenir.';

  @override
  String get knowledgeFiles => 'Dosyalar';

  @override
  String get knowledgeWebsite => 'Web sitesi';

  @override
  String get knowledgePickFiles => 'Dosyaları seç';

  @override
  String get knowledgeWebsiteUrl => 'Web sitesi adresi';

  @override
  String get knowledgeRepoUrl => 'GitHub bağlantısı';

  @override
  String get knowledgeShareAll => 'Çalışma alanındaki her botla paylaş';

  @override
  String get knowledgeShared => 'Tüm çalışma alanı';

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
      other: '$docsString belge',
      one: '1 belge',
    );
    return '$_temp0, $chunksString pasaj';
  }

  @override
  String get knowledgeError => 'Okunamadı';

  @override
  String get knowledgeSyncing => 'Okunuyor…';

  @override
  String get knowledgePending => 'Okunmayı bekliyor';

  @override
  String get add => 'Ekle';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot bir beceri öneriyor: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot, $name becerisini geliştirmeyi öneriyor';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Kullandıkları: $tools';
  }

  @override
  String get saveSkill => 'Beceriyi kaydet';

  @override
  String get applyEdit => 'Değişikliği uygula';

  @override
  String skillSaved(String name) {
    return '$name kaydedildi';
  }

  @override
  String skillUpdated(String name) {
    return '$name güncellendi';
  }

  @override
  String get skillStats => 'Durumu';

  @override
  String get skillNotUsedYet => 'Henüz kullanılmadı';

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

    return '$usesString kez kullanıldı · %$rateString başarılı · $failuresString başarısız · $correctionsString düzeltildi';
  }

  @override
  String skillLastFailure(String date) {
    return 'Son sorun: $date';
  }

  @override
  String get skillHistory => 'Önceki sürümler';

  @override
  String get replays => 'Kayıtlı tekrarlar';

  @override
  String get replaysRow => 'Düşünmeden çalıştırdığı kayıtlı adımlar';

  @override
  String get noReplays => 'Henüz kayıtlı tekrar yok';

  @override
  String get replaysHelp =>
      'Kayıtlı tekrar, botun olduğu gibi çalıştırdığı kayıtlı bir tarayıcı veya masaüstü adımları dizisidir; daha hızlı ve daha ucuzdur. Bir adım artık çalışmazsa bot oradan devralır ve kayıtlı tekrarı güncelleyebilir. Görev öğretme kaydından bir tane kaydedin veya bottan az önce yaptığını kaydetmesini isteyin.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString adım',
      one: '1 adım',
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
      other: '$runsString kez çalıştırıldı',
      one: '1 kez çalıştırıldı',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '$failuresString kez yardım gerekti',
      one: '1 kez yardım gerekti',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return '$name çalıştır';
  }

  @override
  String get runReplayHelp =>
      'Doldurduğu değerleri kontrol edin, ardından çalıştırın.';

  @override
  String get run => 'Çalıştır';

  @override
  String get saveAsReplay => 'Kayıtlı tekrar olarak da kaydet';

  @override
  String replaySaved(String name) {
    return '$name kayıtlı tekrarı kaydedildi';
  }

  @override
  String get passwordManagers => 'Parola yöneticileri';

  @override
  String get passwordManagersRow =>
      'Botlar için 1Password veya Bitwarden giriş bilgileri';

  @override
  String get noPasswordManagers => 'Bağlı parola yöneticisi yok';

  @override
  String get passwordManagersHelp =>
      'Botlar seçtiğiniz kasalardaki giriş bilgileriyle oturum açabilir. Parolayı asla görmezler: tarayıcıya yalnızca o giriş bilgisine ait sitelerde doldurulur.';

  @override
  String get connectPasswordManager => 'Parola yöneticisi bağla';

  @override
  String get pmWorkspace => 'Tüm çalışma alanı';

  @override
  String get pmJustMe => 'Yalnızca ben';

  @override
  String get pmNoVaults => 'Henüz kasa seçilmedi';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kasa',
      one: '1 kasa',
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
      other: '$countString giriş',
      one: '1 giriş',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Hizmet hesabının tokenı ile bir 1Password Connect sunucusu kullanır.';

  @override
  String get pmBitwardenHelp =>
      'Kuruluşunuzun koleksiyonları için Bitwarden\'ın Vault Management API\'sini (bw serve) kullanır.';

  @override
  String get pmConnectUrl => 'Connect sunucu adresi';

  @override
  String get pmConnectToken => 'Connect tokenı';

  @override
  String get pmBwUrl => 'bw serve adresi';

  @override
  String get pmBwToken => 'Erişim tokenı (isteğe bağlı)';

  @override
  String get pmForWorkspace => 'Tüm çalışma alanı için';

  @override
  String get pmChooseVaults => 'Botların kullanabileceği kasalar';

  @override
  String get pmChooseVaultsHelp =>
      'Yalnızca işaretlediğiniz kasa veya koleksiyonlardaki giriş bilgileri botlara sunulur.';

  @override
  String get welcomeGettingReady => 'Alanınız hazırlanıyor…';

  @override
  String get setUpManually => 'Elle kur';

  @override
  String get tryAgain => 'Yeniden dene';

  @override
  String get inviteLinkCopied =>
      'Davet bağlantısı kopyalandı. Birlikte çalıştığınız kişilere gönderin.';

  @override
  String get inviteFriends => 'Arkadaş davet et';

  @override
  String inviteFriendsRow(String amount) {
    return 'Katılan her arkadaşınız için $amount ücretsiz kullanım kazanın';
  }

  @override
  String get inviteFriendsRowPlain => 'Casama\'yı arkadaşlarınızla paylaşın';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Casama hediye edin, $amount kazanın';
  }

  @override
  String get inviteFriendsHeadlinePlain =>
      'Casama\'yı arkadaşlarınızla paylaşın';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Bağlantınızı bir arkadaşınıza gönderin. Kaydolup ilk sohbetini tamamladığında $amount ücretsiz kullanım kazanırsınız.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Bağlantınızı bir arkadaşınıza gönderin. Hemen kaydolabilirler.';

  @override
  String get inviteFriendsYourCode => 'Davet kodunuz. Kopyalamak için dokunun.';

  @override
  String get inviteFriendsShare => 'Bağlantıyı paylaş';

  @override
  String get inviteFriendsCopyLink => 'Bağlantıyı kopyala';

  @override
  String get inviteFriendsCopied => 'Kopyalandı. Bir arkadaşınıza gönderin.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Yapay zeka ekip arkadaşlarının senin için işleri hallettiği Casama\'da bana katıl: $link (davet kodu $code)';
  }

  @override
  String get inviteFriendsProgress => 'Davetleriniz';

  @override
  String get inviteFriendsJoined => 'Katılan arkadaşlar';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kişi henüz ilk sohbetini tamamlamadı',
      one: '1 kişi henüz ilk sohbetini tamamlamadı',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Kazanılan ücretsiz kullanım';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString arkadaş daha size ödül kazandırabilir',
      one: '1 arkadaş daha size ödül kazandırabilir',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'Davetlerin verebileceği en yüksek ödülü kazandınız. Teşekkürler!';

  @override
  String get inviteFriendsHow => 'Nasıl çalışır';

  @override
  String get inviteFriendsStep1 =>
      'Bağlantınızı veya kodunuzu bir arkadaşınızla paylaşın';

  @override
  String get inviteFriendsStep2 =>
      'Bir hafta içinde kaydolup kodunuzu girerler';

  @override
  String inviteFriendsStep3(String amount) {
    return 'İlk sohbetlerini tamamladıklarında $amount ücretsiz kullanım kazanırsınız';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'Kendi yapay zeka ekip arkadaşlarıyla yola koyulurlar';

  @override
  String get inviteFriendsUnavailable => 'Bu sunucuda davetler kullanılamıyor.';

  @override
  String get referralHaveCode => 'Arkadaşınızın kodu var mı?';

  @override
  String get referralCodeHint => 'Davet kodu';

  @override
  String get referralUse => 'Kullan';

  @override
  String get referralRedeemed => 'Davet kodu eklendi. Casama\'ya hoş geldiniz!';

  @override
  String referralRedeemedFrom(String name) {
    return '$name tarafından gönderilen davetle katıldınız. Casama\'ya hoş geldiniz!';
  }

  @override
  String referralJoinedThrough(String name) {
    return '$name tarafından gönderilen davetle katıldınız.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'Bir arkadaşınızın davetiyle katıldınız.';

  @override
  String referralInvitedBy(String name) {
    return '$name sizi davet etti';
  }

  @override
  String get referralInvitedByFriend => 'Bir arkadaşınız sizi davet etti';

  @override
  String get referralWelcomeTitle => 'Casama\'ya hoş geldiniz';

  @override
  String get referralWelcomeHelp =>
      'Kendi bilgisayarlarında sizin için çalışan yapay zeka ekip arkadaşları. Arkadaşınızın ödülü alabilmesi için daveti kabul edin.';

  @override
  String get referralAccept => 'Daveti kabul et';

  @override
  String get referralGetStarted => 'Başla';

  @override
  String get referralInvalid => 'Bu davet çalışmıyor';

  @override
  String get referralInvalidHelp =>
      'Kod yanlış yazılmış olabilir. Yine de kaydolup Casama\'yı kullanabilirsiniz.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return '$amount verin, $amount alın';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Bağlantınızı bir arkadaşınıza gönderin. Kodunuzla kaydolup ilk sohbetini tamamladığında her ikiniz de $amount ücretsiz kullanım kazanırsınız.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Bağlantınızı bir arkadaşınıza gönderin. Kodunuzla kaydolup ilk sohbetini tamamladığında ikiniz de ücretsiz kullanım kazanırsınız: siz $reward, arkadaşınız $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'İlk sohbetlerini tamamladıklarında her ikiniz de $amount ücretsiz kullanım kazanırsınız';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'İlk sohbetlerini tamamladıklarında ikiniz de ücretsiz kullanım kazanırsınız: siz $reward, arkadaşınız $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Yapay zeka ekip arkadaşlarının senin için işleri hallettiği Casama\'da bana katıl. Davet kodum $code ile kaydol ve $amount ücretsiz kullanım kazan: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Kaydolduktan sonraki bir hafta içinde girin ve ilk sohbetinizden sonra $amount ücretsiz kullanım kazanın.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return '$amount hoş geldin bonusunuz çalışma alanınızda.';
  }

  @override
  String referralWelcomePending(String amount) {
    return '$amount hoş geldin bonusunuz ilk sohbetinizden sonra gelir.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'Kendi bilgisayarlarında sizin için çalışan yapay zeka ekip arkadaşları. Daveti kabul edin ve ilk sohbetinizden sonra $amount ücretsiz kullanım kazanın.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return 'Aramıza katıldınız! $amount hoş geldin bonusunuz ilk sohbetinizden sonra gelir.';
  }

  @override
  String get connectManaged => 'Composio üzerinden giriş yap';

  @override
  String connectManagedHelp(String app) {
    return 'Casama, giriş işlemini yöneten Composio üzerinden $app bağlantısını kurar. İstediğiniz zaman bağlantıyı kesebilirsiniz.';
  }

  @override
  String get sharing => 'Paylaşım';

  @override
  String get sharingRow =>
      'Kimler sohbet edebilir, düzenleyebilir veya yönetebilir';

  @override
  String get sharingHelp =>
      'Siz özel yapmadığınız sürece çalışma alanındaki herkes bir botla sohbet edebilir. Eklediğiniz kişiler sohbet edebilir, ayarlarını düzenleyebilir veya kimlerin erişebileceğini de yönetebilir. Biri için çalışan bir bot yalnızca o kişinin kendi bilgisayarını ve bağlantılarını kullanır.';

  @override
  String get sharingPrivate => 'Özel';

  @override
  String get sharingPrivateOn => 'Yalnızca siz ve aşağıdaki kişiler görebilir';

  @override
  String get sharingPrivateOff =>
      'Çalışma alanındaki herkes onunla sohbet edebilir';

  @override
  String get sharingPeople => 'Kişiler';

  @override
  String get sharingOnlyCreator => 'Yalnızca oluşturan';

  @override
  String get sharingEveryoneChats =>
      'Herkes sohbet edebilir; düzenlemesi gereken kişileri ekleyin';

  @override
  String sharingEveryoneRole(String role) {
    return '$role olan herkes';
  }

  @override
  String get accessChat => 'Sohbet edebilir';

  @override
  String get accessEdit => 'Düzenleyebilir';

  @override
  String get accessAdmin => 'Yönetebilir';

  @override
  String get sharingSaved => 'Paylaşım kaydedildi';

  @override
  String get triggerCalendar => 'Toplantılar';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Eşleşen toplantılar civarında ($minutesString dk.)',
      zero: 'Eşleşen toplantıların başlangıcında',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Önce Google Takvim veya Outlook bağlayın.';

  @override
  String get calendarTriggerCalendar => 'Takvim';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString dk.',
      zero: 'Başlangıçta',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests =>
      'Yalnızca şirketim dışından kişilerle olan toplantılar';

  @override
  String get calendarVideoLink => 'Yalnızca video bağlantısı olan toplantılar';

  @override
  String get calendarTitleMatch =>
      'Yalnızca şunları içeren başlıklar (isteğe bağlı)';

  @override
  String get fullAccess => 'Tam erişim';

  @override
  String get fullAccessHelp =>
      'Botlar kendi bilgisayarlarında ve Mac\'inizde önce sormadan hareket eder. Ödemeler, parola değişiklikleri ve kendi \"sor\" kurallarınız yine sorar.';

  @override
  String get fullAccessConfirmTitle => 'Tam erişim açılsın mı?';

  @override
  String get fullAccessConfirmBody =>
      'Bu çalışma alanındaki her bot, önce size sormadan mesaj gönderir, dosya siler, Mac\'inizde komut çalıştırır ve bağlantı ekler. Ödemeler ve parola değişiklikleri yine sorar.';

  @override
  String get fullAccessTurnOn => 'Aç';

  @override
  String get botToBot => 'Botlar birbirleriyle konuşabilir';

  @override
  String get botToBotHelp =>
      'Botlar birbirini @etiketleyebilir, mesajlaşabilir ve birbirine iş devredebilir.';

  @override
  String get capMessages => 'Mesajlar (iMessage)';

  @override
  String get chatApps => 'Sohbet uygulamaları';

  @override
  String get chatAppsRow =>
      'Telegram, e-posta, SMS, Slack, WhatsApp ve daha fazlası';

  @override
  String get botEmail => 'E-posta adresi';

  @override
  String get botEmailRow => 'Bu bota kendi adresini ver';

  @override
  String botEmailClaimTitle(String name) {
    return '$name botuna e-posta adresi ver';
  }

  @override
  String get botEmailClaimHelp =>
      'İnsanlar ona yazabilir, o da e-posta ile yanıt verir. Ona her şeyi iletin: faturalar, rezervasyonlar, bültenler.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'Ad daha sonra değiştirilemez.';

  @override
  String get botEmailNameLabel => 'Ad';

  @override
  String botEmailWillBe(String address) {
    return 'Botunuzun adresi: $address.';
  }

  @override
  String get botEmailClaim => 'Adres oluştur';

  @override
  String get botEmailTaken => 'Bu ad alınmış. Bunlardan birini deneyin:';

  @override
  String get botEmailClaimed => 'Botunuzun bir adresi var';

  @override
  String get botEmailClaimedHelp =>
      'Size bir hoş geldin e-postası gönderiliyor. Yanıtlayın veya herhangi bir şeyi iletin.';

  @override
  String get botEmailCopy => 'Kopyala';

  @override
  String get botEmailCopied => 'Kopyalandı';

  @override
  String get botEmailContacts => 'Kişilere ekle';

  @override
  String botEmailWrite(String name) {
    return '$name botuna yaz';
  }

  @override
  String get botEmailPaused =>
      'Duraklatıldı. E-postaları almaya ve saklamaya devam eder, ancak hiçbirine yanıt vermez.';

  @override
  String get botEmailPause => 'Duraklat';

  @override
  String get botEmailResume => 'Sürdür';

  @override
  String get botEmailSenders => 'İzin verilen göndericiler';

  @override
  String get botEmailSendersHelp =>
      'Yalnızca bu kişiler yanıt alır. Yabancıların e-postaları saklanır ve hiçbir şey başlatmaz.';

  @override
  String get botEmailEditSenders => 'Sohbet uygulamalarında düzenle';

  @override
  String get botEmailMove => 'Başka bir bota taşı';

  @override
  String get botEmailMoveHelp => 'Adres ve e-postaları diğer bota taşınır.';

  @override
  String get botEmailRelease => 'Adresi serbest bırak';

  @override
  String get botEmailReleaseHelp =>
      'Alımı kalıcı olarak durdurur. Bu ad bir daha kimseye verilmez.';

  @override
  String botEmailReleaseConfirm(String address) {
    return '$address serbest bırakılsın mı? Hemen alımı durdurur ve bu ad bir daha kimseye verilmez.';
  }

  @override
  String get botEmailReleaseNow => 'Serbest bırak';

  @override
  String get botEmailMoved => 'Taşındı';

  @override
  String botEmailNewBotRow(String name) {
    return '$name botuna e-posta adresi ver';
  }

  @override
  String get botEmailInbox => 'Gelen Kutusu';

  @override
  String get botEmailInboxRow => 'Saklanan postalar, yabancılar ve dosyalar';

  @override
  String get botEmailEmpty => 'Henüz e-posta yok';

  @override
  String get botEmailStrangers => 'Yabancılar';

  @override
  String get botEmailAll => 'Tüm postalar';

  @override
  String get botEmailUnconfirmed => 'Bu gönderici doğrulanamadı';

  @override
  String get botEmailAllow => 'İzin ver';

  @override
  String get botEmailBlock => 'Engelle';

  @override
  String get botEmailBlocked =>
      'Engellendi. Buradan gelen yeni postalar reddedilir.';

  @override
  String get botEmailUnblock => 'Engeli kaldır';

  @override
  String get botEmailOpenChat => 'Sohbeti aç';

  @override
  String get botEmailFiles => 'Dosyalar';

  @override
  String get botEmailNewSenders => 'Yeni göndericileri bana bildir';

  @override
  String get botEmailNewSendersHelp =>
      'Günde en fazla bir kez. Siz açmadığınız sürece kapalıdır.';

  @override
  String get botEmailTryTitle => 'Denenecek şeyler';

  @override
  String get botEmailTryForward => 'Bir fatura veya rezervasyon ilet';

  @override
  String get botEmailTryForwardHelp =>
      'Yukarıdaki adrese herhangi bir şey iletin. Okur ve buradan yanıtlar.';

  @override
  String get botEmailTryReceipts => 'Makbuzlarımı sakla';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return '$address adresine gönderilen postaları dosyalayan bir rutin oluşturur.';
  }

  @override
  String get botEmailTryDigest => 'Haftada bir özet';

  @override
  String botEmailTryDigestHelp(String address) {
    return '$address adresindeki bültenleri haftalık bir özette toplayan bir rutin oluşturur.';
  }

  @override
  String get botEmailTryCopied => 'Adres kopyalandı';

  @override
  String get botEmailTryMade => 'Rutin oluşturuldu';

  @override
  String get botEmailReceiptsName => 'Makbuzlarımı sakla';

  @override
  String get botEmailReceiptsInstructions =>
      'Bu postadaki makbuzu dosyala: ne içindi, ne kadardı ve ne zaman. Yanlış görünen bir şey olmadığı sürece bir şey söyleme.';

  @override
  String get botEmailDigestName => 'Haftalık bülten özeti';

  @override
  String get botEmailDigestInstructions =>
      'Bu haftanın bültenlerini topla ve tek bir kısa özet gönder: bilmeye değer başlıklar, başka bir şey değil.';

  @override
  String get botEmailTriggerTag => 'Adres etiketi';

  @override
  String get botEmailTriggerTagHelp =>
      'Yalnızca bu etikete gelen postalar, örneğin ada+shop@ için shop. Yalnızca e-posta adresleri.';

  @override
  String get botEmailTriggerUnconfirmed =>
      'Doğrulanmamış göndericileri de dinle';

  @override
  String get botEmailTriggerAutomatic => 'Otomatik postaları da dinle';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used / $limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used kullanıldı';
  }

  @override
  String get botEmailStorageFull =>
      'Posta kutusu dolu, bu yüzden yeni postalar reddediliyor. Yer açmak için eski postaları silin.';

  @override
  String get botEmailSelect => 'Seç';

  @override
  String get botEmailSelectDone => 'Bitti';

  @override
  String get botEmailDelete => 'Sil';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n postayı sil',
      one: '1 postayı sil',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n posta silinsin mi?',
      one: 'Bu posta silinsin mi?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'Metinleri ve dosyaları kalıcı olarak silinir. Sohbette zaten bulunan kopyalar kalır.';

  @override
  String get botEmailDeleteOlder => 'Eski postaları sil';

  @override
  String get botEmailOlder30Days => '30 günden eski';

  @override
  String get botEmailOlder6Months => '6 aydan eski';

  @override
  String get botEmailOlderYear => '1 yıldan eski';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': '30 günden eski tüm postalar silinsin mi?',
      'months6': '6 aydan eski tüm postalar silinsin mi?',
      'other': '1 yıldan eski tüm postalar silinsin mi?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n posta silindi',
      one: '1 posta silindi',
      zero: 'Silinecek bir şey yok',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n bot e-posta adresi',
      one: '1 bot e-posta adresi',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew => 'Botlar yeni kişilere e-posta ile yazar';

  @override
  String get botEmailPerkRepliesOnly => 'Botlar size e-posta ile yanıt verir';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Bir sohbet uygulaması bağla';

  @override
  String get chatAppsEmpty => 'Henüz sohbet uygulaması yok';

  @override
  String get chatAppsHelp =>
      'İnsanların bu bota Telegram, e-posta, SMS, Slack, WhatsApp, Messenger, Feishu veya iMessage üzerinden mesaj göndermesine izin verin. Yalnızca izin verilenler listesindeki kişilere yanıt verir; diğer herkes burada kaydedilir.';

  @override
  String get chatAppsAddHelp =>
      'Uygulamanın geliştirici ayarlarındaki giriş bilgilerini yapıştırın. Şifrelenerek saklanır ve bir daha gösterilmez.';

  @override
  String get chatAppsKind => 'Uygulama';

  @override
  String get chatAppsSenders => 'İzin verilen göndericiler';

  @override
  String get chatAppsSendersHelp =>
      'Satır başına bir adet: e-posta adresleri (veya *@company.com), telefon numaraları ya da kullanıcı kimlikleri. Bir kimlikten emin değil misiniz? Boş bırakın, bota mesaj atın ve kimliği Etkinlik\'ten kopyalayın.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Önce Mac\'inizdeki masaüstü uygulamasında Mesajlar\'a izin verilmiş şekilde \"Botlar için bu bilgisayarı kullan\" ayarını açın.';

  @override
  String chatAppsConnected(String name) {
    return '$name bağlandı';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram zaten buraya mesaj gönderiyor. Denemek için botunuza mesaj atın.';

  @override
  String get chatAppsPasteUrl =>
      'Bu adresi uygulamanın webhook ayarlarına yapıştırın.';

  @override
  String get chatAppsWebhookUrl => 'Webhook adresi';

  @override
  String get chatAppsVerifyToken => 'Doğrulama tokenı';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString izin verilen gönderici',
      one: '1 izin verilen gönderici',
      zero: 'Kimseye izin verilmedi',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Etkinlik';

  @override
  String get chatAppsNoActivity => 'Henüz mesaj yok.';

  @override
  String get chatAppsIgnored => 'Yok sayıldı: izin verilen listede değil';

  @override
  String get chatAppsAllow => 'İzin ver';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender artık bu bota mesaj gönderebilir';
  }

  @override
  String get chatAppsRoutine => 'Bir rutin başlattı';

  @override
  String get chatAppsFailed => 'Gönderilemedi';

  @override
  String get chatAppsSent => 'Gönderildi';

  @override
  String get chatAppsAnswered => 'Yanıtlandı';

  @override
  String get chatAppsRemove => 'Bağlantıyı kes';

  @override
  String get chBotToken => 'Bot tokenı';

  @override
  String get chAddress => 'E-posta adresi';

  @override
  String get chApiKey => 'API anahtarı';

  @override
  String get chSigningSecret => 'İmzalama gizli anahtarı';

  @override
  String get chPhoneNumber => 'Telefon numarası';

  @override
  String get chAccountSid => 'Hesap SID\'si';

  @override
  String get chAuthToken => 'Kimlik doğrulama tokenı';

  @override
  String get chPhoneNumberId => 'Telefon numarası kimliği';

  @override
  String get chAccessToken => 'Erişim tokenı';

  @override
  String get chAppSecret => 'Uygulama gizli anahtarı';

  @override
  String get chPageToken => 'Sayfa erişim tokenı';

  @override
  String get chAppId => 'Uygulama kimliği';

  @override
  String get chEncryptKey => 'Şifreleme anahtarı';

  @override
  String get chVerificationToken => 'Doğrulama tokenı';

  @override
  String get chPublicKey => 'Açık anahtar';

  @override
  String get chTrackerUser => 'Botun izleyicideki kullanıcı kimliği';

  @override
  String get chSiteUrl => 'Site adresi (https://…)';

  @override
  String get chAccountEmail => 'Hesap e-postası';

  @override
  String get routineMessage => 'Eşleşen bir mesaj geldiğinde';

  @override
  String get triggerMessage => 'Mesajlar';

  @override
  String get messageTriggerHelp =>
      'Bu bota gelen bir e-posta veya sohbet mesajı eşleştiğinde başlar. Önce uygulamayı Sohbet uygulamaları altından bağlayın.';

  @override
  String get messageTriggerAnyApp => 'Herhangi bir uygulama';

  @override
  String get messageTriggerSender =>
      'Kimden (adres, numara veya *@company.com)';

  @override
  String get messageTriggerSubject => 'Konu şunu içerir:';

  @override
  String get messageTriggerWords => 'Mesaj şunu içerir:';

  @override
  String callIncoming(String name) {
    return '$name arıyor';
  }

  @override
  String get callAnswer => 'Yanıtla';

  @override
  String get callDecline => 'Reddet';

  @override
  String get callFullScreenTitle => 'Kilit ekranında sesli aramalar';

  @override
  String get callFullScreenOff =>
      'Kapalı: botun araması yalnızca bildirim olarak görünür. Aramaların tam ekranda çalması için dokunun.';

  @override
  String get encryption => 'İçeriği şifrele';

  @override
  String get encryptionHelp =>
      'Mesajlar, hafıza kayıtları, talepler, sayfalar ve bilgi saklanmadan önce bu çalışma alanının kendi anahtarıyla şifrelenir. Arama bundan sonra şifrelenmiş metindeki tam kelimeleri değil, başlıkları ve anlamı eşleştirir.';

  @override
  String get encryptionOff => 'Kapalı';

  @override
  String get encryptionUnavailable =>
      'Kullanılamıyor: bu sunucuda kurulu bir şifreleme anahtarı yok';

  @override
  String get encryptionEncrypting =>
      'Açılıyor: halihazırda saklananlar şifreleniyor';

  @override
  String get encryptionOnServer => 'Açık, sunucunun anahtarıyla';

  @override
  String get encryptionOnKms => 'Açık, AWS KMS ile';

  @override
  String get encryptionDecrypting =>
      'Kapatılıyor: saklananların şifresi çözülüyor';

  @override
  String get encryptionConfirm =>
      'İçerik bu çalışma alanının anahtarıyla şifrelenecek. Çalışma alanı silinirse anahtarı yok edilir ve içerik kurtarılamaz. Tam kelime araması şifrelenmiş metinde eşleşmeyi durdurur.';

  @override
  String get encryptionTurnOn => 'Aç';

  @override
  String get encryptionRotate => 'Anahtarı döndür';

  @override
  String get encryptionKeyManaged =>
      'Casama bu çalışma alanının anahtarını sizin için oluşturup sunucunun kendi anahtarıyla sarmalanmış olarak saklar. Kaydedilecek veya kopyalanacak bir şey yoktur.';

  @override
  String get encryptionRotateTitle => 'Anahtar döndürülsün mü?';

  @override
  String get encryptionRotateBody =>
      'Çalışma alanı anahtarı, sunucunun geçerli anahtarıyla yeniden sarmalanır. İçeriğiniz okunabilir kalır ve hiçbir şeyin yeniden şifrelenmesi gerekmez. Bunu sunucunun anahtarını değiştirdikten sonra veya düzenli aralıklarla yapın.';

  @override
  String get encryptionRotateHelp =>
      'Çalışma alanı anahtarını sunucunun geçerli anahtarıyla yeniden sarmalar';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Son yenileme: $when';
  }

  @override
  String get memoryBackend => 'Hafızanın saklandığı yer';

  @override
  String get memoryBuiltIn => 'Yerleşik';

  @override
  String get memoryBackendHelp => 'Botların uzun süreli hafızası';

  @override
  String get memoryBackendSheetHelp =>
      'Botlarınızın hafızasını kendi hesabınızla Honcho veya Supermemory\'de saklayın. Hafıza ekranı, dışa aktarmalar ve silme aynı şekilde çalışır.';

  @override
  String get memoryHonchoWorkspace => 'Honcho çalışma alanı';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Bu Casama çalışma alanı için oluşturulmuş olanı kullanmak için boş bırakın';

  @override
  String get memoryBaseUrl => 'Sunucu adresi (isteğe bağlı)';

  @override
  String get memoryBaseUrlHelp =>
      'Yalnızca kendi sunucunuzda barındırılan Honcho veya Supermemory için';

  @override
  String get memoryCopyExisting => 'Mevcut anıları oraya kopyala';

  @override
  String get memoryUseBuiltIn => 'Tekrar yerleşik hafızayı kullan';

  @override
  String get providerHintData => 'ücretli veri (yerler, e-postalar, SEO)';

  @override
  String get kindA2a => 'Yapay zeka ajanı (A2A)';

  @override
  String get a2aAgentUrl => 'Ajan adresi veya ajan kartı URL\'si';

  @override
  String get a2aAgentToken => 'Erişim tokenı (isteğe bağlı)';

  @override
  String get a2a => 'Ajandan Ajana (A2A)';

  @override
  String get a2aHelp => 'Dış ajanlar yayınladığınız botlara görev verebilir.';

  @override
  String get chromeExtensionSwitch => 'Chrome için Casama';

  @override
  String get chromeExtensionSwitchHelp =>
      'Üyeler tarayıcı uzantısını bu çalışma alanıyla kullanabilir.';

  @override
  String get chromeActSwitch => 'Üyelerin tarayıcılarında botlar';

  @override
  String get chromeActSwitchHelp =>
      'Üyeler botların kendi Chrome\'larında, durdurabilecekleri bir sekme grubu içinde sayfalar açmasına ve işlem yapmasına izin verebilir.';

  @override
  String get a2aPublish => 'A2A ajanı olarak yayınla';

  @override
  String get a2aPublishHelp =>
      'Çalışma alanı API anahtarına sahip dış ajanlar bu bota görev verebilir.';

  @override
  String get a2aWorkspaceOff =>
      'Önce çalışma alanı ayarlarından ajandan ajana iletişimi açın.';

  @override
  String get a2aCardUrl => 'Ajan kartı';

  @override
  String get phoneCalls => 'Telefon aramaları';

  @override
  String get phoneCallsHelp =>
      'Botların Twilio hesabınız üzerinden sizin adınıza işletmeleri aramasına izin verin. Her arama, olağan onaylar kapsamında önce onayınızı ister.';

  @override
  String get twilioSid => 'Hesap SID\'si';

  @override
  String get twilioToken => 'Kimlik doğrulama tokenı';

  @override
  String get twilioFrom => 'Aramaların geldiği numara';

  @override
  String get phoneCallsPersonal => 'Kişisel numaraları aramaya izin ver';

  @override
  String get phoneCallsCap => 'Günlük arama sayısı';

  @override
  String get phoneCallsOff => 'Bağlı değil';

  @override
  String get outCall => 'Ara';

  @override
  String get outCallRinging => 'Çalıyor…';

  @override
  String get outCallLive => 'Sesli aramada';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString sn sonra sona erdi';
  }

  @override
  String get outCallEndedByYou => 'Sesli aramayı siz sonlandırdınız';

  @override
  String get outCallTakenOver => 'Sesli aramayı devraldınız';

  @override
  String get outCallFailed => 'Bağlanamadı';

  @override
  String get outCallNothingYet => 'Henüz bir şey söylenmedi.';

  @override
  String get outCallTakeOver => 'Devral';

  @override
  String get outCallEnd => 'Sesli aramayı bitir';

  @override
  String get outCallYourPhone => 'Telefon numaranız';

  @override
  String get outCallYourPhoneHelp =>
      '+905551234567 gibi uluslararası biçimde. Kayıtlı olanı kullanmak için boş bırakın.';

  @override
  String get payments => 'Ödemeler';

  @override
  String get paymentsHelp =>
      'Botların her seferinde onayladığınız tek kullanımlık sanal kartlarla satıcılara ödeme yapmasına izin verin. Kendi Stripe Issuing hesabınızı getirin.';

  @override
  String paymentsOn(String spent, String cap) {
    return 'Bu ay $cap içinden $spent harcandı';
  }

  @override
  String get paymentsSheetHelp =>
      'Her kart gösterilen tutarla sizin tarafınızdan onaylanır, o satıcıda bir saat boyunca bir kez çalışır ve hiçbir zaman menkul kıymetler, kripto, hediye kartları veya transferler için çalışmaz.';

  @override
  String get paymentsStripeKey => 'Stripe gizli anahtarı (Issuing özellikli)';

  @override
  String get paymentsWebhookSecret => 'Webhook imzalama gizli anahtarı';

  @override
  String get paymentsWebhook => 'Buraya bir Stripe webhook\'u yönlendirin';

  @override
  String get paymentsCardholder => 'Kartların üzerindeki ad';

  @override
  String get paymentsAddress => 'Fatura adresi';

  @override
  String get paymentsCity => 'Şehir';

  @override
  String get paymentsState => 'İl veya bölge';

  @override
  String get paymentsZip => 'Posta kodu';

  @override
  String get paymentsCountry => 'Ülke (2 harf)';

  @override
  String get paymentsCap => 'Aylık çalışma alanı sınırı (USD)';

  @override
  String get paymentsBotCap => 'Bot başına aylık sınır (USD)';

  @override
  String get links => 'Bağlı botlar';

  @override
  String get linksRow => 'Güvenilen bir kişinin botuyla bağlantı kur';

  @override
  String get linksHelp =>
      'Botunuz, bağlantılı bir kişinin botundan akşam yemeği saati gibi şeyleri isteyebilir. Her bot kendi sahibinin kurallarına göre yanıt verir ve yalnızca gerekeni paylaşır; ikiniz de her görüşmeyi görürsünüz.';

  @override
  String get linksEmpty => 'Henüz bağlı bot yok';

  @override
  String get linksInvite => 'Bir kişiyi davet et';

  @override
  String get linksContactName => 'Kişinin adı';

  @override
  String get linksInviteReady => 'Bu daveti gönder';

  @override
  String get linksInviteHelp =>
      'Kişinize gönderin. Casama\'da botlarından biriyle kabul ederler. 7 gün boyunca bir kez çalışır.';

  @override
  String get linksAccept => 'Daveti kabul et';

  @override
  String get linksAcceptHelp => 'Kişinizin size gönderdiği daveti yapıştırın.';

  @override
  String get linksInviteText => 'Davet';

  @override
  String linksActive(String bot) {
    return '$bot ile bağlantılı';
  }

  @override
  String get linksPending => 'Kişinizin kabul etmesi bekleniyor';

  @override
  String get linksRevoked => 'Bağlantı kaldırıldı';

  @override
  String get linksExchanges => 'Görüşmeler';

  @override
  String get linksNoExchanges => 'Henüz bir şey sorulmadı.';

  @override
  String get linksNoAnswer => 'Yanıt yok';

  @override
  String get linksWorking => 'Çalışıyor…';

  @override
  String get linksRevoke => 'Bağlantıyı kaldır';

  @override
  String get wakeWord => 'Uyandırma kelimesi';

  @override
  String get wakeWordRow =>
      'Bir botla sesli arama başlatmak için bir ifade söyleyin';

  @override
  String wakeWordOnRow(String phrase) {
    return '“$phrase” ifadesi dinleniyor';
  }

  @override
  String get wakeWordHelp =>
      'Casama açıkken bu cihaz ifadenizi dinler ve seçtiğiniz botla canlı bir sesli arama başlatır.';

  @override
  String get wakeWordListen => 'Uyandırma kelimesini dinle';

  @override
  String get wakeWordPhrase => 'İfade';

  @override
  String get wakeWordPhraseHelp => '“hey casama” gibi iki veya üç kelime';

  @override
  String get wakeWordBot => 'Bu botu ara';

  @override
  String get wakeWordDownloading => 'Cihaz içi model indiriliyor…';

  @override
  String get wakeWordTest => 'İfadeyi test et';

  @override
  String get wakeWordTesting => 'Dinleniyor… ifadenizi söyleyin';

  @override
  String get wakeWordHeard => 'Duyuldu!';

  @override
  String get wakeWordStopTest => 'Durdur';

  @override
  String get wakeWordPrivacy =>
      'Dinleme bu cihazda açık kaynaklı bir modelle (yaklaşık 18 MB, bir kez indirilir) gerçekleşir. Sesli arama başlayana kadar hiçbir yere hiçbir şey gönderilmez.';

  @override
  String get secretStore => 'Gizli anahtarların saklandığı yer';

  @override
  String get secretStoreVault => 'Bu sunucunun kasası';

  @override
  String get secretStoreHelp =>
      'Botların adlandırılmış gizli anahtarlarını kendi Infisical projenizde saklayın. Casama yalnızca her gizli anahtarın adını ve nerede kullanılabileceğini tutar.';

  @override
  String get secretStoreSite => 'Infisical adresi';

  @override
  String get secretStoreProject => 'Proje kimliği';

  @override
  String get secretStoreEnv => 'Ortam';

  @override
  String get secretStoreClientId => 'Makine kimliği istemci kimliği';

  @override
  String get secretStoreClientSecret => 'İstemci gizli anahtarı';

  @override
  String get secretStoreMove => 'Mevcut gizli anahtarları Infisical\'a taşı';

  @override
  String get secretStoreBack => 'Tekrar bu sunucunun kasasını kullan';

  @override
  String get localServer => 'Casama\'yı bu bilgisayarda çalıştır';

  @override
  String get setupTitleMac => 'Casama\'yı bu Mac\'te kur';

  @override
  String get setupTitle => 'Casama\'yı bu bilgisayarda kur';

  @override
  String get setupEntryMac => 'Bu Mac\'te çalıştır';

  @override
  String get setupEntry => 'Bu bilgisayarda çalıştır';

  @override
  String get setupEntryHelp =>
      'Bu bilgisayarda kendi özel sunucunuz. Kişisel kullanım için ücretsiz.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Sunucu';

  @override
  String get setupStepAccount => 'Hesap';

  @override
  String get setupStepModel => 'Yapay zeka modeli';

  @override
  String get setupStepPhone => 'Telefon';

  @override
  String get setupDockerChecking => 'Docker kontrol ediliyor…';

  @override
  String get setupDockerMissingTitle => 'Önce Docker\'ı yükleyin';

  @override
  String get setupDockerMissingBodyMac =>
      'Casama\'nın sunucusu, onu Mac\'inizin geri kalanından ayrı tutan ücretsiz bir uygulama olan Docker Desktop içinde çalışır.';

  @override
  String get setupDockerMissingBodyLinux =>
      'Casama\'nın sunucusu, onu bilgisayarınızın geri kalanından ayrı tutan Docker içinde çalışır.';

  @override
  String get setupDockerGetMac => 'Docker Desktop\'ı indir';

  @override
  String get setupDockerGetLinux => 'Docker kurulum kılavuzunu aç';

  @override
  String get setupDockerStep1 =>
      'İndirilen dosyayı açın ve Docker\'ı Uygulamalar\'a sürükleyin.';

  @override
  String get setupDockerStep2 => 'Docker\'ı açın ve koşullarını kabul edin.';

  @override
  String get setupDockerStep3 =>
      'Buraya geri dönün. Bu sayfa kendiliğinden devam eder.';

  @override
  String get setupDockerWaiting => 'Docker bekleniyor…';

  @override
  String get setupDockerStoppedTitle => 'Docker\'ın çalışıyor olması gerekiyor';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker yüklü ancak açık değil. Başladıktan sonra (bir dakika sürebilir) bu sayfa kendiliğinden devam eder.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker yüklü ancak çalışmıyor. Bu komutla başlatın, ardından bu sayfa kendiliğinden devam eder.';

  @override
  String get setupDockerOpen => 'Docker\'ı aç';

  @override
  String get setupDockerOpening => 'Docker başlatılıyor…';

  @override
  String get setupDockerPermissionTitle => 'Docker izninize ihtiyaç duyuyor';

  @override
  String get setupDockerPermissionBody =>
      'Docker çalışıyor ancak kullanıcınızın onu kullanma izni yok. Bu komutu çalıştırın, ardından oturumu kapatıp tekrar açın.';

  @override
  String get setupDockerComposeTitle => 'Docker\'da Compose eksik';

  @override
  String get setupDockerComposeBody =>
      'Bu Docker\'da Compose v2 yok. Docker Desktop bunu içerir; Linux\'ta docker-compose-plugin eklenti paketini yükleyin.';

  @override
  String get setupStepSkipped => 'Atlandı';

  @override
  String get setupArtDocker => 'İlk olarak sunucunuzun yaşayacağı kutu.';

  @override
  String get setupArtServer => 'Eviniz kuruluyor. Bu uzun süren bölüm.';

  @override
  String get setupArtAccount => 'Sunucunuz çalışıyor!';

  @override
  String get setupArtModel => 'Şimdi ona bir zihin verin.';

  @override
  String get setupArtPhone => 'Son adım: yanınızda taşıyın.';

  @override
  String get setupDockerSlowTitle => 'Uzun mu sürdü?';

  @override
  String get setupDockerSlowMenuBar =>
      'Menü çubuğundaki balinayı arayın. Hareket etmeyi durdurduğunda Docker hazırdır.';

  @override
  String get setupDockerSlowTerms =>
      'Docker koşullarını kabul etmenizi isteyen bir pencere gösterirse önce onu tamamlayın. Docker\'a giriş yapmak isteğe bağlıdır.';

  @override
  String get setupDockerSlowRestart =>
      'Hâlâ takılı mı? Menüsünden Docker\'dan çıkın, ardından Tekrar kontrol et\'e basın.';

  @override
  String get setupDockerSlowInstalled =>
      'Zaten yüklediniz mi? Kurulumunu yapabilmesi için Docker\'ı Uygulamalar\'dan bir kez açın.';

  @override
  String get setupDockerSlowOther =>
      'Bunun yerine OrbStack veya Colima mı kullanıyorsunuz? Başlatın. Casama, docker info yanıtı veren her Docker ile çalışır.';

  @override
  String get setupDockerSlowTerminal =>
      'Docker\'ın ne dediğini görmek için terminalde docker info çalıştırın.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker şöyle dedi: $detail';
  }

  @override
  String get setupDockerRecheck => 'Tekrar kontrol et';

  @override
  String get setupDockerGuide => 'Sorun giderme kılavuzu';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Yalnızca $gb GB boş disk alanı var. Sunucu yaklaşık $need GB gerektirir.';
  }

  @override
  String get setupServerTitle => 'Sunucunuzu indirin ve başlatın';

  @override
  String get setupServerBody =>
      'İlk seferde 5 ila 10 dakika süren yaklaşık 2,5 GB\'lık bir indirme ve kurulduğunda yaklaşık 10 GB disk alanı. Bilgisayarınızı kullanmaya devam edebilirsiniz.';

  @override
  String setupServerBodySized(String download, String disk) {
    return '$download GB\'lık bir indirme, ardından kurulduğunda yaklaşık $disk GB disk alanı. İlk sefer 5 ila 10 dakika sürer. Bilgisayarınızı kullanmaya devam edebilirsiniz.';
  }

  @override
  String get setupServerBodyNothing =>
      'Gereken her şey bu bilgisayarda zaten var, bu yüzden bir iki dakikada başlar.';

  @override
  String get setupServerStart => 'Başlat';

  @override
  String get setupServerStageDownload => 'Sunucu indiriliyor';

  @override
  String get setupServerStagePrepare => 'Hazırlanıyor';

  @override
  String get setupServerStageParts => 'Parçaları indiriliyor';

  @override
  String setupServerDownloaded(int megabytes) {
    return 'Şu ana kadar $megabytes MB';
  }

  @override
  String get setupServerStagePartsNote => 'En uzun adım';

  @override
  String setupServerPartsCount(int done, int total) {
    return 'Şu ana kadar $done / $total indirildi';
  }

  @override
  String get setupServerStageStart => 'Başlatılıyor';

  @override
  String get setupServerStageWait => 'Yanıt vermesi bekleniyor';

  @override
  String get setupServerKeepOpen =>
      'Bu işlem bitene kadar Casama\'yı açık tutun.';

  @override
  String get setupServerFailed => 'Sunucu başlatılamadı.';

  @override
  String get setupServerConnecting => 'Hazır. Bağlanıyor…';

  @override
  String get setupShowDetails => 'Ayrıntıları göster';

  @override
  String get setupHideDetails => 'Ayrıntıları gizle';

  @override
  String get setupAccountTitle => 'Hesabınızı oluşturun';

  @override
  String get setupAccountBody =>
      'Yalnızca bu bilgisayarda bulunur ve bu sunucunun sahibidir. E-posta gönderilmez.';

  @override
  String get setupAccountName => 'Adınız';

  @override
  String get setupAccountNameMissing => 'Adınızı girin';

  @override
  String get setupAccountCreate => 'Hesap oluştur';

  @override
  String get setupAccountHave => 'Burada zaten bir hesabım var';

  @override
  String get setupAccountNew => 'Bunun yerine yeni bir hesap oluştur';

  @override
  String get setupAccountSignInTitle => 'Sunucunuza giriş yapın';

  @override
  String get setupAccountSignInBody =>
      'Bu sunucuda oluşturduğunuz hesabı kullanın.';

  @override
  String get setupAccountClosed =>
      'Bu sunucunun zaten bir sahibi var. O hesapla giriş yapın.';

  @override
  String get setupAccountPreparing => 'Alanınız hazırlanıyor…';

  @override
  String get setupModelTitle => 'Botlarınıza bir model verin';

  @override
  String get setupModelBody =>
      'Botların düşünmek için bir yapay zeka modeline ihtiyacı vardır. Bir ChatGPT planı ile giriş yapın ya da OpenRouter, Google veya başka bir sağlayıcıdan bir anahtar yapıştırın.';

  @override
  String get setupSkip => 'Şimdilik atla';

  @override
  String get setupPhoneTitle => 'Telefonunuzu bağlayın';

  @override
  String get setupPhoneBody =>
      'Casama Link bu bilgisayara özel bir adres verir; böylece telefonunuz ona her yerden ulaşır. Ücretsiz bir Casama Cloud hesabıyla bir kez onaylarsınız. Sohbetleriniz bu bilgisayarda kalır.';

  @override
  String get setupPhoneTurnOn => 'Bu bilgisayara adres ver';

  @override
  String get setupPhoneScanTitle => 'Bunu telefonunuzun kamerasıyla tarayın';

  @override
  String get setupPhoneScanBody =>
      'Telefonda Casama\'yı açar ve giriş yapmanızı sağlar. Casama henüz telefonda yoksa açılan sayfa nereden indirileceğini gösterir.';

  @override
  String get setupPhoneWaiting => 'Telefonunuz bekleniyor…';

  @override
  String get setupPhoneConnected => 'Telefon bağlandı';

  @override
  String get setupPhoneConnectedBody =>
      'Telefonunuz giriş yaptı. Başka bir cihaz eklemek için yeni bir kod gösterin.';

  @override
  String get setupPhoneOwnerOnly =>
      'Yalnızca bu sunucunun sahibi ona adres verebilir.';

  @override
  String get setupFinish => 'Bitir';

  @override
  String get setupCardTitle => 'Kurulumu tamamla';

  @override
  String get setupCardModel =>
      'Botlarınızın yanıt verebilmesi için bir yapay zeka modeli ekleyin.';

  @override
  String get setupCardPhone => 'Telefonunuzu bu bilgisayara bağlayın.';

  @override
  String get setupCardOpen => 'Kuruluma devam et';

  @override
  String get desktopUsers => 'Aynı anda masaüstü kullanıcıları';

  @override
  String get desktopUsersHelp =>
      'Bu ekip bilgisayarındaki botlar tek bir ekranı paylaşır. Kullanımdayken diğerleri bekler (ve kabuk, dosyalar ve tarayıcıyla çalışmaya devam eder).';

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
      'calendar': '$bot takviminizi kullanmak istiyor',
      'reminders': '$bot anımsatıcılarınızı kullanmak istiyor',
      'contacts': '$bot kişilerinizi kullanmak istiyor',
      'places': '$bot yerlerinizi kullanmak istiyor',
      'photos': '$bot fotoğraflarınızı kullanmak istiyor',
      'health': '$bot sağlık verilerinizi kullanmak istiyor',
      'notifications': '$bot bildirimlerinizi kullanmak istiyor',
      'activity': '$bot bilgisayar etkinliğinizi kullanmak istiyor',
      'browserTab': '$bot geçerli tarayıcı sekmenizi kullanmak istiyor',
      'browserHistory':
          '$bot tarayıcı geçmişinizi ve yer işaretlerinizi kullanmak istiyor',
      'alarm': '$bot alarmlarınızı kullanmak istiyor',
      'home': '$bot Ev aksesuarlarınızı kullanmak istiyor',
      'other': '$bot cihaz verilerinizi kullanmak istiyor',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Yalnızca kendi sohbetlerinizde. İstediğiniz zaman Ayarlar → Cihaz bağlantıları bölümünden durdurabilirsiniz.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Takviminizi kullanmasına izin verildi',
      'reminders': 'Anımsatıcılarınızı kullanmasına izin verildi',
      'contacts': 'Kişilerinizi kullanmasına izin verildi',
      'places': 'Yerlerinizi kullanmasına izin verildi',
      'photos': 'Fotoğraflarınızı kullanmasına izin verildi',
      'health': 'Sağlık verilerinizi kullanmasına izin verildi',
      'notifications': 'Bildirimlerinizi kullanmasına izin verildi',
      'activity': 'Bilgisayar etkinliğinizi kullanmasına izin verildi',
      'browserTab': 'Geçerli tarayıcı sekmenizi kullanmasına izin verildi',
      'browserHistory': 'Tarayıcı geçmişinizi ve yer işaretlerinizi kullanmasına izin verildi',
      'alarm': 'Alarmlarınızı kullanmasına izin verildi',
      'home': 'Ev aksesuarlarınızı kullanmasına izin verildi',
      'other': 'Cihaz verilerinizi kullanmasına izin verildi',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'Paylaşılmadı';

  @override
  String get deviceKindCalendar => 'takvim';

  @override
  String get deviceKindReminders => 'anımsatıcılar';

  @override
  String get deviceKindContacts => 'kişiler';

  @override
  String get deviceKindPlaces => 'yerler';

  @override
  String get deviceKindPhotos => 'fotoğraflar';

  @override
  String get deviceKindHealth => 'sağlık verileri';

  @override
  String get deviceKindNotifications => 'bildirimler';

  @override
  String get deviceKindActivity => 'bilgisayar etkinliği';

  @override
  String get deviceKindBrowserTab => 'geçerli tarayıcı sekmesi';

  @override
  String get deviceKindBrowserHistory => 'tarayıcı geçmişi ve yer işaretleri';

  @override
  String get deviceKindAlarm => 'alarmlar';

  @override
  String get deviceKindHome => 'Ev aksesuarları';

  @override
  String get deviceBrowserAsks => 'Botların tarayıcınıza sorabilecekleri';

  @override
  String get deviceBrowserAsksHelp =>
      'Chrome için Casama bunları canlı olarak yanıtlar ve hiçbir şey saklanmaz. Uzantının ayarlarından açıp kapatabilirsiniz.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return '$bot botunun sormasına izin vermeyi durdur';
  }

  @override
  String get deviceConnections => 'Cihaz bağlantıları';

  @override
  String get deviceConnectionsHelp =>
      'Bu cihazdaki verileri botlarınızla paylaşın. Siz açana kadar her tür kapalıdır ve yalnızca izin verdiğiniz botlar, yalnızca sizin kendi sohbetlerinizde okuyabilir.';

  @override
  String get deviceConnectionsNone =>
      'Bu cihaz henüz veri paylaşamıyor. Telefonunuzda Casama\'yı açın ve paylaşmak istediklerinizi etkinleştirin.';

  @override
  String get deviceKeepFor => 'Saklama süresi';

  @override
  String get deviceKeepLiveOnly => 'Yalnızca canlı';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString gün',
      one: '1 gün',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Yalnızca özel modeller';

  @override
  String get devicePrivateModelHelp =>
      'Yalnızca yerel bir modeldeki botlar okuyabilir';

  @override
  String get deviceNoBots =>
      'Henüz bot yok. Bir bot buna ihtiyaç duyduğunda sorar veya şimdi birine izin verebilirsiniz.';

  @override
  String get deviceAllowBot => 'Bir bota izin ver';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Takviminizi hangi bot okuyabilir?',
      'reminders': 'Anımsatıcılarınızı hangi bot okuyabilir?',
      'contacts': 'Kişilerinizi hangi bot okuyabilir?',
      'places': 'Yerlerinizi hangi bot okuyabilir?',
      'photos': 'Fotoğraflarınızı hangi bot okuyabilir?',
      'health': 'Sağlık verilerinizi hangi bot okuyabilir?',
      'notifications': 'Bildirimlerinizi hangi bot okuyabilir?',
      'activity': 'Bilgisayar etkinliğinizi hangi bot okuyabilir?',
      'browserTab': 'Geçerli tarayıcı sekmenizi hangi bot okuyabilir?',
      'browserHistory':
          'Tarayıcı geçmişinizi ve yer işaretlerinizi hangi bot okuyabilir?',
      'alarm': 'Alarmlarınızı hangi bot okuyabilir?',
      'home': 'Ev aksesuarlarınızı hangi bot okuyabilir?',
      'other': 'Cihaz verilerinizi hangi bot okuyabilir?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama\'nın izni yok. Sistem ayarlarından izin verin, ardından tekrar deneyin.';

  @override
  String get deviceOtherDevices => 'Diğer cihazlarınız';

  @override
  String get deviceForget => 'Bu cihazı unut';

  @override
  String get deviceBrowsers => 'Botların kullanabileceği tarayıcılar';

  @override
  String get deviceBrowsersHelp =>
      'Chrome için Casama ile eşleştirildi. İzin verdiğiniz botlar orada sizin adınıza oturum açmış olarak kendi sekme gruplarında çalışır.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bot',
      one: '1 bot',
      zero: 'Henüz bot yok',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'Çevrimiçi';

  @override
  String get deviceBrowserOffline => 'Çevrimdışı';

  @override
  String get deviceBrowserUnpair => 'Bu tarayıcının eşleştirmesini kaldır';

  @override
  String get deviceBrowserAllBots => 'Tüm botlar';

  @override
  String get deviceChromeNotPaired => 'Chrome için Casama: eşleştirilmedi';

  @override
  String get deviceChromeHowToPair =>
      'Chrome için Casama\'yı yükleyin, giriş yapın, ardından Daha fazla → “Botların bu tarayıcıyı kullanmasına izin ver” seçeneğini açın.';

  @override
  String get deviceConnectionsRowHelp =>
      'Bu cihazdan takvim, kişiler ve daha fazlası';

  @override
  String get healthExtraCycle => 'Döngü takibi';

  @override
  String get healthExtraGlucose => 'Kan şekeri';

  @override
  String get healthExtraBloodPressure => 'Kan basıncı';

  @override
  String get appleHealth => 'Apple Sağlık';

  @override
  String get appleHealthAbout =>
      'Yalnızca bu açık olduğunda Apple Sağlık\'tan (HealthKit) uyku, aktivite, antrenman ve kalp verilerinizin günlük özetlerini okur. Casama, Apple Sağlık\'a hiçbir zaman veri yazmaz.';

  @override
  String get healthNotMedical =>
      'Yalnızca günlük özetler (uyku, aktivite, antrenmanlar, kalp). Botlar her zamanki durumunuzla nasıl karşılaştırıldığınızı açıklar ve hiçbir zaman tıbbi tavsiye vermez.';

  @override
  String get healthNeedsEncryption =>
      'Sağlık verileri beklemede şifreleme gerektirir. Sahibi olduğunuz bir çalışma alanında açın, ardından tekrar deneyin.';

  @override
  String get placeAddHere => 'Şu an bulunduğum yeri ekle';

  @override
  String get placeName => 'Bu yere bir ad verin (Ev, İş, Spor Salonu)';

  @override
  String get placeNoLocation =>
      'Konumunuz kullanılamıyor. Casama için konuma izin verin, ardından tekrar deneyin.';

  @override
  String get placesHelp =>
      'Botlar bu yerlere vardığınızda veya ayrıldığınızda haberdar olur. Yalnızca yer adı ve saat paylaşılır; rotanız asla paylaşılmaz.';

  @override
  String get watchedAppsHelp =>
      'Yalnızca bu uygulamalardan gelen bildirimler paylaşılır. Tek kullanımlık kodlar telefonunuzdan ayrılmadan önce gizlenir.';

  @override
  String get watchedAppAdd => 'Bir uygulama ekle (ad veya paket kimliği)';

  @override
  String get providerHintMaps => 'şimdi çıkma zamanı için seyahat süreleri';

  @override
  String routineDevice(String event, String detail) {
    return 'Telefonunuzda: $event $detail';
  }

  @override
  String get ctxSelection => 'Seçili metin';

  @override
  String get ctxAddScreenshot => 'Ekran görüntüsü ekle';

  @override
  String get ctxScreenshotAdded => 'Ekran görüntüsü eklendi';

  @override
  String get ctxScreenshotFailed =>
      'Ekran görüntüsü alınamadı. Sistem ayarlarınızdan Casama için ekran kaydına izin verin.';

  @override
  String get watchedFolders => 'İzlenen klasörler';

  @override
  String get watchedFoldersHelp =>
      'Bu klasörlerden birindeki yeni bir dosya bir rutini başlatabilir (örneğin, İndirilenler\'deki yeni PDF\'leri dosyalama). Yalnızca adı paylaşılır; botlar dosyayı yalnızca bu bilgisayarda çalışıyorlarsa okur.';

  @override
  String get whyTitle => 'Bunu neden görüyorum?';

  @override
  String whyData(String data) {
    return 'Kullanılan: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Aciliyet: $urgency';
  }

  @override
  String get heldMeeting =>
      'Toplantıdayken bekledi ve özetinizle birlikte geldi.';

  @override
  String get heldFocus => 'Odak açıkken bekledi ve özetinizle birlikte geldi.';

  @override
  String get heldDriving =>
      'Araç kullanırken bekledi ve özetinizle birlikte geldi.';

  @override
  String get heldCap =>
      'Bot bugün zaten 5 mesaj göndermişti, bu yüzden bu mesaj özetinizi bekledi.';

  @override
  String get heldLow =>
      'Acil değildi, bu yüzden telefonunuzu çaldırmak yerine özetinizi bekledi.';

  @override
  String get lessLikeThis => 'Bunun gibisini daha az göster';

  @override
  String get lessLikeThisDone => 'Anlaşıldı, bunun gibi daha az';

  @override
  String get widgetStatusWorking => 'Çalışıyor…';

  @override
  String get widgetStatusOff => 'Kapatıldı';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner =>
      'Sunucu sahibi tarafından askıya alındı';

  @override
  String get previewHi => 'Selam!';

  @override
  String get previewAsk => 'Notlarımı düzenleyebilir misin?';

  @override
  String get previewOnIt => 'Hemen hallediyorum';

  @override
  String get previewDone => 'Tamamdır! Artık üç klasörün içindeler.';

  @override
  String get previewMessage => 'Mesaj';

  @override
  String get fontPreviewGreeting => 'Günaydın';

  @override
  String get photosFromUnsplash => 'Unsplash fotoğrafları';

  @override
  String get showBotSteps => 'Botun adımlarını göster';

  @override
  String get showBotStepsHelp => 'Her sohbette komutlar ve teknik hatalar.';

  @override
  String get showScreenCard => 'Bot çalışırken ekranını göster';

  @override
  String get showScreenCardHelp =>
      'Sohbette küçük bir canlı kart. Tam ekran izlemek için dokunun.';

  @override
  String get showReplyUsage => 'Yanıtlarda kullanımı göster';

  @override
  String get showReplyUsageHelp =>
      'Altındaki bir satırda her yanıtın maliyeti.';

  @override
  String get openLinksInApp => 'Bağlantıları uygulamada aç';

  @override
  String get openLinksInAppHelp =>
      'Web bağlantıları Casama içindeki bir tarayıcıda açılır. Kapalıysa varsayılan tarayıcınızda açılır.';

  @override
  String replyUsageTokens(String count) {
    return '$count token';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return 'Anahtarlarınızla $amount';
  }

  @override
  String get replyUsageOnPlan => 'ChatGPT planınızda';

  @override
  String replyUsageSoFar(String amount) {
    return 'Şu ana kadar $amount';
  }

  @override
  String get replyUsageTooltip => 'Bu yanıtın maliyeti';

  @override
  String get replyUsageTitle => 'Bu yanıtın maliyeti';

  @override
  String get replyUsageFromCredits => 'Kredilerinizden';

  @override
  String get replyUsageYourKeys => 'Kendi anahtarlarınızla';

  @override
  String get replyUsageTotal => 'Toplam';

  @override
  String get replyUsageTime => 'Süre';

  @override
  String get replyUsageTokensLabel => 'Tokenlar';

  @override
  String get replyUsageSteps => 'Adımlar';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n yardımcı çalıştırma dahil',
      one: '1 yardımcı çalıştırma dahil',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing => 'Bu yanıt için ölçüm yapılmadı.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 kredi = $price. Kendi anahtarlarınız ve planlarınız Casama tarafından değil, sağlayıcıları tarafından faturalandırılır.';
  }

  @override
  String get replyUsageOpenRun => 'Çalıştırmayı aç';

  @override
  String get replyUsageLoadFailed => 'Bu yanıtın kullanımı yüklenemedi.';

  @override
  String get replyUsageOurCost => 'Maliyetimiz';

  @override
  String get replyUsageMargin => 'Marj';

  @override
  String replyUsageItemCost(String amount) {
    return 'Maliyetimiz $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Bu sunucuyu siz yönettiğiniz için maliyetimiz ve marjımız size gösterilir. Başka kimse görmez.';

  @override
  String get kindSpeechToText => 'Sesten metne';

  @override
  String get kindVoice => 'Sesli aramalar';

  @override
  String get kindImages => 'Görseller';

  @override
  String get kindVideo => 'Video';

  @override
  String get kindSearch => 'Web aramaları';

  @override
  String get kindData => 'Veri aramaları';

  @override
  String get kindPhone => 'Telefon aramaları';

  @override
  String get kindApps => 'Uygulama eylemleri';

  @override
  String get activityReady => 'Hazırlanıyor…';

  @override
  String get activitySearching => 'Web\'de aranıyor…';

  @override
  String get activityBrowsing => 'Web\'de geziniliyor…';

  @override
  String get activityComputer => 'Bilgisayarında çalışıyor…';

  @override
  String get activityFiles => 'Dosyalara bakılıyor…';

  @override
  String get activityImage => 'Görsel oluşturuluyor…';

  @override
  String get activityVideo => 'Video oluşturuluyor…';

  @override
  String get activityMemory => 'Bildiklerini kontrol ediyor…';

  @override
  String get activityApps => 'Uygulamalarınız kullanılıyor…';

  @override
  String get activityScheduling => 'Zamanlama ayarlanıyor…';

  @override
  String get activityWorking => 'Üzerinde çalışılıyor…';

  @override
  String get activityWaitingForScreen => 'Ekranı geri vermeniz bekleniyor…';

  @override
  String get runFailedPlain =>
      'Bir sorun oluştu. Tekrar deneyin veya nedenini görmek için Ayrıntılar\'ı açın.';

  @override
  String get newKeyTitle => 'Yeni anahtarınızı kopyalayın';

  @override
  String get newKeyHelp =>
      'Yalnızca bu sefer gösterilir. Bağladığınız uygulamaya yapıştırın, ardından Tamam\'a dokunun.';

  @override
  String get copyKey => 'Anahtarı kopyala';

  @override
  String get keyCopied => 'Anahtar kopyalandı';

  @override
  String revokeApiKeyTitle(String name) {
    return '“$name” iptal edilsin mi?';
  }

  @override
  String get revokeApiKeyBody =>
      'Bu anahtarı kullanan uygulamaların bağlantısı hemen kesilir. Bu işlem geri alınamaz; yeniden bağlanmak için yeni bir anahtar oluşturun.';

  @override
  String unlinkTitle(String name) {
    return '“$name” bağlantısı kaldırılsın mı?';
  }

  @override
  String get unlinkBody =>
      'Botlar birbiriyle konuşmayı hemen durdurur. Yeniden bağlamak için yeni bir davet gerekir.';

  @override
  String get alreadyMember => 'Bu çalışma alanında zaten varsınız.';

  @override
  String get askAdminToInvite =>
      'Yalnızca sahipler ve yöneticiler kişileri davet edebilir. Onlardan birinden davet bağlantısı isteyin.';

  @override
  String get askBeforeJoining => 'Kişiler katılmadan önce bana sor';

  @override
  String get askBeforeJoiningHelp =>
      'Bağlantıyı kullanan her kişiyi bir yönetici onaylar.';

  @override
  String get askToJoin => 'Katılma isteği gönder';

  @override
  String get customLinks => 'Özel bağlantılar';

  @override
  String get customLinksHelp =>
      'Kendi rolü, bitiş süresi veya kullanım sayısı olan bağlantılar.';

  @override
  String get emailAddresses => 'E-posta adresleri';

  @override
  String get emailAddressesHelp =>
      'Bir veya daha fazlasını virgülle ya da yeni satırlarla ayırarak yapıştırın.';

  @override
  String get getCode => 'Kod al';

  @override
  String get getNewCode => 'Yeni kod al';

  @override
  String get getStarted => 'Başla';

  @override
  String get welcomeCta => 'Hadi başlayalım';

  @override
  String get inviteAsAdmin => 'Yönetici olarak davet et';

  @override
  String get inviteByEmail => 'E-posta ile davet et';

  @override
  String get inviteExpired => 'Süresi doldu';

  @override
  String inviteExpires(String when) {
    return 'Bitiş: $when';
  }

  @override
  String get inviteInvalid => 'Bu davet çalışmıyor';

  @override
  String get inviteInvalidHelp =>
      'Süresi dolmuş, kullanım hakkı bitmiş veya kapatılmış olabilir. Yeni bir tane isteyin.';

  @override
  String get inviteLink => 'Davet bağlantısı';

  @override
  String get inviteLinkApprovalHelp =>
      'Bu bağlantıya sahip herkes katılmak için istek gönderebilir. Aşağıdan onaylarsınız.';

  @override
  String get inviteLinkHelp =>
      'Bu bağlantıya sahip herkes üye olarak katılabilir. Bir sohbette veya e-postada paylaşın.';

  @override
  String get inviteLinkOrCode => 'Davet bağlantısı veya kodu';

  @override
  String inviteOtherServer(String host) {
    return 'Bu davet $host içindir ve bu uygulama farklı bir sunucuya bağlıdır.';
  }

  @override
  String get inviteRenewed =>
      'Davet 7 gün daha geçerlidir. Onlara yeni bağlantıyı gönderin.';

  @override
  String inviteSentTo(String email) {
    return 'Kabul etmek için $email ile giriş yapın.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Casama\'da $workspace çalışma alanına katılın: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name sizi katılmaya davet etti';
  }

  @override
  String get invitedToJoin => 'Katılmaya davet edildiniz';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString davet gönderildi.',
      one: 'Davet gönderildi.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'Yönetici olarak katılacaksınız';

  @override
  String get joinAsMember => 'Üye olarak katılacaksınız';

  @override
  String get joinByDomain => 'E-posta alan adıyla katıl';

  @override
  String get joinByDomainHelp => 'Doğrulanmış adresler davet olmadan katılır.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Doğrulanmış @$domain e-postasına sahip herkes katılabilir';
  }

  @override
  String get joinByDomainUnavailable =>
      'Doğrulanmış bir iş e-postasıyla giriş yaptığınızda kullanılabilir (gmail.com ve benzerleri değil).';

  @override
  String get joinNeedsApproval =>
      'Bir yönetici yeni kişileri katılmadan önce onaylar.';

  @override
  String get joinRequestSent => 'İstek gönderildi';

  @override
  String joinRequestSentHelp(String name) {
    return '$name yöneticilerinden biri bunu inceleyecek. Katıldığınızda bildirim alacaksınız.';
  }

  @override
  String get joinWithLinkOrCode => 'Bağlantı veya kodla katıl';

  @override
  String get spacesInvite => 'Kişileri davet et';

  @override
  String spacesInviteTo(String name) {
    return '$name çalışma alanına';
  }

  @override
  String get spacesNew => 'Yeni çalışma alanı';

  @override
  String get spacesNewHint => 'Kendi botları, kişileri ve faturalandırması';

  @override
  String get spacesJoin => 'Bir çalışma alanına katıl';

  @override
  String get spacesJoinHint => 'Davet bağlantısı veya koduyla';

  @override
  String joinWorkspaceNamed(String name) {
    return '$name çalışma alanına katıl';
  }

  @override
  String get joinedBotsHelp =>
      'Bu botlar yardımcı olmak için burada. Başlamak için birine merhaba deyin.';

  @override
  String get joinedNoBots =>
      'Henüz burada bot yok. Bir tane oluşturun veya önce etrafa göz atın.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString üye',
      one: '1 üye',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Üyeler';

  @override
  String openToDomain(String domain) {
    return '@$domain için açık';
  }

  @override
  String openWorkspace(String name) {
    return '$name aç';
  }

  @override
  String get pendingInvites => 'Henüz kabul edilmeyen davetler';

  @override
  String get people => 'Kişiler';

  @override
  String get workspaceAdvancedSummary =>
      'Gizli anahtarlar, hafıza, şifreleme, ödemeler, MCP';

  @override
  String get peopleAdvancedSummary =>
      'Davet kodu, e-posta alan adı, özel bağlantılar';

  @override
  String get inviteLinkToCopy => 'Davet bağlantısı, kopyalanmaya hazır';

  @override
  String linkMade(String when) {
    return '$when oluşturuldu';
  }

  @override
  String get billingAdvancedSummary =>
      'Sunucuya göre ücretler, Casama Link sunucuları ve anahtarlar';

  @override
  String get billingChargesSummary => 'Sunucuya göre ücretler';

  @override
  String get billingUsageRow => 'Botların ne kullandığı ve ne kadar tuttuğu';

  @override
  String billingUsageSoFar(String amount) {
    return 'Bu ay şu ana kadar: $amount';
  }

  @override
  String get usageAdvancedSummary => 'Token sayıları, JSON dışa aktarımı';

  @override
  String get peopleHelp =>
      'Kişileri davet edin ve kimlerin gireceğine karar verin.';

  @override
  String get peopleRow =>
      'Kişileri davet edin, istekleri onaylayın, üyeleri görün';

  @override
  String get qrCode => 'QR kodu';

  @override
  String get remove => 'Kaldır';

  @override
  String get resendInvite => 'Tekrar gönder';

  @override
  String get resetLink => 'Bağlantıyı sıfırla';

  @override
  String get resetLinkHelp =>
      'Mevcut bağlantı hemen çalışmayı durdurur ve yeni bir bağlantı alırsınız. Zaten içeride olan kişiler kalır.';

  @override
  String get revokeInvite => 'Daveti iptal et';

  @override
  String scanToJoin(String name) {
    return '$name çalışma alanına katılmak için tarayın';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$countString davet gönder';
  }

  @override
  String get sendInvitesYourself => 'Bu davetleri kendiniz gönderin';

  @override
  String get sendInvitesYourselfHelp =>
      'Bu sunucuda e-posta kurulu değil. Her kişiye bağlantısını gönderin; katılmak için o adresle giriş yaparlar.';

  @override
  String get signInToJoin => 'Katılmak için giriş yapın';

  @override
  String get startOwnWorkspace => 'Bunun yerine kendi çalışma alanımı başlat';

  @override
  String switchToServer(String host) {
    return '$host sunucusuna geç';
  }

  @override
  String get waitingToJoin => 'Katılmak için bekleniyor';

  @override
  String welcomeToWorkspace(String name) {
    return '$name çalışma alanına hoş geldiniz';
  }

  @override
  String get workspacesYouCanJoin => 'Katılabileceğiniz çalışma alanları';

  @override
  String get yourTeamIsHere => 'Ekibiniz zaten burada';

  @override
  String yourTeamIsHereHelp(String domain) {
    return '$domain alanındaki kişiler bu çalışma alanlarını kullanıyor. Birine katılın veya kendinizinkini başlatın.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Okuması veya yazması kolay. 48 saat geçerlidir. Kişiler bunu Bağlantı veya kodla katıl altına girer.';

  @override
  String get inviteSomeoneNew => 'Çalışma alanına yeni birini davet et';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app yalnızca güvenli (https) bir adreste oturum açar ve bu Casama sunucusu $address adresindedir. Girişi kullanmak için Casama\'yı https üzerinden sunun.';
  }

  @override
  String get aboutYou => 'Hakkınızda';

  @override
  String get aboutYouRow =>
      'Botlarınızın size nasıl hitap ettiği ve sizin hakkınızda bildikleri';

  @override
  String get aboutYouIntro =>
      'Botlarınız size adınızla hitap etmek ve istediğiniz gibi yanıt vermek için bunu okur. Yalnızca siz görebilirsiniz.';

  @override
  String get photoChange => 'Profil fotoğrafını değiştir';

  @override
  String get photoTake => 'Fotoğraf çek';

  @override
  String get photoChoose => 'Fotoğraf seç';

  @override
  String get photoUseGoogle => 'Google fotoğrafımı kullan';

  @override
  String get photoRemove => 'Fotoğrafı kaldır';

  @override
  String get photoUnreadable =>
      'Bu dosya Casama\'nın kullanabileceği bir fotoğraf değil. JPEG veya PNG deneyin.';

  @override
  String get whatToCallYou => 'Botlar size ne diye hitap etsin?';

  @override
  String get pronounsOptional => 'Hitap biçimi (isteğe bağlı)';

  @override
  String get aboutMe => 'Hakkımda';

  @override
  String get aboutMeHint =>
      'İşiniz, hayatınızdaki kişiler, ilgilendiğiniz şeyler. Yardımcı olacak her şey.';

  @override
  String get replyStyle => 'Yanıtları nasıl severim';

  @override
  String get replyStyleHint =>
      'Örneğin: kısa yanıtlar, emoji yok, konuları yeni başlamışım gibi anlat';

  @override
  String get learnAboutMe => 'Sohbetlerden beni tanı';

  @override
  String get learnAboutMeHelp =>
      'Botlar sizin hakkınızda bilgiler kaydeder. İstediğiniz zaman düzenleyebilirsiniz.';

  @override
  String get adultSites => 'Yetişkinlere yönelik siteler';

  @override
  String get adultSitesHelp =>
      'Botlar istediğinizde yetişkinlere yönelik web sitelerini açabilir. Yalnızca 18 yaş ve üzeri içindir.';

  @override
  String get adultSitesConfirmTitle =>
      'Yetişkinlere yönelik siteler açılsın mı?';

  @override
  String get adultSitesConfirmBody =>
      '18 yaşında veya daha büyük olduğunuzu onaylarsınız. İstediğinizde, botlar sizin için yetişkinlere yönelik web sitelerini açabilir ve oradakileri metin olarak listeleyebilir. Web veya masaüstü uygulamasındaki Casama\'dan istediğinizde çalışır; paylaşılan sohbetlerde asla çalışmaz.';

  @override
  String get adultSitesConfirm => '18 yaşında veya daha büyüğüm';

  @override
  String get adultSitesApprovalDetail =>
      'İzin ver seçeneği, 18 yaşında veya daha büyük olduğunuzu onayladığınız ve hesabınız için yetişkinlere yönelik siteleri açtığınız anlamına gelir. Bunu Hakkınızda bölümünden kapatabilirsiniz.';

  @override
  String useInThisSpace(String workspace) {
    return '$workspace içinde paylaştıklarımı kullan';
  }

  @override
  String get useInThisSpaceHelp =>
      'Kapalı: burada yalnızca adınız ve yanıt stiliniz kullanılır.';

  @override
  String get learnedAboutYou => 'Botların öğrendikleri';

  @override
  String get noLearnedFacts =>
      'Henüz bir şey yok. Botların sohbette sizin hakkınızda öğrendiği bilgiler burada görünür.';

  @override
  String get addFact => 'Bilgi ekle';

  @override
  String get editFact => 'Bilgiyi düzenle';

  @override
  String get deleteFactTitle => 'Bu bilgi silinsin mi?';

  @override
  String get deleteFactConfirm => 'Botlarınız artık bunu bilmeyecek.';

  @override
  String get importToProfile => 'ChatGPT veya Claude\'dan içe aktar';

  @override
  String get savedToProfile => 'Profilinize kaydedildi';

  @override
  String get undo => 'Geri al';

  @override
  String get suggestedLookApplied => 'Yeni tema uygulandı';

  @override
  String get suggestedLookUnavailable => 'Bu uygulamada o tema yok';

  @override
  String get removedFromProfile => 'Profilinizden kaldırıldı';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bilgi eklendi',
      one: '1 bilgi eklendi',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'Botlarınız bunu her çalışma alanında kullanacak. Daha sonra Ayarlar → Hakkınızda bölümünden değiştirebilirsiniz.';

  @override
  String get nameStepBubble => 'Tanıştığımıza memnun oldum!';

  @override
  String get heardFromTitle => 'Bizi nereden duydunuz?';

  @override
  String get heardFromHelp =>
      'Tek bir dokunuş neyin işe yaradığını görmemize yardımcı olur. Atlayabilirsiniz.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'Bir arkadaş';

  @override
  String get heardFromSearch => 'Arama motoru';

  @override
  String get heardFromAiAssistant => 'Bir yapay zeka asistanı';

  @override
  String get heardFromOther => 'Diğer';

  @override
  String get heardFromSkip => 'Atla';

  @override
  String get nameStepHint => 'Adınız';

  @override
  String get skillCatalogSubtitle =>
      'Botlarınızın bir görev gerektirdiğinde yüklediği hazır beceriler.';

  @override
  String get skillCategoryWork => 'İş';

  @override
  String get skillCategoryWriting => 'Yazım';

  @override
  String get skillCategoryResearch => 'Araştırma';

  @override
  String get skillCategoryData => 'Veri';

  @override
  String get skillCategoryMoney => 'Finans';

  @override
  String get skillCategoryBuild => 'Geliştirme';

  @override
  String get skillCategoryLife => 'Yaşam';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString beceri',
      one: '1 beceri',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Kurulu';

  @override
  String skillInstalledFor(String names) {
    return '$names için kurulu';
  }

  @override
  String installSkillFor(String name) {
    return '$name becerisini şunun için kur:';
  }

  @override
  String skillUseHint(String name) {
    return 'Botlar bir görev gerektirdiğinde bunu kendiliğinden yükler veya kullanmak için sohbette /$name yazabilirsiniz.';
  }

  @override
  String get skillInstructions => 'Talimatlar';

  @override
  String get skillAlreadyEverywhere => 'Kullanılabileceği her yere kuruldu.';

  @override
  String get gallery => 'Galeri';

  @override
  String get galleryEmpty => 'Galeride eşleşen bir şey yok.';

  @override
  String get galleryOffline =>
      'Şu anda galeriye ulaşılamıyor. Yerleşik temalar ve beceriler hâlâ burada.';

  @override
  String get galleryUse => 'Kullan';

  @override
  String get galleryInstall => 'Kur';

  @override
  String get galleryReport => 'Bildir';

  @override
  String get galleryShare => 'Galeride paylaş';

  @override
  String galleryBy(String name) {
    return 'Hazırlayan: $name';
  }

  @override
  String get galleryFeatured => 'Öne çıkanlar';

  @override
  String get galleryAll => 'Tümü';

  @override
  String get galleryThemes => 'Temalar';

  @override
  String get gallerySchemes => 'Renkler';

  @override
  String get galleryWallpapers => 'Duvar kağıtları';

  @override
  String get gallerySkills => 'Beceriler';

  @override
  String get fromGallery => 'Galeri';

  @override
  String galleryApplied(String name) {
    return '$name kullanılıyor';
  }

  @override
  String get gallerySeeAll => 'Tümünü gör';

  @override
  String get galleryInUse => 'Kullanımda';

  @override
  String galleryInstalled(String name) {
    return '$name kuruldu';
  }

  @override
  String get galleryPreviewDark => 'Koyu modda önizle';

  @override
  String get galleryPreviewLight => 'Açık modda önizle';

  @override
  String get galleryClearSearch => 'Aramayı temizle';

  @override
  String get galleryOfflineTitle => 'Galeri çevrimdışı';

  @override
  String galleryNoMatches(String query) {
    return '“$query” ile eşleşen bir şey yok';
  }

  @override
  String get galleryInstructions => 'Talimatlar';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$palette üzerinde $pattern';
  }

  @override
  String get galleryImage => 'Görsel';

  @override
  String get galleryMeshGradient => 'örgü gradyan';

  @override
  String get galleryOwnDoodles => 'Kendi çizimleriniz';

  @override
  String get galleryLightAndDark => 'Açık ve koyu';

  @override
  String get galleryContribute =>
      'Beğendiğiniz bir görünüm teması mı yaptınız? Paylaşın, Casama\'daki herkes burada bulabilsin.';

  @override
  String get galleryTypeTheme => 'Tema';

  @override
  String get galleryTypeScheme => 'Renk düzeni';

  @override
  String get galleryTypeWallpaper => 'Duvar kağıdı';

  @override
  String get galleryTypeSkill => 'Beceri';

  @override
  String get galleryBehindChats => 'Sohbetlerinizin arkasında';

  @override
  String celebrateNewBot(String name) {
    return '$name botuna merhaba deyin!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name hazır!';
  }

  @override
  String get celebrateJoined => 'Girdiniz! Alanınıza hoş geldiniz.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name tamamen hazır.';
  }

  @override
  String get fewerEffects => 'Daha az efekt';

  @override
  String get fewerEffectsHelp =>
      'Kutlamalar, zıplayan sekmeler veya hareketli botlar yok.';

  @override
  String get haptics => 'Dokunsal geri bildirim';

  @override
  String get trackpadHaptics => 'Trackpad dokunsal geri bildirimi';

  @override
  String get hapticsHelp =>
      'Bir şey olduğunda veya bir botun size ihtiyacı olduğunda hafif dokunuşlar.';

  @override
  String get watchHaptics => 'Dokunsal';

  @override
  String get settingsAppSection => 'Uygulama';

  @override
  String get settingsSecuritySection => 'Giriş ve güvenlik';

  @override
  String get customize => 'Özelleştir';

  @override
  String get customizeColors => 'Renkler';

  @override
  String get appearanceCustomLook => 'Özel tema';

  @override
  String get appearanceCustomHelp =>
      'Kendi değişiklikleriniz. Korumak için tema olarak kaydedin.';

  @override
  String get appearanceFromGallery => 'Galeriden';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Tümünü göster ($countString)';
  }

  @override
  String appearanceSwitched(String name) {
    return '$name temasına geçildi';
  }

  @override
  String appearanceSaved(String name) {
    return '$name temalarınıza kaydedildi';
  }

  @override
  String get appearanceAboutTheme => 'Bu tema hakkında';

  @override
  String settingsOnDevServer(String host) {
    return 'Ayarlar · geliştirme sunucusu $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'Siz: $text';
  }

  @override
  String get chatPreviewPhoto => 'Fotoğraf';

  @override
  String get chatPreviewVideo => 'Video';

  @override
  String get chatPreviewVoice => 'Sesli not';

  @override
  String get chatPreviewNone => 'Henüz mesaj yok';

  @override
  String get chatTimeYesterday => 'Dün';

  @override
  String get chatDayToday => 'Bugün';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day $time';
  }

  @override
  String get anyPriority => 'Herhangi bir öncelik';

  @override
  String get readingAloud => 'Sesli okunuyor';

  @override
  String get readAloudPreparing => 'Hazırlanıyor…';

  @override
  String get readAloudPaused => 'Duraklatıldı';

  @override
  String get stopReading => 'Okumayı durdur';

  @override
  String get readAloudSpeed => 'Oynatma hızı';

  @override
  String readAloudTimeLeft(String time) {
    return '$time kaldı';
  }

  @override
  String get readAloudShowMessage => 'Okunan mesajı göster';

  @override
  String mentionOpenProfile(String name) {
    return '$name, profili aç';
  }

  @override
  String get paywallSubtitle =>
      'Botlarınızın çalışmaya devam edebilmesi için daha fazla bot, daha fazla bilgisayar süresi ve her ay yenilenen krediler.';

  @override
  String get paywallPerkBots => 'Botlar';

  @override
  String get paywallPerkBotsBody => 'Her birinin kendi işi olan tam bir ekip.';

  @override
  String get paywallPerkComputers => 'Bilgisayar süresi';

  @override
  String get paywallPerkComputersBody =>
      'Botlar gezinmek, kod yazmak ve üretmek için kendi bilgisayarlarına sahip olur.';

  @override
  String get paywallPerkCredits => 'Aylık krediler';

  @override
  String get paywallPerkCreditsBody => 'Modeller, arama ve araçlar için.';

  @override
  String get paywallPerkSeats => 'Koltuklar';

  @override
  String get paywallPerkSeatsBody => 'Ekibinizi aynı çalışma alanına getirin.';

  @override
  String paywallHours(String hours) {
    return '$hours sa.';
  }

  @override
  String get paywallWeekly => 'Haftalık';

  @override
  String get paywallMonthly => 'Aylık';

  @override
  String get paywallYearly => 'Yıllık';

  @override
  String get paywallPerMonth => '/ ay';

  @override
  String get paywallPerYear => '/ yıl';

  @override
  String get paywallContinue => 'Devam et';

  @override
  String get paywallContinueCheckout => 'Ödemeye devam et';

  @override
  String get paywallRestore => 'Geri yükle';

  @override
  String get paywallFineStore =>
      'Otomatik olarak yenilenir. Mağaza ayarlarınızdan istediğiniz zaman iptal edebilirsiniz.';

  @override
  String get paywallFineWeb =>
      'Otomatik olarak yenilenir. Faturalandırma bölümünden istediğiniz zaman iptal edebilirsiniz.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, siz iptal edene kadar otomatik olarak yenilenir. Ödeme Apple Hesabınızdan tahsil edilir. Yenilemeden en az 24 saat önce Apple Hesabı ayarlarınızdan istediğiniz zaman iptal edebilirsiniz.',
      'google_play':
          '$price, siz iptal edene kadar otomatik olarak yenilenir. Ödeme Google Play hesabınızdan tahsil edilir. Yenilemeden en az 24 saat önce Google Play hesap ayarlarınızdan istediğiniz zaman iptal edebilirsiniz.',
      'other':
          '$price, siz iptal edene kadar otomatik olarak yenilenir. Ödeme mağaza hesabınızdan tahsil edilir. Yenilemeden en az 24 saat önce mağaza hesabı ayarlarınızdan istediğiniz zaman iptal edebilirsiniz.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          '$days gün boyunca ücretsiz, ardından siz iptal edene kadar otomatik olarak yenilenen $price.',
      one:
          '1 gün boyunca ücretsiz, ardından siz iptal edene kadar otomatik olarak yenilenen $price.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          '$days gün boyunca ücretsiz, ardından siz iptal edene kadar otomatik olarak yenilenen $price.',
      one:
          '1 gün boyunca ücretsiz, ardından siz iptal edene kadar otomatik olarak yenilenen $price.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          '$days gün boyunca ücretsiz, ardından siz iptal edene kadar otomatik olarak yenilenen $price.',
      one:
          '1 gün boyunca ücretsiz, ardından siz iptal edene kadar otomatik olarak yenilenen $price.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 Deneme süresi sona erdiğinde ödeme Apple Hesabınızdan tahsil edilir. Deneme süresi sona ermeden en az 24 saat önce Apple Hesabı ayarlarınızdan iptal ederseniz sizden ücret alınmaz.',
      'google_play':
          '$_temp1 Deneme süresi sona erdiğinde ödeme Google Play hesabınızdan tahsil edilir. Deneme süresi sona ermeden en az 24 saat önce Google Play hesap ayarlarınızdan iptal ederseniz sizden ücret alınmaz.',
      'other':
          '$_temp2 Deneme süresi sona erdiğinde ödeme mağaza hesabınızdan tahsil edilir. Deneme süresi sona ermeden en az 24 saat önce mağaza hesabı ayarlarınızdan iptal ederseniz sizden ücret alınmaz.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Ücretsiz denemeyi başlat';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün ücretsiz, ardından $price/yıl',
      one: '1 gün ücretsiz, ardından $price/yıl',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days gün ücretsiz, ardından $price/ay',
      one: '1 gün ücretsiz, ardından $price/ay',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, siz iptal edene kadar otomatik olarak yenilenir. Faturalandırma bölümünden istediğiniz zaman iptal edebilirsiniz; dönem sonuna kadar planınızı kullanmaya devam edersiniz.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          '$days gün boyunca ücretsiz, ardından siz iptal edene kadar otomatik olarak yenilenen $price.',
      one:
          '1 gün boyunca ücretsiz, ardından siz iptal edene kadar otomatik olarak yenilenen $price.',
    );
    return '$_temp0 Deneme süresi sona ermeden önce Faturalandırma bölümünden iptal ederseniz sizden ücret alınmaz.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price / hafta',
      'year': '$price / yıl',
      'other': '$price / ay',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Kullanım Koşulları';

  @override
  String get privacyPolicy => 'Gizlilik Politikası';

  @override
  String get aiConsentTitle => 'Sohbetleriniz yapay zeka şirketlerine gider';

  @override
  String get aiConsentBody =>
      'Yanıtları yazmak için Casama, botlarınızla paylaştıklarınızı dış yapay zeka sağlayıcılarına gönderir. Siz kabul edene kadar hiçbir şey gönderilmez.';

  @override
  String get aiConsentUpdatedNotice => 'Bu listeye web sayfalarını ekledik.';

  @override
  String get aiConsentWhatTitle => 'Neler gönderilir';

  @override
  String get aiConsentWhat =>
      'Mesajlarınız, dosyalarınız ve fotoğraflarınız; sesli aramalardaki, sesli mesajlardaki ve diktedeki sesiniz; botların sizin hakkınızda hatırladıkları; botlarınızın sizin için açtığı web sayfaları (kendi bilgisayarlarında veya bu cihazdaki tarayıcıda) ve takvim ya da sağlık gibi açtığınız telefon verileri.';

  @override
  String get aiConsentWhoTitle => 'Kimler alır';

  @override
  String get aiConsentWho =>
      'OpenRouter; bunu kullandığınız modeli geliştiren şirkete (DeepSeek, Google veya OpenAI gibi) iletir. Sesli aramalarda Google Gemini kullanılır; sesli mesajları ve dikteyi metne OpenAI dönüştürür. Web aramaları Parallel, Serper veya DeepSeek\'e gider. Kendi API anahtarınızı kullanırsanız veriler bunun yerine o sağlayıcıya gider.';

  @override
  String get aiConsentWhyTitle => 'Bununla ne yaparlar';

  @override
  String get aiConsentWhy =>
      'Yanıtı yazmak için kullanırlar. Bunu istediğiniz zaman Ayarlar › Gizlilik bölümünden durdurabilirsiniz; ayrıntılar gizlilik politikasındadır.';

  @override
  String get aiConsentAgree => 'Kabul et ve devam et';

  @override
  String get aiConsentTile => 'Yapay zeka sağlayıcıları';

  @override
  String get aiConsentTileOn =>
      'İzin verildi. Botlarla paylaştıklarınız yanıt yazmak için dış yapay zeka sağlayıcılarına gider.';

  @override
  String get aiConsentWithdrawQuestion =>
      'Yapay zeka sağlayıcılarıyla paylaşım durdurulsun mu?';

  @override
  String get aiConsentWithdrawBody =>
      'Botlar bu sağlayıcılar olmadan yanıt veremez. Başka bir şey gönderilmeden önce Casama tekrar sorar.';

  @override
  String get aiConsentWithdraw => 'Paylaşımı durdur';

  @override
  String get planChanged => 'Plan değiştirildi';

  @override
  String get purchasesRestored => 'Satın alımlar geri yüklendi';

  @override
  String get creditsAdded => 'Krediler eklendi';

  @override
  String get purchasePending =>
      'Satın alımın onaylanması bekleniyor. Onaylanır onaylanmaz eklenecektir.';

  @override
  String get purchaseFailed =>
      'Satın alım gerçekleşmedi ve sizden ücret alınmadı.';

  @override
  String get purchaseVerifyFailed =>
      'Satın alımınızı henüz doğrulayamadık. Kendi kendine yeniden denenir; yakında görünmezse Satın alımları geri yükle\'ye dokunun.';

  @override
  String paywallTitleFor(String plan) {
    return '$plan ile ekibinizi büyütün';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return '$plan planına hoş geldiniz!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ay ücretsiz',
      one: '1 ay ücretsiz',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return '$plan planına geç';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'App Store üzerinden abonesiniz. Plan değiştirmek için abone olduğunuz cihazdaki App Store\'u kullanın.',
      'google_play': 'Google Play üzerinden abonesiniz. Plan değiştirmek için abone olduğunuz cihazdaki Google Play\'i kullanın.',
      'other': 'Bir uygulama mağazası üzerinden abonesiniz. Plan değiştirmek için abone olduğunuz cihazdaki o mağazayı kullanın.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Web üzerinden abonesiniz. Buradan web ödemesiyle plan değiştirebilir veya aboneliğinizi yönetebilirsiniz.';

  @override
  String get subscribedOutsideAppNote =>
      'Aboneliğiniz bu uygulamanın dışında faturalandırılır, bu nedenle buradan değiştirilemez.';

  @override
  String get outOfCreditsTitle => 'Krediniz tükendi';

  @override
  String get outOfCreditsPaidBody =>
      'Siz kredi ekleyene kadar botlarınız duraklatılır. App Store veya Google Play\'den alınan kredi paketlerinin süresi asla dolmaz; web üzerinden alınan kredi paketleri 12 ay geçerlidir.';

  @override
  String get outOfCreditsFreeBody =>
      'Her ay daha fazla kredi, daha fazla bot ve daha fazla bilgisayar süresi için planınızı yükseltin.';

  @override
  String get addCredits => 'Kredi ekle';

  @override
  String get seePlansButton => 'Planları gör';

  @override
  String get paywallAskAdmin =>
      'Planı yalnızca çalışma alanı sahipleri ve yöneticileri değiştirebilir. Yükseltmesi için birinden rica edin.';

  @override
  String get upgradeToPro => 'Pro\'ya yükselt';

  @override
  String get upgradeToProBody =>
      'Daha fazla bot, bilgisayar süresi ve aylık kredi.';

  @override
  String get manageTab => 'Yönet';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'Hafıza';

  @override
  String get vitalsDisk => 'Disk';

  @override
  String get fixItTitle => 'Düzgün çalışmıyor mu?';

  @override
  String get fixItSubtitle =>
      'Bunları sırayla deneyin. Her biri biraz daha ileri gider.';

  @override
  String get fixRestart => 'Yeniden başlat';

  @override
  String get fixRestartHelp => 'Yaklaşık 20 saniye · hiçbir şey kaybolmaz';

  @override
  String get fixResetSystem => 'Sistemi sıfırla';

  @override
  String get fixResetSystemHelp => 'Temiz bir sistem · dosyalarınız kalır';

  @override
  String get fixErase => 'Her şeyi sil';

  @override
  String get fixEraseHelp => 'Yeni gibi · 7 gün boyunca geri alınabilir';

  @override
  String get fixResetAction => 'Sıfırla…';

  @override
  String get fixEraseAction => 'Sil…';

  @override
  String get computerRestarting => 'Yeniden başlatılıyor…';

  @override
  String get computerRestarted =>
      'Yeniden başlatıldı. Tüm dosyalarınız yerinde.';

  @override
  String get computerUpdateTitle => 'Güncelleme mevcut';

  @override
  String get computerUpdateBody =>
      'Yeni araçlar ve düzeltmeler hazır. Güncelleme bu bilgisayarı yeniden başlatır: dosyalarınız kalır, açık pencereler ve çalışan programlar kapanır.';

  @override
  String get computerUpdateBotWorking =>
      'Şu anda bu bilgisayarda bir bot çalışıyor. Güncelleme yaptığını durdurur.';

  @override
  String get computerUpdateNow => 'Şimdi güncelle';

  @override
  String get computerUpdateLater => 'Daha sonra';

  @override
  String get computerUpdateConfirmTitle => 'Bu bilgisayar güncellensin mi?';

  @override
  String get computerUpdateMenu => 'Bilgisayarı güncelle';

  @override
  String get computerUpdating => 'Güncelleniyor…';

  @override
  String get computerUpdated => 'Güncellendi. Tüm dosyalarınız yerinde.';

  @override
  String get computerUpdateBusyTitle => 'Bir komut hâlâ çalışıyor';

  @override
  String get computerUpdateBusyBody =>
      'Şimdi güncellemek onu durdurur. Bitmesini bekleyin veya yine de güncelleyin.';

  @override
  String get computerUpdateAnyway => 'Yine de güncelle';

  @override
  String resetSheetTitle(String name) {
    return '$name bilgisayarını sıfırla';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots bunu yaklaşık bir dakika boyunca kullanamaz.';
  }

  @override
  String get resetSheetBusyNone => 'Yaklaşık bir dakika boyunca kullanılamaz.';

  @override
  String get resetOptionSystem => 'Sistemi sıfırla, dosyalarımı koru';

  @override
  String get resetOptionSystemHelp =>
      'Bozuk kurulumları, ayarları ve takılan programları düzeltir.';

  @override
  String get resetOptionErase => 'Her şeyi sil';

  @override
  String get resetOptionEraseHelp => 'Yepyeni bir bilgisayara geri döner.';

  @override
  String get resetKept => 'Korunanlar';

  @override
  String get resetRemoved => 'Kaldırılanlar';

  @override
  String get resetKeptFiles => 'workspace klasöründeki dosyalarınız';

  @override
  String get resetKeptSettings => 'Ad, ayarlar ve botlar';

  @override
  String get resetKeptRestorePoints => 'Geri yükleme noktaları';

  @override
  String get resetRemovedApps => 'Kurduğunuz uygulamalar ve araçlar';

  @override
  String get resetRemovedPrograms => 'Çalışan programlar';

  @override
  String get resetRemovedCaches => 'Önbellekler ve ana klasör ayarları';

  @override
  String get resetRemovedFiles => 'Her dosya, çalışma alanı da dahil';

  @override
  String get resetSavePoint => 'Önce bir geri yükleme noktası kaydet';

  @override
  String get resetSavePointHelp => 'Böylece 7 gün boyunca geri alabilirsiniz';

  @override
  String eraseTypeName(String name) {
    return 'Onaylamak için $name yazın';
  }

  @override
  String get resetConfirmSystem => 'Sistemi sıfırla';

  @override
  String get resetConfirmErase => 'Her şeyi sil';

  @override
  String get resetStepSaving => 'Geri yükleme noktası kaydediliyor';

  @override
  String get resetStepWipingSystem => 'Uygulamalar ve ayarlar kaldırılıyor';

  @override
  String get resetStepWipingErase => 'Tüm dosyalar siliniyor';

  @override
  String get resetStepRestarting => 'Temiz bir sistem başlatılıyor';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Sıfırlanıyor… $stepString / $totalString';
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

    return 'Siliniyor… $stepString / $totalString';
  }

  @override
  String get resetLeaveHint =>
      'Bu ekrandan çıkabilirsiniz. Kendi kendine devam eder.';

  @override
  String get resetDone => 'Temiz sistem hazır';

  @override
  String get eraseDone => 'Bilgisayar silindi';

  @override
  String get resetFailed => 'Sıfırlama tamamlanamadı';

  @override
  String get resetUndoHint =>
      'Geri al her şeyi eski haline döndürür. Geri yükleme noktası 7 gün kalır.';

  @override
  String get restoredPrevious => 'Eski haline döndürüldü';

  @override
  String get usageThisMonth => 'Bu ay';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString sa. $minutesString dk.';
  }

  @override
  String get usageCostNote =>
      'Yalnızca açıkken ücretlendirilir. Uyku modunda maliyeti yoktur.';

  @override
  String get usageNone => 'Bu ay henüz kullanılmadı';

  @override
  String get sleepTimerTitle => 'Şu kadar süre sonra uyur:';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString dk.';
  }

  @override
  String get sleepTimerHour => '1 saat';

  @override
  String get sleepTimerHelp =>
      'Bir bot çalışırken veya siz kullanırken asla uyumaz. Daha uzun bekleme süresi bilgisayarı daha uzun açık tutar ve bu da daha fazla maliyet oluşturur.';

  @override
  String sleepTimerSaved(String label) {
    return 'Etkinlik olmadan $label sonra uyur';
  }

  @override
  String get storageTitle => 'Depolama';

  @override
  String storageOf(String total) {
    return '/ $total';
  }

  @override
  String get storageFiles => 'Dosyalarınız';

  @override
  String get storageApps => 'Uygulamalar ve araçlar';

  @override
  String get storageCaches => 'Önbellekler';

  @override
  String get storageBrowser => 'Tarayıcı';

  @override
  String get storageOther => 'Diğer';

  @override
  String get storageFree => 'Boş';

  @override
  String storageFreeUp(String size) {
    return '$size yer aç';
  }

  @override
  String get storageNothingToClean => 'Temizlenecek önbellek yok';

  @override
  String storageFreed(String size) {
    return '$size alan açıldı';
  }

  @override
  String get storageAsleep =>
      'Neyin yer kapladığını görmek için bilgisayarı uyandırın.';

  @override
  String get processesTitle => 'Şu anda çalışanlar';

  @override
  String get processesNone =>
      'Bilgisayarın kendisi dışında hiçbir şey çalışmıyor.';

  @override
  String get processesAsleep => 'Uyku modundayken hiçbir şey çalışmaz.';

  @override
  String get processStop => 'Durdur';

  @override
  String processStopTitle(String name) {
    return '$name durdurulsun mu?';
  }

  @override
  String get processStopMessage => 'Kaydetmediği her şey kaybolur.';

  @override
  String processStopped(String name) {
    return '$name durduruldu';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · %$cpu CPU · $memory';
  }

  @override
  String get usedByTitle => 'Kullananlar';

  @override
  String get usedByNone => 'Henüz bu bilgisayarı kullanan bir bot yok.';

  @override
  String botLastActive(String when) {
    return 'Etkin: $when';
  }

  @override
  String get botNeverActive => 'Henüz etkin değil';

  @override
  String get restorePointsTitle => 'Geri yükleme noktaları';

  @override
  String get restorePointsNone =>
      'Henüz yok. Botlar riskli değişikliklerden önce bir tane kaydeder.';

  @override
  String get restorePointSaveNow => 'Şimdi geri yükleme noktası kaydet';

  @override
  String get restorePointSaveTitle => 'Geri yükleme noktası kaydet';

  @override
  String get restorePointDefaultLabel => 'Elle kaydedildi';

  @override
  String get restorePointSaved => 'Geri yükleme noktası kaydedildi';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Tümünü göster ($nString)';
  }

  @override
  String get historyTitle => 'Geçmiş';

  @override
  String get historyNone => 'Henüz hiçbir şey olmadı.';

  @override
  String get historyStarted => 'Uyandı';

  @override
  String get historySlept => 'Uyku moduna geçti';

  @override
  String get historySleptIdle => 'Uyku moduna geçti (etkinlik yok)';

  @override
  String get historyRestarted => 'Yeniden başlatıldı';

  @override
  String get historyReset => 'Sistem sıfırlandı';

  @override
  String get historyErased => 'Her şey silindi';

  @override
  String get historyCheckpointCreated => 'Bir geri yükleme noktası kaydedildi';

  @override
  String get historyCheckpointRestored =>
      'Bir geri yükleme noktası geri yüklendi';

  @override
  String historyStorageCleaned(String size) {
    return '$size alan açıldı';
  }

  @override
  String get historyStorageCleanedPlain => 'Alan açıldı';

  @override
  String historyProcessStopped(String name) {
    return '$name durduruldu';
  }

  @override
  String get historyUpdated => 'Ayarlarını değiştirdi';

  @override
  String get historyYou => 'siz';

  @override
  String get yourDataTitle => 'Verileriniz';

  @override
  String get downloadAllFiles => 'Tüm dosyaları indir';

  @override
  String get downloadAllFilesHelp =>
      'Çalışma alanındaki her şeyin bir .zip dosyası';

  @override
  String get downloadNothing => 'Henüz indirilecek dosya yok.';

  @override
  String get deleteComputerHelp =>
      'Kendisini ve geri yükleme noktalarını kaldırır';

  @override
  String get manageComputer => 'Yönet';

  @override
  String get restartComputer => 'Yeniden başlat';

  @override
  String get resetComputerMenu => 'Sıfırla…';

  @override
  String get moreFixes => 'Diğer düzeltmeler';

  @override
  String durationMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString dk.';
  }

  @override
  String durationHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString sa.';
  }

  @override
  String durationDays(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString g.';
  }

  @override
  String get remoteUpdateTitle => 'Casama\'yı güncelleme zamanı';

  @override
  String get remoteUpdateBody =>
      'Casama\'nın bu sürümü artık desteklenmiyor. Devam etmek için güncelleyin.';

  @override
  String get remoteUpdateNoLink =>
      'Casama\'nın bu sürümü artık desteklenmiyor. Yüklediğiniz yerden güncelleyin.';

  @override
  String get remoteMaintenanceTitle => 'Casama bakım nedeniyle kapalı';

  @override
  String get openLink => 'Aç';

  @override
  String get routineIdeas => 'Fikirler';

  @override
  String get routineIdeasHelp =>
      'Bir fikirle başlayın, ardından her şeyi değiştirin.';

  @override
  String get pluginDirectory => 'İncelenmiş eklentiler';

  @override
  String get pluginDirectoryHelp =>
      'Casama tarafından kontrol edildi ve kontrol edilen sürüme sabitlendi.';

  @override
  String get pluginOrPaste => 'Veya bir GitHub bağlantısından ekleyin';

  @override
  String byAuthor(String name) {
    return 'Geliştirici: $name';
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
  String get paywallBillingPeriod => 'Faturalandırma dönemi';

  @override
  String get paywallNotSoldTitle => 'Bu sunucuda plan yok';

  @override
  String get paywallNotSoldBody =>
      'Bu sunucu plan satmıyor, bu nedenle burada yükseltilecek bir şey yok.';

  @override
  String get paywallPlansFailedTitle => 'Planlar yüklenmedi';

  @override
  String get paywallPlansFailedBody =>
      'Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'App Store planları göstermiyor',
      'google_play': 'Google Play planları göstermiyor',
      'other': 'Mağaza planları göstermiyor',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Bu cihazda App Store\'a giriş yaptığınızdan emin olun, ardından tekrar deneyin.',
      'google_play': 'Bu cihazda Google Play\'e giriş yaptığınızdan emin olun, ardından tekrar deneyin.',
      'other': 'Bu cihazda mağazaya giriş yaptığınızdan emin olun, ardından tekrar deneyin.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return '%$pct oranına kadar tasarruf edin';
  }

  @override
  String get paywallMostPopular => 'En popüler';

  @override
  String get paywallTaglinePlus => 'Sizin için ve birkaç bot için';

  @override
  String get paywallTaglinePro =>
      'Yoğun çalışan bir kadro ve küçük bir ekip için';

  @override
  String get paywallTaglineMax => 'Tüm gün çalışan botlara sahip ekipler için';

  @override
  String get paywallPerMonthShort => '/ay';

  @override
  String paywallBilledYearly(String price) {
    return 'Yıllık $price faturalandırılır';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Aylık $price tutarına denk gelir';
  }

  @override
  String get paywallBilledMonthly => 'Aylık faturalandırılır';

  @override
  String get paywallBilledWeekly => 'Haftalık faturalandırılır';

  @override
  String get paywallPerWeekShort => '/hf';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'Haftalık $price tutarına denk gelir';
  }

  @override
  String get paywallBilledYearlyPlain => 'Yıllık faturalandırılır';

  @override
  String get paywallPerYearShort => '/yıl';

  @override
  String paywallStartTrial(int n) {
    return '$n günlük ücretsiz denemeyi başlat';
  }

  @override
  String paywallGetPlan(String plan) {
    return '$plan planına abone ol';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kişi',
      one: '1 kişi',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString bilgisayar saati';
  }

  @override
  String get billingChangePlan => 'Planı değiştir';

  @override
  String get billingChangePlanBody =>
      'Aylık veya yıllık her planı karşılaştırın.';

  @override
  String paywallWhatYouGet(String plan) {
    return '$plan ile sahip olduklarınız';
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
  String get updatesRow => 'Güncellemeler';

  @override
  String get updatesRowSubtitle => 'Çalışma alanınızdan haberler';

  @override
  String get updatesEmpty => 'Güncelleme yok';

  @override
  String get updatesEmptyHelp =>
      'Çalışma alanı bildirimleri ve yeni sayfalar burada görünür. Botlarınızın size gönderdikleri kendi sohbetlerindedir.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n öğe sizden yanıt bekliyor',
      one: '1 öğe sizden yanıt bekliyor',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'Üzerinde çalışılıyor: $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Şimdi değil: $title';
  }

  @override
  String openTopic(String title) {
    return '$title aç';
  }

  @override
  String get newTopic => 'Yeni konu';

  @override
  String get topics => 'Konular';

  @override
  String get olderTopics => 'Daha eski';

  @override
  String get generalChat => 'Genel';

  @override
  String get allTopics => 'Tüm konular';

  @override
  String get cardSecrets => 'Gizli anahtarlar';

  @override
  String get cardApproval => 'Onay';

  @override
  String get cardTakeover => 'Devral';

  @override
  String get cardDevice => 'Cihaz erişimi';

  @override
  String get cardSuggestion => 'Öneri';

  @override
  String get formBack => 'Geri';

  @override
  String get formNext => 'İleri';

  @override
  String get formSkip => 'Atla';

  @override
  String formStep(int n, int total) {
    return 'Soru $n / $total';
  }

  @override
  String get cardSuggestions => 'Öneriler';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Göz atmaya değer $n şey bulundu',
      one: 'Göz atmaya değer 1 şey bulundu',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Başladı: $when';
  }

  @override
  String get suggestionStartedPlain => 'Başladı';

  @override
  String get suggestionPutAway => 'Kenara alındı';

  @override
  String get suggestionExpired => 'Süresi doldu';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Süresi doldu: $title';
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
      other: '$nString dakika içinde süresi doluyor',
      one: '1 dakika içinde süresi doluyor',
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
      other: '$nString saat içinde süresi doluyor',
      one: '1 saat içinde süresi doluyor',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n öneri ele alındı',
      one: '1 öneri ele alındı',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Bu sunucuyu telefonunuzda kullanın';

  @override
  String get linkIntro =>
      'Bu sunucuya telefonunuzun her yerden ulaşabileceği bir adres verin. Alan adı ve yönlendirici ayarı gerekmez.';

  @override
  String get linkIntroDetails =>
      'Bu sunucuyu ücretsiz bir Casama Cloud hesabına bağlar. Telefonunuzun trafiği Cloudflare üzerinden doğrudan bu bilgisayara gider; hiçbir zaman Casama\'nın sunucularından geçmez.';

  @override
  String get linkTurnOn => 'Telefonunuzda kullanın';

  @override
  String get linkSignupsNote =>
      'Açıkken yeni kayıtlar kapanır. Yalnızca burada zaten hesabı olan kişiler giriş yapabilir.';

  @override
  String get linkStepSignIn => 'Bu sunucuyu bağla';

  @override
  String get linkSignInBody =>
      'Tarayıcınızda az önce açılan sayfada bu kodu onaylayın. Sayfanın aynı kodu gösterdiğini kontrol edin.';

  @override
  String get linkSignInOpen => 'Sayfayı tekrar aç';

  @override
  String get linkStepAddress => 'Bir adres al';

  @override
  String get linkStepRestart => 'Sunucuyu yeniden başlat';

  @override
  String get linkStepConnect => 'Bağlan';

  @override
  String get linkStateOnline => 'Çevrimiçi';

  @override
  String get linkStateStarting => 'Başlatılıyor';

  @override
  String get linkStateOffline => 'Çevrimdışı';

  @override
  String get linkStateAttention => 'İlgi gerekiyor';

  @override
  String get linkStateOff => 'Kapalı';

  @override
  String get linkAddress => 'Adres';

  @override
  String get linkLocalAddress => 'Bu bilgisayarda';

  @override
  String get linkShowCode => 'Giriş kodunu göster';

  @override
  String get linkCheck => 'Tekrar kontrol et';

  @override
  String get linkTurnOff => 'Kapat';

  @override
  String get linkTurnOffConfirm =>
      'Uzaktan erişim kapatılsın mı? Adres çalışmayı durdurur ve siz tekrar açana kadar telefonlar bu sunucuyu kaybeder. Aynı adresi geri alır.';

  @override
  String get linkTurningOff => 'Kapatılıyor';

  @override
  String get linkNeedsOwner => 'Bunu yalnızca bu sunucunun sahibi açabilir.';

  @override
  String get linkTwoStepTip =>
      'Bu sunucuya artık internetten ulaşılabilir. İki adımlı giriş, tahmin edilen bir parolanın yeterli olmaması demektir.';

  @override
  String get linkProblemNotLinked =>
      'Bu sunucu Casama Cloud\'a bağlı değil. Bağlamak için tekrar açın.';

  @override
  String get linkProblemCloudUnreachable =>
      'Şu anda Casama Cloud\'a ulaşılamıyor. Adres çalışıyorduysa hâlâ çalışıyordur.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud artık bu sunucunun anahtarını kabul etmiyor. Bağlamak için tekrar açın.';

  @override
  String get linkProblemSuspended =>
      'Casama Cloud bu sunucu için uzaktan erişimi kapattı.';

  @override
  String get linkProblemRemoved =>
      'Bu sunucu Casama Cloud\'daki çalışma alanından kaldırıldı. Bağlamak için tekrar açın.';

  @override
  String get linkProblemPlanLimit =>
      'Casama Cloud planınız daha az sunucu bağlar. Oradan birini kaldırın veya planınızı yükseltin.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud\'da artık bu sunucu için bir adres yok. Tekrar açın.';

  @override
  String get linkProblemAddressChanged =>
      'Bu sunucunun adresi değişti. Yenisini kullanmak için tekrar açın.';

  @override
  String get connectProblemConnectorMissing =>
      'Bağlayıcı çalışmıyor. Docker\'ın çalıştığını kontrol edin, ardından tekrar kontrol edin.';

  @override
  String get connectProblemConnectorBlocked =>
      'Bu ağ bağlantıyı engelliyor. Genellikle bir VPN veya katı bir güvenlik duvarı buna neden olur (giden bağlantı noktası 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Her şey bağlı ancak adres henüz yanıt vermiyor. Yeni bir adres bir dakika sürebilir.';

  @override
  String get linkServers => 'Bağlı sunucular';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Planınız $limit sunucu bağlar.',
      one: 'Planınız 1 sunucu bağlar.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'Henüz bağlı sunucu yok. Kendi sunucunuzda Ayarlar\'ı, ardından Casama Link\'i açın.';

  @override
  String linkServerRemoveConfirm(String name) {
    return '$name kaldırılsın mı? Adresi çalışmayı durdurur. Sunucu daha sonra tekrar bağlanabilir.';
  }

  @override
  String get linkStatusActive => 'Adresi var';

  @override
  String get linkStatusParked => 'Son zamanlarda görülmedi';

  @override
  String get linkStatusSuspended => 'Askıya alındı';

  @override
  String get pairDevice => 'Başka bir cihazda giriş yap';

  @override
  String get pairDeviceRow => 'Telefonunuzun tarayacağı bir kod göster';

  @override
  String get pairDeviceHelp =>
      'Bunu telefonunuzun kamerasıyla tarayın. Veya telefondaki Casama\'da: Giriş yap, ardından Kod tara.';

  @override
  String get pairDeviceWarning =>
      'Tarayan herkes sizin adınıza giriş yapar. Birkaç dakikalığına bir kez çalışır.';

  @override
  String pairDeviceServer(String host) {
    return '$host sunucusuna giriş yapar';
  }

  @override
  String get pairDeviceNewCode => 'Yeni kod';

  @override
  String get pairDeviceExpired => 'Bu kodun süresi doldu.';

  @override
  String get pairDeviceNotReachable =>
      'Bu sunucu yalnızca bu bilgisayarda yanıt veriyor, bu yüzden telefon henüz ulaşamıyor.';

  @override
  String get pairDeviceNotReachableOther =>
      'Bu sunucunun adresi yalnızca kendi ağında çalışır. Başkalarının ulaşabileceği bir adres için onu yöneten kişiye sorun.';

  @override
  String get pairDeviceCopyLink => 'Bağlantıyı kopyala';

  @override
  String get pairDeviceLinkCopied =>
      'Bağlantı kopyalandı. Chrome için Casama\'ya veya başka bir cihaza yapıştırın.';

  @override
  String get pairDeviceConnectChrome => 'Chrome\'u bağla';

  @override
  String get pairDeviceChromeDone => 'Chrome için Casama giriş yaptı.';

  @override
  String get pairDeviceChromeFinish =>
      'Açılan Chrome için Casama sekmesinde tamamlayın.';

  @override
  String get pairDeviceChromeMissing =>
      'Chrome için Casama bu tarayıcıda kurulu değil.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Chrome için Casama giriş yapamadı. $error';
  }

  @override
  String get scanToSignIn => 'Bilgisayarınızdan bir kod tarayın';

  @override
  String get scanToSignInTitle => 'Kodu tarayın';

  @override
  String get scanToSignInHelp =>
      'Giriş yaptığınız bir bilgisayarda Ayarlar\'ı, ardından Başka bir cihazda giriş yap\'ı açın.';

  @override
  String pairSignInTo(String host) {
    return '$host sunucusuna giriş yapılsın mı?';
  }

  @override
  String get pairSignInBody =>
      'Bu kod bu cihazı, kodu gösteren hesapla giriş yapar.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'Bu cihaz şu anda $current kullanıyor. $host sunucusuna giriş yapmak onu değiştirir.';
  }

  @override
  String get pairSigningIn => 'Giriş yapılıyor';

  @override
  String get pairCodeInvalid =>
      'Bu kod artık geçerli değil. Yeni bir tane gösterin ve tekrar tarayın.';

  @override
  String get pairLinkInvalid => 'Bu bir Casama giriş kodu değil.';

  @override
  String get linkServerTitle => 'Sunucu bağla';

  @override
  String linkServerBody(String name) {
    return '$name Casama Cloud hesabınıza bağlanmak istiyor.';
  }

  @override
  String get linkServerCode => 'Sunucudaki kod';

  @override
  String get linkServerCheck =>
      'Yalnızca bunu kendi sunucunuzda başlattıysanız ve aynı kodu gösteriyorsa bağlayın.';

  @override
  String get linkServerWhat =>
      'Herkese açık bir adres alır ve size bildirim gönderebilir. Kredilerinizi harcayamaz.';

  @override
  String get linkServerApprove => 'Bağla';

  @override
  String get linkServerDone => 'Bağlandı';

  @override
  String linkServerDoneBody(String name) {
    return '$name sunucusuna geri dönün. Kendi kendine devam eder.';
  }

  @override
  String get linkServerInvalid =>
      'Bu kod artık geçerli değil. Sunucunuzda yeniden başlatın.';

  @override
  String get linkServerEnterCode => 'Sunucunuzun gösterdiği kod';

  @override
  String get linkServerFind => 'Bul';

  @override
  String get linkServerNeedAdmin =>
      'Yalnızca bir çalışma alanının sahipleri ve yöneticileri sunucu bağlayabilir.';

  @override
  String get localDockerStopped =>
      'Docker çalışmıyor, bu yüzden sunucunuz durduruldu';

  @override
  String get localDockerStoppedBody =>
      'Casama sunucunuz bu bilgisayarda Docker içinde çalışır. Docker\'ı açın; sunucu geri döndüğünde Casama kendiliğinden yeniden bağlanır, bu bir dakika sürebilir.';

  @override
  String get serverOfflineTitle => 'Sunucunuz çevrimdışı';

  @override
  String get serverOfflineBody =>
      'Onu çalıştıran bilgisayar açık ve uyanık mı? Bu kendi kendine yeniden bağlanır.';

  @override
  String get signUpsClosed =>
      'Bu sunucu yeni hesap almıyor. Burada zaten sahip olduğunuz bir hesapla giriş yapın.';

  @override
  String get signUpsByInvitation =>
      'Burada yeni hesaplar davetiye ile açılır. Davet edildiğiniz e-posta adresini kullanın.';

  @override
  String get linkPrivateNotifications => 'Özel bildirimler';

  @override
  String get linkPrivateNotificationsHelp =>
      'Bildirimler telefonunuza Casama Cloud üzerinden ulaşır. Bu açıkken metin taşımazlar ve yalnızca \"Yeni etkinlik\" derler; geri kalanını uygulama bu sunucudan yükler.';

  @override
  String get linkInvites => 'Davet edilen kişilerin kaydolmasına izin ver';

  @override
  String get linkInvitesHelp =>
      'Kapalı: kimse yeni hesap açamaz. Açık: e-posta ile davet ettiğiniz kişiler açabilir. Bunu değiştirmek sunucuyu yeniden başlatır.';

  @override
  String get linkKeepAwake => 'Prize takılıyken bu Mac\'i uyanık tut';

  @override
  String get linkKeepAwakeHelp =>
      'Telefonlar bu sunucuya yalnızca bu bilgisayar uyanıkken ve Casama açıkken ulaşabilir.';

  @override
  String get linkLiveView => 'Buradan uzaktayken canlı görünüm';

  @override
  String get linkLiveViewIncluded =>
      'Planınıza dahildir. Bu bilgisayardan uzaktayken bir botun ekranı Casama Cloud\'un aktarımı üzerinden canlı oynatılır.';

  @override
  String get linkLiveViewPlan =>
      'Casama Cloud\'da Plus ve üzeri planlarla gelir. Bu bilgisayardan uzaktayken botun ekranını yaklaşık saniyede bir görürsünüz. Bu bilgisayarda her zaman canlıdır.';

  @override
  String get liveAwayNeedsPlan =>
      'Sunucunun bilgisayarından uzaktayken canlı video Casama Cloud\'da Plus ve üzeri planlarla gelir. O zamana kadar ekran yaklaşık saniyede bir güncellenir.';

  @override
  String get chatShareExport => 'Paylaş veya dışa aktar';

  @override
  String get chatShareExportHelp =>
      'Bu sohbeti dosya olarak kaydedin veya salt okunur bir bağlantı oluşturun.';

  @override
  String get chatExportMarkdown => 'Markdown olarak dışa aktar';

  @override
  String get chatExportMarkdownHelp =>
      'Herkesin okuyabileceği bir metin dosyası';

  @override
  String get chatExportJson => 'JSON olarak dışa aktar';

  @override
  String get chatExportJsonHelp => 'Diğer uygulamalar ve betikler için';

  @override
  String get chatShareLink => 'Salt okunur bağlantı paylaş';

  @override
  String get chatShareLinkHelp =>
      'Bağlantıya sahip herkes bu sohbeti okuyabilir';

  @override
  String get chatStopSharing => 'Bağlantıyı paylaşmayı durdur';

  @override
  String get chatStopSharingHelp => 'Bağlantı çalışmayı durdurur';

  @override
  String get chatMakePublicTitle => 'Bu sohbet bağlantıyla paylaşılsın mı?';

  @override
  String get chatMakePublicBody =>
      'Bağlantıya sahip herkes bu sohbeti sizin gördüğünüz gibi okuyabilir. Ekli dosyalar adıyla listelenir, paylaşılmaz. İstediğiniz zaman durdurabilirsiniz.';

  @override
  String get chatMakePublic => 'Bağlantı oluştur';

  @override
  String get chatLinkTitle => 'Salt okunur bağlantı';

  @override
  String get chatLinkBody =>
      'Kopyalandı. Arama motorlarında listelenmez. Yeni bir bağlantı oluşturmak bu bağlantıyı durdurur.';

  @override
  String get chatSharingStopped => 'Bağlantı artık çalışmıyor';

  @override
  String get creationDuplicate => 'Çoğalt';

  @override
  String creationDuplicated(String title) {
    return 'Kopya oluşturuldu: “$title”';
  }

  @override
  String get slackInstall => 'Slack\'e ekle';

  @override
  String slackInstallHelp(String bot) {
    return 'Tek adımda bir Slack çalışma alanı bağlayın. $bot orada @bahsetmeleri ve doğrudan mesajları yanıtlar.';
  }

  @override
  String get slackInstallFinish =>
      'Slack\'te tamamlayın, ardından buraya geri dönün.';

  @override
  String get helpAndSupport => 'Yardım ve destek';

  @override
  String get helpAndSupportRow =>
      'Casama Yardım\'a sorun, bize yazın, kılavuzlar';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Kılavuzlarımızdan ve hesabınızdan anında yanıtlar. Bir kişi tek dokunuş uzağınızda.';

  @override
  String get supportIntro =>
      'Sorularınız, bir satın almayla ilgili sorununuz veya çalışmayan bir şey mi var? Bize yazın.';

  @override
  String supportSelfHosted(String host) {
    return 'Çalışma alanınız $host üzerinde çalışıyor. Oturum açma, hesaplar ve planlar için o sunucuyu yöneten kişiye sorun. Uygulamanın kendisiyle ilgili konularda yardımcı olabiliriz.';
  }

  @override
  String get supportTalkToPerson => 'Bir kişiyle konuş';

  @override
  String get contactSupport => 'Desteğe ulaş';

  @override
  String contactSupportRow(String email) {
    return '$email adresinden ekibimize yazın';
  }

  @override
  String get sendFeedback => 'Geri bildirim gönder';

  @override
  String get sendFeedbackRow =>
      'Fikirler, beğendikleriniz ve beğenmedikleriniz. Her birini okuyoruz.';

  @override
  String get feedbackHelp =>
      'Casama\'nın ne yapmasını istediğinizi, neleri sevdiğinizi veya nelerin önünüze engel çıktığını bize anlatın.';

  @override
  String get feedbackKindPrompt => 'Ne tür bir geri bildirim?';

  @override
  String get feedbackKindIdea => 'Fikir';

  @override
  String get feedbackKindLike => 'Beğendim';

  @override
  String get feedbackKindDislike => 'Beğenmedim';

  @override
  String get feedbackKindConfusing => 'Kafa karıştırıcı';

  @override
  String get feedbackMessageLabel => 'Geri bildiriminiz';

  @override
  String get feedbackMessageHint =>
      'Örneğin: Keşke bir sohbeti en üste sabitleyebilseydim.';

  @override
  String get feedbackContactOk =>
      'Casama bu konuda benimle iletişime geçebilir';

  @override
  String get feedbackContactOkHelp =>
      'Size e-posta ile bir soru sorabilir veya tamamlandığında haber verebiliriz.';

  @override
  String get feedbackNote =>
      'Uygulama sürümünüz ve planınız bununla birlikte gönderilir. Hesabınız veya bir satın alma ile ilgili sorununuz mu var? Bunun yerine Desteğe ulaş seçeneğini kullanın.';

  @override
  String get feedbackThanks => 'Teşekkürler! Her birini okuyoruz.';

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
  String get supportIdeasBoard => 'Fikir panosu';

  @override
  String get supportIdeasBoardHelp =>
      'Başkalarının neler istediğini görün ve sırada ne olmasını istiyorsanız ona oy verin';

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
      'Neler olduğunu anlatın. E-posta ile yanıt vereceğiz.';

  @override
  String get contactSupportHelpMail =>
      'Neler olduğunu anlatın. Bu işlem ayrıntıları doldurulmuş şekilde e-posta uygulamanızı açar.';

  @override
  String get supportSend => 'Gönder';

  @override
  String get supportWriteEmail => 'E-postayı aç';

  @override
  String get supportTopicPrompt => 'Konu nedir?';

  @override
  String get supportTopicBilling => 'Faturalandırma ve satın almalar';

  @override
  String get supportTopicBroken => 'Bir şey çalışmıyor';

  @override
  String get supportTopicAccount => 'Hesap ve oturum açma';

  @override
  String get supportTopicQuestion => 'Bir soru veya fikir';

  @override
  String get supportTopicOther => 'Başka bir şey';

  @override
  String get supportMessageLabel => 'Mesajınız';

  @override
  String get supportMessageHint => 'Ne oldu ve ne bekliyordunuz?';

  @override
  String get supportMessageMore =>
      'Bir iki cümle ekleyin: Ne yapıyordunuz ve ne ters gitti?';

  @override
  String get supportIncludeChat => 'Casama Yardım ile olan konuşmamı dahil et';

  @override
  String get supportIncludeChatHelp =>
      'Böylece aynı şeyi iki kez anlatmak zorunda kalmazsınız.';

  @override
  String get supportDetailsNote =>
      'Hesabınızı bulabilmemiz için uygulama sürümünüz ile çalışma alanı ve hesap kimliklerinizi ekleriz. Sohbetlerinizi asla eklemeyiz.';

  @override
  String get supportSentTitle => 'Mesaj gönderildi';

  @override
  String supportSentBody(String email, String reference) {
    return '$email adresine yanıt vereceğiz. Referans numaranız: $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'E-posta uygulaması bulunamadığı için mesajınızı kopyaladık. $email adresine göndereceğiniz bir e-postaya yapıştırın.';
  }

  @override
  String get supportGuides => 'Kılavuzlar ve SSS';

  @override
  String get supportGuidesHelp => 'Casama\'daki her şey için adım adım yardım';

  @override
  String get introVideoTitle => 'Casama\'nın nasıl çalıştığını görün';

  @override
  String get introVideoSubtitle => '1,5 dakikalık bir video';

  @override
  String get supportIntroVideo => 'Tanıtım videosunu izle';

  @override
  String get introVideoFailed =>
      'Video oynatılamadı. Bağlantınızı kontrol edip yeniden deneyin.';

  @override
  String get introVideoOnYoutube => 'YouTube\'da izle';

  @override
  String get introVideoReplay => 'Tekrar oynat';

  @override
  String get supportIntroVideoHelp =>
      'Casama\'nın 1,5 dakikada neler yapabileceğini görün';

  @override
  String get supportRate => 'Casama\'yı değerlendir';

  @override
  String get supportRateHelp =>
      'Mağaza sayfasında başkalarına düşüncelerinizi anlatın';

  @override
  String get supportIds => 'Destek kimlikleri';

  @override
  String get supportIdsHelp =>
      'Destek ekibi bunları isteyebilir. Hesabınızı ve satın almalarınızı bulmaya yararlar, kimseye erişim vermezler.';

  @override
  String supportWorkspaceId(String name) {
    return 'Çalışma alanı kimliği · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'Ayrıca App Store ve Google Play\'deki satın alma kimliğinizdir';

  @override
  String get supportAccountId => 'Hesap kimliği';

  @override
  String get supportCopyAll => 'Tüm ayrıntıları kopyala';

  @override
  String get supportCopyAllHelp =>
      'Bir mesaja yapıştırmak üzere uygulama sürümü, platform ve kimlikler';

  @override
  String get supportNewChat => 'Yeni konuşma';

  @override
  String get supportAskHint => 'Casama hakkında her şeyi sorun';

  @override
  String get supportAiNote =>
      'Casama Yardım bir yapay zekadır ve hata yapabilir. Sohbetlerinizi değil, planınızı ve bot hatalarını görür.';

  @override
  String get supportGreeting =>
      'Merhaba! Ben Casama Yardım. Bana Casama, planınız veya yaşadığınız bir sorun hakkında soru sorabilirsiniz. Çözemezsem konuyu destek ekibimize aktarırım.';

  @override
  String get supportStarterPurchase => 'Satın alma işlemim gerçekleşmedi';

  @override
  String get supportStarterCancel => 'Planımı nasıl iptal edebilirim?';

  @override
  String get supportStarterBot => 'Botum yanıt vermiyor';

  @override
  String get supportStarterHowTo => 'Botlarım neler yapabilir?';

  @override
  String get supportAskPerson => 'Bir kişiye sor';

  @override
  String get supportHandoffTitle => 'Bu, destek ekibimize gönderilsin mi?';

  @override
  String get supportHandoffButton => 'İncele ve gönder';

  @override
  String get supportThinking => 'İnceleniyor…';

  @override
  String get supportAssistantError =>
      'Casama Yardım yanıt veremedi. Yeniden deneyin veya bir kişiye sorun.';

  @override
  String get supportAssistantLimit =>
      'Casama Yardım şu anda daha fazla yanıt veremiyor. Bir kişi yardımcı olabilir.';

  @override
  String get purchaseHelp => 'Satın almayla ilgili sorun mu var? Yardım al';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Bildir';

  @override
  String get reportAndBlock => 'Bildir ve engelle';

  @override
  String get reportReply => 'Yanıtı bildir';

  @override
  String get reportBot => 'Botu bildir';

  @override
  String get reportBotRow =>
      'Adında, açıklamasında veya yanıtlarında bir sorun var';

  @override
  String get reportPerson => 'Kişiyi bildir';

  @override
  String get reportGalleryItem => 'Galeri öğesini bildir';

  @override
  String get reportGalleryRequest => 'İsteği bildir';

  @override
  String get reportWorkspace => 'Çalışma alanını bildir';

  @override
  String get reportHelp =>
      'Bu sunucuyu yöneten kişilere sorunun ne olduğunu anlatın. Her bildirimi incelerler.';

  @override
  String get reportPersonHelp =>
      'Bu sunucuyu yöneten kişilere ne olduğunu anlatın. Bu kişiyi sizin için engelleyeceğiz de.';

  @override
  String get reportNote =>
      'Bilmeleri gereken başka bir şey var mı (isteğe bağlı)';

  @override
  String reportAlsoBlock(String name) {
    return '$name kişisini de engelle';
  }

  @override
  String get reportSent =>
      'Teşekkürler. Bildiriminiz incelenmek üzere gönderildi.';

  @override
  String get reportReasonSpam => 'Spam veya dolandırıcılık';

  @override
  String get reportReasonSexual => 'Cinsel içerik';

  @override
  String get reportReasonViolence => 'Şiddet veya tehditler';

  @override
  String get reportReasonHarassment => 'Taciz veya nefret söylemi';

  @override
  String get reportReasonIllegal => 'Yasa dışı veya tehlikeli';

  @override
  String get reportReasonImpersonation => 'Başka birini taklit etme';

  @override
  String get reportReasonOther => 'Başka bir şey';

  @override
  String get thisPerson => 'bu kişi';

  @override
  String blockPerson(String name) {
    return '$name kişisini engelle';
  }

  @override
  String blocked(String name) {
    return '$name engellendi';
  }

  @override
  String get blockHelp =>
      'Engellenen kişiler sizi bir çalışma alanına davet edemez ve onlardan haber almazsınız.';

  @override
  String get blockedPeople => 'Engellenen kişiler';

  @override
  String get blockedPeopleRow =>
      'Sizi davet edemeyen veya size ulaşamayan kişiler';

  @override
  String get noBlockedPeople => 'Kimse engellenmedi';

  @override
  String get unblock => 'Engeli kaldır';

  @override
  String get emailTips => 'E-posta ile ipuçları ve haberler';

  @override
  String get emailTipsHelp =>
      'Başlangıç ipuçları ve ara sıra güncellemeler. Planınız ve hesabınızla ilgili e-postalar her zaman gelir.';

  @override
  String get reportsInApp => 'Uygulamada bildirilenler';

  @override
  String get reportsNone =>
      'Açık bildirim yok. Kişilerin uygulamadan gönderdiği bildirimler burada görünür.';

  @override
  String get reportsPublicLinks => 'Bildirilen herkese açık bağlantılar';

  @override
  String get reportsNoLinks => 'Hiçbir herkese açık bağlantı bildirilmedi.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bildirim',
      one: '1 bildirim',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Yayından kaldır';

  @override
  String get reportsRestore => 'Geri yükle';

  @override
  String get reportKindReply => 'Bot yanıtı';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Kişi';

  @override
  String get reportKindGallery => 'Galeri öğesi';

  @override
  String get reportKindWorkspace => 'Çalışma alanı';

  @override
  String get reportMarkActioned => 'İlgilenildi';

  @override
  String reportSuspendWorkspace(String name) {
    return '$name çalışma alanını askıya al';
  }

  @override
  String get reportDismiss => 'Reddet: sorun yok';

  @override
  String get supportWebTitle => 'Web sitesindeki Casama Yardım';

  @override
  String get supportWebOn => 'Açık';

  @override
  String get supportWebOff => 'Kapalı';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count IP adresi duraklatıldı',
      one: '1 IP adresi duraklatıldı',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return 'Yanıtlanmamış $count soruyu göster';
  }

  @override
  String get ticketsOpen => 'Açık';

  @override
  String get ticketsClosed => 'Kapalı';

  @override
  String get ticketsAll => 'Tümü';

  @override
  String get ticketsNone => 'Burada mesaj yok.';

  @override
  String get ticketClose => 'Kapat';

  @override
  String get ticketReopen => 'Yeniden aç';

  @override
  String get serviceStatus => 'Durum';

  @override
  String get supportStatus => 'Casama Cloud durumu';

  @override
  String get supportStatusHelp =>
      'Şu anda bir şeyin çalışmıyor olup olmadığını kontrol edin';

  @override
  String get galleryChatSuggestionLabel => 'Galeriden';

  @override
  String get galleryChatAdd => 'Ekle';

  @override
  String galleryChatAdded(String name) {
    return '$name eklendi';
  }

  @override
  String galleryChatReads(String things) {
    return 'Okudukları: $things';
  }

  @override
  String get galleryChatRunsCode => 'Kod çalıştırır';

  @override
  String get galleryChatComputer => 'Bilgisayar kullanır';

  @override
  String galleryChatNeeds(String apps) {
    return 'Gerekenler: $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Beceri taslağı';

  @override
  String get galleryChatShowInstructions => 'Talimatları göster';

  @override
  String get galleryChatHideInstructions => 'Talimatları gizle';

  @override
  String get galleryChatSaveSkill => 'Becerilerime kaydet';

  @override
  String get galleryChatSaved => 'Kaydedildi';

  @override
  String get galleryChatSavedSkill => 'Becerilerinize kaydedildi';

  @override
  String get galleryChatSubmit => 'Galeriye gönder';

  @override
  String galleryChatSubmitTitle(String name) {
    return '$name galeriye gönderilsin mi?';
  }

  @override
  String get galleryChatSubmitBody =>
      'Önce bir bakımcı inceler. Eklendikten sonra herkes onu bulup kullanabilir. Yazar olarak e-postanız değil, görünen adınız gösterilir.';

  @override
  String get galleryChatSent => 'Gönderildi';

  @override
  String get galleryChatSubmitted => 'İncelenmek üzere galeriye gönderildi';

  @override
  String get galleryChatSubmissionsOff =>
      'Bu sunucu galeri gönderimlerini kabul etmiyor.';

  @override
  String get galleryPicksTitle => 'Sizin için seçtiklerimiz';

  @override
  String get galleryPicksHelp =>
      'Size uyan bir dizi beceri, uygulama ve rutinle başlayın. Daha sonra her şeyi değiştirebilirsiniz.';

  @override
  String get galleryPicksAdd => 'Bu seti ekle';

  @override
  String get galleryPicksSkip => 'Şimdilik atla';

  @override
  String galleryPicksAddNamed(String name) {
    return '$name öğesini ekle';
  }

  @override
  String get galleryPicksBestMatch => 'En iyi eşleşme';

  @override
  String get galleryPicksInside => 'İçindekiler';

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
      other: '$count beceri',
      one: '1 beceri',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rutin',
      one: '1 rutin',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uygulama',
      one: '1 uygulama',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksPlugins(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count eklenti',
      one: '1 eklenti',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görünüm teması',
      one: '1 görünüm teması',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return '$name eklendi';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return '$name eklendi. Tamamlamak için Uygulamalar bölümünden şunları bağlayın: $apps.';
  }

  @override
  String galleryPicksPending(String name) {
    return '$name eklenmeden önce bir yönetici tarafından incelenecek.';
  }

  @override
  String get galleryPolicyTitle => 'Galeri';

  @override
  String get galleryPolicyRow =>
      'Buradaki kişilerin galeriden ekleyebileceği şeyler';

  @override
  String get galleryPolicyMode => 'Kimler ekleyebilir';

  @override
  String get galleryPolicyOpen => 'Açık';

  @override
  String get galleryPolicyOpenHelp =>
      'Buradaki herkes engellenmemiş her şeyi ekleyebilir.';

  @override
  String get galleryPolicyApproval => 'Önce sor';

  @override
  String get galleryPolicyApprovalHelp =>
      'Aşağıda seçtikleriniz eklenmeden önce bir yöneticinin onayı istenir.';

  @override
  String get galleryPolicyAllowlist => 'Yalnızca izin verilenler';

  @override
  String get galleryPolicyAllowlistHelp =>
      'Kişiler yalnızca izin verilenler listesindekileri ekleyebilir.';

  @override
  String get galleryPolicyApprovalFor => 'Şunlar için önce sor';

  @override
  String get galleryPolicyRunsCode => 'Kod çalıştıran şeyler';

  @override
  String get galleryPolicyApps => 'Uygulamaları bağlayan şeyler';

  @override
  String get galleryPolicyAll => 'Her şey';

  @override
  String get galleryPolicyAllowed => 'İzin verilenler';

  @override
  String get galleryPolicyAllowedHelp =>
      'Sorulmadan eklenir. Yalnızca izin verilenler seçeneğiyle, kişilerin ekleyebileceği tek şeyler bunlardır.';

  @override
  String get galleryPolicyBlocked => 'Engellenenler';

  @override
  String get galleryPolicyBlockedHelp => 'Buradaki kimse bunları ekleyemez.';

  @override
  String get galleryPolicyAddItem => 'Galeriden ekle';

  @override
  String get galleryPolicyNone => 'Henüz bir şey yok';

  @override
  String get galleryPolicySearch => 'Galeride ara';

  @override
  String get galleryPolicyNoResults => 'Galeride eşleşen bir şey yok.';

  @override
  String get galleryPolicySaved => 'Galeri kuralları kaydedildi';

  @override
  String galleryPolicyRemove(String name) {
    return '$name öğesini kaldır';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Bunu yalnızca yöneticiler ve sahipler değiştirebilir.';

  @override
  String get galleryPolicyWaiting => 'Onay bekliyor';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name istedi';
  }

  @override
  String get galleryPolicyApprove => 'Onayla';

  @override
  String get galleryPolicyDecline => 'Reddet';

  @override
  String galleryPolicyApproved(String name) {
    return '$name onaylandı ve eklendi';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name reddedildi';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Onaylandı ancak $name eklenemedi. $error';
  }

  @override
  String get galleryDigestEmails => 'Aylık galeri seçkileri';

  @override
  String get galleryDigestHelp =>
      'Ayda bir kez, kullandıklarınıza uyan en fazla altı yeni beceri, uygulama ve rutin.';

  @override
  String get newsletterTitle => 'Casama\'nın aylık e-postası';

  @override
  String get newsletterHelp =>
      'Yenilikler ve sırada neler olduğu, en fazla ayda bir kez.';

  @override
  String get newsletterSignUp =>
      'Casama\'nın aylık e-postasını almak istiyorum: yenilikler ve sırada neler olduğu, en fazla ayda bir kez.';

  @override
  String get newsletterCardTitle =>
      'Casama\'nın aylık e-postasını almak ister misiniz?';

  @override
  String get newsletterCardBody =>
      'Yenilikler ve sırada neler olduğu, en fazla ayda bir kez. İstediğiniz zaman bırakabilirsiniz.';

  @override
  String get newsletterCardYes => 'Evet, gönder';

  @override
  String get newsletterCardNo => 'Hayır, teşekkürler';

  @override
  String get newsletterCardDone =>
      'Listeye eklendiniz. Ayarlar\'dan istediğiniz zaman kapatabilirsiniz.';

  @override
  String get galleryKindApp => 'Uygulama';

  @override
  String get galleryKindApps => 'Uygulamalar';

  @override
  String get galleryKindBot => 'Başlangıç botu';

  @override
  String get galleryKindBots => 'Başlangıç botları';

  @override
  String get galleryKindRoutine => 'Rutin';

  @override
  String get galleryKindRoutines => 'Rutinler';

  @override
  String get galleryKindPlugin => 'Eklenti';

  @override
  String get galleryKindPlugins => 'Eklentiler';

  @override
  String get galleryKindSet => 'Başlangıç seti';

  @override
  String get galleryKindSets => 'Başlangıç setleri';

  @override
  String get galleryTabBrowse => 'Göz at';

  @override
  String get galleryTabInstalled => 'Yüklü';

  @override
  String get gallerySearchEverything => 'Her şeyde ara';

  @override
  String get galleryNewBadge => 'Yeni';

  @override
  String get galleryRowPicks => 'Seçkiler';

  @override
  String get galleryRowNew => 'Yeni';

  @override
  String get galleryRowTrending => 'Bu hafta öne çıkanlar';

  @override
  String get galleryRowMostUsed => 'En çok kullanılanlar';

  @override
  String get galleryRowWorksWith => 'Sahip olduklarınızla çalışır';

  @override
  String get galleryRowSets => 'Başlangıç setleri';

  @override
  String get galleryRowSeasonal => 'Dönemsel';

  @override
  String get galleryFilterFree => 'Ücretsiz';

  @override
  String get galleryFilterPlan => 'Kredi kullanır';

  @override
  String get galleryFilterSelfHosted => 'Kendi sunucunuzda çalışır';

  @override
  String get galleryFilterComputer => 'Bilgisayar gerekir';

  @override
  String get galleryNoFilterMatches => 'Bu filtrelerle eşleşen bir şey yok';

  @override
  String get galleryClearFilters => 'Filtreleri temizle';

  @override
  String get galleryRequestThis => 'Bunu iste';

  @override
  String get galleryAskCasama => 'Casama\'dan yapmasını iste';

  @override
  String galleryAskPrompt(String query) {
    return 'Bunun için bana bir şey oluştur: $query';
  }

  @override
  String get galleryAccessTitle => 'Nelere erişebilir';

  @override
  String galleryAccessReads(String things) {
    return 'Okudukları: $things';
  }

  @override
  String get galleryAccessRunsCode => 'Kod çalıştırır';

  @override
  String get galleryAccessComputer => 'Bilgisayar kullanır';

  @override
  String get galleryAccessNothing =>
      'Size ait hiçbir şeyi okumaz veya değiştirmez';

  @override
  String get galleryCreditsNone => 'Kredi kullanmaz';

  @override
  String get galleryCreditsLow => 'Az kredi kullanır';

  @override
  String get galleryCreditsMedium => 'Orta düzeyde kredi kullanır';

  @override
  String get galleryCreditsHigh => 'Çok kredi kullanır';

  @override
  String get galleryTryIt => 'Dene';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$shown kişi tarafından kullanılıyor',
      one: '1 kişi tarafından kullanılıyor',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return 'Çalıştırmaların tamamlanma oranı: %$percent';
  }

  @override
  String get galleryAbout => 'Hakkında';

  @override
  String get galleryMadeByCasama => 'Casama yapımı';

  @override
  String get galleryMadeByCommunity => 'Topluluk yapımı';

  @override
  String get galleryMadeReviewed => 'İncelenmiş';

  @override
  String get galleryReviewedHelp => 'Bu sürüm için testleri geçti';

  @override
  String galleryMoreFrom(String name) {
    return '$name tarafından daha fazlası';
  }

  @override
  String galleryVersion(int version) {
    return 'Sürüm $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Güncelleme: $date';
  }

  @override
  String galleryRemixOf(String name) {
    return '$name uyarlaması';
  }

  @override
  String galleryChangesTitle(String name) {
    return '$name içindeki değişiklikler';
  }

  @override
  String get galleryBreaking => 'Farklı çalışır';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Galeride $count öğe',
      one: 'Galeride 1 öğe',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty => 'Bu yazarın galeride henüz bir öğesi yok.';

  @override
  String get galleryInstalledWorkspace => 'Bu çalışma alanında';

  @override
  String get galleryInstalledDevice => 'Bu cihazdaki temalar';

  @override
  String get galleryInstalledEmptyTitle => 'Henüz bir şey eklenmedi';

  @override
  String get galleryInstalledEmpty =>
      'Galeriden eklediğiniz beceriler, uygulamalar, rutinler ve görünüm temaları güncellemeleriyle birlikte burada görünür.';

  @override
  String get galleryInstalledError => 'Yüklü olanlar yüklenemedi.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count güncelleme',
      one: '1 güncelleme',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Güncelle';

  @override
  String galleryUpdated(String name) {
    return '$name güncellendi';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Sürüm $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return '$name güncellensin mi?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'Yeni sürüm sahip olduğunuz sürümden daha fazlasını yapabiliyor:';

  @override
  String get galleryUpdateBreakingHelp =>
      'Yeni sürüm farklı çalışır, bu yüzden güncelledikten sonra kontrol edin.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Artık okudukları: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Artık yapabilecekleri: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Artık kod çalıştırır';

  @override
  String get galleryUpdateNowComputer => 'Artık bilgisayar kullanır';

  @override
  String get galleryRemove => 'Kaldır';

  @override
  String galleryRemoveTitle(String name) {
    return '$name kaldırılsın mı?';
  }

  @override
  String get galleryRemoveHelp =>
      'Bu çalışma alanından kaldırılır. Galeriden yeniden ekleyebilirsiniz.';

  @override
  String galleryRemoved(String name) {
    return '$name kaldırıldı';
  }

  @override
  String get galleryRetired => 'Artık galeride değil';

  @override
  String get galleryRetiredReplaced =>
      'Artık galeride değil; yerine başka bir öğe var';

  @override
  String get gallerySeeReplacement => 'Yerine geçeni gör';

  @override
  String get galleryForgetLook => 'Bu listeden kaldır';

  @override
  String galleryWizardTitle(String name) {
    return '$name ekle';
  }

  @override
  String get galleryWizardAdd => 'Ekle';

  @override
  String get galleryWizardRequired => 'Bunu doldurun';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe içerir',
      one: '1 öğe içerir',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'Neye ihtiyacı var';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count beceri sizin için eklendi',
      one: '1 beceri sizin için eklendi',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'Bağlanacak uygulamalar: $apps';
  }

  @override
  String get galleryWizardBot => 'Hangi bota eklensin';

  @override
  String get galleryWizardPickBot => 'Bir bot seçin';

  @override
  String get galleryWizardSetBotHelp =>
      'Setin rutinlerinin gideceği yer. Biri seçilmezse rutinler eklenmez.';

  @override
  String get galleryWizardSetNotAdded => 'Eklenmedi';

  @override
  String get galleryWizardNeedsTitle => 'Uygulamalarınızı bağlayın';

  @override
  String galleryWizardNeedsHelp(String name) {
    return 'Bunlar bağlandığında $name çalışmaya başlar.';
  }

  @override
  String get galleryWizardSkillAdded => 'Eklendi';

  @override
  String get galleryWizardConnected => 'Bağlandı';

  @override
  String get galleryWizardConnect => 'Bağla';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Ayarlar → Uygulamalar bölümünden $name bağlantısını kurun.';
  }

  @override
  String get galleryWizardContinue => 'Devam et';

  @override
  String get galleryWizardSkip => 'Daha sonra';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name hazır';
  }

  @override
  String get galleryWizardDoneHelp =>
      'Bunu diğer öğelerinizin yanında bulabilirsiniz.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'Tam olarak çalışması için şu uygulamaların bağlanması gerekir: $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'Onay bekliyor';

  @override
  String get galleryWizardPendingHelp =>
      'Çalışma alanınız önce bir yöneticiye sorar. Onayladıklarında eklenir.';

  @override
  String get galleryRequestsTitle => 'İstekler';

  @override
  String get galleryRequestsHelp =>
      'Galeri için fikirler. İstediğinize oy verin; geliştiriciler en üsttekilerden seçer.';

  @override
  String get galleryRequestsLinkHelp =>
      'Henüz burada olmayan bir şey isteyin veya oy verin';

  @override
  String get galleryRequestsTop => 'En iyiler';

  @override
  String get galleryRequestsNew => 'Yeni';

  @override
  String get galleryRequestsEmpty => 'Henüz istek yok. İlk siz olun.';

  @override
  String get galleryRequestsError => 'İstekler yüklenemedi.';

  @override
  String get galleryRequestNew => 'Yeni istek';

  @override
  String get galleryRequestNewHelp =>
      'Birinin ne yapmasını istediğinizi yazın. Benzer istekler birleştirilir.';

  @override
  String get galleryRequestKind => 'Tür';

  @override
  String get galleryRequestTitleLabel => 'Ne yapmalı?';

  @override
  String get galleryRequestTitleLength =>
      '4 ile 80 karakter arasında kullanın.';

  @override
  String get galleryRequestDetails => 'Ayrıntılar (isteğe bağlı)';

  @override
  String get galleryRequestSend => 'İstek gönder';

  @override
  String get galleryRequestSent => 'İstek gönderildi';

  @override
  String galleryRequestSimilar(String title) {
    return '\"$title\" zaten istenmişti, bu yüzden oyunuz ona verildi';
  }

  @override
  String get galleryRequestMine => 'Sizinkiler';

  @override
  String get galleryRequestVote => 'Oy ver';

  @override
  String get galleryRequestOpen => 'Açık';

  @override
  String get galleryRequestPlanned => 'Planlandı';

  @override
  String get galleryRequestDone => 'Tamamlandı';

  @override
  String get galleryRequestDeclined => 'Reddedildi';

  @override
  String get gallerySubmitStart => 'Galeriye gönder';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Oluşturduğunuz bir görünüm temasını, beceriyi, rutini veya botu paylaşın';

  @override
  String get gallerySubmitPick => 'Ne paylaşmak istiyorsunuz?';

  @override
  String get gallerySubmitPickHelp =>
      'Oluşturduğunuz bir şeyi seçin. Galeriye girmeden önce incelenir.';

  @override
  String get galleryLooksMine => 'Görünüm temalarınız';

  @override
  String get gallerySubmitCurrentScheme => 'Kullanımdaki renk şeması';

  @override
  String get gallerySubmitCurrentWallpaper => 'Kullanımdaki duvar kağıdı';

  @override
  String get gallerySubmitMyWallpaper => 'Duvar kağıdım';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'Uygulama gönder',
      'bot': 'Başlangıç botu gönder',
      'routine': 'Rutin gönder',
      'plugin': 'Eklenti gönder',
      'set': 'Başlangıç seti gönder',
      'theme': 'Tema gönder',
      'scheme': 'Renk şeması gönder',
      'wallpaper': 'Duvar kağıdı gönder',
      'other': 'Beceri gönder',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Yazar olarak görünen adınız gösterilir. E-postanız asla paylaşılmaz.';

  @override
  String get gallerySubmitName => 'Ad';

  @override
  String get gallerySubmitNameLength => '1 ile 60 karakter arasında kullanın.';

  @override
  String get gallerySubmitTags => 'Etiketler';

  @override
  String get gallerySubmitTagsHelp => 'En fazla altı adet, virgülle ayrılmış';

  @override
  String get gallerySubmitLicense => 'Lisans';

  @override
  String gallerySubmitRemix(String name) {
    return 'Orijinaline atıfta bulunur: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed =>
      'Orijinal galeri öğesine atıfta bulunur';

  @override
  String get gallerySubmitSend => 'Gönder';

  @override
  String get gallerySubmitted => 'İncelenmek üzere gönderildi';

  @override
  String get gallerySubmissionsTitle => 'Gönderimlerim';

  @override
  String get gallerySubmissionsHelp =>
      'Galeriye gönderdikleriniz ve mevcut durumları.';

  @override
  String get gallerySubmissionsSent => 'Gönderildi';

  @override
  String get gallerySubmissionsEmpty => 'Henüz bir şey gönderilmedi.';

  @override
  String get gallerySubmissionsError => 'Gönderimleriniz yüklenemedi.';

  @override
  String get gallerySubmissionOpen => 'İncelemede';

  @override
  String get gallerySubmissionMerged => 'Galeride';

  @override
  String get gallerySubmissionClosed => 'Kabul edilmedi';

  @override
  String get gallerySubmissionFailed => 'Gönderilemedi';

  @override
  String get galleryMyItems => 'Galerideki öğeleriniz';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count açık bildirim',
      one: '1 açık bildirim',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'Bir bot';

  @override
  String get islandNeedsOk => 'Onayınız gerekiyor';

  @override
  String get islandTakeOver => 'Devralmanızı istiyor';

  @override
  String get islandWriting => 'Yanıt yazıyor';

  @override
  String get islandWorking => 'Çalışıyor';

  @override
  String get islandFinished => 'Bitti';

  @override
  String get islandStoppedProblem => 'Bir sorunla durdu';

  @override
  String get islandOnThisMac => 'Bu Mac\'te';

  @override
  String get islandStale => 'En günceli için Casama\'yı açın';

  @override
  String get islandOpen => 'Aç';

  @override
  String get islandStop => 'Durdur';

  @override
  String get islandAllow => 'İzin ver';

  @override
  String get islandDeny => 'Reddet';

  @override
  String get islandReview => 'İncele';

  @override
  String get islandNothing => 'Şu anda çalışan bot yok';

  @override
  String get islandQuickAsk => 'Hızlı sor…';

  @override
  String get islandOpenCasama => 'Casama\'yı Aç';

  @override
  String get islandSettings => 'Ayarlar…';

  @override
  String get islandQuit => 'Casama\'dan Çık';

  @override
  String get islandAskHint => 'Bir bota sor…';

  @override
  String get islandNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String get islandDropHere => 'Bir bota sormak için bırakın';

  @override
  String get siriSignedOut => 'Önce Casama\'da oturum açın.';

  @override
  String get siriOpenToFinish => 'Bitirmek için Casama\'yı açın.';

  @override
  String get siriTooMany =>
      'Bir dakikada çok fazla istek oldu. Devam etmek için Casama\'yı açın.';

  @override
  String get siriNoCredits =>
      'Krediniz kalmadı. Daha fazla eklemek için Casama\'yı açın.';

  @override
  String get siriOffline => 'Casama şu anda internete ulaşamıyor.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot önce onayınızı bekliyor. İncelemek için Casama\'yı açın.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot bir sorunla karşılaştı. Ne olduğunu görmek için Casama\'yı açın.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot yanıtladı. Okumak için Casama\'yı açın.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot hâlâ üzerinde çalışıyor. Tamamlandığında bildirim alacaksınız.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot yanıt verdi.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return '$routine rutini başlatıldı.';
  }

  @override
  String get siriNothingNeedsYou =>
      'Şu anda sizden yanıt bekleyen bir şey yok.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count şey sizden yanıt bekliyor.',
      one: '1 şey sizden yanıt bekliyor.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'Sizden yanıt bekleyenler: $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'Bu hesap için bilgisayarlar kullanılamıyor.';

  @override
  String get siriNoComputers => 'Bu çalışma alanında hiç bilgisayarınız yok.';

  @override
  String siriStartingComputer(String computer) {
    return '$computer bilgisayarı başlatılıyor.';
  }

  @override
  String get siriComputerFailed => 'Bilgisayar şu anda başlatılamadı.';

  @override
  String get siriWhichBotToStop => 'Hangi botu durdurmalıyım?';

  @override
  String get siriBotNotRunning => 'O bot şu anda çalışmıyor.';

  @override
  String get siriStopped => 'Durduruldu.';

  @override
  String get siriStopFailed => 'Bot şu anda durdurulamadı.';

  @override
  String get focusFilterShowingAll => 'Odak filtresi · Tümü gösteriliyor';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Odak filtresi · $count gösteriliyor',
      one: 'Odak filtresi · 1 gösteriliyor',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casama 13 yaş ve üzeri kişiler içindir';

  @override
  String get under13Body =>
      'Bu hesap, beyan edilen yaş aralığına göre Casama\'yı kullanamaz. Oturumu kapatabilir veya verilerinizi başka bir hesaptan dışa aktarabilirsiniz.';

  @override
  String get siriSpotlightSetting => 'Spotlight ve Siri\'de göster';

  @override
  String get siriSpotlightSettingHelp =>
      'Bot adları, rutin adları ve sohbet başlıkları bu cihazdaki Spotlight ve Siri\'de görünür. Sohbette söylenenler asla görünmez. Uygulama kilidi açıkken kapalıdır.';

  @override
  String get geminiSetting => 'Gemini\'nin Casama\'yı kullanmasına izin ver';

  @override
  String get geminiSettingHelp =>
      'Gemini\'den Casama\'yı kullanmasını istediğinizde, bu telefonda botlarınıza soru sorabilir, sizden ne beklendiğini görebilir ve rutinlerinizi çalıştırabilir. Hiçbir şeyi asla onaylamaz: istekler burada açılır. Özel bir çalışma alanında, Yanıt metnini gizle seçeneği veya uygulama kilidi açıkken yanıtlar gizli kalır.';

  @override
  String get geminiOff =>
      'Bu telefonda Casama için Gemini kapalı. Casama: Ayarlar, Gizlilik bölümünden açın.';

  @override
  String get islandBotWorking => 'Bir bot çalışıyor';

  @override
  String get islandOnThisComputer => 'bu bilgisayarda';

  @override
  String get islandOnACall => 'Sesli aramada';

  @override
  String get islandStartElsewhere => 'Başka yerde başlattığınız botlar';

  @override
  String get islandStartElsewhereHelp =>
      'Mac\'iniz gibi başka bir cihazda başlattıklarınızı bu telefonun Kilitli Ekranında da gösterin.';

  @override
  String get islandBotsAtWork => 'Çalışan botlar';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adım',
      one: '1 adım',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Botları çentikte göster';

  @override
  String get showBotsInNotchHelp =>
      'Botlarınızın ne yaptığı, kameranın çevresinde görünür. Menü çubuğu simgesi bunu her durumda gösterir.';

  @override
  String get notchOnHover => 'Üzerine gelindiğinde çentiği aç';

  @override
  String get notchOnHoverHelp => 'Kapalı: Açmak için çentiğe tıklayın.';

  @override
  String get sitePublishToWeb => 'Web\'de yayınla';

  @override
  String get sitePublishToWebHelp => 'Kendi web adresini verin.';

  @override
  String get siteAddressName => 'Adres adı';

  @override
  String get siteAddressRules =>
      'Bir harf veya rakamla başlayıp biten 3 ila 40 küçük harf, rakam ve tire.';

  @override
  String get siteAddressChecking => 'Kontrol ediliyor…';

  @override
  String get siteAddressAvailable => 'Kullanılabilir';

  @override
  String get siteAddressTaken => 'Bu ad kullanılamıyor.';

  @override
  String get siteAnyoneCanOpen => 'Adresi bilen herkes açabilecek.';

  @override
  String get sitePublish => 'Yayınla';

  @override
  String get siteOnTheWeb => 'Web\'de';

  @override
  String get siteSearchEngines => 'Arama motorlarının bulmasına izin ver';

  @override
  String get siteSearchEnginesHelp =>
      'Google ve diğer arama motorlarında listelenmesini sağlar.';

  @override
  String get siteSearchEnginesPaid => 'Ücretli bir plan gerektirir.';

  @override
  String get siteUseOwnDomain => 'Kendi alan adınızı kullanın';

  @override
  String get siteUnpublish => 'Yayından kaldır';

  @override
  String get siteUnpublishTitle => 'Bu site yayından kaldırılsın mı?';

  @override
  String get siteUnpublishBody =>
      'Web adreslerinden açılması durur. Kitaplığınızda kalır.';

  @override
  String get siteHostLive => 'Yayında';

  @override
  String get siteHostWaitingForDns => 'DNS bekleniyor';

  @override
  String get siteHostGettingCertificate => 'Sertifikası alınıyor';

  @override
  String get siteHostNeedsAttention => 'İlgilenilmesi gerekiyor';

  @override
  String get siteHostPaused => 'Duraklatıldı';

  @override
  String get siteHostSuspended => 'Askıya alındı';

  @override
  String get settingsDomains => 'Alan adları';

  @override
  String get settingsDomainsHelp =>
      'Sitelerinizi sahip olduğunuz bir alan adında açın.';

  @override
  String get settingsSearchHint => 'Ayarlarda ara';

  @override
  String settingsSearchNone(String query) {
    return '“$query” ile eşleşen ayar yok.';
  }

  @override
  String get domainsEmpty =>
      'bakery.com gibi sahip olduğunuz bir alan adını bağladığınızda siteniz orada açılır.';

  @override
  String get domainsConnectOwn => 'Sahip olduğunuz bir alan adını bağlayın';

  @override
  String get domainStateLive => 'Yayında';

  @override
  String get domainStateWaitingDns => 'DNS bekleniyor';

  @override
  String get domainStateWaitingCert => 'Sertifikası alınıyor';

  @override
  String get domainStatePaused => 'Duraklatıldı';

  @override
  String get domainStateNeedsAttention => 'İlgilenilmesi gerekiyor';

  @override
  String get domainNoSite => 'Henüz site yok';

  @override
  String get domainConnectField => 'Alan adınız';

  @override
  String get domainConnectHelp =>
      'bakery.com, www.bakery.com veya shop.bakery.com gibi yazın.';

  @override
  String get domainConnectSite => 'Gösterilecek site';

  @override
  String get domainSiteNone => 'Hiçbiri';

  @override
  String get domainSiteNoneHelp =>
      'Siz bir site seçinceye kadar alan adı hiçbir şey göstermez.';

  @override
  String get domainConnect => 'Bağla';

  @override
  String get domainClaimTitle => 'Size ait olduğunu gösterin';

  @override
  String get domainClaimBody =>
      'Başka bir çalışma alanı bu alan adını bağlamış. Size ait olduğunu göstermek için bu kaydı ekleyin, ardından tekrar Bağla\'ya dokunun.';

  @override
  String get domainRecordType => 'Tür';

  @override
  String get domainRecordName => 'Ad';

  @override
  String get domainRecordValue => 'Değer';

  @override
  String get domainSite => 'Site';

  @override
  String get domainPickSite => 'Bir site seçin';

  @override
  String get domainHosts => 'Adresler';

  @override
  String get domainPrimary => 'Birincil';

  @override
  String get domainPrimaryHelp =>
      'Ziyaretçiler buraya gelir; diğer adresler onları buraya yönlendirir.';

  @override
  String get domainMakePrimary => 'Birincil yap';

  @override
  String get domainRecordsTitle => 'Eklenecek kayıtlar';

  @override
  String get domainRecordsAtCloudflare =>
      'Bunları Cloudflare\'de ekleyin. Kayıtları yalnızca DNS (DNS only) olarak ayarlayın.';

  @override
  String domainRecordsAt(String provider) {
    return 'Bunları $provider DNS ayarlarınıza ekleyin.';
  }

  @override
  String get domainRecordsGeneric =>
      'Bunları alan adınızın DNS\'inin yönetildiği yere, genellikle satın aldığınız şirkete ekleyin.';

  @override
  String get domainRecordsNone => 'Eklenecek bir şey yok. Her şey hazır.';

  @override
  String get domainRecordOptional => 'İsteğe bağlı';

  @override
  String domainRecordForward(String from, String to) {
    return 'Alan adını satın aldığınız şirkette $from adresinden $to adresine yönlendirmeyi açın.';
  }

  @override
  String get domainRecordFound => 'Bulundu';

  @override
  String get domainRecordNotFound => 'Henüz bulunamadı';

  @override
  String get domainCheckAgain => 'Tekrar kontrol et';

  @override
  String get domainCheckTooSoon =>
      'Az önce kontrol ettik. Birkaç saniye sonra yeniden deneyin.';

  @override
  String get domainChecksItself =>
      'Biz de kendiliğimizden kontrol ediyoruz, bu yüzden bu ekrandan ayrılabilirsiniz.';

  @override
  String get domainHistory => 'Geçmiş';

  @override
  String get domainEventConnected => 'Bağlandı';

  @override
  String get domainEventProved => 'Kayıtlar bulundu';

  @override
  String get domainEventLive => 'Yayında';

  @override
  String get domainEventNeedsDns => 'Hâlâ DNS bekleniyor';

  @override
  String get domainEventFailed => 'Kurulum tamamlanamadı';

  @override
  String get domainEventDisconnected =>
      'Kayıtlar kaldırıldığı için bağlantısı kesildi';

  @override
  String get domainEventPaused => 'Duraklatıldı: Planınız bunu kapsamıyor';

  @override
  String get domainEventResumed => 'Tekrar açık';

  @override
  String get domainEventRemoved => 'Bağlantı kesildi';

  @override
  String get domainEventClaim => 'Size ait olduğunu göstermeniz istendi';

  @override
  String get domainEventClaimAttempt =>
      'Başka bir çalışma alanı bunu bağlamaya çalıştı';

  @override
  String get domainEventOverLimit => 'Planınızın sınırını aşıyor';

  @override
  String get domainEventSuspended => 'Askıya alındı';

  @override
  String get domainEventOther => 'Güncellendi';

  @override
  String domainDisconnectTitle(String name) {
    return '$name bağlantısı kesilsin mi?';
  }

  @override
  String get domainDisconnectBody =>
      'Siteniz bu alan adında açılmayı durdurur. Kayıtlarını daha sonra DNS şirketinizden kaldırabilirsiniz.';

  @override
  String get domainsFind => 'Alan adı bul';

  @override
  String get domainsEmptyBuy =>
      'Siteniz için bir alan adı satın alın veya sahip olduğunuz birini bağlayın.';

  @override
  String get domainFindField => 'Ad veya birkaç kelime';

  @override
  String get domainFindHint => 'pastane';

  @override
  String get domainFindHelp => 'Fiyatlar yıllıktır ve vergi hariçtir.';

  @override
  String get domainFindNone => 'Hiç ad bulunamadı. Başka kelimeler deneyin.';

  @override
  String get domainFindNotOffered =>
      'Bu uygulamada alan adı satın alma sunulmuyor. Yine de sahip olduğunuz bir alan adını bağlayabilirsiniz.';

  @override
  String domainPricePerYear(String price) {
    return 'Yıllık $price + vergi';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Yenileme ücreti: $price';
  }

  @override
  String get domainReasonTaken => 'Alınmış';

  @override
  String get domainReasonPremium => 'Özel ad, burada satılmıyor';

  @override
  String get domainReasonNotSold => 'Burada satılmıyor';

  @override
  String get domainBuy => 'Satın al';

  @override
  String domainBuyTitle(String name) {
    return '$name satın al';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return 'İlk yıl için $price, ardından yıllık $renew + vergi.';
  }

  @override
  String get domainBuyFinal =>
      'Alan adı kaydedildikten sonra satış kesindir. Kaydedilemezse tam geri ödeme alırsınız.';

  @override
  String get domainBuyTerms => 'Alan adı koşullarını kabul ediyorum';

  @override
  String get domainBuyReadTerms => 'Koşulları oku';

  @override
  String get domainRenewAuto => 'Otomatik yenile';

  @override
  String get domainRenewAutoHelp =>
      'Ücret, süre dolmadan yaklaşık iki hafta önce kayıtlı ödeme yönteminizden tahsil edilir.';

  @override
  String get domainBuySite => 'Gösterilecek site';

  @override
  String get domainBuyPayInBrowser =>
      'Ödemeyi tarayıcınızda tamamlayın. Bu ekran işlemi takip eder.';

  @override
  String get domainContactTitle => 'İletişim bilgileri';

  @override
  String get domainContactHelp =>
      'Alan adının adına kaydedileceği kişi veya işletme. Kayıt kuruluşları bunları gizli tutar.';

  @override
  String get domainContactFirstName => 'Ad';

  @override
  String get domainContactLastName => 'Soyad';

  @override
  String get domainContactOrganization => 'İşletme (isteğe bağlı)';

  @override
  String get domainContactAddress1 => 'Adres';

  @override
  String get domainContactAddress2 => 'Adres satırı 2 (isteğe bağlı)';

  @override
  String get domainContactCity => 'Şehir';

  @override
  String get domainContactState => 'Eyalet veya bölge';

  @override
  String get domainContactZip => 'Posta kodu';

  @override
  String get domainContactCountry => 'Ülke kodu';

  @override
  String get domainContactCountryHint => 'US';

  @override
  String get domainContactPhone => 'Telefon';

  @override
  String get domainContactPhoneHint => '+1 415 555 0100';

  @override
  String get domainContactEmail => 'E-posta';

  @override
  String get domainContactRequired => 'Gerekli';

  @override
  String get domainContactCountryInvalid =>
      'US gibi iki harfli bir kod kullanın';

  @override
  String get domainContactPhoneInvalid =>
      '+1 415 555 0100 gibi uluslararası biçimi kullanın';

  @override
  String get domainContactEmailInvalid => 'Geçerli bir e-posta girin';

  @override
  String get domainContactSave => 'Kaydet';

  @override
  String get domainContactSaved => 'İletişim bilgileri kaydedildi.';

  @override
  String get domainContactChangeNote =>
      'Değişiklikler bu çalışma alanının satın aldığı her alan adı için geçerlidir. Yeni bir e-postanın yeniden onaylanması gerekir.';

  @override
  String get domainOrderTitle => 'Siparişiniz';

  @override
  String get domainOrderWaitingPayment => 'Tarayıcıda ödemeniz bekleniyor.';

  @override
  String domainOrderRegistering(String name) {
    return '$name kaydediliyor…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return '$name ayarlanıyor…';
  }

  @override
  String domainOrderRefunding(String name) {
    return '$name kaydedilemedi. Ücretiniz şimdi iade ediliyor…';
  }

  @override
  String domainOrderRefunded(String name) {
    return '$name kaydedilemediği için ödemenizin tamamını iade ettik.';
  }

  @override
  String get domainOrderAbandoned =>
      'Bu ödeme işlemi ödenmedi, bu nedenle hiçbir ücret alınmadı.';

  @override
  String get domainOrderNeedsAttention =>
      'Bu siparişte bir sorun oluştu. Bize bildirildi ve sorunu çözeceğiz.';

  @override
  String domainOrderDone(String name) {
    return '$name artık sizin.';
  }

  @override
  String get domainOrderLeave =>
      'Bu ekrandan ayrılabilirsiniz. Hazır olduğunda size haber vereceğiz.';

  @override
  String get domainOrderBack => 'Alan adlarına dön';

  @override
  String domainRenewsOn(String date) {
    return '$date tarihinde yenilenir';
  }

  @override
  String domainExpiresOn(String date) {
    return '$date tarihinde sona erer';
  }

  @override
  String domainRenewPrice(String price) {
    return 'Yıllık $price + vergi';
  }

  @override
  String get domainRenewNow => 'Şimdi yenile';

  @override
  String get domainRenewPayInBrowser =>
      'Ödemeyi tarayıcınızda tamamlayın. Ödendikten sonra yeni tarih burada görünür.';

  @override
  String get domainRenewCharged =>
      'Yenilendi. Yeni tarih bir dakika içinde burada görünür.';

  @override
  String get domainRegistration => 'Kayıt';

  @override
  String domainExpired(String date) {
    return 'Süresi $date tarihinde doldu. Korumak için bu tarihten itibaren 25 gün içinde yenileyin.';
  }

  @override
  String get domainLapsed =>
      'Bu alan adının süresi geçmiş. Geri yüklemeyi sormak için desteğe yazın; bunun garantisi yoktur.';

  @override
  String get domainSuspendedLine =>
      'Bu alan adı askıya alındı. Nedenini öğrenmek için desteğe yazın.';

  @override
  String get domainVerifyTitle => 'Kayıt sahibinin e-postasını onaylayın';

  @override
  String get domainVerifyBody =>
      'Kayıt kuruluşu, kayıt sahibinin adresine bir e-posta gönderdi. Açıp onaylayın, aksi takdirde alan adı çalışmayı durdurur.';

  @override
  String get domainVerifySendAgain => 'Tekrar gönder';

  @override
  String get domainVerifySent =>
      'Gönderildi. Kayıt sahibinin gelen kutusunu kontrol edin.';

  @override
  String get domainDnsRecords => 'DNS kayıtları';

  @override
  String get domainDnsRecordsHelp =>
      'E-posta, alt alan adları ve site kontrolleri';

  @override
  String get domainMoveOut => 'Başka bir kayıt kuruluşuna taşı';

  @override
  String domainMoveOutAfter(String date) {
    return '$date tarihinden sonra taşınabilir';
  }

  @override
  String get domainMoveOutHelp =>
      'Başka bir kayıt kuruluşu için aktarım kodu al';

  @override
  String domainMoveOutTitle(String name) {
    return '$name taşınsın mı?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'Bu işlem alan adının kilidini açar ve aktarım kodunu bir kez gösterir. Onaylamak için $name yazın.';
  }

  @override
  String get domainMoveOutConfirm => 'Aktarım kodunu al';

  @override
  String domainMoveOutLocked(String date) {
    return '$date tarihinden sonra taşınabilir.';
  }

  @override
  String get domainTransferCodeTitle => 'Aktarım kodu';

  @override
  String get domainTransferCodeBody =>
      'Bu kodu yeni kayıt kuruluşuna verin. Yalnızca bu seferlik gösterilir, bu yüzden şimdi kopyalayın.';

  @override
  String get domainTransferCode => 'Kod';

  @override
  String get domainUnlocked => 'Taşıma için kilidi açıldı';

  @override
  String get domainLockAgain => 'Tekrar kilitle';

  @override
  String get domainLocked => 'Tekrar kilitlendi.';

  @override
  String get domainReauthTitle => 'Tekrar oturum açın';

  @override
  String get domainReauthSendCode => 'Bana e-posta ile kod gönder';

  @override
  String domainReauthCodeSent(String email) {
    return '$email adresine bir kod gönderdik.';
  }

  @override
  String get domainReauthCode => 'E-postadaki kod';

  @override
  String get domainReauthSignIn => 'Oturum aç';

  @override
  String get domainReauthSignOut =>
      'Oturumu kapatıp tekrar açın, ardından bir kez daha deneyin.';

  @override
  String get dnsRecordsEmpty => 'Henüz kayıt yok.';

  @override
  String get dnsRecordAdd => 'Kayıt ekle';

  @override
  String get dnsRecordEdit => 'Kaydı düzenle';

  @override
  String get dnsRecordManaged => 'Casama siteniz tarafından kullanılıyor';

  @override
  String get dnsRecordType => 'Tür';

  @override
  String get dnsRecordHost => 'Ad';

  @override
  String dnsRecordHostHelp(String name) {
    return '$name alan adının kendisi için boş bırakın veya www, shop gibi bir ad yazın…';
  }

  @override
  String get dnsRecordAnswer => 'Değer';

  @override
  String get dnsRecordTtl => 'TTL (saniye)';

  @override
  String get dnsRecordPriority => 'Öncelik';

  @override
  String get dnsRecordSave => 'Kaydet';

  @override
  String get dnsRecordDeleteTitle => 'Bu kayıt silinsin mi?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300 saniye veya daha fazla';

  @override
  String get dnsRecordAnswerRequired => 'Gerekli';

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
      'Çalışma alanlarınızda satın alınan alan adları';

  @override
  String get deleteAccountDomainsBody =>
      'Bu alan adları süreleri dolana kadar kayıtlı kalır. Yenilenmezler ve siteleri çevrimdışı olur.';

  @override
  String get whatsNew010Sites =>
      'Bir sayfayı kendi adresinde web\'e koyun ve bunun için kendi alan adınızı kullanın.';

  @override
  String get inAppAlertOpen => 'Aç';

  @override
  String get pushPrefsTitle => 'Bildirimler';

  @override
  String get pushPrefsHelp =>
      'Cihazlarınızı nelerin titreteceğini seçin. Her şey yine gelen kutunuza düşer.';

  @override
  String get pushAllOn => 'Tümü açık';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Yanıtlar kapalı',
      'needsYou': 'Sizden yanıt bekliyor kapalı',
      'routines': 'Rutinler ve özetler kapalı',
      'suggestions': 'Öneriler ve bilgilendirmeler kapalı',
      'other': 'Hesap kapalı',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count tür kapalı';
  }

  @override
  String get pushReplies => 'Yanıtlar';

  @override
  String get pushRepliesHelp =>
      'Bir sohbetten ayrıldıysanız, bir bot sorduğunuz bir şeyi yanıtladığında.';

  @override
  String get pushNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String get pushNeedsYouHelp =>
      'Botlarınızın beklediği onaylar, parolalar ve devralmalar.';

  @override
  String get pushNeedsYouOffWarning =>
      'Kapalı: botlarınız siz uygulamayı açana kadar bekler.';

  @override
  String get pushRoutines => 'Rutinler ve özetler';

  @override
  String get pushRoutinesHelp => 'Rutinlerin sonuçları ve sabah özetiniz.';

  @override
  String get pushSuggestions => 'Öneriler ve bilgilendirmeler';

  @override
  String get pushSuggestionsHelp =>
      'Botlarınızın sizin için yapmayı teklif ettiği şeyler.';

  @override
  String get pushAccount => 'Hesap';

  @override
  String get pushAccountHelp => 'Azalan krediler, projeler ve sunucunuz.';

  @override
  String get pushHideReplyText => 'Yanıt metnini gizle';

  @override
  String get pushHideReplyTextHelp =>
      'Bildirimler, botun sözcükleri olmadan bir botun yanıt verdiğini söyler.';

  @override
  String get reactToMessage => 'Tepki ver';

  @override
  String get moreReactions => 'Daha fazla tepki';

  @override
  String get reactionsTitle => 'Tepkiler';

  @override
  String get reactionsAll => 'Tümü';

  @override
  String get reactionsYou => 'Siz';

  @override
  String get reactionsTapToRemove => 'Kaldırmak için dokunun';

  @override
  String get reactionsNone => 'Henüz tepki yok.';

  @override
  String get reactionsLoadFailed => 'Kimlerin tepki verdiği yüklenemedi.';

  @override
  String get searchEmoji => 'Emoji ara';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tepki',
      one: '1 tepki',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tepki',
      one: '1 tepki',
    );
    return '$emoji, sizinki dahil $_temp0';
  }

  @override
  String reactionQuick(String emoji) {
    return '$emoji ile tepki ver';
  }

  @override
  String reactionRemove(String emoji) {
    return '$emoji tepkinizi kaldırın';
  }

  @override
  String get packsShelfTitle => 'Paketler';

  @override
  String get packsShelfHelp =>
      'Birlikte çalışan botlar, beceriler ve rutinler tek seferde eklenir.';

  @override
  String get packReviewed => 'İncelenmiş';

  @override
  String get packNotReviewed => 'Casama tarafından incelenmedi';

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
      other: '$count beceri',
      one: '1 beceri',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rutin',
      one: '1 rutin',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count uygulama',
      one: '1 uygulama',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count görünüm teması',
      one: '1 görünüm teması',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count araç',
      one: '1 araç',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count öğe',
      one: '1 öğe',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Başlangıç seti';

  @override
  String get packAddFromLink => 'Bağlantıdan paket ekle';

  @override
  String get packAddFromLinkHelp =>
      'Bir paketin GitHub bağlantısını yapıştırın ve önce neleri eklediğini görün.';

  @override
  String get packAddFromFile => 'Dosyadan ekle';

  @override
  String get packAddFromFileHelp => 'Bir paketin .zip dosyasını seçin.';

  @override
  String get packLinkLabel => 'GitHub bağlantısı';

  @override
  String get packFileUnreadable => 'Bu dosya bir paketin .zip dosyası değil.';

  @override
  String get packFileTooBig => 'Bu dosya bir paket için çok büyük.';

  @override
  String packSource(String where, String commit) {
    return '$where · $commit';
  }

  @override
  String get packFromFile => 'Dosyadan';

  @override
  String get packFromShare => 'Sizinle paylaşıldı';

  @override
  String get packAlreadyHere => 'Bu çalışma alanında bu paket zaten var.';

  @override
  String get packOpenInstalled => 'Yüklü paketleri gör';

  @override
  String get packAdd => 'Paket ekle';

  @override
  String packWizardTitle(String name) {
    return '$name ekle';
  }

  @override
  String get packWhatsInside => 'İçindekiler';

  @override
  String get packWhatsInsideHelp =>
      'İstemediğiniz her şeyin işaretini kaldırın.';

  @override
  String get packSectionBots => 'Botlar';

  @override
  String get packSectionSkills => 'Beceriler';

  @override
  String get packSectionRoutines => 'Rutinler';

  @override
  String get packSectionApps => 'Uygulamalar';

  @override
  String get packSectionLooks => 'Temalar';

  @override
  String get packSectionIncludes => 'Galeriden';

  @override
  String get packSectionTools => 'Araçlar';

  @override
  String get packSkillRunsScripts => 'Botun bilgisayarında betikler çalıştırır';

  @override
  String get packSkillForWorkspace => 'Tüm çalışma alanı için';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Haftada yaklaşık $count kez çalışır',
      one: 'Haftada yaklaşık 1 kez çalışır',
      zero: 'Ara sıra çalışır',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Şununla iletişim kurar: $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Şuraya bağlanır: $url';
  }

  @override
  String get packIncludeMissing => 'Galeride bulunamadı';

  @override
  String get packLookHelp =>
      'Ekledikten sonra bunu bu cihazda kullanabilirsiniz.';

  @override
  String get packNothingTicked => 'Eklemek için en az bir şey işaretleyin.';

  @override
  String get packQuestions => 'Birkaç soru';

  @override
  String get packQuestionsHelp =>
      'Paket bunları botlarına ve rutinlerine doldurur.';

  @override
  String get packSecretsTitle => 'Anahtarlar ve ayarlar';

  @override
  String get packSecretsHelp =>
      'Paketin araçlarının çalışması için bunlara ihtiyacı var.';

  @override
  String get packReachTitle => 'Nelere ulaşabilir';

  @override
  String get packReachHelp =>
      'Paketin dosyalarından Casama tarafından çıkarıldı.';

  @override
  String get packReachRunsCode => 'Kod çalıştırır';

  @override
  String get packReachComputer => 'Botun bilgisayarını kullanır';

  @override
  String packReachHosts(String hosts) {
    return 'Şunlarla iletişim kurar: $hosts';
  }

  @override
  String get packReachNoHosts => 'Başka sitelerle iletişim kurmaz';

  @override
  String packReachSecrets(String names) {
    return 'Kullandığı anahtarlar: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Haftada yaklaşık $count zamanlanmış çalıştırma',
      one: 'Haftada yaklaşık 1 zamanlanmış çalıştırma',
      zero: 'Zamanlanmış çalıştırma yok',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama bu paketi incelemedi. Yalnızca nereden geldiğine güveniyorsanız ekleyin. Rutinleri kapalı olarak başlar.';

  @override
  String get packPickBotTitle => 'Hangi bota gitsin?';

  @override
  String get packPickBotHelp =>
      'Bu paket bir bot getirmiyor. Rutinleri ve araçları için bir bot seçin.';

  @override
  String packDoneTitle(String name) {
    return '$name eklendi';
  }

  @override
  String get packDoneHelp => 'Ekledikleri bunlar.';

  @override
  String get packPendingHelp =>
      'Bir yöneticiye sorduk. Onayladıklarında paket eklenir.';

  @override
  String get packStatusInstalled => 'Eklendi';

  @override
  String get packStatusPending => 'Yönetici bekleniyor';

  @override
  String get packStatusSkipped => 'Atlandı';

  @override
  String get packStatusFailed => 'İşe yaramadı';

  @override
  String get packStatusDevice => 'Bu cihazda';

  @override
  String get packConnectTitle => 'Uygulamalarını bağla';

  @override
  String get packConnectHelp =>
      'Bunlar bağlandığında botları tam olarak çalışır.';

  @override
  String get packLooksTitle => 'Bu cihazda bir görünüm teması kullanılsın mı?';

  @override
  String get packUseLook => 'Kullan';

  @override
  String get packLookInUse => 'Kullanımda';

  @override
  String get packInstalledTitle => 'O paket zaten burada';

  @override
  String get packsInstalledTitle => 'Yüklü paketler';

  @override
  String get packsInstalledRow =>
      'Bu çalışma alanının eklediği paketler, güncellemeleriyle birlikte';

  @override
  String get packsInstalledEmpty =>
      'Henüz paket yok. Paketler rafından bir tane bulun veya bir bağlantıdan ekleyin.';

  @override
  String get packEditedBadge => 'Sizin tarafınızdan düzenlendi';

  @override
  String get packRemove => 'Kaldır';

  @override
  String get packUpToDate => 'Bu paket güncel.';

  @override
  String get packCantCheck =>
      'Bu paket bir dosya veya bağlantıdan geldiği için güncellemeleri denetleyemiyor.';

  @override
  String packUpdateTitle(String name) {
    return '$name paketini güncelle';
  }

  @override
  String packDiffAdded(String names) {
    return 'Yeni: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Kaldırılan: $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Değişen: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'İletişim kurduğu yeni siteler: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'Gereken yeni anahtarlar: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'Yeni zamanlamalar: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Haftalık zamanlanmış çalıştırma: $from → $to';
  }

  @override
  String get packDiffNone => 'Fark edeceğiniz bir şey değişmedi.';

  @override
  String get packEditedTitle => 'Değiştirdiğiniz şeyler';

  @override
  String get packEditedHelp => 'Siz değiştirmedikçe kendi sürümünüz kalır.';

  @override
  String get packTakeTheirs => 'Paketin sürümünü kullan';

  @override
  String get packReachGrewTitle => 'Artık daha fazlasına erişiyor';

  @override
  String get packReachGrewHelp =>
      'Yeni sürüm sahip olduğunuzdan daha fazlasına ulaşabilir.';

  @override
  String get packReachConfirm => 'Artık nelere ulaşabildiğini kontrol ettim';

  @override
  String packUpdated(String name) {
    return '$name güncellendi.';
  }

  @override
  String packRemoveTitle(String name) {
    return '$name kaldırılsın mı?';
  }

  @override
  String get packRemoveBody =>
      'Paketin araçları ve anahtarları ile değiştirmediğiniz beceriler ve rutinler kaldırılır. Uygulama bağlantıları kalır.';

  @override
  String get packRemoveBots => 'Bu paketin oluşturduğu botları da sil';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Paket kaldırıldı. Değiştirdiğiniz için $count öğe kaldı.',
      one: 'Paket kaldırıldı. Değiştirdiğiniz için 1 öğe kaldı.',
      zero: 'Paket kaldırıldı.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Paket olarak paylaş';

  @override
  String get sharePackRow =>
      'Başkası için botları ve becerileri bir araya getirin';

  @override
  String get sharePackHelp =>
      'Anahtarlar, sohbetler, hafıza kayıtları, Hakkınızda ve model seçimi asla dahil edilmez.';

  @override
  String get sharePackBots => 'Botlar';

  @override
  String get sharePackBotsHelp =>
      'En fazla 5 tane seçin. Her biri kendi talimatlarını, becerilerini ve rutinlerini getirir.';

  @override
  String get sharePackSkills => 'Çalışma alanı becerileri';

  @override
  String get sharePackName => 'Ad';

  @override
  String get sharePackSummary => 'Hakkında tek satırlık bilgi';

  @override
  String get sharePackLook => 'Bu cihazın temasını dahil et';

  @override
  String get sharePackCheck => 'Kontrol et ve paylaş';

  @override
  String get sharePackFindingsTitle => 'Bazı satırlar anahtara benziyor';

  @override
  String get sharePackFindingsHelp =>
      'Paylaşmadan önce bunları kontrol edin. Düzeltmek için geri dönün veya güvenliyse paylaşın.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, satır $line: $what';
  }

  @override
  String get sharePackGoBack => 'Geri dön';

  @override
  String get sharePackAnyway => 'Yine de paylaş';

  @override
  String get sharePackLinkTitle => 'Paket bağlantınız';

  @override
  String sharePackLinkHelp(String date) {
    return 'Casama\'da oturum açmış herkes $date tarihine kadar açabilir.';
  }

  @override
  String get sharePackShare => 'Paylaş';

  @override
  String get sharePackSaveFile => 'Dosya olarak kaydet';

  @override
  String get sharePackLinkCopied => 'Bağlantı kopyalandı.';

  @override
  String get sharePackStop => 'Paylaşmayı durdur';

  @override
  String get sharePackStopped => 'Bağlantı artık çalışmıyor.';

  @override
  String pluginFromPack(String pack) {
    return '$pack paketinden';
  }

  @override
  String get pluginFromPackHelp =>
      'Galeri → Yüklü paketler bölümünden paketiyle birlikte güncelleyin veya kaldırın.';

  @override
  String get pluginSettings => 'Ayarlar';

  @override
  String get pluginEditSettings => 'Ayarları düzenle';

  @override
  String get pluginSettingsSaved => 'Ayarlar kaydedildi.';

  @override
  String get galleryPolicyKeyHelp =>
      'Ayrıca bir depo (repo/sahip:ad) veya paket (paket/ad) da yazabilirsiniz.';

  @override
  String galleryPolicyUseKey(String key) {
    return '$key ekle';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Paket: $name';
  }

  @override
  String get reportPackShare => 'Bu paketi bildir';

  @override
  String get appLock => 'Uygulama kilidi';

  @override
  String get appLockRow => 'Açıldığında Casama\'nın kilidini açmayı iste';

  @override
  String get appLockHelp =>
      'Casama açıldığında ve bir süre ayrı kalındığında sizden kilidi açmanızı ister. Açıkken oturumunuz bu cihazın anahtar zincirinde tutulur.';

  @override
  String get appLockSwitch => 'Casama\'yı kilitle';

  @override
  String get appLockLocked => 'Casama kilitli';

  @override
  String get appLockUnlock => 'Kilidi aç';

  @override
  String get appLockUnlockWithPasskey => 'Geçiş anahtarı ile kilidi aç';

  @override
  String get appLockUnlockReason => 'Casama\'nın kilidini aç';

  @override
  String get appLockTurnOnReason => 'Uygulama kilidini aç';

  @override
  String get appLockConfirmReason => 'Siz olduğunuzu doğrulayın';

  @override
  String get appLockConfirmTitle => 'Siz olduğunuzu doğrulayın';

  @override
  String get approvalConfirmTitle => 'Buna izin verilsin mi?';

  @override
  String get approvalConfirmBody =>
      'Bu, yüksek riskli bir istek. Botun devam etmesine izin veriyor musunuz?';

  @override
  String get approvalConfirmAllow => 'İzin ver';

  @override
  String appLockUnlockWith(String method) {
    return '$method kullanın.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID veya parolanız';

  @override
  String get appLockDeviceAndroid =>
      'parmak iziniz, yüzünüz veya ekran kilidiniz';

  @override
  String get appLockDeviceMac => 'Touch ID veya Mac\'inizin parolası';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'cihazınızın ekran kilidi';

  @override
  String appLockMethodDevice(String method) {
    return '$method ile kilidi açılır';
  }

  @override
  String get appLockMethodPin => '6 haneli PIN ile kilidi açılır';

  @override
  String get appLockMethodPasskey => 'Geçiş anahtarı ile kilidi açılır';

  @override
  String get appLockPinHint => 'PIN\'inizi girin';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Yanlış PIN. $count deneme hakkı kaldı.',
      one: 'Yanlış PIN. 1 deneme hakkı kaldı.',
      zero: 'Yanlış PIN.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Çok fazla yanlış PIN girildi. Casama\'yı açmak için oturumu kapatıp tekrar oturum açın.';

  @override
  String get appLockFailed => 'Bu işe yaramadı. Yeniden deneyin.';

  @override
  String get appLockUnavailable =>
      'Bu cihaz şu anda Casama\'nın kilidini açamıyor. Tekrar girmek için oturumu kapatıp tekrar oturum açın.';

  @override
  String get appLockSignOutConfirm =>
      'Oturumu kapatmak bu cihazda uygulama kilidini kapatır. Casama\'yı açmak için tekrar oturum açın.';

  @override
  String get appLockCallRinging =>
      'Bir arama çalıyor. Yanıtlamak için kilidi açın.';

  @override
  String get appLockRequiredTitle => 'Uygulama kilidini açın';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace, Casama\'yı açan her cihazda uygulama kilidi gerektirir.';
  }

  @override
  String get appLockRequiredNoWay =>
      'Bu tarayıcı bu sunucuyla geçiş anahtarlarını kullanamadığı için Casama\'yı kilitleyemiyor. Casama\'yı telefonunuzdaki veya bilgisayarınızdaki uygulamada açın.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'Açık. $workspace tarafından zorunlu kılındı';
  }

  @override
  String get appLockTurnOn => 'Aç';

  @override
  String get appLockTurnedOn => 'Uygulama kilidi açık';

  @override
  String get appLockNoWayHere =>
      'Bu tarayıcı bu sunucuyla geçiş anahtarlarını kullanamadığı için Casama burada kilitlenemiyor.';

  @override
  String get appLockNotChecked => 'Siz olduğunuz doğrulanamadı.';

  @override
  String get appLockPinSetupTitle => 'Bir PIN seçin';

  @override
  String get appLockPinAgainTitle => 'PIN\'i tekrar girin';

  @override
  String get appLockPinSetupBody =>
      '6 hane. Casama\'yı açmak için bunu gireceksiniz.';

  @override
  String get appLockPinNext => 'Devam et';

  @override
  String get appLockPinMismatch => 'PIN\'ler eşleşmedi. Tekrar bir PIN seçin.';

  @override
  String get appLockPinNotSaved => 'PIN bu cihaza kaydedilemedi.';

  @override
  String get appLockPinChanged => 'PIN değiştirildi';

  @override
  String get appLockChangePin => 'PIN\'i değiştir';

  @override
  String get appLockAfter => 'Kilitleme süresi';

  @override
  String get appLockAfterHelp =>
      'Arka planda, simge durumunda veya bir bilgisayarda başka uygulamaların arkasında geçen süre.';

  @override
  String get appLockAfterImmediately => 'Hemen';

  @override
  String get appLockAfterOneMinute => '1 dakika';

  @override
  String get appLockAfterFiveMinutes => '5 dakika';

  @override
  String get appLockAfterFifteenMinutes => '15 dakika';

  @override
  String get appLockAfterOneHour => '1 saat';

  @override
  String get appLockBlockScreenshots => 'Ekran görüntülerini engelle';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Ekran görüntüleri, ekran kayıtları ve ekran paylaşımı Casama\'dan hiçbir şey göstermez.';

  @override
  String get appLockLockNow => 'Şimdi kilitle';

  @override
  String get appLockPrivacySection => 'Daha fazla gizlilik';

  @override
  String get appLockAskBeforeRisky => 'Riskli eylemleri onayla';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Hesabınızı silmeden, anahtar oluşturmadan, faturalandırmayı değiştirmeden, veri dışa aktarmadan, yüksek riskli istekleri onaylamadan ve bir bilgisayarı devralmadan önce kilidi yeniden açın.';

  @override
  String get requireAppLock => 'Uygulama kilidini zorunlu kıl';

  @override
  String get requireAppLockHelp =>
      'Üyeler Casama\'yı açmadan önce her cihazda kilitlemelidir. Web\'de bunun için bir geçiş anahtarı gerekir.';

  @override
  String get requireAppLockOwnFirst =>
      'Önce bu cihazda uygulama kilidini açın.';

  @override
  String get permLocation => 'Konum';

  @override
  String get permLocationAlways => 'Arka planda konum';

  @override
  String get permCamera => 'Kamera';

  @override
  String get permMicrophone => 'Mikrofon';

  @override
  String get permSpeech => 'Konuşma tanıma';

  @override
  String get permPhotos => 'Fotoğraflar';

  @override
  String get permContacts => 'Kişiler';

  @override
  String get permCalendar => 'Takvimler';

  @override
  String get permHealth => 'Sağlık';

  @override
  String get permNotifications => 'Bildirimler';

  @override
  String get permNotificationAccess => 'Bildirim erişimi';

  @override
  String get permAccessibility => 'Erişilebilirlik';

  @override
  String get permScreenRecording => 'Ekran Kaydı';

  @override
  String get permAutomation => 'Otomasyon';

  @override
  String get permFullDisk => 'Tam Disk Erişimi';

  @override
  String get permSharedFolders => 'Paylaşılan klasörler';

  @override
  String get permLocalTools => 'Yerel araçlar';

  @override
  String get cardPermissions => 'İzinler';

  @override
  String permissionsTitle(String device) {
    return '$device için bunları açın';
  }

  @override
  String get permStateOn => 'Açık';

  @override
  String get permStateOff => 'Kapalı';

  @override
  String get permStateNotAsked => 'Henüz sorulmadı';

  @override
  String get permStateLimited => 'Sınırlı';

  @override
  String get permStateUnknown => 'Bilinmiyor';

  @override
  String get permStateUnavailable => 'Bu cihazda kullanılamıyor';

  @override
  String get permStateUpdate => 'Burada açmak için Casama\'yı güncelleyin';

  @override
  String get permTurnOn => 'Aç';

  @override
  String get permOpenSettings => 'Ayarları aç';

  @override
  String get permOpenHealth => 'Sağlık uygulamasını aç';

  @override
  String get permHealthIosHow =>
      'Sağlık uygulamasında resminize, ardından Uygulamalar\'a, sonra Casama\'ya dokunun ve botlarınızın okuyabileceği şeyleri açın.';

  @override
  String get permChoose => 'Seç';

  @override
  String get permRestart => 'Casama\'yı yeniden başlat';

  @override
  String get permRestartToFinish => 'Bitirmek için Casama\'yı yeniden başlatın';

  @override
  String permOpenedOn(String device) {
    return '$device üzerinde açıldı';
  }

  @override
  String permSentTo(String device) {
    return '$device cihazına gönderildi: oradaki bildirime dokunun';
  }

  @override
  String permOffline(String device) {
    return '$device çevrimdışı';
  }

  @override
  String permRestarting(String device) {
    return '$device cihazında Casama yeniden başlatılıyor';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Bunları yalnızca $device cihazının sahibi açabilir';
  }

  @override
  String get permNotNowLine => 'Şimdi değil';

  @override
  String get permContinue => 'Devam et';

  @override
  String get permContinueMessage => 'İzinleri açtım, devam et.';

  @override
  String get permContinuedLine => 'Açıldı';

  @override
  String get permissionsScreenTitle => 'İzinler';

  @override
  String get permissionsScreenHelp =>
      'Botların bu cihazda kullanabilecekleri. Siz dokunana kadar hiçbir şey istenmez.';

  @override
  String get permissionsRowHelp =>
      'Bu cihazdaki konum, ekran, mikrofon ve daha fazlası';

  @override
  String permOtherDevice(String device) {
    return 'Bu, $device içindi. Açmak için orada Casama\'yı açın.';
  }

  @override
  String get permAnotherDevice => 'başka bir cihaz';

  @override
  String get permissionsNone => 'Bu cihazda açılacak bir şey yok.';

  @override
  String get widgetNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String get widgetAllClear => 'Her şey yolunda';

  @override
  String get widgetAllow => 'İzin ver';

  @override
  String get widgetDeny => 'Reddet';

  @override
  String get widgetReview => 'İncele';

  @override
  String get widgetOpen => 'Aç';

  @override
  String get widgetDoIt => 'Yap';

  @override
  String get widgetRunNow => 'Şimdi çalıştır';

  @override
  String get widgetStarted => 'Başlatıldı';

  @override
  String get widgetStop => 'Durdur';

  @override
  String get widgetAsk => 'Sor';

  @override
  String widgetAskBot(String bot) {
    return '$bot botuna sor';
  }

  @override
  String get widgetTalk => 'Konuş';

  @override
  String get widgetTry => 'Dene';

  @override
  String get widgetUpNext => 'Sıradaki';

  @override
  String get widgetNoRoutines => 'Henüz rutin yok';

  @override
  String get widgetWorking => 'Çalışıyor';

  @override
  String get widgetWaiting => 'Sizi bekliyor';

  @override
  String get widgetIdle => 'Boşta';

  @override
  String widgetRepliedAt(String time) {
    return 'Yanıt saati: $time';
  }

  @override
  String get widgetBrief => 'Özet';

  @override
  String widgetBriefAt(String time) {
    return '$time saatinde özet';
  }

  @override
  String get widgetNoBrief => 'Henüz özet yok';

  @override
  String get widgetToday => 'Bugün';

  @override
  String get widgetCredits => 'Krediler';

  @override
  String widgetCreditsLeft(String amount) {
    return '$amount kaldı';
  }

  @override
  String widgetSpentToday(String amount) {
    return 'Bugün $amount';
  }

  @override
  String widgetUsedPct(String n) {
    return '%$n kullanıldı';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Sıfırlanma: $time';
  }

  @override
  String get widgetFinished => 'Bitti';

  @override
  String get widgetLibrary => 'Kitaplık';

  @override
  String get widgetNoCreations => 'Henüz yapılmış bir şey yok';

  @override
  String get widgetTasks => 'Görevler';

  @override
  String get widgetTodo => 'Yapılacak';

  @override
  String get widgetInProgress => 'Devam ediyor';

  @override
  String get widgetInReview => 'İncelemede';

  @override
  String get widgetBlocked => 'Engellendi';

  @override
  String get widgetSignIn => 'Oturum açmak için Casama\'yı açın';

  @override
  String get widgetNoBots => 'İlk botunuzla tanışın';

  @override
  String widgetAsOf(String time) {
    return '$time itibarıyla';
  }

  @override
  String get widgetUpdateServer =>
      'Bu araç takımını kullanmak için Casama sunucunuzu güncelleyin';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot onayınızı bekliyor';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot öneriyor';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot devralmanızı istiyor';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Sonraki özet $time';
  }

  @override
  String get widgetNothingNext => 'Zamanlanmış bir şey yok';

  @override
  String get widgetsTitle => 'Araç takımları';

  @override
  String get widgetsRow => 'Ana ekranda ve Kilitli Ekranda botlarınız';

  @override
  String get widgetsIntro =>
      'Araç takımları, Casama\'yı açmadan botlarınızın ne yaptığını ve sizden ne beklendiğini gösterir.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Rutinler';

  @override
  String get widgetDescNeedsYou => 'Hangi botların sizi beklediğini görün';

  @override
  String get widgetDescBot => 'Bir botun ne yaptığını görün';

  @override
  String get widgetDescAsk => 'Tek dokunuşla bir bota sorun veya konuşun';

  @override
  String get widgetDescRoutines =>
      'Sırada neyin çalışacağını görün ve şimdi çalıştırın';

  @override
  String get widgetDescToday =>
      'Tüm gününüzü tek bir büyük araç takımında görün';

  @override
  String get widgetDescBrief => 'Sabah özetinizi okuyun';

  @override
  String get widgetDescLibrary =>
      'Botlarınızın son zamanlarda yaptıklarını görün';

  @override
  String get widgetDescTasks => 'Görev panosunun durumunu görün';

  @override
  String get widgetDescCredits => 'Kredilerinizi takip edin';

  @override
  String get widgetsAddToHome => 'Ana ekrana ekle';

  @override
  String get widgetsPinUnsupported =>
      'Başlatıcınız buradan araç takımı ekleyemiyor. Ana ekranınızda boş bir yere dokunup basılı tutun, Widget\'lar\'a dokunun ve Casama\'yı seçin.';

  @override
  String get widgetsHowToAdd => 'Nasıl eklenir';

  @override
  String get widgetsHowToIos =>
      'Ana Ekranınızda boş bir yere dokunup basılı tutun, Düzenle\'ye, ardından Araç Takımı Ekle\'ye dokunun ve Casama\'yı seçin.';

  @override
  String get widgetsHowToMac =>
      'Menü çubuğundaki tarih ve saate tıklayın, ardından Araç Takımlarını Düzenle\'yi tıklayıp Casama\'yı seçin. Veya masaüstüne sağ tıklayıp Araç Takımlarını Düzenle\'yi seçin.';

  @override
  String get widgetsLockScreen => 'Kilitli Ekran ve denetimler';

  @override
  String get widgetsLockScreenHelp =>
      'Kilitli Ekrana dokunup basılı tutun, Özelleştir\'e, ardından Kilitli Ekran\'a dokunun ve saatin altındaki alana dokunarak Sizden yanıt bekliyor, Sıradaki, Bot veya Krediler araç takımlarını ekleyin. Siz kilidi açana kadar istekler gizli kalır.';

  @override
  String get widgetsControlsHelp =>
      'Denetim Merkezi\'ni açın, dokunup basılı tutun, Denetim Ekle\'ye dokunun ve Casama\'ya Sor, Bir botla konuş veya Bir rutin çalıştır seçeneklerinden birini seçin. Bunlar Kilit Ekranı köşelerine ve Eylem düğmesine de sığar.';

  @override
  String get widgetsShowDetails => 'Araç takımlarında ayrıntıları göster';

  @override
  String get widgetsShowDetailsHelp =>
      'Uygulama kilidi açıkken araç takımları yalnızca sayıları ve bot adlarını gösterir; düğmeleri Casama\'yı açar. İstekleri, mesajları ve rutin adlarını da göstermek için bunu açın.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Yalnızca uygulama kilidi açıkken önemlidir. Kapalıyken araç takımları ayrıntıları gösterir.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace çalışma alanı uygulama kilidi gerektirir, bu nedenle araç takımları ayrıntıları gizli tutar.';
  }

  @override
  String get widgetsPinBot => 'Ana ekranınıza bir bot sabitleyin';

  @override
  String get widgetsPinBotHelp =>
      'Botu kendi simgesi olarak Ana ekranınıza ekler. Sohbet etmek için dokunun.';

  @override
  String get widgetsPin => 'Sabitle';

  @override
  String get widgetNudgeNeedsYou =>
      'Sizden yanıt bekliyor araç takımıyla istekleri Ana ekranınızdan yanıtlayın.';

  @override
  String get widgetNudgeRoutines =>
      'Rutinler araç takımıyla rutinleri Ana ekranınızdan çalıştırın.';

  @override
  String get widgetNameCanvas => 'Tuval';

  @override
  String get widgetDescCanvas =>
      'Botlarınızın oraya koyduklarını gösterir; günlük bir dize veya geri sayım gibi';

  @override
  String get canvasEmpty => 'Bir bottan buraya bir şey koymasını isteyin';

  @override
  String get canvasTry => 'Deneyin: Kilitli Ekranıma günlük bir dize koy';

  @override
  String get canvasAutomatic => 'Otomatik';

  @override
  String canvasIn(String time) {
    return '$time sonra';
  }

  @override
  String canvasSince(String time) {
    return '$time geçti';
  }

  @override
  String get canvasNow => 'Şimdi';

  @override
  String canvasLeft(String n) {
    return '$n kaldı';
  }

  @override
  String get canvasLeftUnit => 'kaldı';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'gün',
      one: 'gün',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Araç takımları';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot bunu araç takımlarınızda göstermek istiyor';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Evet dediğinizde $bot bunu sormadan değiştirebilir. Ayarlar, Araç takımları bölümünden istediğiniz zaman durdurabilirsiniz.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot bunu araç takımlarınıza koydu';
  }

  @override
  String get canvasShow => 'Araç takımlarımda göster';

  @override
  String get canvasShowing => 'Araç takımlarınızda gösteriliyor';

  @override
  String canvasNotShown(String bot) {
    return 'Gösterilmiyor. $bot başka bir gün tekrar sorabilir.';
  }

  @override
  String get canvasGone => 'Artık araç takımlarınızda değil';

  @override
  String get canvasNotPlaced => 'Görmek için Tuval araç takımını ekleyin.';

  @override
  String get canvasHowToIos =>
      'Ana Ekrana veya Kilitli Ekrana dokunup basılı tutun, Düzenle\'ye, ardından Araç Takımı Ekle\'ye dokunun ve Casama\'yı, sonra Tuval\'i seçin.';

  @override
  String get canvasHowToMac =>
      'Masaüstüne sağ tıklayın, Araç Takımlarını Düzenle\'yi seçin ve Casama\'yı, ardından Tuval\'i seçin.';

  @override
  String get canvasHowToElsewhere =>
      'Orada görmek için telefonunuza veya Mac\'inize Casama\'nın Tuval araç takımını ekleyin.';

  @override
  String get canvasAdded => 'Tuval araç takımı eklendi';

  @override
  String get canvasLockScreen => 'Kilitli Ekranda';

  @override
  String get widgetsFromBots => 'Botlarınızdan';

  @override
  String get widgetsFromBotsEmpty =>
      'Henüz bir şey yok. Bir bottan \"Kilitli Ekranıma günlük bir dize koy\" gibi bir şey isteyin.';

  @override
  String canvasSetAt(String time) {
    return 'Ayarlandı: $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Şurada gösteriliyor: $devices';
  }

  @override
  String get canvasNoWidget => 'Henüz Tuval araç takımı eklenmedi';

  @override
  String get canvasPausedLine => 'Duraklatıldı';

  @override
  String get canvasWaitingLine => 'Evet yanıtınız bekleniyor';

  @override
  String get canvasHideLocked => 'Kilitli telefonda gizle';

  @override
  String get canvasPause => 'Duraklat';

  @override
  String get canvasResume => 'Sürdür';

  @override
  String get canvasClear => 'Temizle';

  @override
  String canvasClearTitle(String name) {
    return '$name temizlensin mi?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'Araç takımlarınızdan kaldırılır. $bot oraya tekrar bir şey koyabilir.';
  }

  @override
  String get canvasAllowedBots => 'Araç takımlarınızdaki botlar';

  @override
  String get canvasMayShow => 'Araç takımlarınızda bir şeyler gösterebilir';

  @override
  String canvasStopTitle(String bot) {
    return '$bot durdurulsun mu?';
  }

  @override
  String canvasStopMessage(String bot) {
    return '$bot botunun araç takımlarınızda gösterdikleri temizlenir ve tekrar izin istemesi gerekir.';
  }

  @override
  String get canvasStop => 'Durdur';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Android telefon';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Göster';

  @override
  String get widgetLowRisk => 'Düşük risk';

  @override
  String get widgetThisMonth => 'Bu ay';

  @override
  String get watchNow => 'Şimdi';

  @override
  String get watchAsk => 'Sor';

  @override
  String watchAskBot(String bot) {
    return '$bot botuna sor';
  }

  @override
  String get watchBots => 'Botlar';

  @override
  String get watchUpNext => 'Sıradaki';

  @override
  String get watchBrief => 'Özet';

  @override
  String get watchSettings => 'Ayarlar';

  @override
  String get watchChat => 'Sohbet';

  @override
  String get watchTalk => 'Konuş';

  @override
  String get watchCredits => 'Krediler';

  @override
  String get watchNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String get watchNeedsYouOne => '1 yanıt bekliyor';

  @override
  String watchNeedsYouMany(String count) {
    return '$count istek bekliyor';
  }

  @override
  String get watchNeedsOk => 'Onayınız gerekiyor';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot onayınızı bekliyor';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot öneriyor';
  }

  @override
  String get watchTakeOver => 'Devralmanızı istiyor';

  @override
  String get watchAllClear => 'Her şey yolunda';

  @override
  String get watchNothingWaiting => 'Sizden yanıt bekleyen yok';

  @override
  String get watchAllow => 'İzin ver';

  @override
  String get watchDeny => 'Reddet';

  @override
  String get watchHoldToAllow => 'İzin vermek için basılı tut';

  @override
  String get watchHoldHint =>
      'İzin verilsin mi? İzin vermek için çift dokunun.';

  @override
  String get watchReview => 'İncele';

  @override
  String get watchReviewOnIphone => 'iPhone\'da incele';

  @override
  String get watchReviewOnPhone => 'Telefonda incele';

  @override
  String get watchWhyHighRisk => 'Yüksek risk: telefonunuzdan yanıtlayın';

  @override
  String get watchWhyPayment => 'Ödemeler telefonunuzdan yanıtlanır';

  @override
  String get watchWhySetting => 'Ayarlarınız bunu telefonunuzda tutuyor';

  @override
  String get watchWhyWorkspace => 'Çalışma alanınız bunu telefonunuzda tutuyor';

  @override
  String get watchWhyNotYours =>
      'Yalnızca bu sohbeti başlatan kişi izin verebilir';

  @override
  String get watchHighRisk => 'Yüksek risk';

  @override
  String get watchMediumRisk => 'Orta risk';

  @override
  String get watchLowRisk => 'Düşük risk';

  @override
  String get watchAllowed => 'İzin verildi';

  @override
  String get watchDenied => 'Reddedildi';

  @override
  String get watchDone => 'Tamamlandı';

  @override
  String get watchAlreadyAnswered => 'Zaten yanıtlandı';

  @override
  String get watchLockToAllow =>
      'Buradan izin vermek için bu saatte bir parola belirleyin';

  @override
  String get watchDoIt => 'Yap';

  @override
  String get watchNotNow => 'Şimdi değil';

  @override
  String get watchOpenOnIphone => 'iPhone\'da aç';

  @override
  String get watchOpenOnPhone => 'Telefonda aç';

  @override
  String get watchSentToPhone => 'Telefonunuza gönderildi';

  @override
  String get watchWorking => 'Çalışıyor';

  @override
  String watchIsWorking(String bot) {
    return '$bot çalışıyor';
  }

  @override
  String get watchWaitingForYou => 'Sizi bekliyor';

  @override
  String watchRepliedAt(String time) {
    return 'Yanıt saati: $time';
  }

  @override
  String get watchIdle => 'Boşta';

  @override
  String get watchOff => 'Kapalı';

  @override
  String watchStepCount(String count) {
    return 'Adım $count';
  }

  @override
  String get watchStop => 'Durdur';

  @override
  String get watchStopped => 'Durduruldu';

  @override
  String get watchFinished => 'Bitti';

  @override
  String get watchProblem => 'Bir sorunla durdu';

  @override
  String get watchCouldntFinish => 'Tamamlanamadı';

  @override
  String get watchListening => 'Dinleniyor…';

  @override
  String get watchTapToStop => 'Durdurmak için dokunun';

  @override
  String get watchTypeInstead => 'Bunun yerine yaz';

  @override
  String get watchSending => 'Gönderiliyor…';

  @override
  String get watchHeard => 'Duyuldu';

  @override
  String get watchUndo => 'Geri al';

  @override
  String get watchKeptOffline =>
      'Kaydedildi. Tekrar çevrimiçi olduğunuzda gönderilir';

  @override
  String watchKeptOld(String time) {
    return '$time saatinde sorduğunuz gönderilsin mi?';
  }

  @override
  String get watchSend => 'Gönder';

  @override
  String get watchDiscard => 'Vazgeç';

  @override
  String get watchMicDenied =>
      'Sesle sormak için Ayarlar\'dan mikrofona izin verin';

  @override
  String get watchNoDictation =>
      'Bu sunucuda ses hizmeti yok. Bunun yerine Yaz\'ı kullanın';

  @override
  String get watchDidntCatch => 'Anlaşılamadı. Yeniden dene';

  @override
  String get watchReply => 'Yanıtla';

  @override
  String get watchReadAloud => 'Sesli oku';

  @override
  String get watchStopReading => 'Okumayı durdur';

  @override
  String get watchContinuesOnIphone => 'iPhone\'da devam ediyor';

  @override
  String get watchContinuesOnPhone => 'Telefonda devam ediyor';

  @override
  String get watchReplyReady => 'Yanıt hazır';

  @override
  String get watchYou => 'Siz';

  @override
  String get watchQuickYes => 'Evet';

  @override
  String get watchQuickNo => 'Hayır';

  @override
  String get watchQuickTellMore => 'Daha fazla anlat';

  @override
  String get watchQuickNotNow => 'Şimdi değil';

  @override
  String get watchRunNow => 'Şimdi çalıştır';

  @override
  String get watchStarted => 'Başlatıldı';

  @override
  String watchInMinutes(String minutes) {
    return '$minutes dk içinde';
  }

  @override
  String get watchNoRoutines => 'Henüz rutin yok';

  @override
  String watchBriefAt(String time) {
    return '$time saatinde özet';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Yarın $time saatinde özet';
  }

  @override
  String get watchNoBrief => 'Ayarlanmış özet yok';

  @override
  String get watchNoBots => 'Henüz bot yok. Telefonunuzda bir tane oluşturun';

  @override
  String get watchSigningIn => 'Oturumunuz açılıyor';

  @override
  String watchSignedInAs(String name) {
    return '$name olarak oturum açıldı';
  }

  @override
  String get watchOpenPhoneToFinishIphone =>
      'Bitirmek için iPhone\'unuzda Casama\'yı açın';

  @override
  String get watchOpenPhoneToFinish =>
      'Bitirmek için telefonunuzda Casama\'yı açın';

  @override
  String get watchUseCode => 'Kodla oturum aç';

  @override
  String get watchCodeHelp =>
      'Telefonunuzdaki veya bilgisayarınızdaki Casama\'ya yazın: Ayarlar → Saat';

  @override
  String get watchNewCode => 'Yeni kod';

  @override
  String get watchSignedOut => 'Bu saatte oturum kapalı';

  @override
  String get watchOpenToSignIn => 'Oturum açmak için Casama\'yı açın';

  @override
  String watchAsOf(String time) {
    return '$time itibarıyla';
  }

  @override
  String get watchOffline => 'Çevrimdışı';

  @override
  String get watchCouldntReach => 'Casama\'ya ulaşılamadı';

  @override
  String get watchTryAgain => 'Yeniden dene';

  @override
  String get watchServerTooOld =>
      'Saati kullanmak için Casama sunucunuzu güncelleyin';

  @override
  String get watchOutOfCredits => 'Kredi bitti';

  @override
  String get watchTalkOnPhone => 'Arama telefonunuzda başlatılıyor';

  @override
  String get watchSignOut => 'Bu saatten oturumu kapat';

  @override
  String get watchHideDetails => 'Bileğim aşağıdayken ayrıntıları gizle';

  @override
  String get watchReadRepliesAloud => 'Yanıtları sesli oku';

  @override
  String get watchAskUses => '“Sor” için bot';

  @override
  String get watchWorkspace => 'Çalışma alanı';

  @override
  String get watchSignedInAsLabel => 'Oturum açılan hesap';

  @override
  String get watchCompNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String get watchCompAsk => 'Bir bota sor';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'Sıradaki';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou => 'Kaç isteğin beklediği ve ilk istek';

  @override
  String get watchCompDescAsk => 'Tek dokunuşla bir bota sesle sorun';

  @override
  String get watchCompDescBot => 'Bir botun durumu ve ne yaptığı';

  @override
  String get watchCompDescUpNext => 'Sıradaki rutin ve ne zaman çalışacağı';

  @override
  String get watchCompDescCredits => 'Bu dönem kullanılan krediler';

  @override
  String get watchNeedYouShort => 'bekliyor';

  @override
  String get watchControlAsk => 'Casama\'ya Sor';

  @override
  String get watchControlTalk => 'Bir botla konuş';

  @override
  String get watchControlRun => 'Bir rutin çalıştır';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count yanıt bekliyor. İlki: $text';
  }

  @override
  String get watchPhoneTitle => 'Saat';

  @override
  String get watchPhoneIntro =>
      'Bileğinizden botlara yanıt verin, sesle sorun ve kimin çalıştığını görün.';

  @override
  String get watchPhoneWatches => 'Oturum açılmış saatler';

  @override
  String get watchPhoneNone =>
      'Henüz hiçbir saatte oturum açılmadı. Saatinizde Casama\'yı açtığınızda kendiliğinden oturum açar.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Son kullanım: $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Henüz kullanılmadı';

  @override
  String get watchPhoneRemove => 'Kaldır';

  @override
  String watchPhoneRemoveTitle(String name) {
    return '$name kaldırılsın mı?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'Hemen oturumu kapatılır. Daha sonra yeniden oturum açabilirsiniz.';

  @override
  String get watchPhoneUseCode => 'Bir saatte kodla oturum aç';

  @override
  String get watchPhoneCodeHint => 'Saatinizdeki kod';

  @override
  String watchPhoneCodeAsk(String name) {
    return '$name oturum açsın mı?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'Sizin adınıza $workspace çalışma alanında oturum açılacak. Yalnızca kendi saatinizde gösterilen bir kodu onaylayın.';
  }

  @override
  String get watchPhoneCodeAllow => 'Oturumunu aç';

  @override
  String get watchPhoneCodeWrong =>
      'Bu kod çalışmadı. Saatinizden kontrol edin';

  @override
  String get watchPhoneCodeTaken =>
      'Bu saat hâlâ başka bir hesapta oturum açmış durumda. Orada Ayarlar → Saat bölümünden kaldırın, ardından yeni bir kod alın';

  @override
  String watchPhoneElsewhere(String workspace) {
    return '$workspace çalışma alanında oturum açık';
  }

  @override
  String get watchPhoneElsewhereUnknown =>
      'Başka bir çalışma alanında oturum açık';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name oturum açtı';
  }

  @override
  String get watchPhoneAllowTitle => 'Saatten izin ver';

  @override
  String get watchPhoneAllowMedium => 'Düşük ve orta risk';

  @override
  String get watchPhoneAllowMediumBody =>
      'Düşük risk tek dokunuşla, orta risk basılı tutarak. Yüksek risk ve ödemeler için her zaman telefonunuz gerekir.';

  @override
  String get watchPhoneAllowLow => 'Yalnızca düşük risk';

  @override
  String get watchPhoneAllowNone => 'Hiçbir zaman';

  @override
  String get watchPhoneDetails => 'Saatte ayrıntıları göster';

  @override
  String get watchPhoneDetailsBody =>
      'Kapalı: saat botların yazdıklarını değil, sayıları ve bot adlarını gösterir.';

  @override
  String get watchPhoneQuickReplies => 'Hızlı yanıtlar';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Bir yanıt bildiriminden gönderebileceğiniz kısa yanıtlar. En fazla altı tane.';

  @override
  String get watchPhoneQuickAdd => 'Hızlı yanıt ekle';

  @override
  String get watchPhoneQuickReset => 'Yerleşik yanıtları kullan';

  @override
  String get watchPhoneHowTo => 'Saat kadranınıza Casama ekleyin';

  @override
  String get watchPhoneHowToApple =>
      'Saat kadranınıza dokunup basılı tutun, Düzenle\'ye dokunun, ardından bir komplikasyon için Casama\'yı seçin. Akıllı Gruplama içinde Casama\'yı bulmak için kadranda Digital Crown\'u çevirin.';

  @override
  String get watchPhoneHowToWear =>
      'Casama komplikasyonu eklemek için saat kadranınıza dokunup basılı tutun. Kadrandan sola kaydırın ve bir Casama kartı eklemek için + öğesine dokunun.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return '$name oturum açılıyor…';
  }

  @override
  String get watchPhoneLockAsk => 'Saatinizde oturum açılsın mı?';

  @override
  String get watchPhoneNudge =>
      'Casama saatinizde de var. Bileğinizden botlara yanıt verin.';

  @override
  String get watchPhoneHandoffTitle => 'Saatinizden';

  @override
  String get watchPhoneRow => 'Apple Watch veya Wear OS saatinizde botlarınız';

  @override
  String get watchPhoneAllowLowBody =>
      'Düşük risk tek dokunuşla. Diğer her şey için telefonunuz gerekir.';

  @override
  String get watchPhoneAllowNoneBody =>
      'Saat yalnızca reddedebilir. Telefonunuzdan izin verin.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Uygulama kilidi açık olduğu için kapatıldı; böylece saatiniz sohbetlerinizden hiçbir sözcük göstermez. Görmek için açın.';

  @override
  String get watchPhoneQuickHint => 'Kısa bir yanıt';

  @override
  String get watchPhoneQuickTooLong => 'En fazla 40 karakter';

  @override
  String get watchPhoneQuickMoveUp => 'Yukarı taşı';

  @override
  String get watchPhoneQuickMoveDown => 'Aşağı taşı';

  @override
  String get watchPhoneQuickDelete => 'Bu yanıtı sil';

  @override
  String get watchPhoneCodeBody =>
      'Saatinizde Casama\'yı açın ve Kodla oturum aç\'ı seçin.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking => 'Kimin çalıştığı ve ne yaptığı';

  @override
  String get watchCompDescBrief => 'Bu sabahın özeti';

  @override
  String get watchCodeWaiting => 'Kod bekleniyor…';

  @override
  String watchCodeA11y(String code) {
    return 'Oturum açma kodu $code';
  }

  @override
  String get watchChooseBot => 'Bir bot seçin';

  @override
  String get watchChannelRequests => 'İstekler';

  @override
  String get watchChannelReplies => 'Yanıtlar';

  @override
  String get watchChannelRuns => 'Çalışan botlar';

  @override
  String get watchChannelOther => 'Diğer';

  @override
  String get watchOtherWorkspace =>
      'Bu başka bir çalışma alanında. Telefonunuzdan yanıtlayın';

  @override
  String get watchReplySent => 'Gönderildi';

  @override
  String get watchReplyNotSent => 'Yanıtınız gönderilemedi';

  @override
  String watchAskDropped(String time) {
    return '$time saatinde sorduğunuz gönderilemedi';
  }

  @override
  String get watchNeedsHttps =>
      'Bu saat sunucunuza yalnızca https üzerinden veya ev ağınızda ulaşabilir';

  @override
  String get watchSignIn => 'Oturum aç';

  @override
  String get watchNotOnWatch => 'Bu saat bunu yanıtlayamaz. Telefonunuzda açın';

  @override
  String watchMoreOnPhone(String count) {
    return 'Telefonunuzda $count tane daha';
  }

  @override
  String get watchShareCrashReports => 'Çökme raporlarını paylaş';

  @override
  String get showList => 'Listeyi göster';

  @override
  String get hideList => 'Listeyi gizle';

  @override
  String get panePickLibrary =>
      'Burada görmek için Kitaplık\'tan bir şey seçin.';

  @override
  String get panePickSetting => 'Burada görmek için bir ayar seçin.';

  @override
  String get trackpad => 'İzleme dörtgeni';

  @override
  String get trackpadHint =>
      'Tek parmak imleci hareket ettirir, iki parmak kaydırır, dokunma tıklar.';

  @override
  String get trackpadTakeControl =>
      'İzleme dörtgenini kullanmak için denetimi devralın.';

  @override
  String get foldScreenTitle => 'Katlanır ekran';

  @override
  String get foldRowHelp => 'Casama\'nın bu cihazın ekranlarından gördükleri';

  @override
  String get foldScreenHelp =>
      'Casama\'nın şu anda gördüğü şekliyle bu cihazın nasıl tutulduğu ve kat yerinin nerede olduğu. Cihazı açın, kapatın veya katlayın; sayılar takip edecektir. Bir ekran hatalı görünüyorsa bunları kopyalayın.';

  @override
  String get foldPose => 'Duruş';

  @override
  String get foldWindow => 'Pencere';

  @override
  String get foldInsets => 'Güvenli alan';

  @override
  String get foldStrip => 'Yan şerit';

  @override
  String get foldFold => 'Kat yeri';

  @override
  String get foldHinge => 'Menteşe';

  @override
  String get foldSystemSays => 'Sistemin bildirdikleri';

  @override
  String get inviteGateLine =>
      'Casama Cloud şimdilik yalnızca davetle kullanılabilir.';

  @override
  String get inviteGateSelfHost =>
      'Casama\'yı kendi sunucunuzda çalıştırmak herkese açıktır.';

  @override
  String get joinTheWaitlist => 'Bekleme listesine katıl';

  @override
  String get iHaveAnInvite => 'Davetim var';

  @override
  String get waitlistSubtitle =>
      'İnsanları azar azar içeri alıyoruz. Sıranız geldiğinde tek bir e-posta alacaksınız.';

  @override
  String get waitlistNote => 'Bir bota ilk ne yaptırırdınız?';

  @override
  String get waitlistNoteHint => 'İsteğe bağlı';

  @override
  String get waitlistSelfHosting => 'Casama\'yı kendi sunucumda çalıştırıyorum';

  @override
  String get waitlistNewsletter =>
      'Bana Casama\'nın aylık e-postasını da gönder (en fazla ayda bir kez)';

  @override
  String get waitlistAppleRelay =>
      'Bu, Apple\'ın sizin için oluşturduğu özel adrestir. Apple ile oturum açacaksanız saklayın; Apple e-postalarımızı gelen kutunuza iletir.';

  @override
  String get waitlistJoinedTitle => 'Listedesiniz.';

  @override
  String get waitlistJoinedBody =>
      'İnsanları azar azar içeri alıyoruz. Sıranız geldiğinde tek bir e-posta alacaksınız; aylık e-postayı istemediyseniz başka hiçbir şey gönderilmez. Casama kullanan birini tanıyor musunuz? Ondan alacağınız bir davet sizi hemen içeri alır.';

  @override
  String get waitlistJoinedCode => 'Davet kodunuz var mı? Buraya girin.';

  @override
  String get waitlistJoinedSelfHost =>
      'Beklemek istemiyor musunuz? Casama açık kaynaklıdır. Bugün kendi bilgisayarınızda çalıştırın.';

  @override
  String get waitlistRunItYourself => 'Kendiniz çalıştırın';

  @override
  String get inviteSubtitle =>
      'Davet kodunuzu girin veya davet bağlantısını yapıştırın.';

  @override
  String get inviteCodeLabel => 'Davet kodu';

  @override
  String get inviteNotFound =>
      'Bu kod hiçbir davetle eşleşmiyor. Kontrol edip yeniden deneyin.';

  @override
  String inviteFromName(String name) {
    return '$name sizi Casama\'ya davet etti';
  }

  @override
  String get inviteFromFriend => 'Bir arkadaşınız sizi Casama\'ya davet etti';

  @override
  String inviteFromCampaign(String label) {
    return 'Davetiniz: $label';
  }

  @override
  String get inviteFromCasama => 'Casama davetiniz';

  @override
  String get inviteChooseSignIn =>
      'Şimdi nasıl oturum açacağınızı seçin. Hesabınız için istediğiniz adresi kullanın.';

  @override
  String get inviteGoneHelp =>
      'Bu davetler tükendi. E-postanızı girin, bekleme listesinde sıranın önüne geçin.';

  @override
  String get inviteEmailHelp =>
      'Bu adrese izin vereceğiz, ardından oturum açma bağlantısı göndereceğiz.';

  @override
  String inviteCheckInbox(String email) {
    return 'İçeridesiniz. Oturum açma bağlantısı için $email adresini kontrol edin veya kodunu buraya yazın.';
  }

  @override
  String get inviteWaitlistedTitle => 'Bekleme listesindesiniz';

  @override
  String get inviteWaitlisted =>
      'Bu davetler tükendi ancak sıranın önündesiniz.';

  @override
  String get inviteUseEmailHere =>
      'Bu cihazda E-posta ile devam et seçeneğini kullanın. Apple ve Google, iPhone, Mac ve Android uygulamalarında davetle çalışır.';

  @override
  String get inviteDifferentCode => 'Farklı bir kod kullan';

  @override
  String get inviteRefusedHelp =>
      'Bekleme listesine katılın, sıranız geldiğinde size e-posta gönderelim; veya varsa bir davet kodu girin.';

  @override
  String get inviteRefusedWaitlisted =>
      'Casama Cloud şimdilik yalnızca davetle kullanılabilir. Sıranız geldiğinde size e-posta göndereceğiz. Davet kodunuz mu var? Şimdi kullanın.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count davet hakkı kaldı',
      one: '1 davet hakkı kaldı',
      zero: 'Hiç davet hakkı kalmadı',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$total davetten $used tanesi kullanıldı. Her biri bir arkadaşınızın hesap açmasını sağlar.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'İlk sohbetinizi tamamladıktan sonra davetleriniz açılır.';

  @override
  String get inviteWaitingTitle => 'Davetinizi bekliyor';

  @override
  String get inviteWaitingUses => 'Onları içeri almak bir davetinizi kullanır.';

  @override
  String get inviteWaitingNoneLeft =>
      'Davet ettiğiniz bir arkadaşınız ilk sohbetini tamamladığında bir davet geri alırsınız.';

  @override
  String get inviteWaitingLetIn => 'İçeri al';

  @override
  String inviteWaitingLetInLabel(String email) {
    return '$email adresini içeri al';
  }

  @override
  String get inviteWaitingDone =>
      'Birkaç dakika içinde kaydolmak için bir e-posta alacaklar.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Casama davetimden birini sana ayırdım.',
      one: 'Casama davetimi sana ayırdım.',
    );
    return '$_temp0 Casama şimdilik yalnızca davetle kullanılabiliyor; bu davetle hemen girebilirsin: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Casama davetimden birini sana ayırdım.',
      one: 'Casama davetimi sana ayırdım.',
    );
    return '$_temp0 Casama şimdilik yalnızca davetle kullanılabiliyor. Bu davetle hemen girebilirsin ve ilk sohbetinden sonra $amount tutarında ücretsiz kullanım kazanırsın: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => 'Kimin için?';

  @override
  String get inviteNameHelp =>
      'Adlarını ekleyin; davet sayfası onları adıyla karşılasın. Boş bırakabilirsiniz.';

  @override
  String get inviteNameHint => 'Ad';

  @override
  String get inviteNameShare => 'Daveti paylaş';

  @override
  String get inviteAskTitle => 'Başka kim bunu kullanır?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Casama için $count davetiniz var. Her biri bir arkadaşınızı hemen içeri alır.',
      one: 'Casama için 1 davetiniz var. Bir arkadaşınızı hemen içeri alır.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'İlk sohbetlerinin ardından her biriniz $amount ücretsiz kullanım kazanırsınız.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'İlk sohbetlerinin ardından $amount ücretsiz kullanım kazanırsınız.';
  }

  @override
  String get inviteAskSend => 'Davet gönder';

  @override
  String get inviteAskNotNow => 'Şimdi değil';

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
      other: '$count kayıtlı sıfırlama',
      one: '1 kayıtlı sıfırlama',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'Son kullanım: $date';
  }

  @override
  String get savedResetUse => 'Sıfırlamayı kullan';

  @override
  String get savedResetConfirmTitle => 'Bu sıfırlama kullanılsın mı?';

  @override
  String get savedResetConfirmDaily =>
      'Botlarınızın bugün yeniden çalışabilmesi için bugünkü sınırı temizler. Bu işlem geri alınamaz.';

  @override
  String get savedResetConfirmComputer =>
      'Bu ayın bilgisayar saatlerini geri verir. Bu işlem geri alınamaz.';

  @override
  String get savedResetOwnerRequired =>
      'Bunu yalnızca bir çalışma alanı sahibi kullanabilir.';

  @override
  String get savedResetPaused =>
      'Şimdilik duraklatıldı. Daha sonra tekrar kontrol edin.';

  @override
  String get savedResetPeriodLimit =>
      'Bu dönemin sıfırlamasını kullandınız. Bunu gelecek dönem kullanabilirsiniz.';

  @override
  String get savedResetNothingToRefill =>
      'Henüz doldurulacak bir şey yok. Azaldığı zaman için saklayın.';

  @override
  String get savedResetNoBillingPeriod =>
      'Planınızın kurulumu tamamlandığında kullanılabilir.';

  @override
  String get savedResetUnavailable => 'Şu anda kullanılamıyor.';

  @override
  String savedResetDone(String amount) {
    return 'Sıfırlama kullanıldı: $amount eklendi';
  }

  @override
  String get savedResetDoneNoCredits => 'Sıfırlama kullanıldı';

  @override
  String savedResetConfirm(String amount) {
    return 'Bu dönemin dahil edilen kredilerinden $amount tutarını yeniden doldurur. Bu işlem geri alınamaz.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Kayıtlı sıfırlamaları etkinleştir';

  @override
  String get resetsOffNote => 'Kapalı: kimse kayıtlı sıfırlama almaz.';

  @override
  String get resetsDecrease => 'Azalt';

  @override
  String get resetsIncrease => 'Artır';

  @override
  String get resetsSettings => 'Ayarlar';

  @override
  String get resetsCampaigns => 'Kampanyalar';

  @override
  String get resetsStatLive => 'Yayında';

  @override
  String get resetsStatGiven => 'Verilen';

  @override
  String get resetsStatUsed => 'Kullanılan';

  @override
  String get resetsStatRefilled => 'Doldurulan';

  @override
  String get resetsFilterActive => 'Etkin';

  @override
  String get resetsFilterEnded => 'Sona erdi';

  @override
  String get resetsFilterAll => 'Tümü';

  @override
  String get resetsStateDraft => 'Taslak';

  @override
  String get resetsStateScheduled => 'Zamanlandı';

  @override
  String get resetsStateLive => 'Yayında';

  @override
  String get resetsStatePaused => 'Duraklatıldı';

  @override
  String get resetsStateEnded => 'Sona erdi';

  @override
  String get resetsStateCancelled => 'İptal edildi';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '$budget bütçeden $used kullanıldı';
  }

  @override
  String resetsGivenN(String count) {
    return '$count verildi';
  }

  @override
  String resetsUsedN(String count) {
    return '$count kullanıldı';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Başlangıç $start · Bitiş $end';
  }

  @override
  String get resetsToday => 'bugün';

  @override
  String get resetsTomorrow => 'yarın';

  @override
  String get resetsYesterday => 'dün';

  @override
  String get resetsAudienceEveryone => 'Her çalışma alanı';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count çalışma alanı',
      one: '1 çalışma alanı',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return '$date tarihinden önce katılanlar';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Son $days gün içinde sınıra ulaştı',
      one: 'Bugün sınıra ulaştı',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Kampanyayı iptal et';

  @override
  String get resetsCancelConfirm => 'Bu kampanya iptal edilsin mi?';

  @override
  String get resetsCancelConfirmBody =>
      'Kayıtlı sıfırlama vermeyi durdurur. Bu işlem geri alınamaz.';

  @override
  String get resetsDeleteConfirm => 'Bu kampanya silinsin mi?';

  @override
  String get resetsDeleteConfirmBody => 'Taslak kalıcı olarak kaldırılır.';

  @override
  String get resetsNoCampaigns =>
      'Henüz kampanya yok. Birçok çalışma alanına aynı anda kayıtlı sıfırlama vermek için bir tane başlatın.';

  @override
  String get resetsNoMatches => 'Burada kampanya yok.';

  @override
  String get resetsEditCampaign => 'Kampanyayı düzenle';

  @override
  String get resetsSectionBasics => 'Temel bilgiler';

  @override
  String get resetsSectionAudience => 'Hedef kitle';

  @override
  String get resetsSectionTiming => 'Zamanlama';

  @override
  String get resetsSectionRefill => 'Doldurma';

  @override
  String get resetsSectionWhat => 'Neler sıfırlanır';

  @override
  String get resetsSectionNotify => 'Bildirimler';

  @override
  String get resetsPreviewLabel => 'İnsanların gördükleri';

  @override
  String get resetsMonthly => 'Aylık';

  @override
  String get resetsYearly => 'Yıllık';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Planlar';

  @override
  String get resetsPlansHint =>
      'Her planı dahil etmek için hiçbirini işaretlemeyin.';

  @override
  String get resetsWorkspacesLabel => 'Çalışma alanları';

  @override
  String get resetsWorkspacesHint =>
      'Her çalışma alanını dahil etmek için boş bırakın.';

  @override
  String get resetsSearchWorkspaces => 'Çalışma alanlarını ada göre ara';

  @override
  String get resetsNoWorkspaceMatch => 'Eşleşen çalışma alanı yok.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Yalnızca $name';
  }

  @override
  String get resetsJoinedBefore => 'Şundan önce katılanlar';

  @override
  String get resetsLimitedDaysLabel => 'Son N gün içinde sınıra ulaştı';

  @override
  String get resetsStartsLabel => 'Başlangıç';

  @override
  String get resetsEndsLabel => 'Sona erme';

  @override
  String resetsPercentValue(int percent) {
    return 'Dahil edilen kredileri %$percent oranında yeniden doldur';
  }

  @override
  String get resetsCapLabel => 'Kullanım başına en fazla';

  @override
  String get resetsBudgetLabel => 'Toplam bütçe';

  @override
  String get resetsOptional => 'İsteğe bağlı';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Yaklaşık $count çalışma alanına ulaşır · kredi olarak $credits · yaklaşık maliyeti $cost';
  }

  @override
  String get resetsEstimating => 'Erişim hesaplanıyor…';

  @override
  String get resetsEstimateNeedsFields =>
      'Erişimi görmek için alanları doldurun.';

  @override
  String get resetsLockedNote =>
      'Bu kampanya çalışıyor: yalnızca mesaj, bitiş tarihi, bütçe ve hatırlatıcı değişebilir.';

  @override
  String get resetsRequired => 'Gerekli.';

  @override
  String get resetsTooLong => 'En fazla 120 karakter.';

  @override
  String get resetsDaysInvalid => '1 ile 365 gün arasında girin.';

  @override
  String get resetsMoneyInvalid => '0 veya daha büyük girin.';

  @override
  String get resetsExpiryBeforeStart => 'Başlangıçtan sonra bir bitiş seçin.';

  @override
  String resetsGivenTo(String name) {
    return '$name için kayıtlı sıfırlama verildi';
  }

  @override
  String get resetsCampaignSaved => 'Kampanya kaydedildi';

  @override
  String get resetsDefaultMessage =>
      'Bizden bir kayıtlı sıfırlama. Sınıra ulaştığınızda kullanın.';

  @override
  String resetsGiveName(String name) {
    return '$name için kayıtlı sıfırlama';
  }

  @override
  String get resetsOneWorkspace => 'Bir çalışma alanı';

  @override
  String get resetsPickWorkspace =>
      'Kayıtlı sıfırlamalarını görmek için bir çalışma alanı seçin.';

  @override
  String get resetsAllHistory => 'Tüm geçmiş';

  @override
  String get resetsAllWorkspaces => 'Tüm çalışma alanları';

  @override
  String get resetsNoEvents => 'Burada henüz bir şey yok.';

  @override
  String get resetsEventGiven => 'Kayıtlı sıfırlama verildi';

  @override
  String get resetsEventUsed => 'Kayıtlı sıfırlama kullanıldı';

  @override
  String get resetsEventRevoked => 'Geri alındı';

  @override
  String get resetsEventUndone => 'Doldurma geri alındı';

  @override
  String get resetsEventExpired => 'Kullanılmadan süresi doldu';

  @override
  String get resetsEventCreated => 'Kampanya oluşturuldu';

  @override
  String get resetsEventEdited => 'Kampanya düzenlendi';

  @override
  String get resetsEventStarted => 'Kampanya başlatıldı';

  @override
  String get resetsEventEnded => 'Kampanya sona erdi';

  @override
  String get resetsEventScheduled => 'Kampanya zamanlandı';

  @override
  String get resetsEventPaused => 'Kampanya duraklatıldı';

  @override
  String get resetsEventResumed => 'Kampanya sürdürüldü';

  @override
  String get resetsEventCancelled => 'Kampanya iptal edildi';

  @override
  String get resetsEventDeleted => 'Kampanya silindi';

  @override
  String get resetsEventSettings => 'Ayarlar değişti';

  @override
  String get resetsRevokeConfirm => 'Bu kayıtlı sıfırlama geri alınsın mı?';

  @override
  String get resetsRevokeConfirmBody =>
      'Çalışma alanı bunu kullanmadan kaybeder.';

  @override
  String get resetsUndoConfirm => 'Bu doldurma geri alınsın mı?';

  @override
  String get resetsUndoConfirmBody => 'Eklediği krediler tekrar çıkarılır.';

  @override
  String get resetsPerPeriod => 'Dönem başına çalışma alanı başına kullanım';

  @override
  String get resetsMaxHeld => 'En fazla kayıtlı sıfırlama';

  @override
  String get resetsNotifyOwners => 'Sunucu sahiplerine bildir';

  @override
  String get resetsNewCampaign => 'Yeni kampanya';

  @override
  String get resetsName => 'Ad';

  @override
  String get resetsMessage => 'Kişilere mesaj';

  @override
  String get resetsPlans =>
      'Virgülle ayrılmış plan kodları (boş bırakılırsa tümü)';

  @override
  String get resetsWorkspaces =>
      'Virgülle ayrılmış çalışma alanı kimlikleri (boş bırakılırsa tümü)';

  @override
  String get resetsBefore =>
      'Şu tarihten önce oluşturuldu (tarih ve saat, isteğe bağlı)';

  @override
  String get resetsLimitedDays =>
      'Son N gün içinde sınıra ulaştı (isteğe bağlı)';

  @override
  String get resetsStart => 'Başlangıç (tarih ve saat)';

  @override
  String get resetsExpiry => 'Bitiş (tarih ve saat)';

  @override
  String get resetsPercent => 'Yeniden doldurulacak dahil edilen krediler (%)';

  @override
  String get resetsCap => 'Kullanım başına en fazla dolar (isteğe bağlı)';

  @override
  String get resetsBudget =>
      'Dolar cinsinden toplam kredi bütçesi (isteğe bağlı)';

  @override
  String get resetsDaily => 'Bugünkü model sınırını temizle';

  @override
  String get resetsComputer => 'Bu ayın bilgisayar saatlerini yeniden doldur';

  @override
  String get resetsArrival => 'Geldiğinde bildir';

  @override
  String get resetsReminder => 'Süresi dolmadan hatırlat';

  @override
  String get resetsPreviewSave => 'Önizle ve kaydet';

  @override
  String get resetsSchedule => 'Zamanla';

  @override
  String get resetsPause => 'Duraklat';

  @override
  String get resetsResume => 'Sürdür';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count çalışma alanı. En fazla doldurma: $credits. Tahmini maliyet: $cost.',
      one:
          '1 çalışma alanı. En fazla doldurma: $credits. Tahmini maliyet: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace =>
      'Çalışma alanı kimliği (tüm geçmiş için boş bırakın)';

  @override
  String get resetsHistory => 'Geçmişi yükle';

  @override
  String get resetsGive => 'Kayıtlı sıfırlama ver';

  @override
  String get resetsCopyCsv => 'CSV kopyala';

  @override
  String get resetsRevoke => 'Geri al';

  @override
  String get resetsUndo => 'Kullanılmayan doldurmayı geri al';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention => 'Sağlayıcı hizmetleri ilgi gerektiriyor';

  @override
  String get vendorNotSetUp => 'Kurulmamış';

  @override
  String get vendorCheckNow => 'Şimdi denetle';

  @override
  String get vendorLimit => 'Sınır veya ön ödemeli tutar';

  @override
  String get vendorWarnAt => 'Uyarı eşiği';

  @override
  String get vendorExpiry => 'Sona erme';

  @override
  String get vendorHistory => 'Son okumalar';

  @override
  String get vendorSave => 'Kaydet';

  @override
  String get vendorEnabled => 'İzleme etkin';

  @override
  String get vendorUnknown => 'Bilinmiyor';

  @override
  String get vendorLow => 'Düşük';

  @override
  String get vendorOut => 'Tükendi';

  @override
  String get vendorOk => 'Tamam';

  @override
  String get vendorNoReading => 'Henüz okuma yok';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tanesi ilgi gerektiriyor',
      one: '1 tanesi ilgi gerektiriyor',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count tamam';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count kurulmamış';
  }

  @override
  String get vendorNoVendors => 'Henüz izlenecek hizmet yok.';

  @override
  String get vendorCheckAll => 'Tümünü denetle';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Denetleniyor: $done / $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hizmet denetlendi',
      one: '1 hizmet denetlendi',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count denetim başarısız oldu',
      one: '1 denetim başarısız oldu',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'İlgi gerektiriyor';

  @override
  String get vendorGroupHealthy => 'Sağlıklı';

  @override
  String get vendorGroupIdle => 'Kurulmamış veya kapalı';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tane daha göster',
      one: '1 tane daha göster',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Daha az göster';

  @override
  String get vendorOff => 'Kapalı';

  @override
  String vendorPillPercent(String status, int percent) {
    return '$status · %$percent';
  }

  @override
  String vendorUsedOf(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String vendorLeft(String amount) {
    return '$amount kaldı';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return '$amount altında uyarır';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Sıfırlanma: $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Yenileme: $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Sona erdi: $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dakika içinde',
      one: '1 dakika içinde',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saat içinde',
      one: '1 saat içinde',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün içinde',
      one: '1 gün içinde',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Denetlendi: $when';
  }

  @override
  String get vendorSourceApi => 'Hizmetten';

  @override
  String get vendorSourceOwnCount => 'Casama tarafından sayıldı';

  @override
  String get vendorSourceManual => 'Elle girildi';

  @override
  String vendorReadingError(String error) {
    return 'Son denetim başarısız oldu: $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Denetlemeye başlamak için sunucuda anahtarını ekleyin.';

  @override
  String get vendorOffHint => 'İzleme kapalı.';

  @override
  String get vendorPickOne => 'Ayrıntılarını görmek için bir hizmet seçin.';

  @override
  String get vendorSectionStatus => 'Durum';

  @override
  String get vendorSectionActions => 'Eylemler';

  @override
  String get vendorSectionAlerts => 'Uyarılar';

  @override
  String get vendorSectionPlan => 'Plan';

  @override
  String vendorWarnAtValue(int percent) {
    return '%$percent kullanıldığında uyar';
  }

  @override
  String get vendorWarnAtHelp => 'Gösterge burada kehribar rengine döner.';

  @override
  String get vendorPeriod => 'Dönem';

  @override
  String get vendorPeriodNone => 'Ayarlanmadı';

  @override
  String get vendorPeriodDay => 'Günlük';

  @override
  String get vendorPeriodMonth => 'Aylık';

  @override
  String get vendorPeriodBilling => 'Her fatura dönemi';

  @override
  String get vendorPeriodPrepaid => 'Ön ödemeli';

  @override
  String get vendorDateNotSet => 'Ayarlanmadı';

  @override
  String get vendorClearDate => 'Tarihi temizle';

  @override
  String get vendorLimitInvalid => '0\'dan büyük bir sayı girin.';

  @override
  String get vendorAmountInvalid => '0 veya daha büyük girin.';

  @override
  String get vendorMonthsInvalid => '1 ile 120 ay arasında girin.';

  @override
  String get vendorWarnAtInvalid => '%1 ile %100 arasında bir değer seçin.';

  @override
  String get vendorSaved => 'Ayarlar kaydedildi';

  @override
  String get vendorCheckDone => 'Denetlendi';

  @override
  String get vendorHistoryEmpty => 'Henüz okuma yok.';

  @override
  String get vendorCheckFailed => 'Denetim başarısız oldu';

  @override
  String get vendorResets => 'Sıfırlanır';

  @override
  String get vendorSource => 'Kaynak';

  @override
  String get vendorBilling => 'Faturalandırma ve doldurma';

  @override
  String get vendorBalanceWarning => 'Bakiye altında uyar';

  @override
  String get vendorPeriodStart => 'Dönem başlangıcı';

  @override
  String get vendorInvalidSettings =>
      'Pozitif bir sınır, 0 ile 1 arasında bir uyarı ve geçerli tarihler girin.';

  @override
  String get card24hRange => '24 saatlik aralık';

  @override
  String get card52wRange => '52 haftalık aralık';

  @override
  String get cardAgain => 'Tekrar';

  @override
  String get cardAgoSuffix => 'önce';

  @override
  String get cardAirQuality => 'Hava kalitesi';

  @override
  String get cardAqiAdviceBad =>
      'Herkes dışarıdaki uzun veya zorlu eforu azaltmalı; pencereleri kapalı tutun.';

  @override
  String get cardAqiAdviceGood => 'Dışarı çıkmak için harika bir gün.';

  @override
  String get cardAqiAdviceModerate =>
      'Çoğu kişi için uygun; çok hassas kişiler kendini fazla yormamak isteyebilir.';

  @override
  String get cardAqiAdviceSensitive =>
      'Çocuklar, yaşlılar ve astımı olan herkes dışarıda uzun süreli eforu sınırlamalı.';

  @override
  String get cardAqiGood => 'İyi';

  @override
  String get cardAqiHazardous => 'Tehlikeli';

  @override
  String get cardAqiModerate => 'Orta';

  @override
  String get cardAqiSensitive => 'Hassas gruplar için sağlıksız';

  @override
  String get cardAqiUnhealthy => 'Sağlıksız';

  @override
  String get cardAqiVeryUnhealthy => 'Çok sağlıksız';

  @override
  String get cardBaggage => 'Bagaj';

  @override
  String get cardCalcAmount => 'Tutar';

  @override
  String get cardCalcBill => 'Hesap';

  @override
  String get cardCalcDiscount => 'İndirim';

  @override
  String get cardCalcDiscountTitle => 'İndirim';

  @override
  String get cardCalcGross => 'Vergi dahil';

  @override
  String get cardCalcGrowth => 'Büyüme';

  @override
  String get cardCalcInterest => 'Faiz';

  @override
  String get cardCalcLoan => 'Kredi';

  @override
  String get cardCalcMonthly => 'Her ay';

  @override
  String get cardCalcMonthlyPayment => 'Aylık ödeme';

  @override
  String get cardCalcNet => 'Vergi öncesi';

  @override
  String get cardCalcPeople => 'Kişiler';

  @override
  String get cardCalcPerPerson => 'Kişi başı ödeme';

  @override
  String get cardCalcPrice => 'Fiyat';

  @override
  String get cardCalcPrincipal => 'Anapara';

  @override
  String get cardCalcRate => 'Yıllık oran';

  @override
  String get cardCalcSavings => 'Birikim';

  @override
  String get cardCalcStart => 'Başlangıç';

  @override
  String get cardCalcTax => 'Vergi';

  @override
  String get cardCalcTaxIncluded => 'Vergi dahil';

  @override
  String get cardCalcTaxRate => 'Vergi oranı';

  @override
  String get cardCalcTip => 'Bahşiş';

  @override
  String get cardCalcTipAmount => 'Bahşiş';

  @override
  String get cardCalcTipSplit => 'Bahşiş ve bölüşüm';

  @override
  String get cardCalcTotal => 'Toplam';

  @override
  String get cardCalcTotalInterest => 'Toplam faiz';

  @override
  String get cardCalcTotalPaid => 'Toplam ödenen';

  @override
  String get cardCalcUnits => 'Birim dönüştür';

  @override
  String get cardCalcValue => 'Değer';

  @override
  String get cardCalcVat => 'Vergi';

  @override
  String get cardCalcYears => 'Yıl';

  @override
  String get cardCalcYouPay => 'Ödeyeceğiniz';

  @override
  String get cardCalcYouPutIn => 'Yatırdığınız';

  @override
  String get cardCalcYouSave => 'Tasarrufunuz';

  @override
  String get cardCall => 'Ara';

  @override
  String get cardCaloriesWord => 'Kalori';

  @override
  String get cardComparison => 'Karşılaştırma';

  @override
  String get cardCondClear => 'Açık';

  @override
  String get cardCondCloudy => 'Bulutlu';

  @override
  String get cardCondDrizzle => 'Çisenti';

  @override
  String get cardCondFog => 'Sis';

  @override
  String get cardCondHail => 'Dolu';

  @override
  String get cardCondHeavyRain => 'Şiddetli yağmur';

  @override
  String get cardCondHeavySnow => 'Yoğun kar';

  @override
  String get cardCondLightRain => 'Hafif yağmur';

  @override
  String get cardCondLightSnow => 'Hafif kar';

  @override
  String get cardCondMostlyClear => 'Çoğunlukla açık';

  @override
  String get cardCondPartlyCloudy => 'Parçalı bulutlu';

  @override
  String get cardCondRain => 'Yağmur';

  @override
  String get cardCondShowers => 'Sağanak';

  @override
  String get cardCondSleet => 'Karla karışık yağmur';

  @override
  String get cardCondSnow => 'Kar';

  @override
  String get cardCondThunder => 'Gök gürültülü sağanak';

  @override
  String get cardCons => 'Eksileri';

  @override
  String get cardCopied => 'Kopyalandı';

  @override
  String get cardCopy => 'Metin olarak kopyala';

  @override
  String get cardCouldntUpdate => 'Güncellenemedi';

  @override
  String get cardCurrency => 'Para birimi';

  @override
  String get cardDayLength => 'Gün uzunluğu';

  @override
  String get cardDayRange => 'Günün aralığı';

  @override
  String get cardDays => 'gün';

  @override
  String get cardDelay => 'Gecikme';

  @override
  String get cardDictionary => 'Sözlük';

  @override
  String get cardEmail => 'E-posta';

  @override
  String get cardFlightCancelled => 'İptal edildi';

  @override
  String get cardFlightDiverted => 'Yön değiştirildi';

  @override
  String get cardFlightInAir => 'Havada';

  @override
  String get cardFlightIncident => 'Olay';

  @override
  String get cardFlightLanded => 'İndi';

  @override
  String get cardFlightScheduled => 'Zamanında';

  @override
  String cardStaysFromNight(String price) {
    return 'gecelik $price tutarından başlayan';
  }

  @override
  String get cardStaysANight => 'gecelik';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n gece',
      one: '1 gece',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n misafir',
      one: '1 misafir',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n oda',
      one: '1 oda',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'En iyi';

  @override
  String get cardStaysSortCheapest => 'En ucuz';

  @override
  String get cardStaysSortTopRated => 'En yüksek puanlı';

  @override
  String get cardStaysSortClosest => 'En yakın';

  @override
  String get cardStaysFilterFreeCancel => 'Ücretsiz iptal';

  @override
  String get cardStaysFilterBreakfast => 'Kahvaltı';

  @override
  String get cardStaysFilterPayAtHotel => 'Otelde öde';

  @override
  String get cardStaysFilterStars => '4 yıldız ve üzeri';

  @override
  String get cardStaysFilterRated => '8+ puanlı';

  @override
  String get cardStaysList => 'Liste';

  @override
  String get cardStaysMap => 'Harita';

  @override
  String get cardStaysEdit => 'Düzenle';

  @override
  String cardStaysRating(String value, String max) {
    return '$max üzerinden $value';
  }

  @override
  String cardStaysKm(String km) {
    return 'merkeze $km km';
  }

  @override
  String cardStaysStars(int n) {
    return '$n yıldızlı';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n gece için $price',
      one: '1 gece için $price',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n site daha',
      one: '+1 site daha',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'Fırsatı gör';

  @override
  String get cardStaysView => 'Görüntüle';

  @override
  String cardStaysShowAll(int n) {
    return 'Tümünü göster ($n)';
  }

  @override
  String get cardStaysShowFewer => 'Daha az göster';

  @override
  String get cardStaysNone => 'Bu filtrelerle eşleşen bir şey yok.';

  @override
  String get cardStaysNoMap => 'Bu yerlerin hiçbirinin haritada konumu yok.';

  @override
  String get cardStaysNoDeals => 'Bu tarihler için fiyat yok.';

  @override
  String get cardStaysCheck => 'Fiyat rezervasyon sitesinde kontrol edilir.';

  @override
  String cardStaysCompare(int n) {
    return 'Karşılaştır ($n)';
  }

  @override
  String get cardStaysCompareHint =>
      'Karşılaştırmak için en fazla 4 tane işaretleyin';

  @override
  String get cardStaysComparePick => 'Karşılaştırmak için seçin';

  @override
  String get cardStaysCompareTitle => 'Karşılaştır';

  @override
  String get cardStaysRowNight => 'Gecelik fiyat';

  @override
  String get cardStaysRowTotal => 'Toplam';

  @override
  String get cardStaysRowRating => 'Puan';

  @override
  String get cardStaysRowStars => 'Yıldız';

  @override
  String get cardStaysRowDistance => 'Mesafe';

  @override
  String get cardStaysYes => 'Evet';

  @override
  String get cardStaysNo => 'Hayır';

  @override
  String get cardStaysTermFreeCancel => 'Ücretsiz iptal';

  @override
  String get cardStaysTermBreakfast => 'Kahvaltı dahil';

  @override
  String get cardStaysTermNoBreakfast => 'Kahvaltı yok';

  @override
  String get cardStaysTermPayAtHotel => 'Otelde öde';

  @override
  String get cardStaysTermNonRefundable => 'İade edilmez';

  @override
  String get cardStaysDetailsTitle => 'Konaklanacak yer';

  @override
  String get cardStaysCheapest => 'En ucuz';

  @override
  String get cardStaysAmenities => 'Olanaklar';

  @override
  String cardStaysCheckIn(String time) {
    return 'Giriş $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Çıkış $time';
  }

  @override
  String get cardStaysNearby => 'Yakında';

  @override
  String get cardStaysHotelSite => 'Otelin web sitesi';

  @override
  String get cardStaysBook => 'Benim için rezerve et';

  @override
  String cardStaysBookLabel(String name, String site) {
    return '$site üzerinde $name için rezervasyon yap';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Fotoğraf $n / $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · aya göre fiyat';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'En ucuz: $month, gecelik yaklaşık $price';
  }

  @override
  String get cardStaysTrendNote => 'Bu bir tahmindir, canlı fiyat değildir.';

  @override
  String get cardStaysTrendPick => 'Tarih seç';

  @override
  String get cardStaysSearchTitle => 'Konaklanacak yer bul';

  @override
  String get cardStaysSearchWhere => 'Nerede';

  @override
  String get cardStaysSearchWhereHint => 'Şehir, bölge veya otel';

  @override
  String get cardStaysSearchDates => 'Tarih seç';

  @override
  String get cardStaysSearchAdults => 'Yetişkinler';

  @override
  String get cardStaysSearchRooms => 'Odalar';

  @override
  String get cardStaysSearchBudget => 'Gecelik bütçe (isteğe bağlı)';

  @override
  String get cardStaysSearchNotNow => 'Şimdi değil';

  @override
  String get cardStaysSearchGo => 'Konaklama ara';

  @override
  String get cardStaysSearchSent => 'Aranıyor';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return '$where, $dates konaklamaları';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Daha az: $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'Daha fazla: $label';
  }

  @override
  String get cardStaysAmenityPool => 'Havuz';

  @override
  String get cardStaysAmenityParking => 'Otopark';

  @override
  String get cardStaysAmenityPets => 'Evcil hayvan kabul edilir';

  @override
  String get cardStaysAmenityGym => 'Spor salonu';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Mutfak';

  @override
  String get cardStaysAmenityWifi => 'WiFi';

  @override
  String get cardStaysAmenityAirCon => 'Klima';

  @override
  String get cardProductsTitle => 'Satın alınabilecekler';

  @override
  String cardProductsFrom(String price) {
    return '$price tutarından itibaren';
  }

  @override
  String cardProductsUnder(String price) {
    return '$price altı';
  }

  @override
  String get cardProductsSortBest => 'En iyi';

  @override
  String get cardProductsSortCheapest => 'En ucuz';

  @override
  String get cardProductsSortTopRated => 'En yüksek puanlı';

  @override
  String get cardProductsOnSale => 'İndirimde';

  @override
  String get cardProductsRated => '4+ puanlı';

  @override
  String cardProductsOff(int pct) {
    return '−%$pct';
  }

  @override
  String get cardProductsOtherStores => 've diğer mağazalar';

  @override
  String cardProductsShowAll(int n) {
    return 'Tümünü göster ($n)';
  }

  @override
  String get cardProductsShowFewer => 'Daha az göster';

  @override
  String get cardProductsShowMore => 'Daha fazla göster';

  @override
  String get cardProductsNone => 'Bu filtrelerle eşleşen bir şey yok.';

  @override
  String get cardProductsCheck => 'Fiyat mağazada kontrol edilir.';

  @override
  String get cardProductsBuy => 'Satın al';

  @override
  String get cardProductsCompareStores => 'Mağazaları karşılaştır';

  @override
  String cardProductsCompareLabel(String title) {
    return '$title için mağazaları karşılaştır';
  }

  @override
  String get cardProductsBuyForMe => 'Benim için satın al';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return '$store mağazasından $title satın al';
  }

  @override
  String get cardProductsRowPrice => 'Fiyat';

  @override
  String get cardProductsRowStore => 'Mağaza';

  @override
  String get cardProductsRowRating => 'Puan';

  @override
  String get cardProductsRowDelivery => 'Teslimat';

  @override
  String cardProductsDelivery(String text) {
    return 'Teslimat: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return '$brand ürünü';
  }

  @override
  String get cardProductsOffers => 'Mağazalar';

  @override
  String get cardProductsLowest => 'En düşük toplam';

  @override
  String cardProductsTotal(String price) {
    return 'Toplam $price';
  }

  @override
  String get cardProductsOutOfStock => 'Stokta yok';

  @override
  String get cardProductsFeatures => 'Hakkında';

  @override
  String get cardProductsReviews => 'Alıcıların yorumları';

  @override
  String get cardCheckoutTitle => 'Ödemeden önce kontrol et';

  @override
  String get cardCheckoutTotal => 'Toplam';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Sayfayı aç';

  @override
  String get cardCheckoutCancel => 'İptal';

  @override
  String get cardCheckoutChange => 'Değiştir';

  @override
  String get cardCheckoutConfirm => 'Onayla ve öde';

  @override
  String get cardCheckoutCancelLabel => 'Bunu iptal et';

  @override
  String get cardCheckoutChangeLabel => 'Bir şeyi değiştir';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return '$seller için $total tutarını onaylıyorum';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return '$total tutarını onaylıyorum';
  }

  @override
  String get cardCheckoutConfirmed => 'Onaylandı';

  @override
  String get cardCheckoutChanging => 'Değiştiriliyor';

  @override
  String get cardCheckoutCancelled => 'İptal edildi';

  @override
  String get cardBookingTitle => 'Rezervasyonunuz';

  @override
  String cardBookingWith(String site) {
    return '$site üzerinden rezerve edildi';
  }

  @override
  String get cardBookingCheckIn => 'Giriş';

  @override
  String get cardBookingCheckOut => 'Çıkış';

  @override
  String get cardBookingConfirmation => 'Onay numarası';

  @override
  String get cardBookingCopy => 'Onay numarasını kopyala';

  @override
  String get cardBookingPaid => 'Ödendi';

  @override
  String get cardBookingPayAtHotel => 'Otelde öde';

  @override
  String cardBookingCancelBy(String date) {
    return '$date tarihine kadar ücretsiz iptal';
  }

  @override
  String get cardBookingDirections => 'Yol tarifi';

  @override
  String get cardBookingManage => 'Rezervasyonu yönet';

  @override
  String get cardBookingCalendar => 'Takvime ekle';

  @override
  String cardBookingCalendarLabel(String name) {
    return '$name rezervasyonunu takvimime ekle';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Sipariş $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Verildi: $date';
  }

  @override
  String get cardOrderStepOrdered => 'Sipariş verildi';

  @override
  String get cardOrderStepShipped => 'Kargoya verildi';

  @override
  String get cardOrderStepOut => 'Dağıtıma çıktı';

  @override
  String get cardOrderStepDelivered => 'Teslim edildi';

  @override
  String get cardOrderCancelled => 'İptal edildi';

  @override
  String get cardOrderReturned => 'İade edildi';

  @override
  String cardOrderArrives(String date) {
    return 'Teslimat: $date';
  }

  @override
  String get cardOrderTracking => 'Takip numarası';

  @override
  String get cardOrderCopy => 'Takip numarasını kopyala';

  @override
  String get cardOrderTrack => 'Takip et';

  @override
  String cardOrderTrackLabel(String number) {
    return '$number numarasını takip et';
  }

  @override
  String get cardOrderPage => 'Sipariş sayfası';

  @override
  String get cardFaresBest => 'En iyi';

  @override
  String get cardFaresCheapest => 'En ucuz';

  @override
  String get cardFaresFastest => 'En hızlı';

  @override
  String get cardFaresDirectOnly => 'Yalnızca aktarmasız';

  @override
  String get cardFaresDirect => 'Aktarmasız';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aktarma',
      one: '1 aktarma',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Rezerve et';

  @override
  String cardFaresFromPrice(String price) {
    return '$price tutarından itibaren';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n yolcu',
      one: '1 yolcu',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n gece',
      one: '1 gece',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'Ekonomi';

  @override
  String get cardFaresPremium => 'Premium ekonomi';

  @override
  String get cardFaresBusiness => 'Business';

  @override
  String get cardFaresFirst => 'First';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Bu seyahat için genellikle $low–$high';
  }

  @override
  String get cardFaresLevelLow => 'Şu anda düşük';

  @override
  String get cardFaresLevelTypical => 'Şu anda normal';

  @override
  String get cardFaresLevelHigh => 'Şu anda yüksek';

  @override
  String cardFaresShowAll(int n) {
    return 'Tümünü göster ($n)';
  }

  @override
  String get cardFaresShowFewer => 'Daha az göster';

  @override
  String get cardFaresNoDirect => 'Bu aramada aktarmasız uçuş yok.';

  @override
  String get cardFaresOutboundOnly =>
      'Fiyatlar tüm seyahat içindir; dönüş uçuşunu Google Flights üzerinden seçin.';

  @override
  String get cardFaresSeeAll => 'Tümünü Google Flights\'ta gör';

  @override
  String get cardFaresCheck =>
      'Fiyatlar tüm yolcular içindir ve rezervasyon sitesinde yeniden kontrol edilir.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin kabin, $checked kayıtlı bagaj';
  }

  @override
  String get cardFaresAffiliate =>
      'Bu bağlantılar üzerinden rezervasyon yaptığınızda Casama komisyon kazanabilir. Fiyatı değiştirmez.';

  @override
  String cardFaresCompare(String site) {
    return '$site üzerinde karşılaştır';
  }

  @override
  String get cardFaresWatch => 'Fiyatı takip et';

  @override
  String cardFaresWatching(String date) {
    return 'Takip ediliyor · $date tarihinde biter';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return '$price veya daha düşüğü takip ediliyor · $date tarihinde biter';
  }

  @override
  String get cardFaresWatchStop => 'Durdur';

  @override
  String get cardFaresWatchTitle => 'Bu fiyatı takip et';

  @override
  String get cardFaresWatchBody =>
      'Casama bu fiyatı günde birkaç kez kontrol eder ve düştüğünde size bildirim gönderir. Tarih geçtiğinde veya 60 gün sonra kendiliğinden durur.';

  @override
  String get cardFaresWatchTarget =>
      'Şunun altına düştüğünde bana haber ver (isteğe bağlı)';

  @override
  String get cardFaresWatchAnyDrop =>
      'Büyük herhangi bir düşüş için boş bırakın';

  @override
  String get cardFaresWatchStart => 'Takip et';

  @override
  String get cardFaresWatchStarted =>
      'Bu fiyat takip ediliyor. Düştüğünde bildirim alacaksınız.';

  @override
  String get cardFaresWatchStopped => 'Fiyat takibi durduruldu.';

  @override
  String get cardFaresWatchFull =>
      'Zaten 10 fiyatı takip ediyorsunuz. Önce Ayarlar → Kartlar bölümünden birini durdurun.';

  @override
  String get cardFaresWatchFailed =>
      'Fiyat takibi değiştirilemedi. Tekrar deneyin.';

  @override
  String get cardFaresFlagSeparate => 'Ayrı biletler';

  @override
  String get cardFaresFlagOvernight => 'Gece aktarmalı';

  @override
  String get cardFaresFlagAirport => 'Havalimanı değiştiriyor';

  @override
  String get cardFaresFlagShort => 'Kısa aktarma';

  @override
  String get cardFaresFlagLong => 'Uzun aktarma';

  @override
  String get cardFaresNoteSeparate =>
      'Tek yönde farklı hava yolları olduğu için bunlar ayrı biletler olabilir. Bağlantıyı kaçırırsanız sonraki uçuş kapsam dahilinde olmayabilir. Rezervasyon sitesinden kontrol edin.';

  @override
  String get cardFaresNoteOvernight =>
      'Aktarmalardan biri gece boyunca sürüyor.';

  @override
  String get cardFaresNoteAirport =>
      'Bir bağlantı farklı bir havalimanından kalkıyor.';

  @override
  String get cardFaresNoteShort => 'Aktarma bir saatten kısa.';

  @override
  String get cardFaresNoteLong => 'Aktarma 8 saatten uzun.';

  @override
  String get cardFaresOutbound => 'Gidiş';

  @override
  String get cardFaresReturn => 'Dönüş';

  @override
  String cardFaresEmissions(int kg) {
    return 'Yolcu başına yaklaşık $kg kg CO₂';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return '$place konumunda $time bekleme';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'sonraki uçuş $place konumundan kalkar';
  }

  @override
  String get cardFaresViewFailed => 'Bu ücretler yüklenemedi.';

  @override
  String get cardFaresTryAgain => 'Yeniden dene';

  @override
  String get cardFaresMorning => 'Sabah';

  @override
  String get cardFaresAfternoon => 'Öğleden sonra';

  @override
  String get cardFaresEvening => 'Akşam';

  @override
  String get cardFaresNight => 'Gece';

  @override
  String get cardFaresTime => 'Saat';

  @override
  String get cardFaresAirlines => 'Hava yolları';

  @override
  String get cardFaresBagIncluded => 'Bagaj dahil';

  @override
  String get cardFaresNoMatch => 'Bu filtrelerle eşleşen uçuş yok.';

  @override
  String get cardFaresOpenInChat => 'Sohbette aç';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return '$date tarihindeki $route uçuşlarını göster';
  }

  @override
  String get cardFaresEdit => 'Aramayı düzenle';

  @override
  String get cardFaresDetails => 'Ayrıntılar';

  @override
  String get cardFaresSinceStart => 'takibe başladığınızdan beri';

  @override
  String get cardFareCalOneWay => 'Tek yön';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n gece sonra dönüş',
      one: '1 gece sonra dönüş',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Düşük';

  @override
  String get cardFareCalUsual => 'Normal';

  @override
  String get cardFareCalHigh => 'Yüksek';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'En ucuz: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'Ücretleri gör';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: fiyat yok';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return '$from kalkışlı · her yere';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return '$from kalkışlı · yurt dışı';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return '$from kalkışlı · aynı ülke';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return '$price altı';
  }

  @override
  String get cardFlightSearchTitle => 'Uçuş ara';

  @override
  String get cardFlightSearchReturn => 'Gidiş-dönüş';

  @override
  String get cardFlightSearchOneWay => 'Tek yön';

  @override
  String get cardFlightSearchFrom => 'Nereden';

  @override
  String get cardFlightSearchTo => 'Nereye';

  @override
  String get cardFlightSearchPlaceHint => 'Şehir veya havalimanı';

  @override
  String get cardFlightSearchAnywhere => 'Her yer';

  @override
  String get cardFlightSearchSwap => 'Yerleri değiştir';

  @override
  String get cardFlightSearchPickDates => 'Tarih seç';

  @override
  String get cardFlightSearchPickDate => 'Tarih seç';

  @override
  String get cardFlightSearchWholeMonth => 'Tüm ay';

  @override
  String get cardFlightSearchNights => 'Konaklama gecesi';

  @override
  String get cardFlightSearchAdults => 'Yetişkinler';

  @override
  String get cardFlightSearchChildren => 'Çocuklar (2–11 yaş)';

  @override
  String get cardFlightSearchInfants => 'Bebekler (2 yaş altı)';

  @override
  String get cardFlightSearchNotNow => 'Şimdi değil';

  @override
  String get cardFlightSearchSent => 'Aranıyor…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return '$route uçuşları, $dates';
  }

  @override
  String get cardFareTrendNow => 'Şu anda en ucuz';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Son $n gün',
      one: 'Son 1 gün',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return '$low ile $high arasında';
  }

  @override
  String get cardFareTrendNote =>
      'Bunlar geçmiş fiyatlardır, tahmin değildir. Her an değişebilirler.';

  @override
  String get cardFareWatchesTitle => 'Fiyat takipleri';

  @override
  String get cardFareWatchesNone =>
      'Hiçbir uçuş ücretini takip etmiyorsunuz. Başlamak için bir uçuş ücretleri kartında Fiyatı takip et\'e dokunun.';

  @override
  String get cardFareWatchesNoPrice => 'Henüz fiyat yok';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Hedef $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Herhangi bir büyük düşüş';

  @override
  String cardFareWatchesLow(String price) {
    return 'en düşük $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'bitiş: $date';
  }

  @override
  String get cardsFareWatches => 'Fiyat takipleri';

  @override
  String get cardsFareWatchesNone =>
      'Fiyat takibi yok. Fiyat düştüğünde bildirim almak için bir uçuş ücretleri kartında Fiyatı takip et\'e dokunun.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Şimdi $price · bitiş: $date';
  }

  @override
  String get cardFromBot => 'Bot tarafından yazıldı; hatalı olabilir';

  @override
  String get cardFullRecipe => 'Tam tarif';

  @override
  String get cardGate => 'Kapı';

  @override
  String get cardGo => 'Başlat';

  @override
  String get cardHeads => 'Tura';

  @override
  String get cardHolidays => 'Resmi tatiller';

  @override
  String get cardHoursShort => 'saat';

  @override
  String get cardHumidity => 'Nem';

  @override
  String get cardItsTime => 'Zamanı geldi!';

  @override
  String get cardJustNow => 'az önce';

  @override
  String get cardLast24h => 'Son 24 saat';

  @override
  String get cardLast30Days => 'Son 30 gün';

  @override
  String get cardListen => 'Dinle';

  @override
  String get cardLiveNow => 'Şimdi';

  @override
  String get cardLongWeekend => 'Uzun hafta sonu';

  @override
  String get cardLostShort => 'M';

  @override
  String get cardMarket24h => '7/24';

  @override
  String get cardMarketCap => 'Piyasa değeri';

  @override
  String get cardMarketClosed => 'Kapalı';

  @override
  String get cardMarketOpen => 'Açık';

  @override
  String get cardMarketPost => 'Mesai sonrası';

  @override
  String get cardMarketPre => 'Seans öncesi';

  @override
  String get cardMessage => 'Mesaj';

  @override
  String get cardMinutesShort => 'dk';

  @override
  String get cardMoonFirstQuarter => 'İlk dördün';

  @override
  String get cardMoonFull => 'Dolunay';

  @override
  String get cardMoonLastQuarter => 'Son dördün';

  @override
  String get cardMoonNew => 'Yeni ay';

  @override
  String get cardMoonWaningCrescent => 'Küçülen hilal';

  @override
  String get cardMoonWaningGibbous => 'Şişkin ay (küçülen)';

  @override
  String get cardMoonWaxingCrescent => 'Büyüyen hilal';

  @override
  String get cardMoonWaxingGibbous => 'Şişkin ay (büyüyen)';

  @override
  String get cardMore => 'Daha fazla';

  @override
  String get cardNext24h => 'Önümüzdeki 24 saat';

  @override
  String get cardNoAlerts => 'Uyarı yok';

  @override
  String get cardNoAlertsLong =>
      'Şu anda burada yürürlükte olan bir hava uyarısı yok.';

  @override
  String get cardNoChart => 'Bu aralık için grafik yok';

  @override
  String get cardNoGames => 'Maç yok';

  @override
  String get cardNoHolidays => 'Bu yıl başka resmi tatil yok.';

  @override
  String get cardNoQuakes => 'Son zamanlarda bu büyüklükte deprem olmadı.';

  @override
  String get cardNoStorms => 'Etkin olan yok';

  @override
  String get cardNoStormsLong => 'Şu anda etkin bir tropikal fırtına yok.';

  @override
  String get cardNotAdvice => 'Finansal tavsiye değildir';

  @override
  String get cardNow => 'Şimdi';

  @override
  String get cardNutritionFacts => 'Besin Değerleri';

  @override
  String get cardOpen => 'Aç';

  @override
  String get cardOpenSource => 'Kaynağı aç';

  @override
  String get cardParcel => 'Kargo';

  @override
  String get cardParcelDelivered => 'Teslim edildi';

  @override
  String get cardParcelInTransit => 'Yolda';

  @override
  String get cardParcelOrdered => 'Etiket oluşturuldu';

  @override
  String get cardParcelOut => 'Dağıtıma çıktı';

  @override
  String get cardParcelProblem => 'Sorun';

  @override
  String get cardParcelNoLive =>
      'Burada bu numara için canlı durum yok. En güncel bilgi kargo şirketinin sayfasındadır.';

  @override
  String cardParcelTrackOn(String site) {
    return '$site üzerinden takip et';
  }

  @override
  String get cardPin => 'Araç takımlarına sabitle';

  @override
  String get cardPinFailed => 'Bu kart sabitlenemedi';

  @override
  String get cardPinned => 'Araç takımlarınıza sabitlendi';

  @override
  String get cardPinnedWaiting =>
      'Sabitlendi. Orada görmek için araç takımlarınızda bu bota izin verin';

  @override
  String get cardPlayedShort => 'O';

  @override
  String get cardPointsShort => 'P';

  @override
  String get cardPrevClose => 'Önceki kapanış';

  @override
  String get cardPros => 'Artıları';

  @override
  String get cardProsCons => 'Artıları ve eksileri';

  @override
  String get cardQuiz => 'Bilgi yarışması';

  @override
  String get cardRain => 'Yağmur';

  @override
  String get cardRainChance => 'Yağmur olasılığı';

  @override
  String get cardRandom => 'Rastgele';

  @override
  String get cardReadMore => 'Devamını oku';

  @override
  String get cardReferenceRates =>
      'Merkez bankası referans kurları, günlük yayımlanır';

  @override
  String get cardRefresh => 'Yenile';

  @override
  String get cardReport => 'Hatalı veriyi bildir';

  @override
  String get cardReported => 'Teşekkürler, inceleyeceğiz';

  @override
  String get cardSameTime => 'aynı saat';

  @override
  String get cardScores => 'Skorlar';

  @override
  String get cardSecondsShort => 'sn';

  @override
  String get cardServings => 'Porsiyon';

  @override
  String get cardShareImage => 'Görsel olarak paylaş';

  @override
  String get cardStandings => 'Puan durumu';

  @override
  String get cardStorms => 'Tropikal fırtınalar';

  @override
  String get cardSunMoon => 'Güneş ve ay';

  @override
  String get cardSunrise => 'Gün doğumu';

  @override
  String get cardSunset => 'Gün batımı';

  @override
  String get cardSwap => 'Değiştir';

  @override
  String get cardSynonyms => 'Benzer:';

  @override
  String get cardTails => 'Yazı';

  @override
  String get cardTeam => 'Takım';

  @override
  String get cardTerminal => 'Terminal';

  @override
  String get cardTimeIn => 'Her yerdeki saat';

  @override
  String get cardTimeline => 'Zaman çizelgesi';

  @override
  String get cardToday => 'Bugün';

  @override
  String get cardTomorrow => 'Yarın';

  @override
  String get cardTranslation => 'Çeviri';

  @override
  String get cardTsunami => 'Tsunami';

  @override
  String get cardUnpin => 'Araç takımlarından kaldır';

  @override
  String get cardUnpinned => 'Araç takımlarınızdan kaldırıldı';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'aşırı';

  @override
  String get cardUvHigh => 'yüksek';

  @override
  String get cardUvLow => 'düşük';

  @override
  String get cardUvModerate => 'orta';

  @override
  String get cardUvVeryHigh => 'çok yüksek';

  @override
  String get cardVolume => 'Hacim';

  @override
  String get cardWatchlist => 'İzleme listesi';

  @override
  String get cardWeather => 'Hava durumu';

  @override
  String get cardWeatherAlerts => 'Hava uyarıları';

  @override
  String get cardWebsite => 'Web sitesi';

  @override
  String get cardWind => 'Rüzgar';

  @override
  String get cardWonShort => 'G';

  @override
  String get cardWorldClock => 'Dünya saati';

  @override
  String get cardYesterday => 'Dün';

  @override
  String get cardQuakesWorld => 'Bugünkü en güçlü depremler';

  @override
  String cardMinutesAgo(int n) {
    return '$n dk önce';
  }

  @override
  String cardHoursAgo(int n) {
    return '$n sa önce';
  }

  @override
  String cardStale(String ago) {
    return 'Güncellenemedi · $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Güncellendi: $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return '$minutes dk gecikti';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'Y $high  D $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Hissedilen $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n gün';
  }

  @override
  String cardUntil(String when) {
    return '$when tarihine kadar';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n yürürlükte uyarı',
      one: '1 yürürlükte uyarı',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return 'Başlıca $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'Kızılağaç poleni',
      'birch': 'Huş ağacı poleni',
      'grass': 'Çim poleni',
      'mugwort': 'Pelin otu poleni',
      'olive': 'Zeytin poleni',
      'ragweed': 'Kanarya otu poleni',
      'other': 'Polen',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '$h sa $m dk';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Altın saat: $time itibarıyla';
  }

  @override
  String cardMoonLit(int pct) {
    return '%$pct aydınlık';
  }

  @override
  String cardMoonrise(String time) {
    return 'Doğuş $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Batış $time';
  }

  @override
  String cardRangeChange(String range) {
    return '$range aralığında değişim';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up yukarı · $down aşağı';
  }

  @override
  String cardRatesOf(String date) {
    return '$date kurları';
  }

  @override
  String cardAtTime(String when) {
    return '$when';
  }

  @override
  String cardInDays(int n) {
    return '$n gün içinde';
  }

  @override
  String cardPercentThere(int pct) {
    return '%$pct tamamlandı';
  }

  @override
  String cardQuakesNear(String place) {
    return '$place yakınındaki depremler';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n deprem',
      one: '1 deprem',
      zero: 'Yok',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return '$depth derinlik';
  }

  @override
  String cardAway(String distance) {
    return '$distance uzaklıkta';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n etkin',
      one: '1 etkin',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return '$level uyarısı';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n maç',
      one: '1 maç',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n canlı';
  }

  @override
  String cardMinutes(int n) {
    return '$n dk';
  }

  @override
  String cardExpected(String date) {
    return 'Beklenen: $date';
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
      other: '$n adım',
      one: '1 adım',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return '$n galibiyet';
  }

  @override
  String cardServingSize(String size) {
    return 'Porsiyon: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$total kontrolden $passed tanesi geçti';
  }

  @override
  String cardTotal(int n) {
    return 'Toplam $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return '$n yıl sonra';
  }

  @override
  String get cardsSettingsTitle => 'Kartlar';

  @override
  String get cardsSettingsRow => 'Ana şehir, birimler ve veri kaynakları';

  @override
  String get cardsSettingsIntro =>
      'Botlar hava durumu, fiyatlar, kurlar, saat ve daha fazlasını güncel kalan gerçek veri kartlarıyla yanıtlar. Bir yer belirtmeden sorduğunuzda ana şehriniz kullanılır.';

  @override
  String get cardsSettingsSaveFailed => 'Kaydedilemedi. Tekrar deneyin.';

  @override
  String get cardsHomeCity => 'Ana şehir';

  @override
  String get cardsHomeClear => 'Temizle';

  @override
  String get cardsHomeNone =>
      'Ayarlanmadı. Siz bir tane seçinceye kadar botlar saat diliminizin ana şehrini kullanır.';

  @override
  String get cardsHomeSearch => 'Şehrinizi arayın';

  @override
  String get cardsHomePrivacy =>
      'Yalnızca şehir tutulur, adresiniz asla tutulmaz; hava durumu hizmetlerine yuvarlatılmış koordinatlar olarak gönderilir.';

  @override
  String get cardsUnits => 'Birimler';

  @override
  String get cardsTemperature => 'Sıcaklık';

  @override
  String get cardsWind => 'Rüzgar';

  @override
  String get cardsRain => 'Yağış';

  @override
  String get cardsDistance => 'Mesafe';

  @override
  String get cardsPrices => 'Fiyatlar';

  @override
  String get cardsRedUp => 'Kırmızı artış demek';

  @override
  String get cardsRedUpHint =>
      'Çin, Japonya ve Kore piyasalarında olduğu gibi yükselen fiyatları kırmızı, düşenleri yeşil gösterin.';

  @override
  String get cardsSources => 'Veri kaynakları';

  @override
  String get cardsSourcesIntro =>
      'Kartlar verilerinin nereden ve ne zaman geldiğini belirtir. Verileri bu hizmetler sağlar:';

  @override
  String get cardFewerServings => 'Daha az porsiyon';

  @override
  String get cardMoreServings => 'Daha fazla porsiyon';

  @override
  String get cropTitle => 'Taşı ve Ölçekle';

  @override
  String get cropDone => 'Bitti';

  @override
  String get cropPosition => 'Resim konumu';

  @override
  String get cropMoveUp => 'Yukarı taşı';

  @override
  String get cropMoveDown => 'Aşağı taşı';

  @override
  String get cropMoveLeft => 'Sola taşı';

  @override
  String get cropMoveRight => 'Sağa taşı';

  @override
  String get cropRotate => 'Döndür';

  @override
  String get cropMirror => 'Aynala';

  @override
  String get cropReset => 'Sıfırla';

  @override
  String get cropZoom => 'Yakınlaştır';

  @override
  String get cropZoomIn => 'Yakınlaştır';

  @override
  String get cropZoomOut => 'Uzaklaştır';

  @override
  String get cropSoft => 'Çok yakınlaştırıldı: resim yumuşak görünebilir';

  @override
  String get cropAnimatedStill => 'Hareketli resimler sabit kalır';

  @override
  String get cropBackground => 'Arka plan';

  @override
  String get cropBackgroundNone => 'Yok';

  @override
  String cropBackgroundBot(String name) {
    return '$name rengi';
  }

  @override
  String get cropBackgroundWhite => 'Beyaz';

  @override
  String get cropBackgroundBlack => 'Siyah';

  @override
  String get cropUnreadable =>
      'Bu resim burada açılamıyor. JPEG veya PNG deneyin.';

  @override
  String cropTooBig(String size) {
    return 'Bu dosya $size boyutunda ve 40 MB sınırının üzerinde.';
  }

  @override
  String get botPicture => 'Resim';

  @override
  String botPictureTitle(String name) {
    return '$name resmi';
  }

  @override
  String botPictureChange(String name) {
    return '$name resmini değiştir';
  }

  @override
  String get botPicturePaste => 'Resim yapıştır';

  @override
  String get botPictureDraw => 'Yapay zeka ile oluştur';

  @override
  String get botPictureDrawHelp => 'Casama seçmeniz için iki tane çizer';

  @override
  String get botPictureRecrop => 'Yeniden kırp';

  @override
  String get botPictureMascot => 'Bunun yerine bir maskot kullan';

  @override
  String get botPictureRemove => 'Resmi kaldır';

  @override
  String get botPictureRecent => 'Son kullanılanlar';

  @override
  String get botPictureUpdated => 'Resim güncellendi';

  @override
  String get botPictureRemoved => 'Resim kaldırıldı';

  @override
  String get botPictureFailed => 'Resim kaydedilemedi';

  @override
  String botPictureDrop(String name) {
    return '$name resmi olarak kullanmak için bırakın';
  }

  @override
  String botPictureUseAs(String name) {
    return '$name resmi olarak kullan';
  }

  @override
  String get botPictureUseAsBot => 'Bir bot resmi olarak kullan';

  @override
  String get botPictureWhichBot => 'Bu resmi hangi bot alsın?';

  @override
  String botDrawTitle(String name) {
    return '$name için bir resim';
  }

  @override
  String get botDrawIntro =>
      'Bir görünüm teması seçin, isterseniz birkaç kelime ekleyin; Casama seçmeniz için iki resim çizsin.';

  @override
  String get botDrawDescribe => 'Açıklayın (isteğe bağlı)';

  @override
  String get botDrawHint => 'Okuma gözlüklü sevimli bir baykuş';

  @override
  String get botDrawMake => '2 tane yap';

  @override
  String get botDrawMore => '2 tane daha yap';

  @override
  String get botDrawPick => 'Kullanmak için birine dokunun';

  @override
  String get botDrawCost =>
      'Casama\'nın yaptığı diğer tüm resimler gibi her resim görsel kredisi kullanır.';

  @override
  String get botDrawWorking => 'Çiziliyor…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => 'Yumuşak 3B';

  @override
  String get botDrawStyleWatercolor => 'Suluboya';

  @override
  String get botDrawStyleFlat => 'Düz simge';

  @override
  String get botDrawStylePixel => 'Piksel sanatı';

  @override
  String get botDrawStyleLine => 'Çizgi sanatı';

  @override
  String get botDrawStylePhoto => 'Fotoğraf';

  @override
  String get sharePictureStays =>
      'Resmi bu çalışma alanında kalır: kopya önceki maskotunu veya baş harflerini alır.';

  @override
  String savedResetRefills(String amount) {
    return '$amount krediyi yeniden doldurur';
  }

  @override
  String get savedResetClearsDaily => 'Bugünkü sınırı temizler';

  @override
  String get savedResetGivesHours => 'Bilgisayar saatlerini geri verir';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün kaldı',
      one: '1 gün kaldı',
      zero: 'Bugün sona eriyor',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Modeller';

  @override
  String get modelsRowHelp => 'Casama\'nın modelleri veya kendi anahtarlarınız';

  @override
  String get modelsIntro =>
      'Botlarınızı Casama\'nın mı çalıştıracağını yoksa kendi model anahtarlarınızı mı bağlayacağınızı seçin. Anahtarlar şifrelenmiş olarak saklanır ve bir daha gösterilmez.';

  @override
  String get whoRunsYourBots => 'Botlarınızı kim çalıştırsın';

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
      'Planınıza dahildir; çalışma alanı kredisi kullanır';

  @override
  String get whoRunsCasamaOffHelp => 'Mevcut planınızda duraklatıldı';

  @override
  String get whoRunsOwn => 'Kendi sağlayıcınız';

  @override
  String get whoRunsOwnHelp =>
      'Doğrudan sağlayıcınız tarafından faturalandırılır; Casama kredisi kullanmaz';

  @override
  String get whoRunsCasamaShort => 'Planınıza dahil Casama modelleri';

  @override
  String get whoRunsCasamaCost => 'Kredi kullanır';

  @override
  String get whoRunsOwnShort =>
      'Sağlayıcınız tarafından faturalandırılan kendi anahtarlarınız';

  @override
  String get whoRunsOwnCost => 'Casama kredisi harcamaz';

  @override
  String get whoRunsOwnNeedsKey =>
      'Kendi sağlayıcınızı kullanmak için önce aşağıdaki Anahtar ekle bölümünden bir sohbet anahtarı ekleyin.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Geçiş yapmak için aşağıdan bu anahtar için bir model seçin.';

  @override
  String get whoRunsAdminOnly =>
      'Botlarınızı kimin çalıştırdığını yalnızca çalışma alanı yöneticileri değiştirebilir.';

  @override
  String get botModelSource => 'Model kaynağı';

  @override
  String get botModelSourceWorkspace => 'Çalışma alanı varsayılanı';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'Kendi anahtarlarınızdan biri';

  @override
  String get useCasamaFallback =>
      'Sağlayıcım başarısız olursa Casama\'nın modellerini kullan';

  @override
  String get useCasamaFallbackHelp =>
      'Anahtarınız hız sınırına veya kotaya takıldığında çalışma alanı kredilerinizi kullanarak Casama\'nın modellerine geçin.';

  @override
  String get keyCoversOpenRouter =>
      'Sohbet, görseller, video, sesli okuma, sesli mesajlar ve dikte';

  @override
  String get keyCoversGoogle => 'Sohbet ve canlı sesli aramalar';

  @override
  String get keyCoversOpenAi => 'Sohbet ve hafıza araması';

  @override
  String get keyCoversChat => 'Sohbet';

  @override
  String get ownProviderPrivacyNote =>
      'Kendi sağlayıcınızda, botlarınızın gönderdiği verilere o sağlayıcının koşulları uygulanır. Casama\'nın eğitim yapmama ayarı yalnızca Casama\'nın anahtarında geçerlidir.';

  @override
  String get creditsOwnProviderNote =>
      'Kendi sağlayıcınızdaki modeller kredi kullanmaz.';

  @override
  String get routineWaitingForModel => 'Bir model bekleniyor';

  @override
  String get ownProviderRequiredTitle =>
      'Sohbete devam etmek için bir model bağlayın';

  @override
  String get ownProviderRequiredBody =>
      'Casama\'nın modelleri şu anda bu planda kullanılamıyor. Kendi model anahtarınızı ekleyin veya planınızı yükseltin.';

  @override
  String get modelNoToolsWarning =>
      'Bu model araçları desteklemiyor, bu yüzden bot yalnızca metinle yanıt verebilir.';

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
  String get appBrowserTitle => 'Bu telefondaki tarayıcı';

  @override
  String get appBrowserTitleMac => 'Bu Mac\'teki tarayıcı';

  @override
  String get appBrowserTitleLinux => 'Bu bilgisayardaki tarayıcı';

  @override
  String get appBrowserTitleWindows => 'Bu PC\'deki tarayıcı';

  @override
  String get appBrowserHelp =>
      'Casama içinde, izin verdiğiniz botların yalnızca bu telefonda sohbetleri açıkken siz izlerken kullanabileceği küçük bir tarayıcı. Oturum açmalarınız bu telefonda kalır.';

  @override
  String get appBrowserHelpMac =>
      'Casama içinde, izin verdiğiniz botların yalnızca bu Mac\'te Casama açıkken siz izlerken kullanabileceği küçük bir tarayıcı. Oturum açmalarınız bu Mac\'te kalır.';

  @override
  String get appBrowserHelpLinux =>
      'Casama içinde, izin verdiğiniz botların yalnızca bu bilgisayarda Casama açıkken siz izlerken kullanabileceği küçük bir tarayıcı. Oturum açmalarınız bu bilgisayarda kalır.';

  @override
  String get appBrowserHelpWindows =>
      'Casama içinde, izin verdiğiniz botların yalnızca bu PC\'de Casama açıkken siz izlerken kullanabileceği küçük bir tarayıcı. Oturum açmalarınız bu PC\'de kalır.';

  @override
  String get appBrowserSwitchHelp =>
      'İzin verdiğiniz botlar, sohbetleri bu telefonda açıkken buradan sayfa açabilir.';

  @override
  String get appBrowserSwitchHelpMac =>
      'İzin verdiğiniz botlar, Casama bu Mac\'te açıkken buradan sayfa açabilir.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'İzin verdiğiniz botlar, Casama bu bilgisayarda açıkken buradan sayfa açabilir.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'İzin verdiğiniz botlar, Casama bu PC\'de açıkken buradan sayfa açabilir.';

  @override
  String get appBrowserOn => 'Açık';

  @override
  String get appBrowserOff => 'Kapalı';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Kapatıldı: $reason';
  }

  @override
  String get appBrowserReasonOff => 'henüz kullanılamıyor.';

  @override
  String get appBrowserReasonNotTester =>
      'şimdilik yalnızca test kullanıcıları için.';

  @override
  String get appBrowserReasonSystemOff => 'henüz bu cihazda kullanılamıyor.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'bir yönetici bunu bu çalışma alanı için kapattı.';

  @override
  String get appBrowserReasonUnavailable =>
      'bu sunucuda cihaz bağlantıları yok.';

  @override
  String get appBrowserReasonUnsupported =>
      'bu cihazın tarayıcısı bunu çalıştıramıyor.';

  @override
  String get appBrowserReasonNeedsMacos14 =>
      'macOS 14 veya sonraki bir sürüm gerekir.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Tarayıcıyı burada kullanmak için WebKitGTK yükleyin: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Tarayıcıyı burada kullanmak için Microsoft Edge WebView2 yükleyin veya güncelleyin.';

  @override
  String get appBrowserGetWebview2 => 'WebView2 edin';

  @override
  String get appBrowserReasonNoToken =>
      'Önceki bir kurulumda eşleştirildi. Bu cihazı eşleştirmek için tekrar açın.';

  @override
  String get appBrowserAllBots => 'Tüm botlarınız';

  @override
  String get appBrowserAllBotsHelp =>
      'Sohbet edebildiğiniz her bot bu tarayıcıyı kullanabilir. Tek tek bot seçmek için kapatın.';

  @override
  String get appBrowserModeHeader => 'Bir bota tarayıcı gerektiğinde';

  @override
  String get appBrowserModeAlways => 'Her zaman bu cihaz';

  @override
  String get appBrowserModeAlwaysHelp =>
      'Botlar, sohbetleri açık olduğu sürece her sayfayı burada açar. Kendi bilgisayarları yalnızca siz istediğinizde kullanılır.';

  @override
  String get appBrowserOpenTooltip => 'Tarayıcıyı aç';

  @override
  String get appBrowserBotsBrowseHere => 'Botlar burada gezinir';

  @override
  String get appBrowserBotsBrowseHereHelp =>
      'Sohbetlerinizdeki her sayfa siz izlerken bu tarayıcıda açılır';

  @override
  String get appBrowserModeAsk => 'Gerektiğinde sor';

  @override
  String get appBrowserModeAskHelp =>
      'Bir site oturum açmanızı gerektirdiğinde veya botun bilgisayarını engellediğinde bir seçim sun.';

  @override
  String get appBrowserModeComputer => 'Her zaman botun bilgisayarı';

  @override
  String get appBrowserModeComputerHelp =>
      'Sohbette siz istemedikçe bu cihazın tarayıcısını asla önerme.';

  @override
  String get appBrowserModeDevice => 'Bu cihazı tercih et';

  @override
  String get appBrowserModeDeviceHelp =>
      'Oturum açmalar ve engellenen siteler için sormadan bu cihazın tarayıcısını kullan.';

  @override
  String get appBrowserNeverAsk => 'Botun bilgisayarı (sorma)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Linux bilgisayarı';

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
      'Sizi bekliyor. Tarayıcınızda devam etmek için bu sohbeti açık tutun.';

  @override
  String browserWaitingSite(String site) {
    return 'Sizi bekliyor. Tarayıcınızda $site ile devam etmek için bu sohbeti açık tutun.';
  }

  @override
  String get browserWaitEnded => 'Tarayıcınızı beklemeyi durdurdu.';

  @override
  String get browserHandBackWaiting =>
      'Tarayıcıda sıra sizde. Sayfadaki adımı yapın, ardından Geri ver\'e dokunun.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'Sıra sizde: $site. Sayfadaki adımı yapın, ardından Geri ver\'e dokunun.';
  }

  @override
  String get browserHandBackEnded =>
      'Tarayıcıyı geri vermenizi beklemeyi durdurdu.';

  @override
  String get browserChoiceCardLabel => 'Tarayıcı seçimi';

  @override
  String browserChoiceTitle(String bot, String site) {
    return '$bot, $site sitesini nerede açsın?';
  }

  @override
  String get browserChoiceSubtitleSignIn =>
      'Bu site oturum açmanızı gerektiriyor.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'Bu site $bot botunun bilgisayarını engelledi.';
  }

  @override
  String get browserChoiceOnPhone => 'Bu telefonda';

  @override
  String get browserChoiceOnMac => 'Bu Mac\'te';

  @override
  String get browserChoiceOnLinux => 'Bu bilgisayarda';

  @override
  String get browserChoiceOnWindows => 'Bu PC\'de';

  @override
  String get browserChoiceOnDeviceHelp =>
      'Siz izlersiniz ve kendiniz oturum açabilirsiniz. Okudukları yapay zekaya gider.';

  @override
  String get browserChoiceInChrome => 'Chrome tarayıcınızda';

  @override
  String get browserChoiceInChromeHelp => 'Sitelerinizde zaten oturum açık.';

  @override
  String browserChoiceOnComputer(String bot) {
    return '$bot botunun bilgisayarında';
  }

  @override
  String get browserChoiceOnComputerHelp =>
      'Siz ayrılsanız da çalışmaya devam eder.';

  @override
  String browserChoiceRemember(String site) {
    return '$site için hatırla';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return '$site bu telefonda açıldı';
  }

  @override
  String browserChoicePickedMac(String site) {
    return '$site bu Mac\'te açıldı';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return '$site bu bilgisayarda açıldı';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return '$site bu PC\'de açıldı';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return '$site Chrome tarayıcınızda açıldı';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return '$site, $bot botunun bilgisayarında açıldı';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'Zamanında yanıt gelmedi; $bot botunun bilgisayarında kaldı';
  }

  @override
  String get appBrowserConsentTitle =>
      'Botlar Casama\'daki tarayıcıyı kullansın mı?';

  @override
  String get appBrowserConsentPages =>
      'Botun burada okuduğu sayfalar, kendi bilgisayarında okuduğu sayfalar gibi Casama\'ya ve botun yapay zeka modeline gönderilir.';

  @override
  String get appBrowserConsentSignIns =>
      'Oturumlarınız bu cihazda kalır. Botlar parolaları, kart numaralarını veya kodları asla görmez; bunları kendiniz yazarsınız.';

  @override
  String get appBrowserConsentWatch =>
      'Yalnızca burada botun sohbetini açık tuttuğunuzda çalışır. İstediğiniz zaman izleyebilir, devralabilir veya durdurabilirsiniz.';

  @override
  String get appBrowserConsentYours =>
      'Kendi başınıza gezindikleriniz asla hiçbir yere gönderilmez.';

  @override
  String get appBrowserBots => 'Kullanabilecek botlar';

  @override
  String get appBrowserBotsHelp =>
      'Yalnızca burada açılan botlar bu cihazdaki tarayıcıyı kullanabilir.';

  @override
  String get appBrowserNoBots => 'Henüz bot yok.';

  @override
  String get appBrowserSites => 'Siteler';

  @override
  String get appBrowserSitesHelp =>
      'Her zaman veya Hiçbir zaman yanıtını verdiğiniz siteler. Bir dahaki sefere tekrar sorulması için birini kaldırın.';

  @override
  String get appBrowserNoSites =>
      'Henüz site yok. Bir bot bir siteyi ilk kez açtığında sorar.';

  @override
  String appBrowserRemoveSite(String site) {
    return '$site sitesini kaldır';
  }

  @override
  String get appBrowserKinds => 'Kapalı kalan siteler';

  @override
  String get appBrowserKindsHelp =>
      'Siz açmadığınız sürece bu tür siteler kapalı kalır. Biri açık olduğunda bile bot her seferinde sorar.';

  @override
  String get appBrowserKindBanking => 'Bankacılık ve ödemeler';

  @override
  String get appBrowserKindHealth => 'Sağlık';

  @override
  String get appBrowserKindPasswords => 'Parola yöneticileri';

  @override
  String get appBrowserKindGovernment => 'Resmî kimlik';

  @override
  String get appBrowserSignIn => 'Bir sitede oturum aç';

  @override
  String get appBrowserSignInHelp =>
      'Bir siteyi açın, kendiniz oturum açın, ardından botlarınızın kullanmasına izin verin. Orada yaptıklarınız hiçbir yere gönderilmez.';

  @override
  String get appBrowserClearData => 'Tarama verilerini temizle';

  @override
  String get appBrowserClearDataHelp =>
      'Bu tarayıcının tüm sitelerdeki oturumunu kapatır ve sitelerin kaydettiklerini temizler.';

  @override
  String get appBrowserClearDataConfirm =>
      'Bu tarayıcıdaki oturumlar ve site verileri temizlensin mi?';

  @override
  String get appBrowserClearDataDone => 'Tarama verileri temizlendi';

  @override
  String get appBrowserUnpair => 'Bu cihazın eşleştirmesini kaldır';

  @override
  String get appBrowserUnpairConfirm =>
      'Bu cihazın tarayıcısının eşleştirmesi kaldırılsın mı? Siz tekrar açana kadar botlar kullanamaz.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot çalışıyor';
  }

  @override
  String get appBrowserTakeOver => 'Devral';

  @override
  String get appBrowserHandBack => 'Geri ver';

  @override
  String get appBrowserYourTurn => 'Sıra sizde';

  @override
  String appBrowserPaused(String bot) {
    return 'Siz sayfayı kullanırken $bot duraklatıldı';
  }

  @override
  String get appBrowserAway => 'Duraklatıldı: sohbet açık değil';

  @override
  String get appBrowserAddress => 'Site adresi';

  @override
  String get appBrowserBack => 'Geri';

  @override
  String get appBrowserForward => 'İleri';

  @override
  String get appBrowserReload => 'Yenile';

  @override
  String get appBrowserAllowSite =>
      'Botlarımın bu siteyi kullanmasına izin ver';

  @override
  String appBrowserSiteAdded(String site) {
    return '$site eklendi. Botlarınız bunu burada kullanabilir.';
  }

  @override
  String get appBrowserAddressRefused => 'Bu adres burada açılamıyor.';

  @override
  String get appBrowserSecure => 'Güvenli bağlantı';

  @override
  String get appBrowserNotSecure => 'Güvenli değil';

  @override
  String get appBrowserCardLabel => 'Uygulama içi tarayıcı';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot, $site sitesini açmak istiyor';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'Bu cihazdaki Casama\'da, oturumlarınızla birlikte. Her zaman, bundan sonra bu siteyi açmasına izin verir.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'Bu Mac\'te, oturumlarınızla birlikte. Her zaman, bundan sonra bu siteyi açmasına izin verir.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'Bu bilgisayarda, oturumlarınızla birlikte. Her zaman, bundan sonra bu siteyi açmasına izin verir.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'Bu PC\'de, oturumlarınızla birlikte. Her zaman, bundan sonra bu siteyi açmasına izin verir.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': 'Bankacılık ve Ödeme siteleri her seferinde sorar.',
      'health': 'Sağlık siteleri her seferinde sorar.',
      'passwords': 'Parola Yöneticisi siteleri her seferinde sorar.',
      'government': 'Resmi Kimlik siteleri her seferinde sorar.',
      'other': 'Bu siteler her seferinde sorar.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Bir kez';

  @override
  String get appBrowserAlways => 'Her zaman';

  @override
  String get appBrowserNever => 'Hiçbir zaman';

  @override
  String appBrowserStepAskTitle(String bot) {
    return '$bot botunun bunu yapmasına izin verilsin mi?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'Bu cihazdaki Casama\'da, oturumlarınızla birlikte.';

  @override
  String get appBrowserStepAskHelpMac =>
      'Bu Mac\'te, oturumlarınızla birlikte.';

  @override
  String get appBrowserStepAskHelpLinux =>
      'Bu bilgisayarda, oturumlarınızla birlikte.';

  @override
  String get appBrowserStepAskHelpWindows =>
      'Bu PC\'de, oturumlarınızla birlikte.';

  @override
  String appBrowserStepClick(String name) {
    return '“$name” öğesine dokun';
  }

  @override
  String appBrowserStepType(String name) {
    return '“$name” alanına yaz';
  }

  @override
  String appBrowserStepPress(String name) {
    return '“$name” alanında bir tuşa bas';
  }

  @override
  String appBrowserStepUpload(String name) {
    return '“$name” alanına dosya yükle';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: “$name”';
  }

  @override
  String get appBrowserDontAllow => 'İzin verme';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Android telefon';

  @override
  String get toolOnThisPhone => 'bu cihazda';

  @override
  String get appBrowserWorkspaceSwitch =>
      'Üyelerin uygulama içi tarayıcılarındaki botlar';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'Üyeler izlerken botların telefonlarında veya bilgisayarlarında Casama içindeki bir tarayıcıyı kullanmasına izin verebilir.';

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
  String get vendorRenewalUsd => 'Bir yenilemenin maliyeti (USD)';

  @override
  String get vendorRenewalMonths => 'Bir yenilemenin kapsadığı ay sayısı';

  @override
  String get vendorSeeSpend => 'Harcamayı gör';

  @override
  String get costSpent => 'Harcanan';

  @override
  String get costCharged => 'Tahsil edilen';

  @override
  String get costMargin => 'Marj';

  @override
  String get costMarginNone => 'Hiçbir ücret tahsil edilmedi';

  @override
  String get costNotRecorded => 'Kaydedilmemiş';

  @override
  String get costNotRecordedHint =>
      'Bunun ne anlama geldiğini ve hangi hizmetlerle ilgili olduğunu gösterir';

  @override
  String get costNotRecordedHelp =>
      'Bazı hizmetler kendi toplamlarını bildirir. Onlarınki bu sunucunun kaydettiğinden yüksek olduğunda fark burada görünür. Henüz hiçbir özelliğe, anahtara veya çalışma alanına bağlanmamış gerçek harcamadır.';

  @override
  String get costNotRecordedWhy => 'Hizmetlerin bunun üzerinde bildirdikleri';

  @override
  String get costNotRecordedNone => 'Hizmetlerin bildirdikleriyle eşleşiyor';

  @override
  String get costNotRecordedAllMatch =>
      'Toplam bildiren her hizmet bu sunucunun kaydettiğiyle eşleşiyor.';

  @override
  String get costNotRecordedNoList =>
      'Hizmet listesi şu anda kullanılamıyor. Birazdan tekrar deneyin.';

  @override
  String get costNoVendorFigures => 'Hiçbir hizmet toplam bildirmedi';

  @override
  String get costNoVendorFiguresHelp =>
      'Bu dönem için hiçbir hizmet kendi toplamını bildirmedi, bu yüzden karşılaştırılacak bir şey yok.';

  @override
  String costNoFigureFrom(String names) {
    return 'Toplam bildirmeyenler: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hizmet',
      one: '1 hizmet',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'Onların bildirdiği: $theirs · bizim kaydettiğimiz: $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'Onların bildirdiği: $theirs · bizim kaydettiğimiz: $ours · kaydedilmeyen: $gap';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'Onların bildirdiği: $theirs · bizim kaydettiğimiz: $ours · eksik yok';
  }

  @override
  String get costNoVendorFigure =>
      'Bu hizmet bu dönem için kendi toplamını vermedi.';

  @override
  String get costNoVendorFigureKind => 'Bu hizmet kendi toplamını bildirmiyor.';

  @override
  String costUpdated(String when) {
    return 'Güncellendi: $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'önceki $days güne göre',
      one: 'önceki güne göre',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => 'karşılaştırılacak daha eski dönem yok';

  @override
  String get costChangeNew => 'Yeni';

  @override
  String get costChangeNewSpoken => 'bu dönemde yeni';

  @override
  String get costChangeFlat => 'değişiklik yok';

  @override
  String costChangeUp(String amount) {
    return '$amount artış';
  }

  @override
  String costChangeDown(String amount) {
    return '$amount düşüş';
  }

  @override
  String costPoints(String count) {
    return '$count puan';
  }

  @override
  String get costOther => 'Diğer';

  @override
  String get costNotLabelled => 'Etiketlenmemiş';

  @override
  String get costNotLabelledHelp =>
      'Bu maliyetler bu gruplama için bir etiket olmadan kaydedildiği için daha fazla bölünemez. Yine de toplamın bir parçasıdırlar.';

  @override
  String get costGroupService => 'Hizmet';

  @override
  String get costGroupKey => 'Anahtar';

  @override
  String get costGroupApp => 'Uygulamalar ve MCP';

  @override
  String get costGroupFeature => 'Özellik';

  @override
  String get costGroupModel => 'Model';

  @override
  String get costGroupWorkspace => 'Çalışma alanı';

  @override
  String get costGroupBy => 'Grupla';

  @override
  String get costFilters => 'Filtreler';

  @override
  String get costNoFilters =>
      'Yok. Görünümü daraltmak için bir satırı açıp Tabloda göster\'i seçin.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return '$name filtresini kaldır';
  }

  @override
  String get costIncludeFixed => 'Sabit faturaları dahil et';

  @override
  String get costIncludeFixedHelp =>
      'Abonelikleri ve yenilemeleri kapsadıkları günlere eşit dağıtarak Harcanan\'a ekler.';

  @override
  String get costOptions => 'Dönem ve filtreler';

  @override
  String get costPeriod => 'Dönem';

  @override
  String costPeriodDays(int days) {
    return '$days gün';
  }

  @override
  String get costPeriodCustom => 'Özel';

  @override
  String costLastDays(int days) {
    return 'Son $days gün';
  }

  @override
  String get costChangeDates => 'Tarihleri değiştir';

  @override
  String get costDone => 'Bitti';

  @override
  String get costDaysUtc => 'Günler UTC saat dilimindedir.';

  @override
  String get costDailySpend => 'Günlük harcama';

  @override
  String costStackedBy(String group) {
    return '$group ölçütüne göre yığılmış: en büyükler, ardından Diğer.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Günlük harcama grafiği, $days gün, toplam $total. En yüksek gün $peakAmount ile $peakDay oldu.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Günlük harcama grafiği, $days gün, hiçbir şey harcanmadı.';
  }

  @override
  String get costSourceMetered => 'Ölçümlenen';

  @override
  String get costSourceCounted => 'Sayılan';

  @override
  String get costSourceFixed => 'Sabit';

  @override
  String get costSourceEstimated => 'Tahmini';

  @override
  String get costSourceMeteredHelp =>
      'Her çağrı için kaydedilen gerçek maliyet.';

  @override
  String get costSourceCountedHelp =>
      'Bu sunucunun kendi sayımı çarpı birim fiyat.';

  @override
  String get costSourceFixedHelp =>
      'Kapsadığı günlere eşit olarak dağıtılan bir fatura.';

  @override
  String get costSourceEstimatedHelp =>
      'Metin uzunluğundan hesaplanır. Gerçek maliyet en az bu kadardır.';

  @override
  String get costEstimated => 'tahmini';

  @override
  String get costColShare => 'Pay';

  @override
  String get costColChange => 'Değişim';

  @override
  String get costColCalls => 'Çağrılar';

  @override
  String get costColSource => 'Kaynak';

  @override
  String get costColFailed => 'Başarısız';

  @override
  String get costColFees => 'Sağlayıcı ücretleri';

  @override
  String get costColTokens => 'Token maliyeti';

  @override
  String get costTokenCost => 'Token maliyeti';

  @override
  String get costFailureRate => 'Hata oranı';

  @override
  String costSortBy(String column) {
    return '$column sütununa göre sırala';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, düşükten yükseğe sıralı';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, yüksekten düşüğe sıralı';
  }

  @override
  String get costOpenRowHint => 'Ayrıntıları açar';

  @override
  String costSpokenSpent(String amount) {
    return 'harcanan $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return 'sağlayıcı ücretleri $amount';
  }

  @override
  String costSpokenShare(String share) {
    return 'toplamın $share kadarı';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count çağrı';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate başarısız';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'tahmini token maliyeti $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return 'tahsil edilen $amount';
  }

  @override
  String costCallsCount(String count) {
    return '$count çağrı';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate başarısız';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount token, tahmini';
  }

  @override
  String get costOpenBilling => 'Faturalandırma sayfasını aç';

  @override
  String get costByDay => 'Güne göre';

  @override
  String get costSplitBy => 'Bölme ölçütü';

  @override
  String get costShowInTable => 'Tabloda göster';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Tabloyu $name ile daraltır ve $group ölçütüne göre gruplar.';
  }

  @override
  String get costNothingRecorded => 'Bu dönemde burada kaydedilen bir şey yok.';

  @override
  String costLastUsed(String when) {
    return 'son kullanım: $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ve $count tane daha. Tabloda gösterin.',
      one: 'Ve 1 tane daha. Tabloda gösterin.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'Ne için';

  @override
  String get costKeyService => 'Hizmet';

  @override
  String get costKeySetting => 'Ayar';

  @override
  String get costKeySetIn => 'Nerede ayarlandığı';

  @override
  String get costKeyVault => 'Kasa öğesi';

  @override
  String get costKeyStatus => 'Durum';

  @override
  String get costKeyConfigured => 'Ayarlı';

  @override
  String get costKeyNotConfigured => 'Ayarlı değil';

  @override
  String get costKeyLastUsed => 'Son kullanım';

  @override
  String get costKeyNotUsed => 'Bu dönemde değil';

  @override
  String get costKeyCap => 'Harcama üst sınırı';

  @override
  String costKeyCapLeft(String left, String cap) {
    return '$cap üst sınırından $left kaldı';
  }

  @override
  String costKeyCapUsed(String share) {
    return 'Üst sınırın $share kadarı kullanıldı';
  }

  @override
  String get costKeyNoCap => 'Yok';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Bu $days günde hiçbir şey harcanmadı',
      one: 'Bu günde hiçbir şey harcanmadı',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'Bu günlerde hiçbir şey harcanmadı';

  @override
  String get costEmptyFiltered => 'Bu filtrelerle eşleşen bir harcama yok';

  @override
  String get costEmptyGroup => 'Bu gruplama için listelenecek bir şey yok';

  @override
  String get costAppsNote =>
      'Uygulamalar ve MCP sunucuları: Harcanan, sağlayıcının faturalandırdığı tutardır. Token maliyeti, sonuçlarının model tokenları cinsinden tahmin edilen maliyetidir ve zaten model harcamasının bir parçasıdır.';

  @override
  String costFixedLeftOut(String amount) {
    return 'Bu dönemdeki $amount tutarındaki sabit faturalar dışarıda bırakıldı. Eklemek için Sabit faturaları dahil et seçeneğini açın.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Çalışma alanları kendi anahtarlarıyla $amount ödedi. Bu tutar bu sunucunun parası olmadığı için hariç tutuldu.';
  }

  @override
  String get costOlderServerTitle => 'Bu sunucunun güncellenmesi gerekiyor';

  @override
  String get costOlderServer =>
      'Hizmet, anahtar ve uygulamaya göre maliyetler daha yeni bir sunucu sürümüyle gelir. Sunucuyu güncelleyin, ardından tekrar kontrol edin.';

  @override
  String get costCheckAgain => 'Tekrar kontrol et';

  @override
  String get costSpendCardTitle => 'Harcama, son 30 gün';

  @override
  String get costSpendCardOpen => 'Maliyetler';

  @override
  String get costSpendCardHint => 'Maliyetler sekmesini açar';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Son 30 gündeki harcama: $spent harcanan, $charged tahsil edilen, $margin marj';
  }

  @override
  String get costSort => 'Sıralama';

  @override
  String get costSortName => 'Ad';

  @override
  String get costByWorkspace => 'Çalışma alanına göre';

  @override
  String get costTopTools => 'En çok kullanılan araçlar';

  @override
  String get costToolList => 'Modele gönderilen araç listesi';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ve $count araç daha.',
      one: 'Ve 1 araç daha.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Casama\'nın Telegram botunu kullan';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Telegram\'da $bot ile konuşun. Tek dokunuş, hiçbir kurulum gerektirmez.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Telegram\'ınız başka bir çalışma alanında bağlı. Buraya bağlamak onu taşır.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'Oradaki mesajlarınız $bot botuna gider.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'Oradaki mesajlarınız $other botuna gider. $bot botuna yönlendirmek için dokunun.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Telegram mesajları artık $bot botuna gidiyor.';
  }

  @override
  String get telegramFinish => 'Telegram\'da tamamla';

  @override
  String get telegramFinishHelp =>
      'Telegram\'da Başlat\'a basın. Bunu yalnızca kendi Telegram hesabınızda yapın. Bağlandığınızda burası güncellenir.';

  @override
  String get telegramOpenAgain => 'Telegram\'ı tekrar aç';

  @override
  String get telegramConnected => 'Telegram bağlı';

  @override
  String telegramConnectedHelp(String name) {
    return '$name olarak bağlandı. Bota Telegram\'da istediğiniz zaman mesaj atın; sohbet burada Genel içinde de görünür.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Bota Telegram\'da istediğiniz zaman mesaj atın; sohbet burada Genel içinde de görünür.';

  @override
  String get telegramConnect => 'Telegram\'ı bağla';

  @override
  String get telegramDisconnect => 'Telegram bağlantısını kes';

  @override
  String get telegramDisconnectConfirm => 'Telegram bağlantısı kesilsin mi?';

  @override
  String get telegramDisconnectHelp =>
      'Botlarınız Telegram\'da yanıt vermeyi durdurur. Sohbet geçmişiniz burada kalır.';

  @override
  String get telegramPickBot => 'Telegram mesajlarının gideceği bot';

  @override
  String get telegramNeedsBot =>
      'Önce bir bot oluşturun, ardından Telegram\'ı bağlayın.';

  @override
  String get telegramNotOffered =>
      'Bu sunucunun kendi Telegram botu yok. Bir botun Sohbet uygulamaları bölümünden kendi botunuzu bağlayabilirsiniz.';

  @override
  String get chatAppsSettingsHelp =>
      'Zaten kullandığınız sohbet uygulamalarından botlarınızla konuşun. Mesajlar Genel sohbetinize düşer, böylece buradan devam edebilirsiniz.';

  @override
  String get chatAppsPerBot =>
      'E-posta ve kendi botlarınız bot başına ayarlanır: bir botu, ardından Sohbet uygulamaları\'nı açın.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack ve daha fazlası';

  @override
  String get chatAppsSlackHelp =>
      'Slack, her Slack çalışma alanı için tek bir bot adına eklenir. Botu seçin, ardından Slack\'e Ekle\'ye dokunun.';

  @override
  String get chatAppsSlackPickBot => 'Şunun için Slack ekle:';

  @override
  String get slackAnyoneInWorkspace => 'Bu Slack çalışma alanındaki herkes';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Yalnızca listelenen kişiler değil, çalışma alanındaki herkes botla konuşabilir. Onaylar için hâlâ listedeki birinin yanıtı gerekir.';

  @override
  String get discordUseCasama => 'Casama\'nın Discord botunu kullan';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Discord\'da $bot ile konuşun. Discord ile bir kez oturum açın, ardından bota mesaj atın veya her yerde /ask kullanın.';
  }

  @override
  String get discordOtherWorkspace =>
      'Discord\'unuz başka bir çalışma alanında bağlı. Buraya bağlamak onu taşır.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Discord mesajları artık $bot botuna gidiyor.';
  }

  @override
  String get discordFinish => 'Discord\'da tamamla';

  @override
  String get discordFinishHelp =>
      'Tarayıcınızda Discord ile oturum açın ve Casama\'ya izin verin. Bunu yalnızca kendi Discord hesabınızla yapın. Bağlandığınızda burası güncellenir.';

  @override
  String get discordOpenAgain => 'Discord oturum açma sayfasını tekrar aç';

  @override
  String get discordConnected => 'Discord bağlı';

  @override
  String discordConnectedHelp(String name) {
    return '$name olarak bağlandı. Discord\'da Casama botuna mesaj atın veya her yerde /ask kullanın; sohbet burada Genel içinde de görünür.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Discord\'da Casama botuna mesaj atın veya her yerde /ask kullanın; sohbet burada Genel içinde de görünür.';

  @override
  String get discordConnect => 'Discord\'u bağla';

  @override
  String get discordDisconnect => 'Discord bağlantısını kes';

  @override
  String get discordDisconnectConfirm => 'Discord bağlantısı kesilsin mi?';

  @override
  String get discordDisconnectHelp =>
      'Botlarınız Discord\'da yanıt vermeyi durdurur. Sohbet geçmişiniz burada kalır.';

  @override
  String get discordPickBot => 'Discord mesajlarının gideceği bot';

  @override
  String get discordNeedsBot =>
      'Önce bir bot oluşturun, ardından Discord\'u bağlayın.';

  @override
  String get discordNotOffered =>
      'Bu sunucunun kendi Discord uygulaması yok. Bir botun Sohbet uygulamaları bölümünden kendi Discord uygulamanızı bağlayabilirsiniz.';

  @override
  String get inactiveAccountsNote =>
      'Casama\'yı kullanmayı bırakırsanız: 30 gün sonra rutinleriniz ve takipleriniz siz dönene kadar duraklatılır. 6 ay sonra bilgisayarlarınızın kayıtlı dosyaları, 12 ay sonra da (daha önce hiç ödeme yaptıysanız 24 ay sonra) hesabınız silinir. Herhangi bir şey kaldırılmadan önce size e-posta göndeririz. Ücretli bir plandaki hesaplar asla etkilenmez.';

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
  String get inactivityModeOff => 'Kapalı';

  @override
  String get inactivityModeReport => 'Bildir';

  @override
  String get inactivityModeOn => 'Açık';

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
    return 'etkin: $when';
  }

  @override
  String get inactivityStateResting => 'Dinlenmede';

  @override
  String get inactivityStateFilesSoon => 'Dosyalar yakında silinecek';

  @override
  String get inactivityStateRemovalSoon => 'Yakında kaldırılacak';

  @override
  String get inactivityStateRemoving => 'Kaldırılıyor';

  @override
  String get inactivityKept => 'Korundu';

  @override
  String get keepAccount => 'Bu hesabı koru';

  @override
  String get keepAccountHelp =>
      'Kullanılmadığı için asla dinlendirilmez veya kaldırılmaz';

  @override
  String get computerFilesRemoved => 'Kayıtlı dosyalar kaldırıldı';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'Bu bilgisayar 6 ay boyunca kullanılmadığı için kayıtlı dosyaları $date tarihinde kaldırıldı. Sıfırdan başlar.';
  }

  @override
  String get downloadSavedFiles => 'Kayıtlı dosyaları indir';

  @override
  String get downloadSavedFilesHelp =>
      'Onu uyandırmadan ana klasörünün .tar.gz arşivi';

  @override
  String get liveActivity => 'Canlı Etkinlik';

  @override
  String get liveRowHelp =>
      'Gerçekleştikleri anda bekleme listesi, kayıtlar ve indirmeler';

  @override
  String get liveRefresh => 'Yenile';

  @override
  String get liveTabActivity => 'Etkinlik';

  @override
  String get liveTabAlerts => 'Uyarılar';

  @override
  String get liveGroupAll => 'Tümü';

  @override
  String get liveGroupWaitlist => 'Bekleme listesi';

  @override
  String get liveGroupAccounts => 'Hesaplar';

  @override
  String get liveGroupMoney => 'Para';

  @override
  String get liveGroupWebsite => 'Web sitesi';

  @override
  String get liveGroupGrowth => 'Büyüme';

  @override
  String get liveGroupSupport => 'Destek';

  @override
  String get liveKindWaitlistJoined => 'Bekleme listesine katıldı';

  @override
  String get liveKindWaitlistAdmitted => 'Bekleme listesinden içeri alındı';

  @override
  String get liveKindSignup => 'Yeni hesap';

  @override
  String get liveKindSignupRefused => 'Kayıt geri çevrildi';

  @override
  String get liveKindFirstChat => 'İlk sohbet';

  @override
  String get liveKindMilestone =>
      'Diğer ilkler (bot, bilgisayar, arama, rutin)';

  @override
  String get liveKindSubscription => 'Yeni abonelik';

  @override
  String get liveKindSubscriptionEnded => 'Abonelik sona erdi';

  @override
  String get liveKindPurchase => 'Kredi satın alındı';

  @override
  String get liveKindSupportTicket => 'Destek talebi';

  @override
  String get liveKindFeedback => 'Geri bildirim';

  @override
  String get liveKindAccountDeleted => 'Hesap silindi';

  @override
  String get liveKindDownloadClick => 'İndirme tıklaması';

  @override
  String get liveKindQrOpen => 'İndirme QR kodu açıldı';

  @override
  String get liveKindStartClick => 'Ücretsiz başla tıklandı';

  @override
  String get liveKindInviteOpen => 'Davet bağlantısı açıldı';

  @override
  String get liveNow => 'şimdi';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes dk';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours sa';
  }

  @override
  String get liveTestSent => 'Cihazlarınıza test uyarısı gönderildi';

  @override
  String get liveTodayWaitlist => 'Bugün katılanlar';

  @override
  String get liveTodaySignups => 'Bugünkü hesaplar';

  @override
  String get liveTodayDownloads => 'Bugünkü indirmeler';

  @override
  String get liveTodayMoney => 'Bugünkü gelir';

  @override
  String get liveRetry => 'Yeniden dene';

  @override
  String get liveEmpty =>
      'Henüz bir şey yok. Yeni etkinlikler birkaç saniye içinde burada görünür.';

  @override
  String get liveOlder => 'Eskileri göster';

  @override
  String get liveAlertsHelp =>
      'Telefonlarınıza, Mac\'lerinize ve tarayıcılarınıza nelerin gönderileceğini seçin. Aynı anda çok şey olduğunda her biri için ayrı bildirim yerine tek bir özet alırsınız.';

  @override
  String get livePauseAll => 'Tüm uyarıları duraklat';

  @override
  String get livePauseAllHelp => 'Etkinlikler burada görünmeye devam eder';

  @override
  String get liveSendTest => 'Test uyarısı gönder';

  @override
  String get liveSendTestHelp =>
      'Uyarıların bu cihaza ulaşıp ulaşmadığını kontrol edin';

  @override
  String get liveAlertsFooter =>
      'Uyarılar sessiz saatlerinizde (Ayarlar → Bildirimler) bekler ve sonrasında tek bir özet olarak gelir. Bir tarayıcıda bildirimleri alabilmek için bu siteye izin verin.';

  @override
  String get liveStatusOn => 'Canlı: birkaç saniyede bir güncellenir';

  @override
  String get liveStatusPaused => 'Canlı. Uyarılar duraklatıldı';

  @override
  String get liveGroupApp => 'Uygulama';

  @override
  String get liveKindAppFirstOpen => 'Uygulama ilk kez açıldı';

  @override
  String get liveKindAppReinstall => 'Uygulama yeniden yüklendi';

  @override
  String get liveKindSigninStarted => 'Oturum açma başlatıldı';

  @override
  String get liveKindTrialStarted => 'Deneme başladı';

  @override
  String get liveKindRenewal => 'Abonelik yenilendi';

  @override
  String get liveKindRefund => 'İade';

  @override
  String get liveKindDisputeOpened => 'İtiraz açıldı';

  @override
  String get liveKindPlanCancelFailed => 'Plan iptal edilmedi';

  @override
  String get liveKindStoreReview => 'Mağaza değerlendirmesi';

  @override
  String get liveKindStoreCrashes => 'Mağaza çökme raporları';

  @override
  String get liveKindDay2Return => '2. günde geri döndü';

  @override
  String get liveKindWeek1Return => '1. haftada geri döndü';

  @override
  String get liveKindDeviceGone => 'Uygulama muhtemelen silindi';

  @override
  String get liveKindPartnerInterest =>
      'İçerik üreticisi Ortaklar ile ilgileniyor';

  @override
  String get liveKindCreatorOpen => 'İçerik üreticisi bağlantısı açıldı';

  @override
  String get liveKindPartnerClaimed => 'İçerik üreticisi kodu kullanıldı';

  @override
  String get liveKindGiftOpen => 'Hediye bağlantısı açıldı';

  @override
  String get liveKindCompRedeemed => 'Hediye plan kullanıldı';

  @override
  String get liveKindReferralRewarded => 'Davet karşılık verdi';

  @override
  String get liveKindNewsletterConfirmed => 'Bülten kaydı';

  @override
  String get liveKindTestimonialSubmitted => 'İncelenecek kullanıcı görüşü';

  @override
  String get liveDailyDigest => 'Sabah özeti';

  @override
  String get liveDailyDigestHelp =>
      'Saat diliminizde saat 9\'da dünkü dönüşüm hunisi ve indirmeler';

  @override
  String get liveFunnelClicks => 'Tıklamalar';

  @override
  String get liveFunnelOpens => 'İlk açılışlar';

  @override
  String get liveFunnelSignups => 'Hesaplar';

  @override
  String get liveFunnelChats => 'İlk sohbetler';

  @override
  String get liveFunnelPaying => 'Ödeme yapan';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · %$percent';
  }

  @override
  String get liveByPerson => 'Kişiye göre';

  @override
  String get liveSearch => 'E-posta, ülke, kaynak ara';

  @override
  String get liveNoMatches => 'Bu aramayla eşleşen bir şey yok';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count adım',
      one: '1 adım',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'olası';

  @override
  String get liveStepClick => 'İndirmeye tıkladı';

  @override
  String get liveStepOpen => 'Uygulamayı açtı';

  @override
  String get liveStepSignup => 'Hesap oluşturdu';

  @override
  String get liveStepChat => 'İlk sohbet';

  @override
  String get liveStepPaying => 'Ödeme yapıyor';

  @override
  String get liveJourneyTitle => 'Ne oldu';

  @override
  String get liveJourneyVisitor => 'Ziyaretçi';

  @override
  String get liveJourneyWho => 'Kim';

  @override
  String get liveJourneyFrom => 'Nereden';

  @override
  String get liveJourneyDevice => 'Cihaz';

  @override
  String get liveJourneyTimeline => 'Zaman çizelgesi';

  @override
  String get liveJourneyNow => 'Şimdi';

  @override
  String get liveJourneySource => 'Kaynak';

  @override
  String get liveJourneyCampaign => 'Kampanya';

  @override
  String get liveJourneyLanding => 'İlk sayfa';

  @override
  String get liveJourneyClickedFrom => 'Tıklanan yer';

  @override
  String get liveJourneyPlatform => 'Platform';

  @override
  String get liveJourneyStore => 'Kaynak';

  @override
  String get liveJourneyVersion => 'Sürüm';

  @override
  String get liveJourneyCountry => 'Ülke';

  @override
  String get liveJourneyLikelyHelp =>
      'Bir bağlantıyla değil; cihaz, ülke ve zamana göre bir web sitesi tıklamasıyla eşleştirildi. Bunu iyi bir tahmin olarak görün.';

  @override
  String get liveJourneyPlan => 'Plan';

  @override
  String get liveJourneyMessages => 'Gönderilen mesajlar';

  @override
  String get liveJourneyBots => 'Botlar';

  @override
  String get liveJourneyDevices => 'Oturum açılan cihazlar';

  @override
  String get liveJourneyLastActive => 'Son etkinlik';

  @override
  String get liveJourneyJoined => 'Hesap oluşturuldu';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap sonra';
  }

  @override
  String get liveJourneyNone => 'Bunun hakkında henüz daha fazla bilgi yok.';

  @override
  String get liveJourneyCopyEmail => 'E-postayı kopyala';

  @override
  String get liveJourneyCopied => 'E-posta kopyalandı';

  @override
  String get liveJourneyOpenAdmin => 'Yönetici panelinde aç';

  @override
  String get liveJourneyGone =>
      'Bu kayıt 30 günden eski olduğu için ayrıntıları silindi.';

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
  String get planChangeTitle => 'Plan değişikliğini onayla';

  @override
  String planChangeSwitchTo(String plan) {
    return '$plan planına geç';
  }

  @override
  String get planChangeChargedNow => 'Şimdi tahsil edilen';

  @override
  String planChangeTaxIncluded(String tax) {
    return '$tax vergi dahil';
  }

  @override
  String get planChangeCredit => 'Kullanılmayan süre için düşülen tutar';

  @override
  String planChangeThen(String amount, String period) {
    return 'Sonra $amount / $period (vergi öncesi)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Sonraki faturalandırma: $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Onayla ve öde';

  @override
  String get planChangeHaveCode => 'Kodunuz var mı?';

  @override
  String get planChangeCodeLabel => 'İndirim kodu';

  @override
  String get planChangeCodeHint => 'Kodu girin';

  @override
  String get planChangeApply => 'Uygula';

  @override
  String get planChangeRemove => 'Kaldır';

  @override
  String get planChangeDiscountApplied => 'İndirim uygulandı';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return 'Her yenilemede %$percent indirim';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yenileme için %$percent indirim',
      one: '1 yenileme için %$percent indirim',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return 'Her yenilemede $amount indirim';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yenileme için $amount indirim',
      one: '1 yenileme için $amount indirim',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return 'Her yenilemede %$percent indirim; planı tekrar değiştirirseniz sona erer';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return 'Her yenilemede $amount indirim; planı tekrar değiştirirseniz sona erer';
  }

  @override
  String get planChangeInvalidCode => 'Bu kod bu planda kullanılamaz.';

  @override
  String get planChangeCodeCostsMore =>
      'Bu kod mevcut indiriminizin yerini alır ve daha pahalıya mal olur.';

  @override
  String get planChangeCodeEndsLasting =>
      'Bu kod mevcut kalıcı indiriminizi sonlandırır.';

  @override
  String get planChangeCodeNotBetter =>
      'Zaten eşit veya daha iyi bir indiriminiz var.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Mevcut %$percent indiriminizin yerini alır';
  }

  @override
  String get planChangeReplacesDiscount => 'Mevcut indiriminizin yerini alır';

  @override
  String get planChangePriceMoved =>
      'Bunu açtığınızdan beri toplam tutar değişti. Güncellenen tutarı inceleyin ve yeniden onaylayın.';

  @override
  String get planChangePeriodWeek => 'hafta';

  @override
  String get planChangePeriodMonth => 'ay';

  @override
  String get planChangePeriodYear => 'yıl';

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
  String get partnerSection => 'Casama Ortakları';

  @override
  String get partnerProgramTitle =>
      'Video, gönderi veya bülten mi hazırlıyorsunuz?';

  @override
  String get partnerProgramSubtitle =>
      'Yönlendirdiğiniz kişilerin ödediklerinin %30\'unu bir yıl boyunca kazanın';

  @override
  String get partnerYourCode => 'İçerik üreticisi kodunuz';

  @override
  String get partnerPaused => 'Duraklatıldı';

  @override
  String get partnerPortal => 'Kazançlar ve Ödemeler';

  @override
  String partnerShareText(String link, String code) {
    return 'Sizin için çalışan yapay zeka ekip arkadaşları Casama\'yı deneyin. Kaydolurken $code kodumu kullanın: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name sizi Casama\'ya yönlendirdi.';
  }

  @override
  String get partnerClaimed =>
      'İçerik üreticisi kodu eklendi. Casama\'ya hoş geldiniz!';

  @override
  String partnerClaimedFrom(String name) {
    return '$name için desteğiniz teşekkürler. Casama\'ya hoş geldiniz!';
  }

  @override
  String get partnerErrNotFound =>
      'Böyle bir içerik üreticisi kodu yok. Kontrol edip yeniden deneyin.';

  @override
  String get partnerErrOwnCode =>
      'Bu sizin kendi kodunuz. Bunun yerine hedef kitlenizle paylaşın.';

  @override
  String get partnerErrWindowClosed =>
      'İçerik üreticisi kodları yalnızca kaydolduktan sonraki ilk günlerde girilebilir.';

  @override
  String get partnerErrAlreadyPaying =>
      'İçerik üreticisi kodları ilk ödemeden önce, yeni hesaplar içindir.';

  @override
  String get partnerErrAlready =>
      'Zaten bir içerik üreticisinin kodunu girdiniz.';

  @override
  String get partnerErrReferred =>
      'Bir arkadaşınızın davetiyle katıldığınız için içerik üreticisi kodu eklenemez.';

  @override
  String get partnerErrOff =>
      'Bu sunucuda içerik üreticisi kodları kullanılamıyor.';

  @override
  String get referralHaveCodeAny => 'Kodunuz var mı?';

  @override
  String get referralCodeHintAny => 'Arkadaş veya içerik üreticisi kodu';

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
  String get testimonialStateLive => 'Yayında';

  @override
  String get testimonialStateDraft => 'Taslak';

  @override
  String get testimonialStateHidden => 'Gizli';

  @override
  String get testimonialStateWithdrawn => 'Geri çekildi';

  @override
  String get testimonialPlaceSiteHome => 'casama.ai ana sayfası';

  @override
  String get testimonialPlaceSitePricing => 'casama.ai fiyatlandırma';

  @override
  String get testimonialPlaceAppPaywall => 'Uygulama planları';

  @override
  String get testimonialPlaceAppSignin => 'Uygulama giriş ekranı';

  @override
  String get testimonialSourceEmail => 'E-posta';

  @override
  String get testimonialSourceInApp => 'Uygulamada';

  @override
  String get testimonialSourceOther => 'Diğer';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yıldız',
      one: '1 yıldız',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'İnsanların Casama hakkında söyledikleri';

  @override
  String get testimonialAskTitle => 'Casama\'yı beğeniyor musunuz?';

  @override
  String get testimonialAskSubtitle => 'Tek cümlede bize anlatın.';

  @override
  String get testimonialAskHint => 'En çok nesini seviyorsunuz?';

  @override
  String testimonialAskConsent(String name) {
    return 'Sözlerimin casama.ai sitesinde ve uygulamada $name adıyla alıntılanmasını kabul ediyorum';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'Sözlerimin casama.ai sitesinde ve uygulamada bir Casama kullanıcısı olarak alıntılanmasını kabul ediyorum';

  @override
  String get testimonialAskSend => 'Gönder';

  @override
  String get testimonialAskNotNow => 'Şimdi değil';

  @override
  String get testimonialAskThanks => 'Teşekkürler! Her birini okuyoruz.';

  @override
  String get communityTitle => 'Topluluk';

  @override
  String get communitySentence =>
      'Casama açık kaynaklıdır. İşinize yarıyorsa GitHub\'da yıldız vermeniz başkalarının da onu bulmasına yardımcı olur.';

  @override
  String get communityStarOnGitHub => 'GitHub\'da yıldız ver';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Ekiple ve Casama kullanan diğer kişilerle sohbet edin';

  @override
  String get starAskTitle => 'GitHub\'da Casama';

  @override
  String get starAskNotNow => 'Şimdi değil';

  @override
  String get cloudSignInTitle => 'Casama hesabınızla oturum açın';

  @override
  String get cloudSignInBody =>
      'Ücretsiz kişisel lisans Casama hesabınızdan gelir. Bu sunucuya yalnızca lisans gider; sohbetleriniz burada kalır.';

  @override
  String get cloudSignInEmail => 'E-posta';

  @override
  String get cloudSignInSendCode => 'Kod gönder';

  @override
  String get cloudSignInCode => 'E-postadaki kod';

  @override
  String get cloudSignInVerify => 'Oturum aç';

  @override
  String cloudSignInCodeSent(String email) {
    return '$email adresine bir kod gönderdik. Buraya girin.';
  }

  @override
  String get licenseSetupTitle => 'Ücretsiz kişisel lisansınızı alın';

  @override
  String get licenseSetupBody =>
      'Botların çalışabilmesi için bu sunucuya bir lisans gerekir. Tek kişi için kişisel kullanım ücretsizdir: Casama hesabınızla oturum açın, lisans her 30 günde bir çevrimiçi olarak kendiliğinden yenilenir.';

  @override
  String get licensePersonalButton => 'Ücretsiz kişisel lisans al';

  @override
  String get licensePersonalNote =>
      'Kişisel: tek kişi, kişisel kullanım için, kendi bilgisayarınızda veya sunucunuzda.';

  @override
  String get licenseBusinessTitle => 'Veya bir işletme anahtarı girin';

  @override
  String get licenseBusinessHint => 'Lisans anahtarınızı yapıştırın';

  @override
  String get licenseBusinessSave => 'Bu anahtarı kullan';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return 'Casama\'yı işte veya bir ekiple mi kullanıyorsunuz? Business, aktif kullanıcı başına aylık $monthlyPrice (yıllık faturalandırıldığında $yearlyMonthlyPrice) tutarındadır. $email adresine yazın.';
  }

  @override
  String get licenseActivated => 'Lisans etkin. Botlarınız çalışabilir.';

  @override
  String get licenseOtherServer => 'Başka bir sunucu kullan';

  @override
  String get licenseRenew => 'Yenile';

  @override
  String get licenseRenewTitle => 'Bu sunucunun lisansını yenile';

  @override
  String licenseGraceBanner(String date) {
    return 'Bu sunucunun lisansı sona erdi. Botlar $date tarihine kadar çalışmaya devam eder; bu tarihten önce yenileyin.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'Bu sunucunun lisansı sona erdi. Botların çalışmaya devam etmesi için yakında yenileyin.';

  @override
  String get licenseExpiredBanner =>
      'Bu sunucunun lisansının süresi doldu, bu nedenle yeni bot çalıştırmaları duraklatıldı. Verileriniz güvende: yine de oturum açabilir, okuyabilir ve dışa aktarabilirsiniz. Botları tekrar başlatmak için yenileyin.';

  @override
  String get licenseErrorRequired =>
      'Bu sunucuya önce bir lisans gerekir. Ücretsiz kişisel lisansı alın veya bir işletme anahtarı girin.';

  @override
  String licenseErrorSeats(String email) {
    return 'Bu sunucunun lisansındaki tüm koltuklar dolu. Daha fazla kişi için Business lisansı gerekir: $email adresine yazın.';
  }

  @override
  String get licenseErrorExpired =>
      'Bu sunucunun lisansının süresi doldu, bu nedenle yeni bot çalıştırmaları duraklatıldı. Verileriniz güvende. Botları tekrar başlatmak için lisansı yenileyin.';

  @override
  String get licenseEditionPersonal => 'Kişisel';

  @override
  String get licenseEditionTrial => 'Deneme';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Denetim dışa aktarımı';

  @override
  String get licenseFeatureAuditForwarding => 'Denetim iletimi';

  @override
  String get licenseFeatureRoles => 'Gelişmiş roller';

  @override
  String get setupLicenseTitle => 'Ücretsiz kişisel lisans';

  @override
  String get setupLicenseBody =>
      'Bu sunucu için ücretsiz kişisel lisansı almak üzere Casama hesabınızla oturum açın: tek kişi, kişisel kullanım. Bunu daha sonra da yapabilirsiniz.';

  @override
  String get setupLicenseSignIn => 'Casama ile oturum aç';

  @override
  String get setupLicenseReady =>
      'Ücretsiz kişisel lisans sunucunuzla birlikte gelir.';

  @override
  String setupLicenseReadyFor(String email) {
    return '$email olarak oturum açıldı. Ücretsiz kişisel lisans sunucunuzla birlikte gelir.';
  }

  @override
  String get setupLicenseSkipped =>
      'Henüz lisans yok. Sunucunuz başladığında bir lisans isteyecektir.';

  @override
  String setupLicenseFailed(String error) {
    return 'Kişisel lisans oluşturulamadı ($error). Sunucunuz başladığında bir lisans isteyecektir.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'Casama sunucusu, onu PC\'nizin geri kalanından ayrı tutmak için WSL 2 kullanan ücretsiz Docker Desktop uygulamasının içinde çalışır.';

  @override
  String get setupDockerStep1Windows =>
      'İndirilen yükleyiciyi çalıştırın ve \"Use WSL 2\" seçeneğini açık bırakın.';

  @override
  String localUpdateAvailable(String version) {
    return 'Bir sunucu güncellemesi hazır: $version';
  }

  @override
  String get localUpdateButton => 'Güncelle';

  @override
  String get localUpdateLater => 'Daha sonra';

  @override
  String localUpdateTitle(String version) {
    return 'Sunucunuzu $version sürümüne güncelleyin';
  }

  @override
  String get localUpdateBody =>
      'Önce veritabanı yedeklenir. Yeni sürüm başlamazsa sunucunuz şu an sahip olduğu sürüme geri döner.';

  @override
  String localUpdateDone(String version) {
    return '$version sürümüne güncellendi.';
  }

  @override
  String get localUpdateRolledBack =>
      'Yeni sürüm başlamadı, bu yüzden sunucunuz önceki sürümüne geri döndü. Hiçbir şey kaybolmadı ve bir veritabanı yedeği kaydedildi.';

  @override
  String localUpdateFailed(String detail) {
    return 'Güncelleme başarısız oldu: $detail';
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
  String get shCloudScreenTitle => 'Casama Cloud modelleri';

  @override
  String get shCloudPitch =>
      'Casama\'nın modelleri, yönetilecek anahtar yok. Bir Casama Cloud planıyla ödenir.';

  @override
  String get shCloudTurnOn => 'Aç';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'Açık · $workspace tarafından ödeniyor';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, $workspace tarafından ödeniyor';
  }

  @override
  String get shCloudMemberOff =>
      'Açık değil. Bunu yalnızca bu sunucunun bir yöneticisi açabilir.';

  @override
  String get shCloudManage => 'Yönet';

  @override
  String get shCloudSignInBody =>
      'Casama Cloud modelleri için kimin ödeyeceğini seçmek üzere Casama hesabınızla oturum açın. Botlarınız, sohbetleriniz ve hafızanız bu sunucuda kalır.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Casama Cloud\'da $email olarak oturum açıldı';
  }

  @override
  String get shCloudOtherAccount => 'Başka bir hesap kullan';

  @override
  String get shCloudContinue => 'Devam et';

  @override
  String get shCloudPayerTitle => 'Kim ödesin?';

  @override
  String get shCloudPayerBody =>
      'Casama Cloud modelleri, sahibi olduğunuz veya yönettiğiniz bir Casama Cloud çalışma alanı tarafından ödenir. Planı, dahil edilen kullanımı ve günlük sınırı, kullandığı diğer her şeyle paylaşılır.';

  @override
  String get shCloudPayerNone =>
      'Henüz bir Casama Cloud çalışma alanı yönetmiyorsunuz. Ödeme yapmak için bir tane oluşturun; boş olarak başlar.';

  @override
  String get shCloudCreateWorkspace => 'Oluştur';

  @override
  String shCloudWorkspaceNamed(String name) {
    return '$name çalışma alanı';
  }

  @override
  String get shCloudNoPlan => 'Henüz plan yok';

  @override
  String shCloudCovered(String plan) {
    return '$plan planınız bunu kapsıyor.';
  }

  @override
  String get shCloudPlanTitle => 'Bir plan seçin';

  @override
  String get shCloudPlanBody =>
      'Casama Cloud modelleri herhangi bir Casama Cloud planıyla gelir: Cloud\'dakiyle aynı dahil edilen kullanım, günlük sınır ve ek yüklemeler. Kendi sunucunuzda barındırma için ayrı bir ücret yoktur.';

  @override
  String get shCloudTryFirst => 'Önce deneyin';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Denemek için ücretsiz kullanım: Casama hesabı başına bir kez yaklaşık $amount tutarında mesaj. Satın alınacak bir şey yok.';
  }

  @override
  String get shCloudTrialUsed =>
      'Bu Casama hesabında deneme amaçlı ücretsiz kullanım tükendi. Devam etmek için bir plan seçin.';

  @override
  String get shCloudIntervalWeek => 'Haftalık';

  @override
  String get shCloudIntervalMonth => 'Aylık';

  @override
  String get shCloudIntervalYear => 'Yıllık';

  @override
  String get shCloudWaitingForPlan =>
      'Ödemeyi tarayıcınızda tamamlayın. Plan geldiğinde bu ekran kendiliğinden devam eder.';

  @override
  String get shCloudWaitingTimedOut =>
      'Plan henüz gelmedi. Ödemenin görünmesi birkaç dakika sürebilir.';

  @override
  String get shCloudCheckAgain => 'Tekrar kontrol et';

  @override
  String get shCloudGiftCode => 'Hediye kodunuz var mı?';

  @override
  String get shCloudGiftCodeLabel => 'Hediye kodu';

  @override
  String get shCloudRedeem => 'Kullan';

  @override
  String get shCloudNoWayToBuy =>
      'Bu uygulamada plan satın alınamaz. Aynı hesapla casama.ai üzerinden bir plan satın alın, ardından buradan tekrar kontrol edin.';

  @override
  String get shCloudPurchasePending =>
      'Satın alma işleminiz onay bekliyor. Tamamlandığında işlem kendiliğinden devam eder.';

  @override
  String get shCloudPurchaseFailed =>
      'Satın alma işlemi gerçekleşmedi. Hiçbir ücret alınmadı.';

  @override
  String get shCloudConnecting => 'Bu sunucu Casama Cloud\'a bağlanıyor…';

  @override
  String get shCloudLoading => 'Yükleniyor…';

  @override
  String get shCloudReviewTitle => 'Açmadan önce kontrol edin';

  @override
  String get shCloudReviewPays => 'Kim öder';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$workspace üzerinde $plan ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return '$workspace üzerinde denemek için ücretsiz kullanım ($email)';
  }

  @override
  String get shCloudReviewBots => 'Hangi botlar geçsin';

  @override
  String get shCloudReviewAll => 'Tüm botlar';

  @override
  String get shCloudReviewNoKey => 'Yalnızca çalışan anahtarı olmayan botlar';

  @override
  String get shCloudReviewPick => 'Botları seç';

  @override
  String get shCloudReviewNoBots =>
      'Bu sunucuda henüz bot yok. Yeni botlar Casama Cloud\'u kullanabilir.';

  @override
  String get shCloudReviewDefault => 'Yeni botlar da Casama Cloud\'u kullanır';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Casama Cloud\'un modeli';

  @override
  String get shCloudNoKeyYet => 'Çalışan anahtar yok';

  @override
  String shCloudStepDown(String from) {
    return 'Yanıtlar $from ile olduğundan daha kısa veya daha az özenli olabilir. Önce bir botta deneyin.';
  }

  @override
  String get shCloudReviewJobs => 'Hafıza, görseller ve ses';

  @override
  String get shCloudJobMemory => 'Hafıza araması';

  @override
  String get shCloudJobImages => 'Görseller';

  @override
  String get shCloudJobTts => 'Sesli okuma';

  @override
  String get shCloudJobStt => 'Dikte';

  @override
  String get shCloudJobOwnKey => 'Kendi anahtarınız';

  @override
  String get shCloudJobMemoryOptIn => 'Hafıza için de Casama Cloud\'u kullan';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'Hafıza arka planda yeniden dizinlenir; bu sırada arama çalışmaya devam eder.';

  @override
  String get shCloudJobLiveNote =>
      'Canlı ses, telefon aramaları ve video kendi anahtarlarınızı kullanmaya devam eder.';

  @override
  String get shCloudWhatGoes => 'Casama Cloud\'a neler gider';

  @override
  String get shCloudReviewPrivacy =>
      'Modele giden mesajlar Casama Cloud üzerinden geçer ve saklanmaz. Kullanım (model, tokenlar, maliyet) Cloud faturanızda görünür. Botlar, sohbetler, hafıza, dosyalar ve bilgisayarlar bu sunucuda kalır.';

  @override
  String get shCloudWhatGoesLink => 'Bu sunucunun gönderdikleri';

  @override
  String get shCloudFallback =>
      'Casama Cloud tükenirse veya ulaşılamazsa kendi anahtarımı kullan';

  @override
  String get shCloudFallbackHelp =>
      'Kendi anahtarınızdan gelen her yanıt bunu belirtir.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return 'Bu sunucuyu $usedString kişi kullanıyor ve $plan planı $seatsString kişiyi kapsıyor. Her ek kişi Casama Cloud\'un ek kişi fiyatı üzerinden faturalandırılır.';
  }

  @override
  String get shCloudApply => 'Casama Cloud\'u aç';

  @override
  String get shCloudPickOne =>
      'En az bir bot seçin veya yeni botların kullanmasına izin verin.';

  @override
  String get shCloudPolicyTitle => 'Kimler kullanabilir';

  @override
  String get shCloudPolicyEveryone => 'Bu sunucudaki herkes';

  @override
  String get shCloudPolicyChosen => 'Yalnızca seçilen kişiler';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kişi seçildi',
      one: '1 kişi seçildi',
      zero: 'Henüz kimse seçilmedi',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Kişi başı günlük sınır';

  @override
  String get shCloudNoLimit => 'Sınır yok';

  @override
  String shCloudDailyLimitValue(String amount) {
    return 'Günde $amount';
  }

  @override
  String get shCloudPolicySaved => 'Kaydedildi';

  @override
  String get shCloudDoneTitle => 'Casama Cloud açık';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bot artık Casama Cloud kullanıyor.',
      one: '1 bot artık Casama Cloud kullanıyor.',
      zero: 'Yeni botlar Casama Cloud kullanır.',
    );
    return '$_temp0 Kullanım bu sunucunun Kullanım ekranında ve Cloud faturanızda görünür.';
  }

  @override
  String shCloudSayHi(String bot) {
    return '$bot botuna merhaba de';
  }

  @override
  String get shCloudDone => 'Bitti';

  @override
  String get shCloudUsageTitle => 'Kullanım';

  @override
  String shCloudIncludedLeft(String amount) {
    return 'Bu ay dahil edilen kullanımdan $amount kaldı';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Bugün: $spend / $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Bugün: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount kredi';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return 'Denemek için $amount ücretsiz kullanım kaldı';
  }

  @override
  String get shCloudPriceNote =>
      'Casama Cloud\'un uyguladığı fiyattan. Aynı çağrılar Cloud faturanızda bu sunucunun adı altında görünür.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'Bugün siz: $spend / $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'Casama Cloud bu ayın dahil edilen kullanımının %80\'ini kullandı.';

  @override
  String get shCloudWarnDaily =>
      'Casama Cloud bugünkü sınırın %80\'ini kullandı.';

  @override
  String get shCloudTopUp => 'Bakiye yükle';

  @override
  String get shCloudUseOwnKey => 'Kendi anahtarımı kullan';

  @override
  String get shCloudStopOutOfCredits =>
      'Casama Cloud\'un bu ayki kullanımı tükendi.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'Bugünkü Casama Cloud sınırı tükendi. Sıfırlanma saati: $time.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'Bugünkü Casama Cloud sınırı tükendi. Yarın sıfırlanır.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud için $workspace üzerinde bir plan gerekir.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return '$workspace üzerindeki Casama Cloud planı sona erdi.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return '$workspace üzerindeki plan burada Casama Cloud kullanan herkesi kapsamıyor.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'Bu sunucuda bugünkü Casama Cloud sınırına ulaştınız.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Yöneticiniz sizin için Casama Cloud\'u açmadı.';

  @override
  String get shCloudStopDisconnected =>
      'Casama Cloud bağlantısı bu sunucudan kesildi.';

  @override
  String get shCloudStopUnreachable =>
      'Casama Cloud\'a şu anda ulaşılamıyor. Yeniden deneniyor.';

  @override
  String get shCloudSeePlans => 'Planları gör';

  @override
  String get shCloudRenew => 'Yenile';

  @override
  String get shCloudAskAdmin => 'Bir yöneticiye sor';

  @override
  String get shCloudAskAdminBody =>
      'Casama Cloud\'u yalnızca bu sunucunun bir yöneticisi değiştirebilir. Onlardan birine sorun; sorun giderildiğinde botlar ve rutinler kendiliğinden devam eder.';

  @override
  String get shCloudReconnect => 'Yeniden bağla';

  @override
  String get shCloudFallbackActive =>
      'Bu arada kendi anahtarınız yanıt veriyor ve her yanıt bunu belirtiyor.';

  @override
  String get shCloudUseOwnKeyTitle =>
      'Bu arada kendi anahtarınız kullanılsın mı?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Casama Cloud yanıt veremediğinde botlar kendi anahtarınızla yanıt verir ve bu tür her yanıt bunu belirtir. İstediğiniz zaman bu ekrandan kapatabilirsiniz.';

  @override
  String get shCloudAddKeyFirst =>
      'Önce Modeller ekranından kendi anahtarınızı ekleyin.';

  @override
  String get shCloudRoutinesWait =>
      'Rutinler bekler ve sorun giderildiğinde kendiliğinden devam eder.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Hafıza yetişiyor: $doneString / $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'Arama henüz yeniden dizinlenmemiş anılar için sözcükleri kullanır.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'Modele giden mesajlar artık $workspace tarafından ödenen Casama Cloud üzerinden geçiyor.';
  }

  @override
  String get shCloudGotIt => 'Anladım';

  @override
  String shCloudChipPaidBy(String workspace) {
    return '$workspace tarafından ödeniyor';
  }

  @override
  String get shCloudPaidBy => 'Ödeyen';

  @override
  String get shCloudChangePayer => 'Değiştir';

  @override
  String get shCloudChangeBots => 'Botları değiştir';

  @override
  String get shCloudFallbackSection => 'Casama Cloud yanıt veremediğinde';

  @override
  String get shCloudTurnOff => 'Kapat';

  @override
  String get shCloudOffTitle => 'Casama Cloud kapatılsın mı?';

  @override
  String get shCloudOffBody =>
      'Bu botlar hâlâ çalışıyorsa önceki anahtarlarına, aksi halde çalışma alanının varsayılan anahtarına geri döner. Başka hiçbir şey değişmez ve istediğiniz zaman tekrar açabilirsiniz.';

  @override
  String get shCloudOffBotsNone =>
      'Şu anda hiçbir bot Casama Cloud\'u kullanmıyor.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud kapalı';

  @override
  String shCloudOffBackTo(String key) {
    return '$key anahtarına geri dönüldü';
  }

  @override
  String get shCloudOffNeedsKey => 'Bir anahtar gerekiyor';

  @override
  String get shCloudAddKey => 'Anahtar ekle';

  @override
  String get shCloudSignInAgain =>
      'Casama Cloud oturumunuz sona erdi. Devam etmek için tekrar oturum açın.';

  @override
  String get cloudAccountSection => 'Casama Cloud hesabı';

  @override
  String cloudAccountRow(String email) {
    return '$email olarak oturum açıldı';
  }

  @override
  String get cloudAccountRowHelp =>
      'Bu sunucunun lisansı ve Casama Cloud modelleri için kullanılır';

  @override
  String get cloudAccountSignOut => 'Casama Cloud oturumunu kapat';

  @override
  String get cloudAccountSignOutBody =>
      'Bu cihaz Casama Cloud oturumunuzu unutur. Bu sunucu, lisansı ve Casama Cloud modelleri çalışmaya devam eder.';

  @override
  String get cloudAccountDelete => 'Casama Cloud hesabını sil';

  @override
  String get cloudAccountDeleteHelp =>
      'Casama Cloud üzerindeki hesabınızı siler. Bu sunucu ve verileri kalır.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Casama Cloud hesabınızı silmek için $email yazın. Yalnızca size ait olan Cloud çalışma alanları da silinir ve Casama Cloud modelleri bunların ödediği sunucularda durur. Web üzerinden alınan bir plan otomatik olarak iptal edilir. App Store veya Google Play\'den alınan bir plan ise iptal edilmez: ilgili mağazadan iptal edin.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Casama Cloud hesabınız silindi. Verileri $date tarihinde kalıcı olarak kaldırılır.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Casama Cloud\'a taşı';

  @override
  String get wsMoveSettingsToServer => 'Kendi sunucuma taşı';

  @override
  String get wsMoveSettingsHelp =>
      'Bu çalışma alanının botlarını, sohbetlerini, hafızasını ve dosyalarını başka bir sunucuya taşıyın';

  @override
  String get wsMoveTitle => 'Bu çalışma alanını taşı';

  @override
  String get wsMoveIntro =>
      'Her şey birlikte gelir: botlar, sohbetler, hafıza, rutinler, dosyalar ve bilgisayarlar. Oraya taşındıktan sonra bu kopya okunabilir kalır ancak çalışmayı durdurur.';

  @override
  String get wsMoveCloudOption => 'Casama Cloud\'a taşı';

  @override
  String get wsMoveCloudOptionHelp =>
      'Casama hesabınızla oturum açın ve nereye gideceğini seçin.';

  @override
  String get wsMoveServerOption => 'Kendi sunucuma taşı';

  @override
  String get wsMoveServerOptionHelp =>
      'O sunucuda Ayarlar › Çalışma Alanını Buraya Getir bölümünü açın ve taşıma kodunu kopyalayın.';

  @override
  String get wsMoveInstallServer => 'Casama sunucusunu yükle';

  @override
  String get wsMoveInstallServerHelp =>
      'Henüz sunucu yok mu? Önce bu bilgisayarda bir tane çalıştırın.';

  @override
  String get wsMoveReceiveOption => 'Buraya bir çalışma alanı getir';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Diğer çalışma alanının şu anda bulunduğu sunucuda kullanmak üzere bu çalışma alanı için bir taşıma kodu alın.';

  @override
  String get wsMoveOwnerOnly =>
      'Bunu yalnızca çalışma alanının sahibi taşıyabilir.';

  @override
  String get wsMoveCloudPickTitle => 'Nereye gitmeli?';

  @override
  String get wsMoveCloudNew => 'Yeni bir çalışma alanı';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Casama Cloud üzerinde boş başlar, adı $name olur.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Taşınan öğeler oradakilerin yanına eklenir. Çakışan adların sonuna “(moved)” eklenir.';

  @override
  String get wsMoveServerTitle => 'Kendi sunucunuza taşıyın';

  @override
  String get wsMoveServerAddress => 'Sunucu adresi';

  @override
  String get wsMoveServerCode => 'Taşıma kodu';

  @override
  String get wsMoveCheckButton => 'Kontrol et';

  @override
  String get wsMoveReceiveTitle => 'Çalışma alanını buraya getirin';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'Çalışma alanının şu anda bulunduğu sunucuda Ayarlar › Kendi Sunucuma Taşı bölümünü açın ve bu adresi ve kodu girin. Kod $time saatine kadar bir kez çalışır ve her şeyi $name çalışma alanına getirir.';
  }

  @override
  String get wsMoveReceiveAddress => 'Bu sunucunun adresi';

  @override
  String get wsMoveReceiveCode => 'Taşıma kodu';

  @override
  String get wsMoveCopy => 'Kopyala';

  @override
  String get wsMoveCopied => 'Kopyalandı';

  @override
  String get wsMoveCheckTitle => 'Taşınmaya hazır';

  @override
  String wsMoveCheckTo(String name) {
    return 'Hedef: $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString dakika',
      one: '1 dakika',
    );
    return '$size kopyalanacak, yaklaşık $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString dakika',
      one: '1 dakika',
    );
    return 'Sona doğru botlar yaklaşık $_temp0 duraklar, ardından orada devam eder.';
  }

  @override
  String get wsMoveCheckLongPause =>
      'Bu uzun bir duraklama. Sakin bir zaman seçin.';

  @override
  String get wsMoveCheckComes => 'Birlikte taşınacaklar';

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
      other: '$nString sohbet',
      one: '1 sohbet',
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
      other: '$nString anı',
      one: '1 anı',
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
      other: '$nString rutin',
      one: '1 rutin',
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
      other: '$nString dosya',
      one: '1 dosya',
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
      other: '$nString bilgisayar',
      one: '1 bilgisayar',
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
      other: '$nString kişi',
      one: '1 kişi',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => 'Sonrasında sizden beklenenler';

  @override
  String wsMoveReconnect(String names) {
    return 'Şu uygulamalarda tekrar oturum açın: $names';
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
      other: '$nString kişi',
      one: '1 kişi',
    );
    return '$_temp0 e-posta daveti alır';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (davet edildi)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'ChatGPT planları geride kalır. Orada ChatGPT\'de tekrar oturum açın.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString bilgisayar',
      one: '1 bilgisayar',
    );
    return '$_temp0 ana klasörü geri yüklenmiş şekilde orada sıfırdan başlar.';
  }

  @override
  String get wsMoveResetNote =>
      'Onaylar, tam erişim ve cihaz erişimi yeni sunucunun varsayılanlarıyla başlar.';

  @override
  String get wsMoveBringKeys => 'Anahtarlarımı getir';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString anahtar',
      one: '1 anahtar',
    );
    return '$_temp0 yalnızca yeni sunucunun okuyabileceği şekilde mühürlenerek birlikte taşınır.';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'Model ve sohbet uygulaması anahtarlarını orada yeniden ekleyeceksiniz.';

  @override
  String get wsMoveDoesntFit => 'Bu çalışma alanı oradaki plana sığmıyor';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$plan buna uyar. Casama Cloud\'da bunu seçin, ardından tekrar kontrol edin.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have / $limit';
  }

  @override
  String get wsMoveOverPeople => 'Kişiler';

  @override
  String get wsMoveOverBots => 'Botlar';

  @override
  String get wsMoveOverComputers => 'Bilgisayarlar';

  @override
  String get wsMoveOverStorage => 'Depolama';

  @override
  String get wsMoveUpdateSource =>
      'Önce bu sunucuyu güncelleyin. Taşıyacağınız sunucudan daha eski.';

  @override
  String get wsMoveUpdateTarget =>
      'Taşıyacağınız sunucunun önce güncellenmesi gerekiyor.';

  @override
  String get wsMoveStart => 'Taşımayı başlat';

  @override
  String get wsMoveCheckAgain => 'Tekrar kontrol et';

  @override
  String get wsMoveProgressTitle => 'Taşınıyor';

  @override
  String get wsMoveStepStarting => 'Hazırlanıyor';

  @override
  String get wsMoveStepCopying =>
      'Her şey çalışmaya devam ederken dosyalar kopyalanıyor';

  @override
  String get wsMoveStepPausing =>
      'Son değişiklikleri kopyalamak için botlar duraklatılıyor';

  @override
  String get wsMoveStepFinishing => 'Sohbetler, hafıza ve ayarlar gönderiliyor';

  @override
  String get wsMoveStepImporting => 'Yeni sunucu bunları içeri aktarıyor';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done / $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'Uygulamayı kapatabilirsiniz. Taşıma işlemi devam eder ve bittiğinde bildirim alırsınız.';

  @override
  String get wsMoveFailedTitle => 'Taşıma durdu';

  @override
  String get wsMoveFailedBody =>
      'Burada hiçbir şey değişmedi: bu çalışma alanı çalışmaya devam ediyor.';

  @override
  String get wsMoveTryAgain => 'Yeniden dene';

  @override
  String get wsMoveNewCodeNeeded =>
      'Tekrar denemek için yeni bir taşıma kodu alın.';

  @override
  String get wsMoveDoneTitle => 'Taşındı';

  @override
  String wsMoveDoneBody(String server) {
    return 'Her şey $server sunucusuna ulaştı.';
  }

  @override
  String get wsMoveDoneNeeds => 'Orada birkaç şey sizden yanıt bekliyor:';

  @override
  String get wsMoveOpenThere => 'Orada aç';

  @override
  String wsMoveAfterReconnect(String name) {
    return '$name için tekrar oturum açın';
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
      other: '$nString kişi',
      one: '1 kişi',
    );
    return '$_temp0 e-posta ile davet edildi';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return '$name bağlantısını yeniden kur';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return '$name göndericisine yeni webhook adresini verin';
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
      other: '$nString gün',
      one: '1 gün',
    );
    return 'Buraya hâlâ gönderilen webhook\'lar $_temp0 boyunca iletilir.';
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
    return '$_temp0 için onayları kontrol edin';
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
    return '$_temp0 için Ayarlar\'da Casama Cloud modellerini bağlayın veya başka bir model seçin';
  }

  @override
  String get wsMoveAfterKeys => 'Model anahtarlarınızı oraya ekleyin';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString öğe',
      one: '1 öğe',
    );
    return '$_temp0 “(moved)” olarak yeniden adlandırıldı';
  }

  @override
  String get wsMoveAfterReindex =>
      'Hafıza araması birkaç dakika içinde yetişir.';

  @override
  String get wsMoveAfterNothing => 'Yapılacak başka bir şey yok.';

  @override
  String get wsMoveSubTitle => 'Abonelikleriniz';

  @override
  String get wsMoveSubToCloud =>
      'Casama Cloud üzerindeki botlar Cloud planınızla çalışır. Bu sunucu için bir işletme lisansı ödediyseniz, ihtiyacınız kalmadığında onu iptal edin.';

  @override
  String get wsMoveSubFromCloud =>
      'Casama Cloud planınız yenilenmeye devam eder. Kendi sunucunuza yerleştikten sonra iptal edin.';

  @override
  String get wsMoveSubManage => 'Planı yönet';

  @override
  String get wsMovedTitle => 'Bu çalışma alanı taşındı';

  @override
  String get wsMovedBodyCloud =>
      'Artık Casama Cloud üzerinde. Devam etmek için orada oturum açın. Bu kopya salt okunurdur.';

  @override
  String wsMovedBodyServer(String host) {
    return 'Artık $host üzerinde. Devam etmek için orada oturum açın. Bu kopya salt okunurdur.';
  }

  @override
  String get wsMovedSignInCloud => 'Casama Cloud\'da oturum aç';

  @override
  String wsMovedOpenServer(String host) {
    return '$host adresini aç';
  }

  @override
  String get wsMovedViewOld => 'Eski kopyayı görüntüle';

  @override
  String get languageDevice => 'Cihaz dili';

  @override
  String get shortcutQuickAsk => 'Hızlı sor';

  @override
  String shortcutAskBot(String name) {
    return '$name botuna sor';
  }

  @override
  String shortcutRunRoutine(String name) {
    return '$name rutinini çalıştır';
  }

  @override
  String get settingsWordsWorkspace =>
      'çalışma alanı değiştir ekip organizasyon rol workspace';

  @override
  String get settingsWordsAboutYou =>
      'profil ad fotoğraf resim avatar zamirler hakkımda yanıt stili bilgiler hafıza';

  @override
  String get settingsWordsPeople =>
      'üyeler davet ekip kullanıcılar yöneticiler roller davet bağlantısı kod katıl kaldır';

  @override
  String get settingsWordsWorkspaceSettings =>
      'çalışma alanı ad simge logo şifreleme hafıza ödemeler stripe kart parola yöneticileri botlar arası chrome uzantısı galeri tam erişim izinler onaylar sor atla';

  @override
  String get settingsWordsSettingsDomains =>
      'alan adı web sitesi özel dns satın al bağla siteler';

  @override
  String get settingsWordsUsage =>
      'maliyet harcama para kredi tokenlar sınırlar';

  @override
  String get settingsWordsBilling =>
      'plan abonelik yükselt pro plus max ödeme fatura kart fiyatlandırma';

  @override
  String get settingsWordsInviteFriends =>
      'yönlendirme kredi ödül paylaş davet';

  @override
  String get settingsWordsAdminConsole => 'yönetici konsolu admin console';

  @override
  String get settingsWordsAppearance =>
      'tema koyu mod açık mod gece renkler yazı tipleri yazı boyutu arka plan duvar kağıdı görünüm stil efektler hareket animasyonlar dokunsal titreşim titresim haptik geri bildirim trackpad izleme dörtgeni';

  @override
  String get settingsWordsQuietHours =>
      'rahatsız etme uyku sessiz sustur bildirimler zamanlama';

  @override
  String get settingsWordsPushPrefsTitle =>
      'bildirimler anlık bildirim uyarılar yanıtlar sesler';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'aramalar telefon çalma zil kilit ekranı tam ekran gelen yanıtla';

  @override
  String get settingsWordsEmailTips =>
      'e-posta bülten ipuçları haberler abonelikten çık';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'e-posta galeri özet aylık seçkiler';

  @override
  String get settingsWordsNewsletterTitle =>
      'e-posta bülten aylık haberler güncellemeler abone ol abonelikten çık';

  @override
  String get settingsWordsWakeWord => 'ses hey eller serbest mikrofon dinle';

  @override
  String get settingsWordsShowBotSteps => 'adımlar araçlar ayrıntılar ilerleme';

  @override
  String get settingsWordsShowReplyUsage =>
      'maliyet tokenlar fiyat kullanım yanıt başına';

  @override
  String get settingsWordsCheckForUpdates =>
      'güncelle güncellemeler sürüm yükselt indir otomatik';

  @override
  String get settingsWordsOpenAtLogin =>
      'başlangıç açılış oturum açma otomatik başlat';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'canlı etkinlik dynamic island kilitli ekran kilit ekranı diğer cihazlar';

  @override
  String get settingsWordsShowBotsInNotch =>
      'çentik menü çubuğu dynamic island';

  @override
  String get settingsWordsNotchOnHover => 'çentik üzerine gelme fare';

  @override
  String get settingsWordsLanguage => 'dil yerel ayar türkçe ingilizce çeviri';

  @override
  String get settingsWordsIntegrations =>
      'uygulamalar bağla bağlantılar gmail google slack takvim eklentiler araçlar mcp';

  @override
  String get settingsWordsSkills => 'beceriler katalog yetenekler talimatlar';

  @override
  String get settingsWordsCasamaLink =>
      'uzaktan erişim adres tünel kendi sunucum telefon';

  @override
  String get settingsWordsServiceKeys => 'api anahtarları arama haritalar veri';

  @override
  String get settingsWordsModelsTitle =>
      'api anahtarları openai anthropic openrouter gemini modeller sağlayıcılar ollama yerel modeller';

  @override
  String get settingsWordsModelKeys =>
      'api anahtarları openai anthropic openrouter gemini modeller sağlayıcılar ollama yerel modeller';

  @override
  String get settingsWordsAccount =>
      'e-posta e-posta değiştir parola tüm cihazlardan çık oturum açma';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa iki adımlı doğrulama totp otp güvenlik kodu';

  @override
  String get settingsWordsPairDevice =>
      'qr kod tara oturum aç eşleştir telefon başka cihaz';

  @override
  String get settingsWordsPasskeys =>
      'geçiş anahtarı passkey face id touch id parmak izi biyometrik';

  @override
  String get settingsWordsWidgetsTitle =>
      'araç takımları widget ana ekran kilitli ekran kilit ekranı denetimler denetim merkezi kestirme sabitle';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'kartlar hava durumu birimler santigrat fahrenhayt ana şehir konum para birimi hisse kırmızı yeşil veri kaynakları';

  @override
  String get settingsWordsAppLock =>
      'uygulama kilidi pin parola face id touch id parmak izi biyometrik windows hello ekran görüntüleri gizlilik kilit ekranı';

  @override
  String get settingsWordsPrivacy =>
      'veri dışa aktar indir hesabı sil analiz izleme geçmiş saklama engellenen kişiler engelle';

  @override
  String get settingsWordsSecrets =>
      'gizli bilgiler parolalar giriş bilgileri kasa ortam değişkenleri';

  @override
  String get settingsWordsComputers =>
      'bilgisayarlar makineler docker korumalı alan masaüstü';

  @override
  String get settingsWordsDeviceConnections =>
      'cihazlar konum sağlık yerler klasörler izlenen uygulamalar tarayıcılar chrome uzantısı telefon izinler';

  @override
  String get settingsWordsUseThisComputer =>
      'eşlikçi bu bilgisayar mac yerel dosyalar';

  @override
  String get settingsWordsHelpAndSupport =>
      'yardım destek iletişim talep hata bildirimi geri bildirim belgeler topluluk github yıldız açık kaynak discord fikir panosu durum';

  @override
  String get settingsWordsSignOut => 'çıkış oturumu kapat';

  @override
  String get notifDoIt => 'Yap';

  @override
  String get notifNotNow => 'Şimdi değil';

  @override
  String get notifAllow => 'İzin ver';

  @override
  String get notifDeny => 'Reddet';

  @override
  String get notifApprove => 'Onayla';

  @override
  String get notifReview => 'İncele';

  @override
  String get notifReply => 'Yanıtla';

  @override
  String get notifSend => 'Gönder';

  @override
  String get notifReplyPlaceholder => 'Yanıtla…';

  @override
  String get notifChannelReplies => 'Yanıtlar';

  @override
  String get notifChannelRepliesDescription =>
      'Bir bot sorduğunuz bir şeyi yanıtladı';

  @override
  String get notifChannelNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String get notifChannelNeedsYouDescription =>
      'Botlarınızın beklediği onaylar, parolalar ve devralmalar';

  @override
  String get notifChannelRoutines => 'Rutinler ve özetler';

  @override
  String get notifChannelRoutinesDescription =>
      'Rutinlerin sonuçları ve sabah özeti';

  @override
  String get notifChannelSuggestions => 'Öneriler';

  @override
  String get notifChannelSuggestionsDescription =>
      'Botlarınızın sizin için yapmayı teklif ettiği şeyler';

  @override
  String get notifChannelAccount => 'Hesap';

  @override
  String get notifChannelAccountDescription =>
      'Krediler, projeler ve sunucunuz';

  @override
  String get notifCallChannel => 'Aramalar';

  @override
  String get notifCallLive => 'Sesli aramada';

  @override
  String get notifCallMuted => 'Sessize alındı';

  @override
  String get notifCallReconnecting => 'Yeniden bağlanıyor';

  @override
  String get notifCallMute => 'Sessize al';

  @override
  String get notifCallUnmute => 'Sesi aç';

  @override
  String get notifCallEnd => 'Aramayı bitir';

  @override
  String get notifFromYourWatch => 'Saatinizden';

  @override
  String get notifLiveOpen => 'Aç';

  @override
  String get notifLiveStop => 'Durdur';

  @override
  String get notifLiveReview => 'İncele';

  @override
  String get notifLiveAllow => 'İzin ver';

  @override
  String get notifLiveDeny => 'Reddet';

  @override
  String get notifLiveNeedsOk => 'Onayınız gerekiyor';

  @override
  String get notifLiveNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String get notifLiveWorking => 'Çalışıyor';

  @override
  String get notifLiveTakeOver => 'Devralmanızı istiyor';

  @override
  String get notifLiveFinished => 'Bitti';

  @override
  String get notifLiveProblem => 'Bir sorunla durdu';

  @override
  String get notifLiveBotWorking => 'Bir bot çalışıyor';

  @override
  String get notifLiveBotsAtWork => 'Çalışan botlar';

  @override
  String get notifLiveStepOne => '1 adım';

  @override
  String notifLiveSteps(int count) {
    return '$count adım';
  }

  @override
  String get notifAlarmTitle => 'Casama Alarmı';

  @override
  String get notifAlarmStop => 'Durdur';

  @override
  String get widgetIosNeedsYouDescription =>
      'Hangi botların sizi beklediğini görün ve basit olanları yanıtlayın.';

  @override
  String get widgetIosBotDescription =>
      'Botlarınızdan birinin ne yaptığını takip edin.';

  @override
  String get widgetIosAskDescription =>
      'Denenecek fikirlerle birlikte tek dokunuşla bir bota sorun veya sesli arama başlatın.';

  @override
  String get widgetIosRoutinesDescription =>
      'Sırada neyin çalışacağını görün ve bir rutini şimdi çalıştırın.';

  @override
  String get widgetIosTodayDescription =>
      'Gününüzü tek bir yerde görün: sizden ne beklendiği, sırada ne olduğu ve kredileriniz.';

  @override
  String get widgetIosBriefDescription =>
      'Botunuzun bu sabah size söylediklerini okuyun.';

  @override
  String get widgetIosLibraryDescription =>
      'Botlarınızın son zamanlarda yaptıklarını açın.';

  @override
  String get widgetIosTasksDescription =>
      'Sizden yanıt bekleyenler en üstte olacak şekilde panonun durumunu görün.';

  @override
  String get widgetIosCreditsDescription =>
      'Kredilerinizin ne kadarını kullandığınızı kontrol edin.';

  @override
  String get widgetIosInlineDescription =>
      'En önemli tek şeyi saatin üzerinde görün.';

  @override
  String get widgetIosCanvasDescription =>
      'Botlarınızın buraya koyduklarını gösterin: bir dize, geri sayım, seri, liste veya resim.';

  @override
  String get widgetMacNeedsYouDescription =>
      'Hangi botların sizi beklediğini görün.';

  @override
  String get widgetMacRoutinesDescription => 'Sırada neyin çalışacağını görün.';

  @override
  String get widgetAskCasama => 'Casama\'ya Sor';

  @override
  String get widgetControlAskDescription =>
      'Klavye açık olarak hızlı soru açın.';

  @override
  String get widgetTalkToBot => 'Bir botla konuş';

  @override
  String widgetTalkToName(String name) {
    return '$name ile konuş';
  }

  @override
  String get widgetControlTalkDescription =>
      'Seçtiğiniz botla sesli arama başlatın.';

  @override
  String get widgetRunRoutine => 'Bir rutin çalıştır';

  @override
  String get widgetControlRunDescription =>
      'Seçtiğiniz rutini Casama\'yı açmadan çalıştırın.';

  @override
  String widgetFallbackAskBot(String bot) {
    return '$bot botuna istediğinizi sorun';
  }

  @override
  String get widgetFallbackBrief => 'Sabah özeti';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot tamamladı: $title';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return '$time itibarıyla';
  }

  @override
  String get widgetFallbackNothingNext => 'Yaklaşan bir şey yok';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot devralmanızı istiyor';
  }

  @override
  String get widgetFallbackDay => 'gün';

  @override
  String get widgetFallbackDays => 'gün';

  @override
  String get widgetSampleVerse => 'Durun ve Tanrı olduğumu bilin.';

  @override
  String get widgetSampleVerseRef => 'Mez. 46:10';

  @override
  String get widgetSampleVerseShort =>
      'Durun ve Tanrı olduğumu bilin. · Mez. 46:10';

  @override
  String get widgetSampleVerseTiny => 'Durun ve bilin…';

  @override
  String get widgetSampleCanvasName => 'Günün dizesi';

  @override
  String get widgetSampleNeedFlights => 'Lizbon uçuşlarına bak';

  @override
  String get widgetSampleNeedDentist =>
      'Dişçi randevusu Cuma gününe alınsın mı?';

  @override
  String get widgetSampleBotText =>
      'Üç e-posta yanıt bekliyor ve Acme faturası iki gün gecikmiş.';

  @override
  String get widgetSampleStep => 'Gelen kutunuz okunuyor';

  @override
  String get widgetSampleRoutineInbox => 'Gelen kutusu taraması';

  @override
  String get widgetSampleRoutineBrief => 'Sabah özeti';

  @override
  String get widgetSampleRoutineWeekly => 'Haftalık rapor';

  @override
  String get widgetSampleWeekdays => 'Hafta içi';

  @override
  String get widgetSampleEveryDay => 'Her gün';

  @override
  String get widgetSampleFridays => 'Cuma günleri 16:00';

  @override
  String get widgetSampleBrief =>
      'Üç e-posta yanıt bekliyor ve Acme faturası iki gün gecikmiş. Saat 15:00\'ten itibaren yağmur var, bu yüzden 16:30\'daki alma işlemi için erken çıkın. İlk toplantınız saat 10:00\'da Dana ile.';

  @override
  String get widgetSamplePricing => '4. çeyrek fiyatlandırma sayfası';

  @override
  String get widgetSampleLogoIdeas => 'Logo fikirleri';

  @override
  String get widgetSampleTripPlan => 'Seyahat planı';

  @override
  String get widgetSampleLaunchPost => 'Lansman gönderisini tasarla';

  @override
  String get widgetSampleStarterInbox => 'Gelen kutumu özetle';

  @override
  String get widgetSampleStarterFriday => 'Cuma günümü planla';

  @override
  String get widgetSampleWorking => 'Çalışıyor · 2:14';

  @override
  String get widgetSampleCreditsLeft => 'US\$5,70 kaldı';

  @override
  String get widgetSampleSpentToday => 'Bugün US\$0,80';

  @override
  String get widgetSampleMorning =>
      'Günaydın. Bugün iki toplantınız var, ilki saat 10:00\'da tasarım ekibiyle. Saat 15:00\'ten sonra yağmur var, yanınıza kaban alın. Lizbon uçuşunuz Cuma günü için onaylandı.';

  @override
  String get widgetSampleLisbonPlan => 'Lizbon seyahat planı';

  @override
  String get widgetSampleAgo => 'Milo · 2 sa önce';

  @override
  String get widgetSampleLaunchEmail => 'Lansman e-postasını tasarla';

  @override
  String get widgetSampleInReviewBy => 'İncelemede · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo Lizbon için uçuş fiyatlarını aramak istiyor';

  @override
  String get widgetSampleUpNextAt => 'Sıradaki · 09:00';

  @override
  String get widgetSampleInMinutes => 'Ada · 18 dk içinde';

  @override
  String get widgetSampleDate => '18 Kasım Çarşamba';

  @override
  String get widgetSampleNeedsCount => 'Sizden yanıt bekliyor · 1';

  @override
  String get widgetSampleSearchFlights => 'Lizbon için uçuş fiyatlarını ara';

  @override
  String get widgetSampleAskAda => 'Ada\'ya sor';

  @override
  String get widgetSampleAskMilo => 'Milo\'ya sor';

  @override
  String get widgetSamplePlanDay => '☀️ Günümü planla';

  @override
  String get widgetSampleWhatsNew => '✉️ Gelen kutumda neler yeni?';

  @override
  String get widgetAndroidBotDescription =>
      'Bir botun şu anda ne yaptığını takip edin';

  @override
  String get widgetAndroidTodayDescription =>
      'Botlarınızla tüm gününüzü tek bir yerde tutun';

  @override
  String get widgetAndroidBriefDescription =>
      'Sabah özetinizi bir bakışta okuyun';

  @override
  String get widgetAndroidLibraryDescription =>
      'Botlarınızın son zamanlarda yaptıklarını açın';

  @override
  String get widgetAndroidTasksDescription =>
      'Görev panonuzun durumunu takip edin';

  @override
  String get widgetAndroidCreditsDescription =>
      'Ne kadar kullandığınızı kontrol edin';

  @override
  String get widgetAndroidCanvasDescription =>
      'Botlarınızın buraya koyduklarını, bir dizeden geri sayıma kadar gösterin';

  @override
  String get widgetConfigBotTitle => 'Bir bot seçin';

  @override
  String get widgetConfigRoutinesTitle => 'Rutinleri seçin';

  @override
  String get widgetConfigRoutinesHint =>
      'Elle başlattıklarınız için en fazla dört tane seçin';

  @override
  String get widgetConfigAutomatic => 'Otomatik';

  @override
  String get widgetConfigAutomaticHint =>
      'Botlarınız genelindeki sıradaki çalıştırmalar';

  @override
  String get widgetConfigDone => 'Bitti';

  @override
  String get widgetConfigSignedOutTitle => 'Henüz seçilecek bir şey yok';

  @override
  String get widgetConfigSignedOut =>
      'Casama\'yı açıp oturum açın, ardından buradan seçin.';

  @override
  String get widgetConfigCanvasTitle => 'Bir tuval seçin';

  @override
  String get widgetConfigCanvasAutomaticHint => 'Bir botun en son ayarladığı';

  @override
  String get widgetConfigCanvasNone =>
      'Henüz tuval yok. Bir bottan buraya bir şey koymasını isteyin.';

  @override
  String get iosUsageTracking =>
      'İzin verirseniz Casama, Facebook veya Instagram\'da bir Casama reklamı gördükten sonra uygulamayı yüklediğinizde, katıldığınızda veya abone olduğunuzda hangi reklamların işe yaradığını ölçebilmemiz için bunu Meta\'ya bildirir. Casama asla reklam göstermez ve sohbetlerinizi veya dosyalarınızı asla paylaşmaz.';

  @override
  String get iosUsageContacts =>
      'Botlarınız, yalnızca Cihaz bağlantıları bölümünde Kişiler\'i açtığınızda tanıdığınız kişilerin bilgilerine bakabilir.';

  @override
  String get iosUsagePhotoLibrary =>
      'Bir bota göndermek veya profiliniz için fotoğraf seçtiğinizde Casama fotoğraf kitaplığınızı açar.';

  @override
  String get iosUsageLocationAlways =>
      'Adlandırdığınız yerlere vardığınızda veya oradan ayrıldığınızda Casama kapalıyken bile botlarınıza haber verin. Yalnızca yer adı ve saat paylaşılır, rotanız asla paylaşılmaz.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Ev veya İş gibi adlandırdığınız yerleri kaydedin ve bir sonraki randevunuz için ne zaman yola çıkmanız gerektiğini botlarınızın size hatırlatmasını sağlayın. Yalnızca Cihaz bağlantıları bölümünde Yerler\'i açtığınızda kullanılır.';

  @override
  String get iosUsageCamera =>
      'Bir bota göndermek veya profiliniz için fotoğraf çektiğinizde Casama kamerayı kullanır.';

  @override
  String get iosUsageCalendars =>
      'Botlarınız programınızla ilgili soruları yanıtlayabilir ve etkinlik ekleyebilir; bunu yalnızca Cihaz bağlantıları bölümünde Takvim\'i açtığınızda yapar.';

  @override
  String get iosUsageSpeech =>
      'Casama\'nın dikte hizmetine ulaşılamadığında cihazınızın kendi konuşma tanıma özelliği söylediklerinizi metne dönüştürür.';

  @override
  String get iosUsageAlarmKit =>
      'Botlarınız yalnızca Cihaz bağlantıları bölümünde Alarmlar\'a izin verdiğinizde sessiz modda bile çalan alarmlar ve zamanlayıcılar kurabilir.';

  @override
  String get iosUsageHomeKit =>
      'Cihaz bağlantıları bölümünde Ev\'e izin verdiğinizde botlarınız HomeKit evinizin durumuna bakabilir ve onu kontrol edebilir; değişiklikler için her zaman önce onayınız istenir.';

  @override
  String get iosUsageMicrophone =>
      'Casama mikrofonu dikte ve botlarınızla canlı sesli aramalar için kullanır. Sesiniz, yalnızca siz kabul ettikten sonra, size yanıt vermek üzere yapay zeka sağlayıcılarına gider: sesli aramalar için Google Gemini\'ye, dikteyi metne dönüştürmek için OpenAI\'a.';

  @override
  String get iosUsageHealthUpdate =>
      'Casama yalnızca Apple Sağlık verilerini okur; oraya asla veri yazmaz.';

  @override
  String get iosUsageFaceId =>
      'Casama, uygulama kilidini açtığınızda uygulamanın kilidini açmak ve riskli eylemleri onaylamak için Face ID kullanır.';

  @override
  String get iosUsageHealthShare =>
      'Botlarınız yalnızca Cihaz bağlantıları bölümünde Apple Sağlık\'ı açtığınızda Apple Sağlık\'taki uyku, aktivite, antrenman ve kalp verilerinizin günlük özetlerini görebilir. Casama asla Apple Sağlık\'a veri yazmaz ve bunları asla reklamlar için kullanmaz.';

  @override
  String get iosUsageWatchMicrophone =>
      'Bir bota bir şey sorduğunuzda Casama sesinizi kaydeder ve Casama sunucunuza gönderir; burada bir yapay zeka sağlayıcısı (Casama Cloud\'da OpenAI) bunu botunuz için metne dönüştürür.';

  @override
  String get macUsageContacts =>
      'Botlarınız, yalnızca Cihaz bağlantıları bölümünde Kişiler\'i açtığınızda tanıdığınız kişilerin bilgilerine bakabilir.';

  @override
  String get macUsageSpeech =>
      'Casama\'nın dikte hizmetine ulaşılamadığında cihazınızın kendi konuşma tanıma özelliği söylediklerinizi metne dönüştürür.';

  @override
  String get macUsageMicrophone =>
      'Casama mikrofonu dikte ve botlarınızla canlı sesli aramalar için kullanır. Sesiniz, yalnızca siz kabul ettikten sonra, size yanıt vermek üzere yapay zeka sağlayıcılarına gider: sesli aramalar için Google Gemini\'ye, dikteyi metne dönüştürmek için OpenAI\'a.';

  @override
  String get macUsageAppleEvents =>
      'Hızlı sor, öndeki pencerenin başlığını ve tarayıcınızın geçerli sekmesini yalnızca klavye kestirmesine bastığınızda okur.';

  @override
  String get nativeNameFileProvider => 'Casama Bilgisayarları';

  @override
  String get nativeNameNotifications => 'Casama Bildirimleri';

  @override
  String get nativeNameSafari => 'Safari için Casama';

  @override
  String get nativeNameAskCasama => 'Casama\'ya Sor';

  @override
  String get nativeComputer => 'Bilgisayar';

  @override
  String get nativeSafariSignInIos =>
      'Bu cihazda Casama\'yı açın -> Ayarlar -> Başka Bir Cihazda Oturum Aç bölümüne gidin veya aşağıya bir oturum açma bağlantısı yapıştırın.';

  @override
  String get nativeSafariSignInMac =>
      'Bu Mac\'te Casama\'yı açın -> Ayarlar -> Başka Bir Cihazda Oturum Aç bölümüne gidin veya aşağıya bir oturum açma bağlantısı yapıştırın.';

  @override
  String get linuxDesktopComment =>
      'Sahip olduğunuz her ekranda işi yapan botlar';

  @override
  String get linuxDesktopKeywords => 'yapay zeka;asistan;aracı;bot;sohbet;';

  @override
  String macMenuAbout(String appName) {
    return '$appName Hakkında';
  }

  @override
  String get macMenuPreferences => 'Tercihler…';

  @override
  String get macMenuServices => 'Servisler';

  @override
  String macMenuHide(String appName) {
    return '$appName Uygulamasını Gizle';
  }

  @override
  String get macMenuHideOthers => 'Diğerlerini Gizle';

  @override
  String get macMenuShowAll => 'Tümünü Göster';

  @override
  String macMenuQuit(String appName) {
    return '$appName Uygulamasından Çık';
  }

  @override
  String get macMenuEdit => 'Düzen';

  @override
  String get macMenuUndo => 'Geri Al';

  @override
  String get macMenuRedo => 'Yinele';

  @override
  String get macMenuCut => 'Kes';

  @override
  String get macMenuCopy => 'Kopyala';

  @override
  String get macMenuPaste => 'Yapıştır';

  @override
  String get macMenuPasteAndMatchStyle => 'Yapıştır ve Stili Eşleştir';

  @override
  String get macMenuDelete => 'Sil';

  @override
  String get macMenuSelectAll => 'Tümünü Seç';

  @override
  String get macMenuFind => 'Bul';

  @override
  String get macMenuFindEllipsis => 'Bul…';

  @override
  String get macMenuFindAndReplace => 'Bul ve Değiştir…';

  @override
  String get macMenuFindNext => 'Sonrakini Bul';

  @override
  String get macMenuFindPrevious => 'Öncekini Bul';

  @override
  String get macMenuUseSelectionForFind => 'Bul İçin Seçimi Kullan';

  @override
  String get macMenuJumpToSelection => 'Seçime Git';

  @override
  String get macMenuSpellingAndGrammar => 'Yazım ve Dilbilgisi Denetimi';

  @override
  String get macMenuSpelling => 'Yazım Denetimi';

  @override
  String get macMenuShowSpelling => 'Yazım ve Dilbilgisi Denetimini Göster';

  @override
  String get macMenuCheckDocumentNow => 'Belgeyi Şimdi Denetle';

  @override
  String get macMenuCheckSpellingWhileTyping => 'Yazarken Yazım Denetimi Yap';

  @override
  String get macMenuCheckGrammar => 'Yazım ve Dilbilgisi Denetimi Yap';

  @override
  String get macMenuCorrectSpelling => 'Yazım Hatalarını Otomatik Düzelt';

  @override
  String get macMenuSubstitutions => 'Değişimler';

  @override
  String get macMenuShowSubstitutions => 'Değişimleri Göster';

  @override
  String get macMenuSmartCopyPaste => 'Akıllı Kopyala/Yapıştır';

  @override
  String get macMenuSmartQuotes => 'Akıllı Tırnaklar';

  @override
  String get macMenuSmartDashes => 'Akıllı Tireler';

  @override
  String get macMenuSmartLinks => 'Akıllı Bağlantılar';

  @override
  String get macMenuDataDetectors => 'Veri Algılayıcıları';

  @override
  String get macMenuTextReplacement => 'Metin Değişimi';

  @override
  String get macMenuTransformations => 'Dönüşümler';

  @override
  String get macMenuMakeUpperCase => 'Büyük Harf Yap';

  @override
  String get macMenuMakeLowerCase => 'Küçük Harf Yap';

  @override
  String get macMenuCapitalize => 'Baş Harfleri Büyük Yap';

  @override
  String get macMenuSpeech => 'Konuşma';

  @override
  String get macMenuStartSpeaking => 'Konuşmayı Başlat';

  @override
  String get macMenuStopSpeaking => 'Konuşmayı Durdur';

  @override
  String get macMenuView => 'Görüntü';

  @override
  String get macMenuEnterFullScreen => 'Tam Ekrana Geç';

  @override
  String get macMenuWindow => 'Pencere';

  @override
  String get macMenuMinimize => 'Simge Durumuna Küçült';

  @override
  String get macMenuZoom => 'Büyüt/Küçült';

  @override
  String get macMenuBringAllToFront => 'Tümünü Öne Getir';

  @override
  String get macMenuHelp => 'Yardım';

  @override
  String get macMenuCheckForUpdates => 'Güncellemeleri Denetle…';

  @override
  String get macMenuSettings => 'Ayarlar…';

  @override
  String get macMenuFile => 'Dosya';

  @override
  String get macMenuNewChat => 'Yeni Sohbet';

  @override
  String get macMenuNewBot => 'Yeni Bot…';

  @override
  String get macMenuQuickAsk => 'Hızlı Sor';

  @override
  String get macMenuSearch => 'Ara…';

  @override
  String get macMenuCloseWindow => 'Pencereyi Kapat';

  @override
  String get macMenuGo => 'Git';

  @override
  String get macMenuBots => 'Botlar';

  @override
  String get macMenuInbox => 'Gelen Kutusu';

  @override
  String get macMenuBoard => 'Pano';

  @override
  String get macMenuComputer => 'Bilgisayar';

  @override
  String get macMenuPages => 'Sayfalar';

  @override
  String get macMenuCasamaHelp => 'Casama Yardım';

  @override
  String get macMenuSendFeedback => 'Geri Bildirim Gönder…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Rutin';

  @override
  String get siriRoutines => 'Rutinler';

  @override
  String get siriCanvas => 'Tuval';

  @override
  String get siriAutomatic => 'Otomatik';

  @override
  String get siriAutomaticSubtitle => 'Bir botun en son ayarladığı';

  @override
  String get siriChooseCanvas => 'Tuval seç';

  @override
  String get siriChooseCanvasDescription =>
      'Bir botun en son ayarladığını veya tek bir tuvali gösterin.';

  @override
  String get siriChooseBot => 'Bot seç';

  @override
  String get siriChooseBotDescription =>
      'Bu araç takımının göstereceği botu seçin.';

  @override
  String get siriChooseRoutines => 'Rutin seç';

  @override
  String get siriChooseRoutinesDescription =>
      'Sıradaki çalıştırmaları veya seçtiğiniz en fazla dört rutini gösterin.';

  @override
  String get siriOpenCasama => 'Casama\'yı aç';

  @override
  String get siriWhere => 'Neresi';

  @override
  String get siriTalkToBot => 'Bir botla konuş';

  @override
  String get siriTalkToBotDescription =>
      'Seçtiğiniz botla sesli arama başlatır.';

  @override
  String get siriRunRoutine => 'Bir rutin çalıştır';

  @override
  String get siriRunRoutineControlDescription =>
      'Seçtiğiniz rutini Casama\'yı açmadan çalıştırır.';

  @override
  String get siriCallAction => 'Arama eylemi';

  @override
  String get siriAction => 'Eylem';

  @override
  String get siriStopBot => 'Botu durdur';

  @override
  String get siriRun => 'Çalıştırma';

  @override
  String get siriAnswerRequest => 'Bir botun isteğini yanıtla';

  @override
  String get siriRequest => 'İstek';

  @override
  String get siriAllow => 'İzin ver';

  @override
  String get siriFromWidget => 'Bir araç takımından';

  @override
  String get siriRunRoutineNow => 'Şimdi bir rutin çalıştır';

  @override
  String get siriAcceptSuggestion => 'Bir botun önerdiğini yap';

  @override
  String get siriSuggestion => 'Öneri';

  @override
  String get siriBotStatusDescription => 'Bir botun durumu ve ne yaptığı';

  @override
  String get siriNextRoutineDescription =>
      'Sıradaki rutin ve ne zaman çalışacağı';

  @override
  String get siriAskCasama => 'Casama\'ya Sor';

  @override
  String get siriAskVoiceDescription => 'Bir bota sesle bir şey sorun';

  @override
  String get siriWhatWaiting => 'Onayınızı bekleyenler';

  @override
  String get siriAsk => 'Sor';

  @override
  String get siriShortNeedsYou => 'Sizden yanıt bekliyor';

  @override
  String get siriOpeningToFinish => 'Tamamlamak için Casama açılıyor.';

  @override
  String get siriName => 'Ad';

  @override
  String get siriTitle => 'Başlık';

  @override
  String get siriChat => 'Sohbet';

  @override
  String get siriBotSubtitle =>
      'Casama\'da sohbet ettiğiniz yapay zeka asistanı bir bot';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Casama\'da $bot botunun çalıştırdığı bir rutin';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Casama\'da $bot ile bir sohbet';
  }

  @override
  String get siriBotInCasama => 'Casama\'daki bot';

  @override
  String siriRoutineDot(String bot) {
    return 'Rutin · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return '$bot ile sohbet';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'rutin';

  @override
  String get siriKeywordChat => 'sohbet';

  @override
  String get siriAskBot => 'Bir bota sor';

  @override
  String get siriAskBotDescription =>
      'Yeni bir sohbette Casama botlarınızdan (yapay zeka asistanlarından) birine soru gönderir ve yanıtı sesli okur. Bot adı verilmezse en son konuştuğunuz bot yanıtlar.';

  @override
  String get siriCategoryBots => 'Botlar';

  @override
  String get siriAskBotParamDescription =>
      'Hangi bota sorulacağı. En son konuştuğunuz bot için boş bırakın.';

  @override
  String get siriQuestion => 'Soru';

  @override
  String get siriQuestionDescription =>
      'Kendi sözlerinizle bota sorulacak soru.';

  @override
  String get siriWhatShouldIAsk => 'Ne sormalıyım?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return '$bot botuna $question sor';
  }

  @override
  String get siriRestOnScreen => 'Geri kalanı ekranda.';

  @override
  String get siriRestOnScreenEllipsis => '… Geri kalanı ekranda.';

  @override
  String get siriRunRoutineDescription =>
      'Casama botlarınızın rutinlerinden birini şimdi çalıştırır. Sonuç, rutin kendiliğinden çalıştığında olduğu gibi uygulamaya ve bildirim olarak gelir.';

  @override
  String get siriRoutineParamDescription =>
      'Şimdi hangi rutinin çalıştırılacağı.';

  @override
  String siriSummaryRun(String routine) {
    return '$routine rutinini çalıştır';
  }

  @override
  String get siriWhatNeedsMe => 'Benden yanıt bekleyen ne var';

  @override
  String get siriWhatNeedsMeDescription =>
      'Casama\'da sizden yanıt bekleyen kaç şey olduğunu söyler: bir botun onay isteği, bir devralma veya bir öneri. Bunları uygulamada yanıtlayın.';

  @override
  String get siriOpenBot => 'Bir botu aç';

  @override
  String get siriOpenBotDescription =>
      'Casama botlarınızdan biriyle sohbetinizi açar.';

  @override
  String get siriOpenBotPersonDescription =>
      'Bir Casama botunun sohbetini açar.';

  @override
  String get siriOpenChat => 'Bir sohbeti aç';

  @override
  String get siriOpenChatDescription =>
      'Bir Casama botuyla sohbetlerinizden birini açar.';

  @override
  String get siriOpenRoutine => 'Bir rutinin botunu aç';

  @override
  String get siriOpenRoutineDescription =>
      'Casama rutinlerinizden birini çalıştıran botu açar.';

  @override
  String get siriTalkDescription =>
      'Casama botlarınızdan biriyle ses modunu açar. Eylem düğmesinde kullanılabilir.';

  @override
  String get siriAskGetReply => 'Bir bota sor ve yanıtı al';

  @override
  String get siriAskGetReplyDescription =>
      'Bir Casama botuna soru gönderir ve Kestirmeler\'de zincirlemek üzere yanıt metnini döndürür.';

  @override
  String get siriGetLastReply => 'Son yanıtı al';

  @override
  String get siriGetLastReplyDescription =>
      'Bir Casama bot sohbetinden gelen en son yanıt metnini döndürür.';

  @override
  String get siriStartComputer => 'Bir bilgisayarı başlat';

  @override
  String get siriStartComputerDescription =>
      'Onayın ardından bir Casama bilgisayarını uyandırır.';

  @override
  String get siriComputerName => 'Bilgisayar adı';

  @override
  String get siriYourComputer => 'Casama bilgisayarınız';

  @override
  String siriStartConfirm(String computer) {
    return '$computer başlatılsın mı?';
  }

  @override
  String get siriOpenToStartComputer =>
      'Bilgisayarınızı başlatmak için Casama\'yı açın.';

  @override
  String get siriFocusTitle => 'Casama Odak Filtresini Ayarla';

  @override
  String get siriFocusDescription =>
      'Bu Odak etkinken yalnızca seçilen botları gösterin ve isteğe bağlı olarak proaktif bilgilendirmeleri bekletin.';

  @override
  String get siriFocusBots => 'Gösterilecek botlar';

  @override
  String get siriFocusHold => 'Proaktif bilgilendirmeleri beklet';

  @override
  String get siriFocusShowOne => '1 botu göster';

  @override
  String siriFocusShowMany(int count) {
    return '$count botu göster';
  }

  @override
  String get siriFocusHoldCheckIns => 'Bilgilendirmeleri beklet';

  @override
  String get siriFocusAllowCheckIns => 'Bilgilendirmelere izin ver';

  @override
  String get siriFocusAllBots => 'Tüm botlar';

  @override
  String get siriFocusAllVisible => 'Tüm botlar görünür';

  @override
  String get siriToolAsk => 'Bir Casama botuna sor';

  @override
  String get siriToolAskDescription =>
      'Kişinin Casama botlarından birine bir soru sor ve yanıtını döndür.';

  @override
  String get siriCategoryAssistants => 'Asistanlar';

  @override
  String get siriToolBotDescription => 'Sorulacak Casama botu.';

  @override
  String get siriToolQuestionDescription => 'Bota sorulacak şey.';

  @override
  String get siriToolRun => 'Bir Casama rutinini çalıştır';

  @override
  String get siriToolRunDescription =>
      'Kişiyle onayladıktan sonra kayıtlı bir Casama rutinini çalıştır.';

  @override
  String get siriCategoryAutomation => 'Otomasyon';

  @override
  String get siriToolRoutineDescription => 'Çalıştırılacak rutin.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return '$bot ile $routine çalıştırılsın mı?';
  }

  @override
  String get siriToolNeeds => 'Casama\'da benden yanıt bekleyen ne var';

  @override
  String get siriToolNeedsDescription =>
      'Casama\'da kaç onay, devralma veya öneri beklediğini kontrol et.';

  @override
  String get siriOpenToCheck =>
      'Sizden ne beklendiğini görmek için Casama\'yı açın.';

  @override
  String get siriToolStop => 'Bir Casama botunu durdur';

  @override
  String get siriToolStopDescription =>
      'Casama\'da şu anda bir görev çalıştıran botu durdur.';

  @override
  String get siriToolStopBotDescription => 'Durdurulacak bot.';

  @override
  String siriStoppedBot(String bot) {
    return '$bot durduruldu.';
  }

  @override
  String get siriToolCall => 'Bir Casama botunu ara';

  @override
  String get siriToolCallDescription =>
      'Casama\'yı aç ve seçilen botla canlı bir sesli arama başlat.';

  @override
  String get siriCategoryCommunication => 'İletişim';

  @override
  String get siriToolCallBotDescription => 'Aranacak bot.';

  @override
  String siriCalling(String bot) {
    return '$bot aranıyor.';
  }

  @override
  String siriBotIn(String app) {
    return '$app içinde bir bot';
  }

  @override
  String get siriMe => 'Ben';

  @override
  String get siriABot => 'bir bot';

  @override
  String get siriFavorited => 'Favorilere eklendi';

  @override
  String siriSentTo(String bot) {
    return '$bot botuna gönderildi';
  }

  @override
  String get siriMessage => 'Mesaj';

  @override
  String get siriNone => 'Hiçbiri';

  @override
  String get siriErrorOneBot =>
      'Casama tek seferde bir bota gönderir. Hangi bot?';

  @override
  String get siriErrorTextOnly =>
      'Siri bir bota yalnızca sözcükler gönderebilir. Dosya, resim ve yerleri Casama\'da ekleyin.';

  @override
  String get siriErrorNoBot => 'Casama\'da o botu bulamadım.';

  @override
  String get siriWhatShouldISend => 'Ne göndermeliyim?';

  @override
  String get siriAskCasamaBot => 'Casama Botuna Sor';

  @override
  String siriAskName(String bot) {
    return '$bot botuna sor';
  }

  @override
  String get siriAskAboutThis => 'Bunun hakkında Casama\'ya sor';

  @override
  String siriPhraseAsk(String app) {
    return '$app uygulamasına sor';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return '$app uygulamasındaki bir bota sor';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return '$app uygulamasında $bot botuna sor';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return '$app uygulamasındaki bir botla konuş';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return '$app uygulamasında $bot ile konuş';
  }

  @override
  String siriPhraseRunIn(String app) {
    return '$app uygulamasında bir rutin çalıştır';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return '$app uygulamasında $routine rutinini çalıştır';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return '$app uygulamasında benden yanıt bekleyen ne var';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return '$app uygulamasında bekleyen ne var';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return '$app uygulamasına bir şey sor';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return '$app uygulamasında $routine rutinimi çalıştır';
  }

  @override
  String get siriABotSubject => 'Bir bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot onayınızı bekliyor.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot devralmanızı istiyor.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot bir öneride bulundu.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot sizden yanıt bekliyor.';
  }

  @override
  String get siriOneThingNeedsYou => 'Bir şey sizden yanıt bekliyor.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count şey sizden yanıt bekliyor.';
  }

  @override
  String get siriUnlockPhone =>
      'Telefonunuzun kilidini açın ve tekrar deneyin.';

  @override
  String get siriGeminiOff =>
      'Bu telefonda Casama için Gemini kapalı (Casama → Ayarlar → Gizlilik).';

  @override
  String get suggestionActionTurnOn => 'Aç';

  @override
  String suggestionActionRemindMe(String date) {
    return 'Hatırlat: $date';
  }

  @override
  String get suggestionActionPickTime => 'Zaman seç';

  @override
  String get suggestionActionPutAwayAll => 'Tümünü kenara al';

  @override
  String suggestionActionPutAwayAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tüm $count fikri kenara al',
      one: '1 fikri kenara al',
    );
    return '$_temp0';
  }

  @override
  String get suggestionActionOpen => 'Aç';

  @override
  String get suggestionActionGotIt => 'Anladım';

  @override
  String get suggestionActionLater => 'Daha sonra';

  @override
  String get suggestionActionSomethingElse => 'Başka bir şey';

  @override
  String get suggestionTurnedOn => 'Açıldı';

  @override
  String suggestionReminderSet(String date) {
    return 'Hatırlatıcı ayarlandı: $date';
  }

  @override
  String get suggestionSnoozed => 'Daha sonra için kaydedildi';

  @override
  String get suggestionSnoozedExpired => 'Kenara alındı – iki kez ertelendi';

  @override
  String suggestionPutAwayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fikir kenara alındı',
      one: '1 fikir kenara alındı',
    );
    return '$_temp0';
  }

  @override
  String get suggestionUndo => 'Geri Al';

  @override
  String get suggestionLaterTomorrow => 'Yarın sabah';

  @override
  String get suggestionLaterEvening => 'Bu akşam';

  @override
  String get suggestionLaterNextWeek => 'Gelecek hafta';

  @override
  String suggestionMoreWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fikir daha bekliyor',
      one: '1 fikir daha bekliyor',
    );
    return '$_temp0';
  }

  @override
  String botIdeasGrouped(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count fikir',
      one: '$name · 1 fikir',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutine(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · bugün $count rutin sonucu',
      one: '$name · bugün 1 rutin sonucu',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNotice(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · bugün $count güncelleme',
      one: '$name · bugün 1 güncelleme',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutinePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bugün $count rutin sonucu',
      one: 'Bugün 1 rutin sonucu',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNoticePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bugün $count güncelleme',
      one: 'Bugün 1 güncelleme',
    );
    return '$_temp0';
  }

  @override
  String briefSinceYesterday(String summary) {
    return 'Dünden beri: $summary';
  }

  @override
  String briefSincePages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sayfa',
      one: '1 sayfa',
    );
    return '$_temp0';
  }

  @override
  String briefSinceRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rutin sonucu',
      one: '1 rutin sonucu',
    );
    return '$_temp0';
  }

  @override
  String briefSinceUpdates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count güncelleme',
      one: '1 güncelleme',
    );
    return '$_temp0';
  }

  @override
  String get notifTurnOn => 'Aç';

  @override
  String get notifOpen => 'Aç';

  @override
  String get notifGotIt => 'Anladım';

  @override
  String get notifRemindMe => 'Bana hatırlat';

  @override
  String get notifLater => 'Daha sonra';

  @override
  String get watchTurnOn => 'Aç';

  @override
  String get watchGotIt => 'Anladım';

  @override
  String get watchRemindMe => 'Hatırlat';

  @override
  String get watchLater => 'Daha sonra';

  @override
  String get watchOpen => 'Aç';

  @override
  String get costModeLabel => 'Maliyet görünümü';

  @override
  String get costModePaid => 'Ödenen';

  @override
  String get costModeEstimated => 'Tahmini';

  @override
  String get costPaid => 'Ödenen';

  @override
  String get costEstimatedTitle => 'Tahmini';

  @override
  String get costMarginListPrices => 'Liste fiyatlarıyla marj';

  @override
  String get costFreePlan => 'Ücretsiz plan';

  @override
  String costFreePlanCalls(String count) {
    return 'Ücretsiz plan · $count çağrı';
  }

  @override
  String costCapUsage(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String get costShareOfOwnServers => 'Kendi sunucuların payı';

  @override
  String costIncludedCredit(String amount) {
    return 'aylık $amount dahil';
  }

  @override
  String costAtListPrices(String amount) {
    return 'liste fiyatıyla $amount';
  }

  @override
  String costEmptyPaidDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Bu $days günde hiçbir şey ödenmedi',
      one: 'Bu günde hiçbir şey ödenmedi',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyPaidRange => 'Bu günlerde hiçbir şey ödenmedi';

  @override
  String get costEmptyPaidFiltered => 'Bu filtrelere uyan bir ödeme yok';

  @override
  String costSpokenPaid(String amount) {
    return 'ödenen $amount';
  }

  @override
  String costSpokenEstimated(String amount) {
    return 'tahmini $amount';
  }

  @override
  String costSpendCardPaidSemantics(
    String paid,
    String charged,
    String margin,
  ) {
    return 'Son 30 gün harcama: $paid ödenen, $charged tahsil edilen, $margin liste fiyatlarıyla marj';
  }

  @override
  String get vendorBillingFree => 'Ücretsiz plan';

  @override
  String get vendorBillingMetered => 'Kullanım bazlı';

  @override
  String get vendorBillingFreeHelp =>
      'Kullanım limitte durur ve 0 \$ ödenmiş sayılır.';

  @override
  String get vendorBillingMeteredHelp =>
      'Kullanım kaydedilen maliyet üzerinden ödenir.';

  @override
  String get vendorIncludedUsd => 'Aylık dahil kredi (USD)';

  @override
  String get vendorIncludedUsdHelp =>
      'Her takvim ayında bu tutara kadar kullanım 0 \$ ödenmiş sayılır.';
}
