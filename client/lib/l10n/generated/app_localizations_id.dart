// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

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
  String get tabTitleCall => 'Panggilan';

  @override
  String get tabTitleProject => 'Proyek';

  @override
  String get tabTitleGroupChat => 'Chat grup';

  @override
  String get loading => 'Memuat…';

  @override
  String get retry => 'Coba lagi';

  @override
  String get keepGoing => 'Lanjutkan';

  @override
  String get keepGoingMessage => 'Lanjutkan dari bagian terakhir tadi.';

  @override
  String get startOver => 'Mulai ulang';

  @override
  String get continueRunHint =>
      'Lanjut dari bagian terakhir dengan anggaran baru, tanpa mengulang permintaan dari awal.';

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Simpan';

  @override
  String get delete => 'Hapus';

  @override
  String get edit => 'Edit';

  @override
  String get close => 'Tutup';

  @override
  String get create => 'Buat';

  @override
  String get continueLabel => 'Lanjutkan';

  @override
  String get somethingWentWrong => 'Terjadi kesalahan';

  @override
  String get errorViewHint =>
      'Memulai ulang aplikasi biasanya akan memperbaikinya.';

  @override
  String get signInTitle => 'Masuk ke Casama';

  @override
  String get signUpTitle => 'Buat akunmu';

  @override
  String get email => 'Email';

  @override
  String get password => 'Kata sandi';

  @override
  String get signIn => 'Masuk';

  @override
  String get signUp => 'Buat akun';

  @override
  String get haveAccount => 'Sudah punya akun? Masuk';

  @override
  String get needAccount => 'Baru di sini? Buat akun';

  @override
  String get magicLink => 'Kirimi saya tautan masuk lewat email';

  @override
  String get magicLinkSent => 'Cek emailmu untuk tautan masuk.';

  @override
  String get continueWithGoogle => 'Lanjutkan dengan Google';

  @override
  String get continueWithApple => 'Lanjutkan dengan Apple';

  @override
  String get continueWithEmail => 'Lanjutkan dengan email';

  @override
  String get moreSignInOptions => 'Opsi lainnya';

  @override
  String get usePasswordInstead => 'Pakai kata sandi saja';

  @override
  String get checkInboxTitle => 'Cek kotak masukmu';

  @override
  String checkInboxBody(String email) {
    return 'Kami mengirim tautan masuk dan kode 6 digit ke $email. Ketuk tautan, atau ketik kodenya di sini.';
  }

  @override
  String get emailCodeLabel => 'Kode 6 digit';

  @override
  String get resendLink => 'Kirim ulang';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Kirim ulang dalam $secondsString dtk';
  }

  @override
  String get useDifferentEmail => 'Pakai email lain';

  @override
  String get authWrongPassword =>
      'Email dan kata sandi itu tidak cocok. Coba lagi, atau masuk pakai tautan email.';

  @override
  String get authEmailNotConfirmed =>
      'Konfirmasi emailmu dulu: buka tautan yang kami kirim.';

  @override
  String get authCodeInvalid =>
      'Kode itu salah atau sudah kedaluwarsa. Cek email terbaru, atau kirim kode baru.';

  @override
  String get authTooManyTries =>
      'Terlalu banyak percobaan. Tunggu sebentar lalu coba lagi.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds detik',
      one: '1 detik',
    );
    return 'Terlalu banyak permintaan sekaligus. Coba lagi dalam $_temp0.';
  }

  @override
  String get tooManyRequestsReady => 'Kamu bisa coba lagi sekarang.';

  @override
  String computerInUseBy(String name) {
    return '$name sedang memakai komputer ini';
  }

  @override
  String get authAccountExists =>
      'Sudah ada akun dengan email ini. Silakan masuk saja.';

  @override
  String get authSignupDisabled =>
      'Server ini sedang tidak menerima pendaftaran baru.';

  @override
  String get useMagicLinkInstead => 'Kirimi saya tautan lewat email saja';

  @override
  String get invalidEmail => 'Masukkan alamat email yang valid';

  @override
  String get passwordTooShort => 'Gunakan minimal 6 karakter';

  @override
  String get signOut => 'Keluar';

  @override
  String get onboardingTitle => 'Siapkan ruang kerjamu';

  @override
  String get createWorkspace => 'Buat ruang kerja';

  @override
  String get workspaceName => 'Nama ruang kerja';

  @override
  String get joinWorkspace => 'Bergabung dengan kode undangan';

  @override
  String get inviteCode => 'Kode undangan';

  @override
  String get join => 'Gabung';

  @override
  String get addModelKeyTitle => 'Tambah kunci model';

  @override
  String get addModelKeyBody =>
      'Bot memakai kunci penyedia modelmu sendiri. Kunci ini disimpan terenkripsi dan tidak akan ditampilkan lagi.';

  @override
  String get provider => 'Penyedia';

  @override
  String get label => 'Label';

  @override
  String get apiKey => 'Kunci API';

  @override
  String get baseUrl => 'URL dasar';

  @override
  String get testKey => 'Uji kunci';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'Kunci berfungsi ($model, $msString mdt)';
  }

  @override
  String keyFailed(String error) {
    return 'Uji kunci gagal: $error';
  }

  @override
  String get createFirstBot => 'Buat bot pertamamu';

  @override
  String get botName => 'Nama bot';

  @override
  String get model => 'Model';

  @override
  String get persona => 'Instruksi';

  @override
  String get personaHint =>
      'Apa yang dilakukan bot ini dan cara kerjanya. Persona akan mengisinya; kamu bebas mengeditnya.';

  @override
  String get modelKey => 'Kunci model';

  @override
  String get navComputer => 'Komputer';

  @override
  String get navChats => 'Chat';

  @override
  String get navTasks => 'Tugas';

  @override
  String get settingsConnectionsSection => 'Koneksi';

  @override
  String get advanced => 'Lanjutan';

  @override
  String get settingsAdvancedSummary => 'Rahasia, komputer, perangkat';

  @override
  String get bots => 'Bot';

  @override
  String get newBot => 'Bot baru';

  @override
  String get noBots => 'Belum ada bot';

  @override
  String get botStatusIdle => 'Diam';

  @override
  String get botStatusWorking => 'Bekerja';

  @override
  String get botStatusWaiting => 'Menunggumu';

  @override
  String sidebarMoreWorking(int count) {
    return '$count lainnya sedang bekerja';
  }

  @override
  String get botStatusDisabled => 'Dinonaktifkan';

  @override
  String costToday(String cost) {
    return '$cost hari ini';
  }

  @override
  String get newChat => 'Chat baru';

  @override
  String get conversations => 'Percakapan';

  @override
  String messageHint(String bot) {
    return 'Kirim pesan ke $bot';
  }

  @override
  String messageHintWithApps(String bot) {
    return 'Kirim pesan ke $bot · @ untuk menyebut aplikasi';
  }

  @override
  String get mentionSectionBots => 'Bot';

  @override
  String get mentionSectionApps => 'Aplikasi';

  @override
  String get mentionSectionAddToBot => 'Tambahkan ke bot ini';

  @override
  String get mentionSectionConnect => 'Hubungkan';

  @override
  String get mentionSectionStartGroup => 'Mulai chat grup';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'Aplikasi';

  @override
  String get mentionAddAction => 'Tambah';

  @override
  String get mentionConnectAction => 'Hubungkan';

  @override
  String get mentionMaxApps =>
      'Kamu bisa menyebut hingga 3 aplikasi per pesan.';

  @override
  String get mentionRemovedApp => 'Aplikasi dihapus';

  @override
  String get send => 'Kirim';

  @override
  String get stop => 'Hentikan';

  @override
  String get thinking => 'Berpikir…';

  @override
  String get checkingItsWork => 'Memeriksa hasilnya…';

  @override
  String get mapFullScreen => 'Layar penuh';

  @override
  String get mapTitle => 'Peta';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Dihentikan.';

  @override
  String emptyChat(String bot) {
    return 'Sapa $bot.';
  }

  @override
  String get toolRunning => 'Berjalan';

  @override
  String get toolFailedLabel => 'Gagal';

  @override
  String get toolOutput => 'Keluaran';

  @override
  String get remembered => 'Mengingat sesuatu';

  @override
  String skillLoaded(String name) {
    return 'Memuat keahlian $name';
  }

  @override
  String checkpointSaved(String label) {
    return 'Titik pemulihan disimpan: $label';
  }

  @override
  String computerState(String state) {
    return 'Komputer $state';
  }

  @override
  String get activity => 'Aktivitas';

  @override
  String get timelineTitle => 'Linimasa eksekusi';

  @override
  String get allEvents => 'Semua';

  @override
  String get filterTools => 'Alat';

  @override
  String get filterMessages => 'Pesan';

  @override
  String get filterSystem => 'Sistem';

  @override
  String get restore => 'Pulihkan';

  @override
  String get restoreConfirm =>
      'Kembali ke titik pemulihan ini? File yang berubah sejak saat itu akan diganti.';

  @override
  String get restored => 'Titik pemulihan dipulihkan.';

  @override
  String get noRuns => 'Belum ada eksekusi.';

  @override
  String get computerTitle => 'Komputer';

  @override
  String get computerStart => 'Nyalakan';

  @override
  String get computerSleep => 'Tidurkan';

  @override
  String get screen => 'Layar';

  @override
  String get terminal => 'Terminal';

  @override
  String get files => 'File';

  @override
  String get noScreen =>
      'Belum ada apa pun di layar. Halaman browser bot akan muncul di sini.';

  @override
  String get refresh => 'Muat ulang';

  @override
  String get upload => 'Unggah';

  @override
  String get download => 'Unduh';

  @override
  String get emptyFolder => 'Folder ini kosong';

  @override
  String get noCheckpoints =>
      'Titik simpan dibuat otomatis sebelum perubahan berisiko, agar kamu bisa membatalkannya.';

  @override
  String get computerAsleep =>
      'Komputer sedang tidur. Filenya aman dan akan bangun saat diperlukan.';

  @override
  String get connectTerminal => 'Hubungkan';

  @override
  String get terminalDisconnected => 'Terputus.';

  @override
  String get terminalReconnecting =>
      'Server dimulai ulang, menghubungkan kembali…';

  @override
  String get memory => 'Memori';

  @override
  String get noMemories => 'Belum ada yang diingat.';

  @override
  String get noMemoriesMatch => 'Tidak ada memori yang cocok.';

  @override
  String get clearSearch => 'Bersihkan';

  @override
  String get addMemory => 'Tambah memori';

  @override
  String get addMemoryHelp =>
      'Sesuatu yang harus selalu diketahui bot tentang kamu atau pekerjaanmu.';

  @override
  String get addMemoryFactHint =>
      'Misalnya: Tahun fiskal kami dimulai bulan April.';

  @override
  String get addMemoryPreferenceHint =>
      'Misalnya: Buat ringkasan maksimal lima poin.';

  @override
  String get memoryAdded => 'Memori ditambahkan';

  @override
  String get pin => 'Sematkan';

  @override
  String get unpin => 'Lepas sematan';

  @override
  String get deleteMemoryConfirm =>
      'Lupakan ini? Tindakan ini tidak bisa dibatalkan.';

  @override
  String get skills => 'Keahlian';

  @override
  String get noSkills =>
      'Belum ada keahlian. Keahlian adalah instruksi yang dimuat bot saat relevan.';

  @override
  String get newSkill => 'Keahlian baru';

  @override
  String get skillName => 'Nama (huruf kecil, tanda hubung)';

  @override
  String get skillDescription => 'Deskripsi satu baris';

  @override
  String get skillBody => 'Instruksi (Markdown)';

  @override
  String get enabled => 'Aktif';

  @override
  String get settings => 'Pengaturan';

  @override
  String get workspace => 'Ruang kerja';

  @override
  String get switchWorkspace => 'Ganti ruang kerja';

  @override
  String get modelKeys => 'Kunci model';

  @override
  String get moreProviders => 'Penyedia lainnya';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, server kustom';

  @override
  String get toolPermissions => 'Izin alat';

  @override
  String get devicesAdvancedSummary =>
      'Lama penyimpanan, model privat, bot dengan akses';

  @override
  String get companionAdvancedSummary =>
      'Perintah, alat lokal (MCP), coding agent';

  @override
  String get noKeys => 'Belum ada kunci model.';

  @override
  String get addKey => 'Tambah kunci';

  @override
  String get usage => 'Penggunaan';

  @override
  String get language => 'Bahasa';

  @override
  String inviteSent(String email) {
    return 'Undangan terkirim ke $email.';
  }

  @override
  String get botProfile => 'Profil bot';

  @override
  String get groupMembers => 'Bot di chat ini';

  @override
  String get groupMembersHelp =>
      'Masing-masing menyimpan memori dan pengaturannya sendiri. Ketuk salah satu untuk membuka profilnya.';

  @override
  String get botAdvancedSummary =>
      'Aplikasi chat, tautan, aturan, pemantau, plugin, aktivitas';

  @override
  String get botActivityRow => 'Setiap eksekusi, langkah demi langkah';

  @override
  String get createBotAdvancedSummary => 'Kunci model dan model';

  @override
  String get botProfileSection => 'Profil';

  @override
  String get botBrain => 'Otak';

  @override
  String get botAbilities => 'Kemampuan';

  @override
  String get botSchedule => 'Jadwal';

  @override
  String get chatComputerLive => 'Bekerja di komputernya';

  @override
  String get autonomy => 'Otonomi';

  @override
  String get autonomyAskAlways => 'Tanya sebelum bertindak';

  @override
  String get autonomyAskRisky => 'Tanya untuk tindakan berisiko';

  @override
  String get autonomyAutonomous => 'Bertindak sendiri';

  @override
  String get saved => 'Tersimpan.';

  @override
  String get justNow => 'baru saja';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString menit lalu',
      one: '1 menit lalu',
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
      other: '$nString jam lalu',
      one: '1 jam lalu',
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
      other: '$nString hari lalu',
      one: 'kemarin',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'Sebuah bot';

  @override
  String get addIntegration => 'Tambah integrasi';

  @override
  String get addSecret => 'Tambah rahasia';

  @override
  String get allowedHosts => 'Host yang diizinkan';

  @override
  String get allowedHostsHelp => 'Dipisahkan koma, misalnya api.github.com';

  @override
  String get alwaysAllow => 'Selalu izinkan';

  @override
  String get approval => 'Persetujuan';

  @override
  String get approvalAlreadyDecided =>
      'Permintaan ini sudah diputuskan atau kedaluwarsa.';

  @override
  String get approvals => 'Persetujuan';

  @override
  String get approve => 'Setujui';

  @override
  String get approved => 'Disetujui';

  @override
  String get authHeaderOptional => 'Header otorisasi (opsional)';

  @override
  String get authSecretName => 'Nama rahasia autentikasi (opsional)';

  @override
  String get authSecretNameHelp =>
      'Nama rahasia dari Pengaturan › Rahasia, dikirim sebagai token bearer';

  @override
  String get baseUrlOptional => 'URL dasar (opsional)';

  @override
  String get blankBot => 'Kosong';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Pilih model';

  @override
  String get createBotNeedsModel => 'Choose a model above to create this bot.';

  @override
  String get createBotKeyRejected =>
      'The provider rejected this key. Check it in Settings → Model keys, or pick another key.';

  @override
  String get createBotDiscardTitle => 'Discard This Bot?';

  @override
  String get createBotDiscardBody => 'What you entered here will be lost.';

  @override
  String get searchModels => 'Cari model atau ketik ID model';

  @override
  String get recommendedModels => 'Direkomendasikan';

  @override
  String get allModels => 'Semua model';

  @override
  String useCustomModel(String id) {
    return 'Pakai “$id”';
  }

  @override
  String modelListFallback(String reason) {
    return 'Menampilkan model yang disarankan. $reason Kamu tetap bisa mengetik ID model mana saja.';
  }

  @override
  String get noModelsFound => 'Tidak ada model yang cocok.';

  @override
  String get addModelKeyFirst =>
      'Tambahkan kunci model dulu. Botmu memakainya untuk berpikir; kunci disimpan terenkripsi dan tidak akan ditampilkan lagi.';

  @override
  String get composioToolkits =>
      'Toolkit (dipisahkan koma, misalnya github, gmail)';

  @override
  String get copySecret => 'Salin rahasia';

  @override
  String get cronExpression => 'Ekspresi cron';

  @override
  String get cronHelp => 'menit jam tanggal bulan hari';

  @override
  String get denied => 'Ditolak';

  @override
  String get deny => 'Tolak';

  @override
  String get everyHour => 'Setiap jam';

  @override
  String get expired => 'Kedaluwarsa';

  @override
  String get inbox => 'Kotak masuk';

  @override
  String get integrationName => 'Nama';

  @override
  String get integrationNameHelp => 'Huruf kecil, angka, dan garis bawah';

  @override
  String get integrationType => 'Jenis';

  @override
  String get integrations => 'Integrasi';

  @override
  String get kindMcp => 'Server MCP';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Tandai semua sudah dibaca';

  @override
  String get newRoutine => 'Rutinitas baru';

  @override
  String get noIntegrationsForBot =>
      'Tambahkan integrasi di Pengaturan dulu, lalu aktifkan untuk bot ini di sini.';

  @override
  String get noRoutines => 'Belum ada rutinitas';

  @override
  String get noSecrets => 'Belum ada rahasia';

  @override
  String get notifications => 'Notifikasi';

  @override
  String get openInbox => 'Buka kotak masuk';

  @override
  String get pipedreamApps => 'Aplikasi (dipisahkan koma)';

  @override
  String get pipedreamClientId => 'Client ID';

  @override
  String get pipedreamClientSecret => 'Client secret';

  @override
  String get pipedreamProject => 'ID proyek';

  @override
  String get riskHigh => 'Risiko tinggi';

  @override
  String get riskLow => 'Risiko rendah';

  @override
  String get riskMedium => 'Risiko sedang';

  @override
  String get routineGithub => 'Saat ada peristiwa GitHub';

  @override
  String get routineInstructions => 'Instruksi';

  @override
  String get routineInstructionsHint =>
      'Apa yang harus dilakukan bot setiap kali?';

  @override
  String get routineName => 'Nama';

  @override
  String get routineEditTitle => 'Edit rutinitas';

  @override
  String get routineEditSubtitle => 'Ubah tugas dan jadwal berjalannya.';

  @override
  String get routineRecentRuns => 'Eksekusi terbaru';

  @override
  String get routineNoRuns => 'Belum pernah berjalan.';

  @override
  String get routineSaved => 'Rutinitas tersimpan';

  @override
  String get routineStarted => 'Rutinitas dimulai';

  @override
  String get routineWebhook => 'Saat ada webhook';

  @override
  String get routines => 'Rutinitas';

  @override
  String get routineAdvancedSummary =>
      'Pemicu GitHub dan webhook, cron, zona waktu';

  @override
  String get routineRepeatDaily => 'Setiap hari';

  @override
  String get routineRepeatWeekdays => 'Hari kerja';

  @override
  String get routineRepeatWeekly => 'Setiap minggu';

  @override
  String get routineDay => 'Hari';

  @override
  String get routineTimeLabel => 'Waktu';

  @override
  String get routineRunsAt => 'Berjalan pukul';

  @override
  String routineTimesIn(String timezone) {
    return 'Waktu dalam $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Kustom: $schedule';
  }

  @override
  String get routineOtherTriggers => 'Pemicu lainnya';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Setiap $nString menit',
      one: 'Setiap menit',
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
      other: 'Setiap $nString jam',
      one: 'Setiap jam',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'Setiap jam pada :$minute';
  }

  @override
  String cronDailyAt(String time) {
    return 'Setiap hari pukul $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'Hari kerja pukul $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Akhir pekan pukul $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days pukul $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Tanggal $day setiap bulan pukul $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items dan $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Setiap hari Minggu',
      'mon': 'Setiap Senin',
      'tue': 'Setiap Selasa',
      'wed': 'Setiap Rabu',
      'thu': 'Setiap Kamis',
      'fri': 'Setiap Jumat',
      'sat': 'Setiap Sabtu',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Minggu',
      'mon': 'Senin',
      'tue': 'Selasa',
      'wed': 'Rabu',
      'thu': 'Kamis',
      'fri': 'Jumat',
      'sat': 'Sabtu',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Tonton botmu bekerja langsung';

  @override
  String get headlessScreenEmpty =>
      'Komputer ini berjalan hanya browser agar tetap ringan. Kamu akan melihat halaman webnya di sini saat dibuka. Beralih ke desktop untuk menonton dan mengontrol aplikasi juga.';

  @override
  String get headlessScreenChecking =>
      'Memeriksa halaman setiap beberapa detik';

  @override
  String get headlessBrowserOnly => 'Hanya browser';

  @override
  String get switchedToDesktopHere =>
      'Beralih ke Desktop. Layarnya muncul di sini setelah siap.';

  @override
  String get desktopBarLabel => 'Desktop · memakai lebih banyak memori';

  @override
  String get switchToBrowserOnly => 'Beralih ke hanya browser';

  @override
  String get switchingToBrowserOnly => 'Beralih ke hanya browser…';

  @override
  String get switchedToBrowserOnly =>
      'Beralih ke hanya browser. Sekarang memakai lebih sedikit memori.';

  @override
  String get runNow => 'Jalankan sekarang';

  @override
  String get secretName => 'Nama';

  @override
  String get secretNameHelp => 'Huruf kapital, misalnya GITHUB_TOKEN';

  @override
  String get secretValue => 'Nilai';

  @override
  String get secrets => 'Rahasia';

  @override
  String get serverUrl => 'URL server';

  @override
  String get specUrl => 'URL spesifikasi OpenAPI';

  @override
  String get startFrom => 'Persona';

  @override
  String get storedEncrypted =>
      'Disimpan terenkripsi; tidak akan ditampilkan lagi';

  @override
  String get taskBlocked => 'Terhalang';

  @override
  String get taskDoing => 'Sedang dikerjakan';

  @override
  String get taskDone => 'Selesai';

  @override
  String get taskTodo => 'Belum dikerjakan';

  @override
  String get test => 'Uji';

  @override
  String get timezone => 'Zona waktu';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Berulang';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'Lihat eksekusi';

  @override
  String get webhookCreated => 'Webhook dibuat';

  @override
  String get webhookSecret => 'Rahasia penanda tangan';

  @override
  String get webhookShownOnce =>
      'Salin rahasia penanda tangan sekarang. Ini hanya ditampilkan sekali.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Koneksi gagal: $error';
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
      other: 'Terhubung, $nString alat',
      one: 'Terhubung, 1 alat',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Berikutnya: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Hanya dikirim ke $hosts';
  }

  @override
  String requestedAgo(String when) {
    return 'diminta $when';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return 'Termasuk rutinitas: $names.';
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
      other: '$nString alat',
      one: '1 alat',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'Bot kembali memegang kendali';

  @override
  String get botComputer => 'Komputer';

  @override
  String get botComputerDefault =>
      'Komputer pribadinya jika ada, atau komputer tim';

  @override
  String get botInControl => 'Bot memegang kendali';

  @override
  String get computerName => 'Nama';

  @override
  String get computers => 'Komputer';

  @override
  String get connectingLive => 'Menghubungkan…';

  @override
  String get dismiss => 'Tutup';

  @override
  String get renameTopic => 'Ganti nama';

  @override
  String get library => 'Pustaka';

  @override
  String get navLibrary => 'Pustaka';

  @override
  String get librarySearchHint => 'Cari di Pustaka';

  @override
  String get libraryFilterAll => 'Semua';

  @override
  String get libraryFilterPages => 'Situs & game';

  @override
  String get libraryFilterImages => 'Gambar';

  @override
  String get libraryFilterVideos => 'Video';

  @override
  String get libraryFilterAudio => 'Audio';

  @override
  String get libraryFilterDocuments => 'Dokumen';

  @override
  String get libraryFilterFiles => 'File';

  @override
  String get creationKindPage => 'Halaman';

  @override
  String get creationKindImage => 'Gambar';

  @override
  String get creationKindVideo => 'Video';

  @override
  String get creationKindAudio => 'Audio';

  @override
  String get creationKindDocument => 'Dokumen';

  @override
  String get creationKindFile => 'File';

  @override
  String get libraryPinned => 'Disematkan';

  @override
  String get libraryToday => 'Hari ini';

  @override
  String get libraryYesterday => 'Kemarin';

  @override
  String get libraryThisWeek => 'Minggu ini';

  @override
  String get libraryEarlier => 'Lebih lama';

  @override
  String get videoCantPlay => 'Video ini tidak bisa diputar di perangkat ini.';

  @override
  String get libraryEmptyTitle => 'Mau buat apa dulu?';

  @override
  String get libraryEmptyBody =>
      'Pilih satu dan botmu akan mulai bekerja. Semua hasil buatan botmu otomatis masuk ke sini.';

  @override
  String get libraryNoMatch => 'Tidak ada yang cocok di sini.';

  @override
  String get libraryStarterGame => 'Game kecil';

  @override
  String get libraryStarterGamePrompt =>
      'Buatkan saya game kecil yang bisa dimainkan di browser.';

  @override
  String get libraryStarterLogo => 'Sebuah logo';

  @override
  String get libraryStarterLogoPrompt => 'Rancang logo untuk proyek saya.';

  @override
  String get libraryStarterSite => 'Situs satu halaman';

  @override
  String get libraryStarterSitePrompt =>
      'Buatkan situs web satu halaman untuk bisnis saya.';

  @override
  String get libraryStarterVideo => 'Video singkat';

  @override
  String get libraryStarterVideoPrompt => 'Buatkan video singkat tentang ';

  @override
  String get libraryStarterCard => 'Kartu ulang tahun';

  @override
  String get libraryStarterCardPrompt => 'Buatkan kartu ulang tahun untuk ';

  @override
  String get libraryStarterReport => 'Sebuah laporan';

  @override
  String get libraryStarterReportPrompt => 'Riset dan tulis laporan tentang ';

  @override
  String get libraryStarterElse => 'Lainnya…';

  @override
  String get creationOpen => 'Buka';

  @override
  String get creationPlay => 'Putar';

  @override
  String get creationView => 'Lihat';

  @override
  String get creationChangeIt => 'Ubah';

  @override
  String creationChangeDraft(String title) {
    return 'Tentang “$title”: ';
  }

  @override
  String creationMadeBy(String bot) {
    return 'Dibuat oleh $bot';
  }

  @override
  String creationVersion(int n) {
    return 'versi $n';
  }

  @override
  String creationFromChat(String bot) {
    return 'Dari chatmu dengan $bot';
  }

  @override
  String creationFromBot(String bot) {
    return 'Dibuat oleh $bot';
  }

  @override
  String get creationFromHelp => 'Buka percakapan';

  @override
  String get creationDetails => 'Detail';

  @override
  String get creationAlongside => 'Dibuat bersamaan';

  @override
  String creationDeleted(String title) {
    return '“$title” dihapus';
  }

  @override
  String get showInLibrary => 'Tampilkan di Pustaka';

  @override
  String get pinInLibrary => 'Sematkan di Pustaka';

  @override
  String get libraryItemNotFound =>
      'Item itu belum ada di Pustaka. Coba lagi sebentar lagi.';

  @override
  String creationPinned(String title) {
    return '“$title” disematkan';
  }

  @override
  String creationUnpinned(String title) {
    return 'Melepas sematan “$title”';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Diperbarui · versi $version';
  }

  @override
  String get madeHere => 'Dibuat di sini';

  @override
  String madeHereEmpty(String bot) {
    return '$bot belum membuat apa pun.';
  }

  @override
  String get madeHereThisChat => 'Di chat ini';

  @override
  String madeHereByBot(String bot) {
    return 'Dibuat oleh $bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return 'Hal lain yang dibuat $bot';
  }

  @override
  String madeHereCount(String count) {
    return 'Dibuat di sini ($count)';
  }

  @override
  String get sidePanelComputer => 'Komputer';

  @override
  String get madeForTicket => 'Dibuat untuk tiket ini';

  @override
  String get libraryCantChangePicked =>
      'Hanya pembuat permintaan atau pengelola bot yang bisa mengubah ini.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item dihapus',
      one: '1 item dihapus',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dipilih',
      one: '1 dipilih',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'Terbaru';

  @override
  String get librarySortOpened => 'Baru dibuka';

  @override
  String get librarySortName => 'Nama';

  @override
  String get libraryScopeMine => 'Dibuat untuk saya';

  @override
  String get libraryScopeWorkspace => 'Seluruh ruang kerja';

  @override
  String get libraryFilterSort => 'Urutkan dan filter';

  @override
  String get creationWhoCanSee => 'Yang bisa melihat';

  @override
  String get libraryTile => 'Pustaka';

  @override
  String get libraryTileHelp => 'Yang dibuatnya';

  @override
  String get regenerateReply => 'Buat ulang';

  @override
  String get deleteMessage => 'Hapus pesan';

  @override
  String get deleteMessageTitle => 'Hapus pesan ini?';

  @override
  String get deleteMessageBody =>
      'Pesan ini dihapus untuk semua orang di chat ini. Pesan di sekitarnya tetap ada.';

  @override
  String get messageDeleted => 'Pesan dihapus';

  @override
  String get findInChat => 'Cari di chat';

  @override
  String get findInChatHint => 'Cari di chat ini';

  @override
  String findInChatCount(int index, int count) {
    return '$index dari $count';
  }

  @override
  String get findInChatNone => 'Tidak ada yang cocok';

  @override
  String get findPrevious => 'Hasil sebelumnya';

  @override
  String get findNext => 'Hasil berikutnya';

  @override
  String get closeFind => 'Tutup pencarian';

  @override
  String get pinTopic => 'Sematkan';

  @override
  String get unpinTopic => 'Lepas sematan';

  @override
  String get inAppAlertReview => 'Tinjau';

  @override
  String get forBot => 'Untuk bot';

  @override
  String get handBack => 'Kembalikan';

  @override
  String get handBackNote => 'Catatan untuk bot (opsional)';

  @override
  String get handBackNoteHint => 'Misalnya: Saya sudah masuk, lanjutkan';

  @override
  String get live => 'Langsung';

  @override
  String get liveView => 'Tampilan langsung';

  @override
  String get liveViewHelp =>
      'Tonton komputer ini secara langsung dan ambil alih kendali saat dibutuhkan.';

  @override
  String get newComputer => 'Komputer baru';

  @override
  String get newComputerHelp =>
      'Komputer pribadi hanya dimiliki satu bot. Filenya terpisah dari komputer tim.';

  @override
  String get openLiveView => 'Buka tampilan langsung';

  @override
  String get liveExpand => 'Layar penuh';

  @override
  String get liveCopy => 'Salin';

  @override
  String get liveScreenshot => 'Tangkapan layar';

  @override
  String get liveScreenshots => 'Tangkapan layar';

  @override
  String get liveScreenshotsHelp =>
      'Video langsung tidak bisa lewat di jaringan ini, jadi layar diperbarui sekitar sekali per detik.';

  @override
  String get liveReconnecting => 'Menghubungkan kembali…';

  @override
  String get liveReconnectingHelp =>
      'Video langsung terputus (server mungkin sedang dimulai ulang). Mencoba lagi; tangkapan layar ditampilkan sementara itu.';

  @override
  String get liveTryAgain => 'Coba lagi';

  @override
  String get liveDroppedHelp =>
      'Video langsung tidak bisa kembali tersambung, jadi layar diperbarui sekitar sekali per detik. Ketuk Coba lagi.';

  @override
  String get liveMore => 'Lainnya';

  @override
  String get liveSaveScreenshot => 'Simpan tangkapan layar';

  @override
  String get liveCopyFromComputer => 'Salin dari komputer';

  @override
  String get livePasteToComputer => 'Tempel ke komputer';

  @override
  String get liveRotateHint =>
      'Putar ponselmu ke samping untuk layar lebih besar';

  @override
  String get liveWatching => 'Menonton';

  @override
  String get liveCopied => 'Disalin dari komputer.';

  @override
  String get liveNothingCopied =>
      'Tidak ada yang disalin. Pilih sesuatu di komputer dulu.';

  @override
  String get livePasteEmpty => 'Papan klipmu kosong.';

  @override
  String get liveMinimize => 'Kembali ke panel samping';

  @override
  String get liveShownFullScreen =>
      'Tampilan langsung terbuka dalam layar penuh.';

  @override
  String get liveStillWatching => 'Masih menonton?';

  @override
  String get liveStillWatchingHelp =>
      'Komputer akan tidur saat tidak ada yang menonton untuk menghemat daya.';

  @override
  String get liveKeepWatching => 'Tetap tonton';

  @override
  String get livePausedToSavePower => 'Dijeda untuk menghemat daya';

  @override
  String get livePausedToSavePowerHelp =>
      'Tidak ada yang menonton, jadi komputer bisa beristirahat. Lanjutkan akan membangunkannya lagi.';

  @override
  String get liveResume => 'Lanjutkan';

  @override
  String get paused => 'Dijeda';

  @override
  String get pausedUserInControl =>
      'Dijeda: seseorang sedang mengendalikan layar';

  @override
  String get letBotUseTerminal => 'Izinkan pakai terminal & file';

  @override
  String get screenHandedBack => 'Layar dikembalikan';

  @override
  String get privateComputer => 'Komputer pribadi';

  @override
  String get profileDesktop => 'Desktop';

  @override
  String get profileHeadless => 'Tanpa desktop';

  @override
  String get rename => 'Ganti nama';

  @override
  String get rightClickNextTap => 'Klik kanan pada ketukan berikutnya';

  @override
  String get screenshotMode =>
      'Tangkapan layar (video langsung tidak tersedia di jaringan ini)';

  @override
  String get showKeyboard => 'Keyboard';

  @override
  String get someoneElseInControl => 'Orang lain sedang mengendalikan';

  @override
  String get switchToDesktop => 'Beralih ke Desktop';

  @override
  String get switchToHeadless => 'Beralih ke Tanpa desktop';

  @override
  String get switchProfileConfirm =>
      'Komputer akan dimulai ulang untuk beralih. Filemu tetap ada, tetapi apa pun yang sedang berjalan akan berhenti.';

  @override
  String get switchProfileButton => 'Beralih';

  @override
  String get switchingToDesktop => 'Beralih ke Desktop…';

  @override
  String get switchingToHeadless => 'Beralih ke Tanpa desktop…';

  @override
  String get switchedToDesktop =>
      'Beralih ke Desktop. Buka Tampilan langsung untuk menonton layarnya.';

  @override
  String get switchedToHeadless =>
      'Beralih ke Tanpa desktop. Sekarang memakai lebih sedikit memori.';

  @override
  String get takeControl => 'Ambil kendali';

  @override
  String get takeoverCompleted => 'Dikembalikan';

  @override
  String get takeoverDismissed => 'Ditolak';

  @override
  String get takeoverPrivacy =>
      'Saat kamu mengendalikan, bot dijeda dan apa pun yang kamu ketik atau lihat tidak dikirim ke bot.';

  @override
  String get liveShellOnTooltip =>
      'Biarkan bot tetap memakai terminal dan filenya saat kamu mengendalikan';

  @override
  String get liveShellOffTooltip =>
      'Jeda terminal dan file bot juga saat kamu mengendalikan';

  @override
  String get liveShellOnNote =>
      'Bot tetap bisa memakai terminal dan filenya. Bot tetap tidak bisa melihat atau memakai layar sampai kamu kembalikan.';

  @override
  String get liveShellOffNote =>
      'Bot dijeda sepenuhnya sampai kamu kembalikan.';

  @override
  String get teamComputer => 'Komputer tim';

  @override
  String get withDesktop => 'Dengan desktop';

  @override
  String get withDesktopHelp =>
      'Menambahkan layar yang bisa kamu tonton langsung; memakai lebih banyak memori';

  @override
  String get youAreInControl => 'Kamu memegang kendali';

  @override
  String botAsksForHelp(String reason) {
    return 'Bot bertanya: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot butuh bantuanmu';
  }

  @override
  String deleteComputerConfirm(String name) {
    return 'Hapus $name? File, snapshot, dan titik pemulihannya juga akan dihapus.';
  }

  @override
  String latencyMs(int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return '$msString mdt';
  }

  @override
  String privateComputerOf(String bot) {
    return 'Komputer $bot';
  }

  @override
  String get micPermissionNeeded => 'Izinkan akses mikrofon untuk mendikte.';

  @override
  String get dictationEmpty => 'Tidak ada suara yang tertangkap. Coba lagi.';

  @override
  String get startCall => 'Mulai panggilan suara';

  @override
  String get stopDictation => 'Hentikan dan transkripsikan';

  @override
  String get dictate => 'Dikte';

  @override
  String get dictateOnDevice => 'Dikte dengan perangkat ini';

  @override
  String get stopListening => 'Berhenti mendengarkan';

  @override
  String get dictationRetry => 'Coba lagi';

  @override
  String get dictationSayAgain => 'Ucapkan lagi';

  @override
  String get dictationFailed => 'Gagal mengubah suara menjadi teks.';

  @override
  String get dictationFailedUseDevice =>
      'Gagal mengubah suara menjadi teks. Ucapkan lagi dan perangkatmu akan mendengarkan.';

  @override
  String get dictationNoServiceUseDevice =>
      'Dikte belum disiapkan untuk ruang kerja ini. Perangkatmu bisa mendengarkan sebagai gantinya.';

  @override
  String get dictationDeviceFailed =>
      'Dikte perangkatmu berhenti berfungsi, jadi mikrofon kembali ke Casama.';

  @override
  String get dictationDevicePermission =>
      'Izinkan pengenalan ucapan untuk mendikte dengan perangkat ini.';

  @override
  String get readAloud => 'Bacakan';

  @override
  String get callConnecting => 'Menghubungkan…';

  @override
  String get callLive => 'Langsung';

  @override
  String get callEnded => 'Panggilan berakhir';

  @override
  String get callEndedIdle => 'Panggilan diakhiri setelah 2 menit hening.';

  @override
  String get callFailed => 'Panggilan gagal tersambung.';

  @override
  String get callListening => 'Mendengarkan';

  @override
  String get callSpeaking => 'Berbicara';

  @override
  String get callWorking => 'Sedang dikerjakan';

  @override
  String get callMutedState => 'Dibisukan';

  @override
  String get callCaptions => 'Teks';

  @override
  String get callSpeaker => 'Speaker';

  @override
  String get callEarpiece => 'Ponsel';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Headphone';

  @override
  String get callAudioOutput => 'Putar panggilan melalui';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Mengganti fotonya',
      'memory_search': 'Mencari di memorimu',
      'memory_write': 'Menyimpan ke memori',
      'memory': 'Memperbarui memorinya',
      'knowledge_search': 'Mencari di pengetahuanmu',
      'web_search': 'Mencari di web',
      'web': 'Membaca halaman web',
      'browser_open': 'Membuka situs web',
      'browser_click': 'Mengklik di halaman',
      'browser_type': 'Mengetik di halaman',
      'browser_press': 'Menekan tombol',
      'browser_scroll': 'Menggulir halaman',
      'browser_look': 'Melihat halaman',
      'desktop_click': 'Mengklik di layar',
      'desktop_type': 'Mengetik',
      'desktop_press': 'Menekan tombol',
      'desktop_launch': 'Membuka aplikasi',
      'desktop_look': 'Melihat layar',
      'shell': 'Bekerja di komputernya',
      'files_read': 'Membaca file',
      'files_write': 'Menulis file',
      'files_list': 'Melihat daftar file',
      'files_search': 'Mencari file',
      'files_from_chat': 'Mengambil file dari chat',
      'http': 'Menghubungi layanan',
      'data_search': 'Mencari data',
      'data_call': 'Mengambil data',
      'skills_load': 'Menyiapkan keahlian',
      'skills_create': 'Mempelajari keahlian baru',
      'skills_update': 'Meningkatkan keahlian',
      'checkpoint': 'Menyimpan titik simpan',
      'computer_restart': 'Memulai ulang komputernya',
      'takeover': 'Memintamu mengambil alih',
      'delegate': 'Meminta bantuan',
      'routines_list': 'Memeriksa rutinitasmu',
      'routines_create': 'Menyiapkan rutinitas',
      'routines_update': 'Memperbarui rutinitas',
      'routines_delete': 'Menghapus rutinitas',
      'watchers_create': 'Menyiapkan pemantau',
      'watchers_list': 'Memeriksa pemantaumu',
      'watchers_delete': 'Menghapus pemantau',
      'tasks_list': 'Memeriksa tugasmu',
      'tasks_create': 'Menambahkan tugas',
      'tasks': 'Memperbarui tugasmu',
      'notify_user': 'Mengirimimu catatan',
      'usage_report': 'Memeriksa penggunaan',
      'device_read': 'Membaca data perangkatmu',
      'device_access': 'Meminta akses perangkat',
      'pages_publish': 'Menerbitkan halaman',
      'pages': 'Memperbarui halaman',
      'media': 'Membuat gambar',
      'media_video': 'Membuat video',
      'bots_create': 'Membuat bot baru',
      'bots_update': 'Memperbarui bot',
      'bots_list': 'Memeriksa botmu',
      'bots_archive': 'Mengarsipkan bot',
      'channel_send': 'Mengirim pesan',
      'links_ask': 'Bertanya ke asisten kontak',
      'logins_list': 'Memeriksa info masuk tersimpan',
      'replay_run': 'Mengulangi langkah tersimpan',
      'replay_save': 'Menyimpan langkah ini',
      'setup_apply': 'Menyarankan pengaturan',
      'sidebar_organize': 'Merapikan bilah sampingmu',
      'suggestions_add': 'Menambahkan saran',
      'teach_save_draft': 'Menyimpan draf keahlian',
      'welcome_name': 'Memilih nama',
      'secrets_request': 'Meminta rahasia darimu',
      'pages_list': 'Memeriksa halamanmu',
      'pages_share': 'Mengubah siapa yang bisa melihat halaman',
      'projects_create': 'Memulai proyek',
      'projects_status': 'Memeriksa proyek',
      'projects_update': 'Memperbarui proyek',
      'projects': 'Merencanakan proyek',
      'payments': 'Meminta izin membayar',
      'voice_call': 'Menghubungi bisnis',
      'voice_call_user': 'Menghubungimu',
      'tools_load': 'Bersiap',
      'ui_show': 'Menunjukkan sesuatu kepadamu',
      'start_task': 'Memulai ini di chat',
      'adult_sites_turn_on': 'Meminta mengaktifkan situs dewasa',
      'connections_attach': 'Mulai memakai aplikasi',
      'other': 'Sedang dikerjakan',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Fotonya diganti',
      'memory_search': 'Memorimu dicari',
      'memory_write': 'Disimpan ke memori',
      'memory': 'Memorinya diperbarui',
      'knowledge_search': 'Pengetahuanmu dicari',
      'web_search': 'Web sudah dicari',
      'web': 'Halaman web dibaca',
      'browser_open': 'Situs web dibuka',
      'browser_click': 'Halaman diklik',
      'browser_type': 'Teks diketik di halaman',
      'browser_press': 'Tombol ditekan',
      'browser_scroll': 'Halaman digulir',
      'browser_look': 'Halaman dilihat',
      'desktop_click': 'Layar diklik',
      'desktop_type': 'Teks diketik',
      'desktop_press': 'Tombol ditekan',
      'desktop_launch': 'Aplikasi dibuka',
      'desktop_look': 'Layar dilihat',
      'shell': 'Selesai bekerja di komputernya',
      'files_read': 'File dibaca',
      'files_write': 'File ditulis',
      'files_list': 'Daftar file dilihat',
      'files_search': 'File dicari',
      'files_from_chat': 'File diambil dari chat',
      'http': 'Layanan dihubungi',
      'data_search': 'Data dicari',
      'data_call': 'Data diambil',
      'skills_load': 'Keahlian dipakai',
      'skills_create': 'Keahlian baru dipelajari',
      'skills_update': 'Keahlian ditingkatkan',
      'checkpoint': 'Titik simpan dibuat',
      'computer_restart': 'Komputernya dimulai ulang',
      'takeover': 'Kamu diminta mengambil alih',
      'delegate': 'Bantuan sudah diminta',
      'routines_list': 'Rutinitasmu diperiksa',
      'routines_create': 'Rutinitas disiapkan',
      'routines_update': 'Rutinitas diperbarui',
      'routines_delete': 'Rutinitas dihapus',
      'watchers_create': 'Pemantau disiapkan',
      'watchers_list': 'Pemantaumu diperiksa',
      'watchers_delete': 'Pemantau dihapus',
      'tasks_list': 'Tugasmu diperiksa',
      'tasks_create': 'Tugas ditambahkan',
      'tasks': 'Tugasmu diperbarui',
      'notify_user': 'Catatan dikirim kepadamu',
      'usage_report': 'Penggunaan diperiksa',
      'device_read': 'Data perangkatmu dibaca',
      'device_access': 'Akses perangkat diminta',
      'pages_publish': 'Halaman diterbitkan',
      'pages': 'Halaman diperbarui',
      'media': 'Gambar dibuat',
      'media_video': 'Video dibuat',
      'bots_create': 'Bot baru dibuat',
      'bots_update': 'Bot diperbarui',
      'bots_list': 'Botmu diperiksa',
      'bots_archive': 'Bot diarsipkan',
      'channel_send': 'Pesan dikirim',
      'links_ask': 'Asisten kontak sudah ditanya',
      'logins_list': 'Info masuk tersimpan diperiksa',
      'replay_run': 'Langkah tersimpan diulang',
      'replay_save': 'Langkah ini disimpan',
      'setup_apply': 'Pengaturan disarankan',
      'sidebar_organize': 'Bilah sampingmu dirapikan',
      'suggestions_add': 'Saran ditambahkan',
      'teach_save_draft': 'Draf keahlian disimpan',
      'welcome_name': 'Nama dipilih',
      'secrets_request': 'Rahasia diminta darimu',
      'pages_list': 'Halamanmu diperiksa',
      'pages_share': 'Akses halaman diubah',
      'projects_create': 'Proyek dimulai',
      'projects_status': 'Proyek diperiksa',
      'projects_update': 'Proyek diperbarui',
      'projects': 'Proyek direncanakan',
      'payments': 'Izin membayar diminta',
      'voice_call': 'Bisnis sudah ditelepon',
      'voice_call_user': 'Kamu sudah ditelepon',
      'tools_load': 'Sudah siap',
      'ui_show': 'Sesuatu ditunjukkan kepadamu',
      'start_task': 'Dimulai di chat',
      'adult_sites_turn_on': 'Pengaktifan situs dewasa diminta',
      'connections_attach': 'Aplikasi mulai dipakai',
      'other': 'Selesai',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return 'Memakai $app';
  }

  @override
  String toolUsedApp(String app) {
    return 'Sudah memakai $app';
  }

  @override
  String get toolDetails => 'Detail';

  @override
  String approvalAsking(String bot) {
    return '$bot bertanya dulu';
  }

  @override
  String get approvalLookClosely =>
      'Periksa baik-baik sebelum kamu mengizinkan ini';

  @override
  String approvalAttachConnection(String app) {
    return 'Mulai memakai $app, yang sudah terhubung di ruang kerja ini';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return 'Biarkan $bot melakukan ini tanpa bertanya';
  }

  @override
  String get pageShareToPublic =>
      'Siapa saja yang memiliki tautan bisa membukanya';

  @override
  String get pageShareToWorkspace =>
      'Semua orang di ruang kerja ini bisa membukanya';

  @override
  String get pageShareToPrivate => 'Hanya kamu yang bisa membukanya';

  @override
  String approvalAllowedLine(String what) {
    return 'Diizinkan: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Ditolak: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'Tidak dijawab tepat waktu: $what';
  }

  @override
  String get callToolFailed => 'Tindakan itu tidak berhasil';

  @override
  String get callToolNeedsOk => 'Perlu persetujuanmu untuk melanjutkan';

  @override
  String get callToolAllow => 'Izinkan';

  @override
  String get callToolNotNow => 'Nanti saja';

  @override
  String get callToolAllowed => 'Diizinkan. Hasilnya akan muncul di chat';

  @override
  String get callToolDeclined => 'Kamu memilih nanti saja';

  @override
  String get callToolBackground =>
      'Masih bekerja. Hasilnya akan muncul di chat';

  @override
  String get callToolInChat => 'Hasilnya akan muncul di chat';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString dtk';
  }

  @override
  String get callNeedsKeyTitle => 'Panggilan butuh kunci Google AI';

  @override
  String get callNeedsKeyBody =>
      'Panggilan langsung berjalan di Gemini Live dari Google, jadi ruang kerja ini butuh kunci Google AI. Kunci ini hanya dipakai untuk panggilan: bacakan, dikte, gambar, dan video berjalan di OpenRouter. Google memberikannya gratis di AI Studio: buat kuncinya di sana, lalu tambahkan di Kunci model dan panggilan akan langsung berfungsi. Hanya pemilik dan admin ruang kerja yang bisa menambahkan kunci.';

  @override
  String get callAddKey => 'Tambah kunci Google AI';

  @override
  String get callGetFreeKey => 'Dapatkan kunci gratis dari Google';

  @override
  String get callMicUnmute => 'Nyalakan mik';

  @override
  String get videoUnmute => 'Nyalakan suara';

  @override
  String get callMicMute => 'Bisukan mik';

  @override
  String get videoMute => 'Bisukan suara';

  @override
  String get hangUp => 'Tutup';

  @override
  String callWith(String bot) {
    return 'Panggilan dengan $bot';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return 'Akhiri panggilan dengan $from dan hubungi $to?';
  }

  @override
  String get callSwitchBody =>
      'Kamu hanya bisa berada dalam satu panggilan sekaligus. Panggilan saat ini akan disimpan ke chatnya dulu.';

  @override
  String get callSwitchConfirm => 'Akhiri dan panggil';

  @override
  String get callVoiceConsentTitle => 'Suaramu dikirim ke Google';

  @override
  String get callVoiceConsentBody =>
      'Dalam panggilan, Casama mengirim suaramu dan ucapanmu ke Google Gemini, yang mendengarmu dan membacakan balasan botmu. Kata-kata dalam panggilan juga dikirim ke model AI yang dipakai botmu melalui OpenRouter. Tidak ada yang dikirim sebelum kamu setuju. Kamu bisa menghentikannya kapan saja di Pengaturan › Privasi.';

  @override
  String get callVoiceConsentAgree => 'Setuju dan panggil';

  @override
  String get callVoiceConsentNotNow => 'Nanti saja';

  @override
  String get callEndedLost =>
      'Panggilan berakhir karena koneksi terputus terlalu lama.';

  @override
  String get callMinimize => 'Perkecil';

  @override
  String get callEndCall => 'Akhiri panggilan';

  @override
  String get callEndAndAnswer => 'Akhiri dan jawab';

  @override
  String get callReconnecting => 'Menghubungkan kembali…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menit',
      one: '1 menit',
      zero: 'kurang dari semenit',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return 'Panggilan dengan $bot, $time, ketuk untuk kembali';
  }

  @override
  String callReturnBar(String bot) {
    return 'Sedang dalam panggilan dengan $bot, ketuk untuk kembali';
  }

  @override
  String get callOpen => 'Buka panggilan';

  @override
  String get callOnHold => 'Ditahan';

  @override
  String get callNotificationLive => 'Dalam panggilan';

  @override
  String get callNotificationMuted => 'Dibisukan';

  @override
  String get callNotificationChannel => 'Panggilan';

  @override
  String callTabTitle(String time) {
    return 'Dalam panggilan · $time';
  }

  @override
  String get callMenuShow => 'Tampilkan panggilan';

  @override
  String get callJobWorking => 'Sedang dikerjakan';

  @override
  String callJobStrip(String task) {
    return 'Mengerjakan: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'Perlu kamu: $task';
  }

  @override
  String get callTileWatching => 'Tampilan langsung';

  @override
  String get callTileDone => 'Selesai';

  @override
  String get callTileNeedsYou => 'Perlu kamu';

  @override
  String callTileLabel(String state) {
    return 'Layar bot, $state. Ketuk untuk melihat ukuran penuh';
  }

  @override
  String get callTileHide => 'Sembunyikan layar';

  @override
  String get screenCardLive => 'langsung';

  @override
  String screenCardLabel(String bot, String state) {
    return 'Layar $bot, $state';
  }

  @override
  String get screenCardOpen => 'Buka layar penuh';

  @override
  String get screenCardYouHave => 'Kamu mengendalikan layar';

  @override
  String screenCardHeldBy(String name) {
    return '$name memegang layar';
  }

  @override
  String get screenCardMore => 'Opsi lainnya';

  @override
  String screenCardIntro(String bot) {
    return 'Layar $bot. Ketuk untuk menonton, seret untuk memindahkan.';
  }

  @override
  String get screenCardHideForNow => 'Sembunyikan sementara';

  @override
  String get screenCardDontShow => 'Jangan tampilkan otomatis';

  @override
  String get screenCardTurnedOff =>
      'Kartu layar nonaktif. Aktifkan lagi di Pengaturan.';

  @override
  String get screenCardOfferOff =>
      'Sering menyembunyikan kartu layar? Kamu bisa mematikannya.';

  @override
  String get screenCardTurnOff => 'Matikan';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot membutuhkanmu di layar';
  }

  @override
  String callRecapTitle(String length) {
    return 'Panggilan · $length';
  }

  @override
  String get callRecapStarted => 'Dimulai saat panggilan';

  @override
  String get callRecapTaskDone => 'Selesai';

  @override
  String get callRecapTaskFailed => 'Belum selesai';

  @override
  String get callRecapTaskStopped => 'Dihentikan';

  @override
  String get callRecapTaskRunning => 'Masih bekerja';

  @override
  String get callRecapOpenRun => 'Lihat hasilnya';

  @override
  String get summarizeCalls => 'Ringkas panggilan';

  @override
  String get summarizeCallsHelp =>
      'Setelah setiap panggilan, kartunya menampilkan topik dan langkah berikutnya. Memakai sedikit model kecil bot.';

  @override
  String callCardVoice(String length) {
    return 'Panggilan suara · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Panggilan telepon · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Panggilan terputus · $length';
  }

  @override
  String callCardMissed(String name) {
    return 'Panggilan tak terjawab dari $name';
  }

  @override
  String callCardLive(String name) {
    return 'Sedang dalam panggilan dengan $name';
  }

  @override
  String get callCardLiveElsewhere =>
      'Sedang dalam panggilan di perangkat lain';

  @override
  String get callCardReturn => 'Kembali ke panggilan';

  @override
  String callCardBotHungUp(String name) {
    return '$name menutup panggilan';
  }

  @override
  String get callCardEndedQuiet => 'Berakhir setelah jeda hening';

  @override
  String get callCardEndedLimit => 'Panggilan berakhir karena mencapai batas';

  @override
  String get callCardWritingSummary => 'Menulis ringkasan…';

  @override
  String callCardSummaryBy(String name) {
    return 'Ringkasan oleh $name';
  }

  @override
  String get callCardNextSteps => 'Langkah berikutnya';

  @override
  String get callCardDoIt => 'Lakukan';

  @override
  String get callCardDismissStep => 'Tutup';

  @override
  String get callCardStepStarted => 'Dimulai';

  @override
  String get callCardStepFailed => 'Gagal memulainya. Coba lagi.';

  @override
  String get callCardDoneOnCall => 'Selesai saat panggilan';

  @override
  String callCardMore(int count) {
    return '$count lainnya';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Transkrip · $count giliran',
      one: 'Transkrip · 1 giliran',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Transkrip';

  @override
  String get callCardSearchTranscript => 'Cari transkrip';

  @override
  String get callCardNoMatches => 'Tidak ada yang cocok';

  @override
  String get callCardYou => 'Kamu';

  @override
  String get callCardCallBack => 'Hubungi balik';

  @override
  String get callCardCopy => 'Salin';

  @override
  String get callCardCopied => 'Disalin';

  @override
  String get callCardShare => 'Bagikan';

  @override
  String get callCardMoreActions => 'Lainnya';

  @override
  String get callCardDelete => 'Hapus panggilan';

  @override
  String get callCardDeleteTitle => 'Hapus panggilan ini?';

  @override
  String get callCardDeleteBody =>
      'Kartu dan transkripnya dihapus dari chat ini. Tugas yang dimulainya tetap menyimpan hasilnya.';

  @override
  String get callCardDeleted => 'Panggilan dihapus';

  @override
  String get callCardDeleteFailed => 'Gagal menghapus panggilan';

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

    return 'Balasan dimulai dalam $msString mdt';
  }

  @override
  String get voiceSettings => 'Suara';

  @override
  String get voiceSettingsHelp =>
      'Suara bacaan dan alat yang dimiliki bot saat panggilan';

  @override
  String get callTools => 'Alat saat panggilan';

  @override
  String get callToolsHelp =>
      'Panggilan sudah mencakup memori, pencarian web, catatan untukmu, rutinitas, dan tiket, serta meneruskan tugas besar ke chat. Tambahkan alat aplikasi terhubung yang harus dipakai bot secara langsung; tiap alat menambah sedikit biaya setiap panggilan.';

  @override
  String get callToolsNone =>
      'Bot ini belum mengaktifkan aplikasi terhubung. Aktifkan satu di Integrasi, lalu pilih alatnya di sini.';

  @override
  String get openIntegrations => 'Buka Integrasi';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString alat aplikasi terhubung ditambahkan',
      one: '1 alat aplikasi terhubung ditambahkan',
      zero: 'Hanya alat suara bawaan',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'ID suara (opsional)';

  @override
  String get voiceIdHelp =>
      'Nama suara Gemini, misalnya Kore atau Puck; jika kosong memakai Kore';

  @override
  String get useThisComputer => 'Pakai komputer ini untuk bot';

  @override
  String get companionDesktopOnly =>
      'Hanya aplikasi desktop (macOS, Windows, Linux) yang bisa bertindak sebagai komputer bot.';

  @override
  String get companionIntro =>
      'Izinkan bot pilihan bekerja di komputer ini: menjalankan perintah, mengedit file di folder pilihanmu, menjelajah, dan memakai aplikasi. Semua yang dilakukannya tampil di layar dan bisa dihentikan. Nonaktif sampai kamu setujui tiap kemampuannya.';

  @override
  String get thisComputer => 'Komputer ini';

  @override
  String get companionOnline =>
      'Aktif: bot yang kamu izinkan bisa memakai komputer ini';

  @override
  String get companionError => 'Tidak dapat menjangkau Casama; mencoba lagi';

  @override
  String get companionOff => 'Nonaktif';

  @override
  String get companionCapabilities => 'Yang boleh dilakukan bot';

  @override
  String get companionCapabilitiesHelp =>
      'Setujui masing-masing. Tindakan berisiko tinggi selalu bertanya, apa pun otonomi bot.';

  @override
  String get capShell => 'Jalankan perintah (di dalam folder bersama)';

  @override
  String get capFiles => 'Baca dan edit file di folder bersama';

  @override
  String get capBrowser =>
      'Pakai browser (miliknya sendiri, terpisah dari milikmu)';

  @override
  String get capDesktop => 'Pakai aplikasi desktop';

  @override
  String get sharedFolders => 'Folder bersama';

  @override
  String get sharedFoldersHelp => 'Bot hanya bisa menjangkau folder ini.';

  @override
  String get addFolder => 'Tambah folder';

  @override
  String get botsAllowed => 'Bot yang diizinkan';

  @override
  String get botsAllowedHelp =>
      'Bot yang diizinkan juga bisa bekerja di komputer ini. Masing-masing tetap punya komputernya sendiri dan memakainya kecuali tugas membutuhkan komputer ini.';

  @override
  String get worksOnTitle => 'Bekerja di';

  @override
  String worksOnSubtitle(String bot) {
    return 'Tempat $bot menjalankan perintah, memakai file, dan menjelajah untukmu.';
  }

  @override
  String get worksOnAuto => 'Otomatis';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot memilih untuk tiap langkah: komputernya sendiri, kecuali tugas membutuhkan komputermu.';
  }

  @override
  String get worksOnBot => 'Hanya komputer bot';

  @override
  String get worksOnBotHelp => 'Komputermu tidak dipakai sama sekali.';

  @override
  String get worksOnMine => 'Hanya komputer saya';

  @override
  String get worksOnMineHelp =>
      'Semuanya berjalan di komputermu, jadi komputer harus menyala.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Semuanya berjalan di $computer, jadi komputer harus menyala.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Bekerja di: $mode';
  }

  @override
  String placesTitle(String bot) {
    return 'Tempat $bot bekerja';
  }

  @override
  String get placesSubtitle =>
      'Pilih komputer yang ingin dilihat di sini. Bekerja di menentukan tempat bot bekerja.';

  @override
  String placesBarLabel(String computer, String mode) {
    return 'Menampilkan $computer. Bekerja di: $mode. Ubah';
  }

  @override
  String get placeYoursOnline => 'Komputermu · Online';

  @override
  String get placeYoursOffline => 'Komputermu · Offline';

  @override
  String get placeTeamComputer => 'Komputer tim';

  @override
  String placeBotsOwn(String bot) {
    return 'Komputer milik $bot';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$action di $computer';
  }

  @override
  String get botYourComputer => 'Komputermu';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone => 'Tidak diizinkan di komputermu mana pun';

  @override
  String botYourComputerHow(String bot) {
    return 'Agar $bot bisa bekerja di komputermu juga, buka Casama di komputer itu dan aktifkan di Pengaturan → Pakai komputer ini untuk bot → Bot yang diizinkan. Bot tetap menyimpan komputernya sendiri.';
  }

  @override
  String get routineWhere => 'Tempat kerjanya';

  @override
  String get routineWhereHelp =>
      'Tempat rutinitas ini menjalankan perintah dan memakai file.';

  @override
  String get routineWhereBot => 'Komputer bot';

  @override
  String get routineWhereBotHelp =>
      'Berjalan baik komputermu menyala maupun tidak.';

  @override
  String get routineWhereMine => 'Komputer saya saat menyala';

  @override
  String get routineWhereMineHelp =>
      'Untuk pekerjaan pada file dan aplikasimu sendiri. Eksekusi akan memberi tahu jika komputer mati.';

  @override
  String get routineUsesComputer => 'Uses a computer';

  @override
  String get routineUsesComputerOn =>
      'Can save files, run commands and browse pages.';

  @override
  String get routineUsesComputerOff =>
      'Reads your apps, the web and memory only. Faster, and never wakes a computer.';

  @override
  String get computerBotsAllowed => 'Bot yang diizinkan';

  @override
  String get unpairComputer =>
      'Berhenti memakai komputer ini dan putuskan pemasangan';

  @override
  String botActingHere(String bot, String action) {
    return '$bot sedang bekerja di komputer ini: $action';
  }

  @override
  String get quickAsk => 'Tanya cepat';

  @override
  String get quickAskHint => 'Tanyakan apa saja ke bot…';

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
  String get cloudModelsTitle => 'Model cloud';

  @override
  String get cloudModelsHelp =>
      'Berlaku untuk setiap server Cloud dalam hitungan detik.';

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
  String get connectionsTitle => 'Koneksi aplikasi';

  @override
  String get connectionsServerComposio => 'Akun Composio Casama';

  @override
  String get connectionsServerComposioHelp =>
      'Aplikasi tanpa info masuk sendiri terhubung dalam satu klik lewat akun Composio server ini.';

  @override
  String get connectionsOwnAccounts => 'Akun pribadi pengguna';

  @override
  String get connectionsOwnAccountsHelp =>
      'Setiap orang memakai Composio, Pipedream, atau Zapier miliknya sendiri.';

  @override
  String get connectionsNoComposioKey =>
      'Tambahkan COMPOSIO_API_KEY ke server ini untuk memakai akun Casama.';

  @override
  String get connectionsGoogleTitle => 'Aplikasi Google';

  @override
  String get connectionsGoogleComposio => 'Lewat Composio';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Kalender, Drive, dan lainnya langsung berfungsi.';

  @override
  String get connectionsGoogleDirect => 'Server milik Google sendiri';

  @override
  String get connectionsGoogleDirectHelp =>
      'Memerlukan pendaftaran Google Workspace Developer Preview.';

  @override
  String get notInstanceOwner =>
      'Hanya pemilik instans yang bisa membuka konsol admin.';

  @override
  String get runs24h => 'Eksekusi (24 j)';

  @override
  String get failedRuns24h => 'Eksekusi gagal (24 j)';

  @override
  String get cost24h => 'Pengeluaran (24 j)';

  @override
  String get computersRunning => 'Komputer berjalan';

  @override
  String get devicesOnline => 'Komputer pribadi online';

  @override
  String get editQuotas => 'Edit kuota';

  @override
  String get maxBots => 'Batas bot';

  @override
  String get monthlyUsd => 'Batas pengeluaran bulanan (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'Casama $latest tersedia (kamu memakai $current)';
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
      other: '$nString ruang kerja',
      one: '1 ruang kerja',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'masuk $when';
  }

  @override
  String quotasFor(String name) {
    return 'Kuota untuk $name';
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
      other: '$nString anggota',
      one: '1 anggota',
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
    return '$usd dalam 30 hari';
  }

  @override
  String get connectingToServer => 'Menghubungkan ke Casama…';

  @override
  String get cannotReachServer => 'Tidak dapat menjangkau server Casama-mu';

  @override
  String get connectionFailed =>
      'Tidak dapat menjangkau server Casama-mu. Periksa koneksimu dan coba lagi.';

  @override
  String get serverNotResponding =>
      'Server Casama-mu sedang tidak merespons. Coba lagi sebentar lagi.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Periksa koneksimu, atau pastikan server di $url sedang berjalan.';
  }

  @override
  String get serverUnreachableBody =>
      'Pastikan kamu online. Jika sudah, server mungkin sedang dimulai ulang, jadi kami akan terus mencoba.';

  @override
  String retryingIn(int seconds) {
    return 'Mencoba lagi dalam $seconds dtk';
  }

  @override
  String get retryingNow => 'Mencoba…';

  @override
  String get upgradeTitle => 'Upgrade paketmu';

  @override
  String get notNow => 'Nanti saja';

  @override
  String get seePlans => 'Lihat paket';

  @override
  String get billing => 'Tagihan';

  @override
  String get billingOffSelfHosted =>
      'Tagihan nonaktif di server ini. Server berjalan dengan lisensinya sendiri: penggunaan pribadi gratis untuk satu orang, dan tim memakai lisensi Business.';

  @override
  String get restorePurchases => 'Pulihkan pembelian';

  @override
  String get restoreStarted => 'Memeriksa pembelianmu…';

  @override
  String get plans => 'Paket';

  @override
  String get currentPlan => 'Paket saat ini';

  @override
  String subscribeFor(String price) {
    return 'Berlangganan seharga $price';
  }

  @override
  String get subscribeOnWeb => 'Berlangganan di web';

  @override
  String get credits => 'Kredit';

  @override
  String get creditHistory => 'Riwayat kredit';

  @override
  String get creditReasonPurchase => 'Kredit dibeli';

  @override
  String get creditReasonGrant => 'Kredit ditambahkan';

  @override
  String get creditReasonRefund => 'Pengembalian dana';

  @override
  String get creditReasonAdjustment => 'Penyesuaian';

  @override
  String get creditReasonExpire => 'Kredit kedaluwarsa';

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
  String get limitBotsUnlimited => 'Bot tanpa batas';

  @override
  String get unlimitedValue => 'Tanpa batas';

  @override
  String trialDaysFree(int n) {
    return '$n hari gratis';
  }

  @override
  String get extraPeople => 'Anggota tambahan';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '$price per orang per bulan, di atas $seats yang sudah termasuk dalam paketmu.';
  }

  @override
  String get extraPeopleSaved => 'Anggota tambahan diperbarui';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString jam komputer per bulan';
  }

  @override
  String limitCredits(String amount) {
    return '$amount kredit per bulan';
  }

  @override
  String get viaWeb => 'Ditagih lewat web';

  @override
  String get viaAppStore => 'Ditagih lewat App Store';

  @override
  String get viaGooglePlay => 'Ditagih lewat Google Play';

  @override
  String get yourPlan => 'Paketmu';

  @override
  String planEndsOn(String date) {
    return 'Berakhir pada $date';
  }

  @override
  String planRenewsOn(String date) {
    return 'Diperpanjang pada $date';
  }

  @override
  String creditsBalance(String amount) {
    return 'Kredit: $amount';
  }

  @override
  String get manageSubscription => 'Kelola langganan';

  @override
  String get compViaCasama => 'Gratis dari Casama';

  @override
  String compFreeUntil(String date) {
    return 'Gratis hingga $date';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Pembelian uji coba. Batas penguji berlaku: kredit $credits per bulan dan $daily per hari.';
  }

  @override
  String compKeepPlan(String plan) {
    return 'Pertahankan $plan';
  }

  @override
  String get haveGiftCode => 'Punya kode hadiah?';

  @override
  String get redeemCodeTitle => 'Tukarkan kode hadiah';

  @override
  String get redeemCodeIntro =>
      'Masukkan kode yang kamu terima. Paket masuk ke ruang kerja pilihanmu, tanpa biaya.';

  @override
  String get redeemCodeLabel => 'Kode hadiah';

  @override
  String get redeemCodeChecking => 'Memeriksa…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months bulan $plan, gratis',
      one: '1 bulan $plan, gratis',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid =>
      'Kode itu tidak ada atau tidak dapat dipakai lagi.';

  @override
  String get redeemCodeWorkspace => 'Ruang kerja';

  @override
  String get redeemCodeSubmit => 'Tukarkan';

  @override
  String get redeemCodeFinePrint =>
      'Satu kode hadiah per orang. Setelah berakhir, ruang kerja beralih ke paket Gratis kecuali kamu memilih paket.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return '$plan milikmu';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Ruang kerjamu mendapat $plan gratis hingga $date. Buka Casama di perangkat mana saja untuk memakainya.';
  }

  @override
  String get redeemCodeOpenBilling => 'Buka Tagihan';

  @override
  String get redeemCodeNoWorkspace =>
      'Kode hadiah diberikan ke ruang kerja milikmu. Buat dulu satu ruang kerja, lalu buka tautannya lagi.';

  @override
  String get redeemCodeUnavailable =>
      'Fitur ini belum tersedia di versi aplikasi ini.';

  @override
  String usageComputerHours(String hours) {
    return 'Komputer cloud: $hours j';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Tampilan langsung: $minutes mnt';
  }

  @override
  String get thisMonth => 'Bulan ini';

  @override
  String get noBillableUsage => 'Belum ada penggunaan yang ditagihkan.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Hubungkan Casama host mandiri ke ruang kerja ini. Alamat publik dan notifikasi gratis; komputer cloud dan kredit model ditagihkan di sini.';

  @override
  String get linkCloudNewKey => 'Kunci Casama Link baru';

  @override
  String get linkCloudKeyCreated => 'Kunci dibuat';

  @override
  String get linkCloudKeyOnce =>
      'Salin sekarang; hanya ditampilkan sekali. Pasang di servermu dengan CASAMA_CLOUD_URL.';

  @override
  String get copy => 'Salin';

  @override
  String get revoke => 'Cabut';

  @override
  String get instanceName => 'Nama server';

  @override
  String get server => 'Server';

  @override
  String get serverAddress => 'Alamat server';

  @override
  String get serverAddressInvalid =>
      'Masukkan alamat server seperti https://casama.example.com atau http://192.168.1.20:8080.';

  @override
  String get connect => 'Hubungkan';

  @override
  String get changeServer => 'Pakai server lain';

  @override
  String serverIs(String host) {
    return 'Server: $host';
  }

  @override
  String get continueWithSso => 'Lanjutkan dengan SSO';

  @override
  String get workEmail => 'Email kerja';

  @override
  String get privacy => 'Privasi';

  @override
  String get exportMyData => 'Ekspor data saya';

  @override
  String get exportMyDataHelp =>
      'Bot, chat, eksekusi, memori, dan pengaturan. Tanpa rahasia.';

  @override
  String exportReady(String kb) {
    return 'Ekspor siap ($kb KB)';
  }

  @override
  String get runHistoryRetention => 'Simpan riwayat eksekusi selama';

  @override
  String get runHistoryRetentionHelp =>
      'Peristiwa eksekusi yang lebih lama dihapus otomatis.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hari',
      one: '1 hari',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Hapus akun saya';

  @override
  String get deleteAccountHelp =>
      'Menghapus datamu setelah masa tenggang singkat.';

  @override
  String get deleteAccountQuestion => 'Hapus akunmu?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Ruang kerja yang hanya kamu pemiliknya akan dihapus bersama akunmu, termasuk bot dan komputernya. Paket yang kamu beli di web dibatalkan otomatis. Paket yang dibeli di App Store atau Google Play tidak dibatalkan: batalkan di toko tersebut. Ketik $email untuk mengonfirmasi.';
  }

  @override
  String get accountDeleted => 'Akun dijadwalkan untuk dihapus';

  @override
  String accountDeletedBody(String date) {
    return 'Kamu telah keluar. Datamu akan dihapus pada $date.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString langkah',
      one: '1 langkah',
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
      other: 'Tampilkan $countString langkah sebelumnya',
      one: 'Tampilkan 1 langkah sebelumnya',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Disalin';

  @override
  String get jumpToLatest => 'Lompat ke terbaru';

  @override
  String get chatViewFullTable => 'Lihat tabel penuh';

  @override
  String get chatShowMore => 'Show more';

  @override
  String get chatShowLess => 'Show less';

  @override
  String get chatTableTitle => 'Tabel';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Tanyakan apa saja ke $bot, atau ketuk ide di bawah untuk mulai.';
  }

  @override
  String get suggestPlanDay => 'Bantu rencanakan hariku';

  @override
  String get suggestWriteMessage => 'Bantu saya menulis pesan';

  @override
  String get suggestExplain => 'Cari sesuatu dan jelaskan dengan sederhana';

  @override
  String get suggestCapabilities => 'Apa saja yang bisa kamu bantu?';

  @override
  String connectedAppSummary(String app) {
    return '$app terhubung';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama belum memeriksa server ini. Hubungkan hanya jika kamu memercayai $host.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama belum memeriksa server ini. Hubungkan hanya jika kamu memercayai pengelolanya.';

  @override
  String get serverAddressLabel => 'Alamat server';

  @override
  String get serverAddressHelp =>
      'Tempel alamat server. Jika berisi kunci, kunci disimpan terenkripsi dan tidak muncul di chat.';

  @override
  String get serverChecking => 'Memeriksa server…';

  @override
  String serverSignInOn(String host) {
    return 'Kamu akan masuk di $host.';
  }

  @override
  String get serverUseKey => 'Pakai kunci saja';

  @override
  String get serverUseSignIn => 'Masuk saja';

  @override
  String serverSignInUnavailable(String name) {
    return '$name tidak bisa menerima proses masuk lewat browser dari server Casama ini. Pakai kunci.';
  }

  @override
  String get serverNoSignIn => 'Server ini berfungsi tanpa masuk.';

  @override
  String get serverHeaderLabel => 'Nama header (opsional)';

  @override
  String get serverToolsTitle => 'Alat yang bisa dipakai';

  @override
  String get serverToolsHelp =>
      'Matikan yang tidak kamu inginkan. Bot tetap bertanya sebelum langkah berisiko.';

  @override
  String addedInChatBy(String bot) {
    return 'Ditambahkan di chat oleh $bot';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name berjalan di komputermu sendiri. Buka Casama di komputer itu dan aktifkan Pakai komputer ini untuk menambahkannya.';
  }

  @override
  String get connectAppsTitle => 'Hubungkan aplikasimu';

  @override
  String get moreApps => 'Lainnya';

  @override
  String addAppTile(String app) {
    return 'Tambahkan $app ke bot ini';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return '$app ditambahkan ke $bot';
  }

  @override
  String get connectAppsHint =>
      'Izinkan saya membaca dan bertindak di alat yang sudah kamu pakai.';

  @override
  String connectAppTile(String app) {
    return 'Hubungkan $app';
  }

  @override
  String get showComputer => 'Tampilkan komputer';

  @override
  String get hideComputer => 'Sembunyikan komputer';

  @override
  String get moreActions => 'Lainnya';

  @override
  String get noConversations => 'Belum ada percakapan';

  @override
  String get untitledChat => 'Percakapan baru';

  @override
  String get listening => 'Mendengarkan…';

  @override
  String get orLabel => 'atau';

  @override
  String get notificationsPrimerBubble => 'Jangan sampai ketinggalan!';

  @override
  String get notificationsPrimerTitle => 'Aktifkan notifikasi';

  @override
  String get notificationsPrimerBody =>
      'Botmu memberi tahu saat mereka butuh keputusanmu, atau saat pekerjaannya selesai.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome memblokir notifikasi untuk situs ini. Izinkan dari ikon gembok di bilah alamat, lalu ketuk Aktifkan lagi.';

  @override
  String get notificationsTurnOn => 'Aktifkan';

  @override
  String get autoUpdates => 'Perbarui otomatis';

  @override
  String get autoUpdatesHelp => 'Memasang versi baru saat kamu keluar.';

  @override
  String get upToDate => 'Casama sudah terbaru';

  @override
  String get noReleasesToCheck =>
      'Belum ada rilis yang diterbitkan untuk komputer ini, jadi belum ada yang bisa dibandingkan dengan versi ini.';

  @override
  String updateReady(String version) {
    return 'Casama $version tersedia';
  }

  @override
  String appVersion(String version) {
    return 'Versi $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Yang baru di Casama $version';
  }

  @override
  String get whatsNewGotIt => 'Mengerti';

  @override
  String get whatsNewSubtitle =>
      'Berikut perubahan sejak pembaruan terakhirmu.';

  @override
  String get whatsNew010Calls =>
      'Telepon botmu dan bahas semuanya. Mereka menjawab dengan suara, lengkap dengan teks.';

  @override
  String get whatsNew010Looks =>
      'Jadikan Casama milikmu: tema, skema warna, font, dan wallpaper di Pengaturan → Tampilan, dengan lebih banyak lagi di galeri.';

  @override
  String get whatsNew010AboutYou =>
      'Ceritakan tentang dirimu ke bot sekali saja, di Pengaturan → Tentangmu: panggilan yang kamu suka dan gaya balasannya.';

  @override
  String get whatsNew010SignIn =>
      'Masuk dengan kunci sandi, Apple, Google, atau kode dari emailmu.';

  @override
  String get openAtLogin => 'Buka saat login';

  @override
  String get openAtLoginHelp => 'Siap untuk pintasan tanya cepat.';

  @override
  String get signInTagline =>
      'Rekan tim yang tetap bekerja setelah kamu menutup aplikasi.';

  @override
  String get signInTagline2 => 'Kenalan dengan tim AI kamu.';

  @override
  String get signInTagline3 =>
      'AI yang tidak cuma bicara, tapi juga membereskan tugas.';

  @override
  String get signInTagline4 =>
      'Rekan tim andal yang bertanya dulu sebelum bertindak.';

  @override
  String get signInTagline5 => 'Serahkan tugasnya. Kembali saat sudah beres.';

  @override
  String get noBotsHelp =>
      'Bot adalah rekan tim dengan komputernya sendiri. Buat satu untuk mulai chat.';

  @override
  String get newBotSubtitle =>
      'Rekan tim dengan komputer dan memorinya sendiri.';

  @override
  String get appearance => 'Tampilan';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI, atau penyedia lain yang kompatibel';

  @override
  String get signOutConfirm =>
      'Kamu bisa masuk kembali kapan saja; botmu tetap bekerja.';

  @override
  String get roleOwner => 'Pemilik';

  @override
  String get roleAdmin => 'Admin';

  @override
  String get roleMember => 'Anggota';

  @override
  String get themeLight => 'Terang';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeDark => 'Gelap';

  @override
  String get createWorkspaceBody =>
      'Ruang kerja menampung bot, komputer mereka, dan orang-orang yang bekerja bersamamu.';

  @override
  String get workspaceNameHint => 'Tim saya';

  @override
  String get orJoinWithCode => 'atau bergabung dengan kode undangan';

  @override
  String get getOpenRouterKey => 'Dapatkan kunci OpenRouter';

  @override
  String get createFirstBotBody =>
      'Beri nama dan pilih model. Kamu bisa mengubah keduanya nanti.';

  @override
  String stepOf(int step, int total) {
    return 'Langkah $step dari $total';
  }

  @override
  String get providerHintOpenRouter => 'disarankan: chat, gambar, video, suara';

  @override
  String get providerHintGoogle => 'hanya panggilan langsung';

  @override
  String get providerHintCompatible =>
      'API apa pun yang kompatibel dengan OpenAI';

  @override
  String get providerHintSearch => 'pencarian web';

  @override
  String get noRoutinesHelp =>
      'Rutinitas adalah pekerjaan yang dilakukan bot nanti secara mandiri: sekali pada waktu pilihanmu, sesuai jadwal, atau saat webhook tiba.';

  @override
  String get routineOnce => 'Sekali';

  @override
  String lastRun(String when) {
    return 'Terakhir: $when';
  }

  @override
  String get routineOff => 'Nonaktif';

  @override
  String get routineEnds => 'Berakhir';

  @override
  String get routineEndsNever => 'Tidak pernah';

  @override
  String get routineEndsOnDate => 'Pada tanggal tertentu';

  @override
  String get routineEndsAfterRuns => 'Setelah beberapa kali jalan';

  @override
  String get routineEndDate => 'Hari terakhir';

  @override
  String get routineRunCountLabel => 'Eksekusi';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n eksekusi',
      one: '1 eksekusi',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return 'Berakhir $when';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n eksekusi tersisa',
      one: '1 eksekusi tersisa',
      zero: 'Tidak ada eksekusi tersisa',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'Waktu berakhir';

  @override
  String get routineEndTitle => 'Waktu berakhir';

  @override
  String get routineEndSubtitle =>
      'Rutinitas akan mati sendiri saat itu. Jumlah eksekusi baru dihitung dari sekarang.';

  @override
  String deleteRoutineTitle(String name) {
    return 'Hapus “$name”?';
  }

  @override
  String get deleteRoutineBody =>
      'Rutinitas ini tidak akan berjalan lagi. Hasil yang sudah dikirim tetap ada di percakapannya.';

  @override
  String get triggerOnce => 'Sekali';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Dalam $nString mnt';
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
      other: 'Dalam $nString jam',
      one: 'Dalam 1 jam',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Besok $time';
  }

  @override
  String get integrationNeedsName => 'Beri nama dengan minimal satu huruf.';

  @override
  String integrationNeedsField(String field) {
    return 'Isi $field untuk menyimpan.';
  }

  @override
  String integrationSavedAs(String name) {
    return 'Disimpan sebagai $name';
  }

  @override
  String get integrationUrlInvalid =>
      'Gunakan alamat lengkap yang diawali https://';

  @override
  String get openFile => 'Buka';

  @override
  String get saveFile => 'Simpan';

  @override
  String get shareFile => 'Bagikan';

  @override
  String savedFile(String name) {
    return '$name disimpan';
  }

  @override
  String noAppToOpen(String name) {
    return 'Tidak ada aplikasi di perangkat ini yang bisa membuka $name. Simpan saja.';
  }

  @override
  String get previewUnavailable =>
      'Tidak ada pratinjau untuk jenis file ini. Buka atau simpan untuk melihatnya.';

  @override
  String get openInSystemPlayer => 'Buka di pemutar videomu';

  @override
  String get playMedia => 'Putar';

  @override
  String get fullScreen => 'Layar penuh';

  @override
  String get exitFullScreen => 'Keluar dari layar penuh';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
      one: '1 halaman',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Buka di browser';

  @override
  String get convertingToPdf => 'Menyiapkan pratinjau…';

  @override
  String tableFirstRows(int count) {
    return 'Menampilkan $count baris pertama';
  }

  @override
  String get imageCouldNotLoad => 'Gagal memuat gambar ini';

  @override
  String get mediaKindImage => 'Gambar';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaKindAudio => 'Audio';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Buka file';

  @override
  String get attach => 'Lampirkan';

  @override
  String get attachFiles => 'File';

  @override
  String get attachPhotos => 'Pustaka foto';

  @override
  String get attachCamera => 'Ambil foto';

  @override
  String get attachScan => 'Pindai dokumen';

  @override
  String get scanFailed => 'Gagal memindai dokumen. Coba lagi.';

  @override
  String get dropToAttach => 'Lepas file untuk melampirkan';

  @override
  String uploadFailed(String name) {
    return 'Gagal mengunggah $name';
  }

  @override
  String attachFailed(String name, String reason) {
    return 'Gagal melampirkan $name: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return 'Gagal melampirkan $name';
  }

  @override
  String get sendWithoutIt => 'Kirim tanpa file itu';

  @override
  String get sendWithoutThem => 'Kirim tanpa file-file itu';

  @override
  String get removeAttachment => 'Hapus';

  @override
  String get editPhoto => 'Edit foto';

  @override
  String get retryUpload => 'Coba lagi';

  @override
  String get uploadingAttachments => 'Mengunggah…';

  @override
  String get notSent => 'Tidak terkirim';

  @override
  String get deleteChat => 'Hapus chat';

  @override
  String get deleteChatTitle => 'Hapus chat ini?';

  @override
  String deleteChatBody(String bot) {
    return 'Pesannya dihapus untuk semua orang yang bisa melihatnya. Yang dibuat $bot di sini tetap ada di Pustaka, catatan penggunaan tetap ada, dan yang diingatnya dari sini tetap ada di memorinya.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hapus juga $count item yang dibuat di sini',
      one: 'Hapus juga 1 item yang dibuat di sini',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp =>
      'Nonaktif: item tetap ada di Pustaka.';

  @override
  String get chatDeleted => 'Chat dihapus';

  @override
  String get deleteAllChats => 'Hapus semua chat';

  @override
  String get deleteAllChatsRow =>
      'Mulai lagi dengan riwayat bersih. Memori tetap ada.';

  @override
  String deleteAllChatsTitle(String bot) {
    return 'Hapus semua chat dengan $bot?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return 'Setiap chat dengan $bot yang bisa kamu hapus akan hilang beserta pesan, foto, dan filenya. Chat grup tetap ada. Catatan penggunaan tetap ada, dan yang diingat $bot tetap ada di memorinya.';
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
      other: '$nString chat dihapus.',
      one: '1 chat dihapus.',
      zero: 'Tidak ada chat untuk dihapus.',
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
          '$nString chat dipertahankan karena bot masih bekerja di dalamnya.',
      one: '1 chat dipertahankan karena bot masih bekerja di dalamnya.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          '$n bot ada di chat ini. Masing-masing menyimpan memori dan pengaturannya sendiri.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention =>
      'Ketik @ dan nama untuk bertanya langsung ke satu bot.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone: $lead menjawab lebih dulu dan membagi tugas jika ada pekerjaan yang perlu dibagi; jika tidak, tiap bot menjawab bergiliran dan yang terakhir menutupnya.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Tanpa sebutan, bot yang berbicara terakhir yang menjawab ($lead di awal).';
  }

  @override
  String get messageNotSent =>
      'Filemu gagal diunggah, jadi pesan tidak terkirim. Pesan dikembalikan ke kotak.';

  @override
  String get chatSendsWhenDone => 'Dikirim setelah balasan ini selesai';

  @override
  String get noComputerForFiles =>
      'Bot ini tidak punya komputer untuk menyimpan file.';

  @override
  String fileTooLarge(String name) {
    return '$name melebihi 25 MB, terlalu besar untuk dilampirkan.';
  }

  @override
  String get secretsHelp =>
      'Bot memasukkan rahasia ke permintaan lewat namanya. Rahasia hanya dikirim ke host yang kamu izinkan dan model tidak pernah melihatnya.';

  @override
  String deleteSecretTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get deleteSecretBody =>
      'Bot yang memakainya tidak akan bisa lagi menjangkau layanan itu.';

  @override
  String get hide => 'Sembunyikan';

  @override
  String get show => 'Tampilkan';

  @override
  String get deleteMemoryTitle => 'Hapus memori ini?';

  @override
  String get noMemoriesHelp =>
      'Saat kamu chat, bot menyimpan hal yang penting: fakta, preferensi, dan ringkasan pekerjaan sebelumnya.';

  @override
  String get memoryHelp =>
      'Memori yang disematkan selalu ada di konteks bot. Edit jika ada yang salah; memori yang dihapus hilang selamanya.';

  @override
  String get memoryFact => 'Fakta';

  @override
  String get memoryPreference => 'Preferensi';

  @override
  String get memorySummary => 'Ringkasan';

  @override
  String get memoryEpisode => 'Episode';

  @override
  String get pinned => 'Disematkan';

  @override
  String get editMemory => 'Edit memori';

  @override
  String get editMemoryHelp => 'Bot memakai ini saat relevan nanti.';

  @override
  String get modelKeysIntro =>
      'Bot berpikir dengan kunci penyedia modelmu sendiri. Kunci disimpan terenkripsi dan tidak akan ditampilkan lagi.';

  @override
  String get casamaCloudKeyHint => 'Dibayar dari kreditmu';

  @override
  String get casamaCloudIncluded => 'Termasuk';

  @override
  String get casamaCloudModelLocked => 'Casama memilih model ini.';

  @override
  String get serverVoiceSetUp =>
      'Server ini menyediakan suara, jadi tidak ada kunci yang perlu ditambahkan. Kunci milik ruang kerja dipakai lebih dulu.';

  @override
  String modelKeysFor(String workspace) {
    return 'Kunci hanya milik satu ruang kerja. Ini untuk $workspace.';
  }

  @override
  String get yourKeys => 'Kuncimu';

  @override
  String get keyWorking => 'Berfungsi';

  @override
  String get keyFailing => 'Gagal';

  @override
  String get keyUntested => 'Belum diuji';

  @override
  String get skillsHelp =>
      'Keahlian adalah serangkaian instruksi yang dimuat bot saat tugas membutuhkannya, seperti gaya penulisan laporanmu.';

  @override
  String get skillsForAllBots => 'Semua bot';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Hanya untuk $bot';
  }

  @override
  String get skillsRemovedBot => 'Bot yang dihapus';

  @override
  String deleteSkillTitle(String name) {
    return 'Hapus keahlian “$name”?';
  }

  @override
  String get editSkill => 'Edit keahlian';

  @override
  String get deleteSkill => 'Hapus keahlian';

  @override
  String get skillDescriptionHelp =>
      'Bot membaca ini untuk menentukan kapan keahlian berlaku.';

  @override
  String get skillBodyHint => '# Langkah\n1. …';

  @override
  String get computersHelp =>
      'Setiap bot bekerja di komputer: komputer tim yang dipakai bersama, atau komputer pribadi. File tetap tersimpan di sana di antara chat.';

  @override
  String get computersEmptyTitle => 'Belum ada komputer';

  @override
  String get thisDevice => 'Perangkat ini';

  @override
  String get personalComputerConnected => 'Terhubung';

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
    return 'Disk $size';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Terakhir dipakai $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Terakhir terlihat $when';
  }

  @override
  String get computerSaved => 'Tersimpan';

  @override
  String get computerSavedHelp => 'Filenya tetap tersimpan saat dihentikan';

  @override
  String computerCanUse(Object list) {
    return 'Bot bisa memakai: $list';
  }

  @override
  String get computerCanUseNothing => 'Bot belum bisa memakainya';

  @override
  String get computerCapShell => 'Terminal';

  @override
  String get computerCapFiles => 'File';

  @override
  String get computerCapBrowser => 'Browser';

  @override
  String get computerCapDesktop => 'Layar';

  @override
  String get computerCapMcp => 'Alat lokal';

  @override
  String get computerCapMessages => 'Pesan';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name sedang offline. Buka Casama di sana dan aktifkan \"Pakai komputer ini untuk bot\". Komputermu sendiri tidak pernah memakai jam komputer paketmu.';
  }

  @override
  String get yourComputerOffline => 'Komputermu sedang offline';

  @override
  String get howToFix => 'Cara memperbaiki';

  @override
  String get computerHoursUsedTitle => 'Jam komputer habis';

  @override
  String get personalScreenNote =>
      'Ini adalah komputermu sendiri, jadi kamu melihat tangkapan layar baru setiap beberapa detik alih-alih tampilan langsung.';

  @override
  String get renameComputer => 'Ganti nama komputer';

  @override
  String deleteComputerTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get privacyIntro =>
      'Chat, memori, dan filemu adalah milikmu. Ekspor kapan saja, atau hapus akunmu.';

  @override
  String get yourData => 'Datamu';

  @override
  String get shareAnalytics => 'Bagikan data penggunaan';

  @override
  String get shareAnalyticsHelp =>
      'Laporan penggunaan dan kerusakan. Tidak pernah pesan atau filemu.';

  @override
  String get measureAds => 'Bantu ukur iklan kami';

  @override
  String get measureAdsHelp =>
      'Memungkinkan Casama memberi tahu Meta saat seseorang yang melihat iklan kami bergabung atau berlangganan. Casama tidak pernah menampilkan iklan.';

  @override
  String get measureAdsNeedsUsageData =>
      'Aktifkan Bagikan data penggunaan untuk memakai ini.';

  @override
  String get trackingTile => 'Izinkan pelacakan';

  @override
  String get trackingAllowed =>
      'Diizinkan. SDK Meta berjalan di perangkat ini dan Casama dapat memberi tahu Meta saat kamu bergabung atau berlangganan setelah melihat iklan kami. Ubah di aplikasi Pengaturan.';

  @override
  String get trackingNotAllowed =>
      'Tidak diizinkan. Tidak ada yang dikirim dari perangkat ini ke Meta. Ubah di aplikasi Pengaturan.';

  @override
  String get trackingNotAsked =>
      'Casama belum bertanya. Sampai kamu mengizinkannya, tidak ada yang dikirim dari perangkat ini ke Meta.';

  @override
  String get trackingOpenSettings => 'Buka Pengaturan';

  @override
  String get workspaceAnalytics => 'Data penggunaan untuk ruang kerja ini';

  @override
  String get workspaceAnalyticsHelp =>
      'Data penggunaan untuk ruang kerja ini. Laporan kerusakan tetap aktif.';

  @override
  String get dangerZone => 'Zona bahaya';

  @override
  String get quotasHelp => 'Kosongkan kolom jika tidak ada batas.';

  @override
  String get serviceOff => 'Nonaktif';

  @override
  String get serviceDown => 'Mati';

  @override
  String get serviceOk => 'OK';

  @override
  String get sendInvite => 'Kirim undangan';

  @override
  String get thinking0 => 'Model';

  @override
  String get saveChanges => 'Simpan perubahan';

  @override
  String get autonomyAskAlwaysHelp =>
      'Bertanya kepadamu sebelum setiap tindakan yang mengubah sesuatu.';

  @override
  String get autonomyAskRiskyHelp =>
      'Bekerja sendiri, tetapi bertanya sebelum melakukan hal berisiko, seperti menghapus file atau mengeluarkan uang.';

  @override
  String get autonomyAutonomousHelp =>
      'Bertindak tanpa bertanya. Terbaik untuk rutinitas yang kamu percaya.';

  @override
  String get usageSubtitle => 'Pengeluaran model bulan ini';

  @override
  String get skillsRowHelp =>
      'Instruksi yang dimuat bot saat tugas membutuhkannya';

  @override
  String get integrationsRowHelp => 'Server MCP dan aplikasi terhubung';

  @override
  String get secretsRowHelp =>
      'Token dan kata sandi, hanya dikirim ke tempat yang kamu izinkan';

  @override
  String get computersRowHelp => 'Komputer tim dan komputer pribadi';

  @override
  String get companionRowHelp =>
      'Izinkan bot memakai aplikasi dan file perangkat ini';

  @override
  String get privacyRowHelp => 'Ekspor datamu atau hapus akunmu';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'Belum ada integrasi';

  @override
  String get integrationsHelp =>
      'Integrasi memberi bot lebih banyak alat: server MCP, sumber OpenAPI, Composio, atau Pipedream. Setiap alat dinamai sesuai integrasinya.';

  @override
  String get botIntegrationsHelp =>
      'Aktifkan integrasi yang boleh dipakai bot ini. Alatnya muncul saat bot berjalan berikutnya.';

  @override
  String get openSettings => 'Buka Pengaturan';

  @override
  String get noRunsHelp =>
      'Setiap kali bot ini bekerja, dari chat, rutinitas, atau webhook, eksekusinya muncul di sini beserta hasil dan biayanya.';

  @override
  String get runCompleted => 'Selesai';

  @override
  String get runWaiting => 'Menunggu';

  @override
  String get runWorking => 'Bekerja';

  @override
  String get triggerChat => 'Chat';

  @override
  String get triggerRoutine => 'Rutinitas';

  @override
  String get noEventsForFilter => 'Tidak ada jenis ini di eksekusi ini.';

  @override
  String get runStatusFailed => 'Gagal';

  @override
  String get runStatusStopped => 'Dihentikan';

  @override
  String get quickAskIntro =>
      'Kirim permintaan cepat. Ini memulai chat baru dengan bot pilihanmu.';

  @override
  String quickAskIntroBot(String name) {
    return 'Kirim permintaan cepat. Ini memulai chat baru dengan $name.';
  }

  @override
  String quickAskHintBot(String bot) {
    return 'Apa yang harus dilakukan $bot?';
  }

  @override
  String get stateProvisioning => 'Menyiapkan';

  @override
  String get stateStarting => 'Memulai';

  @override
  String get computerRestoringFiles => 'Memulihkan file…';

  @override
  String get stateRunning => 'Berjalan';

  @override
  String get stateIdle => 'Diam';

  @override
  String get stateSleeping => 'Tidur';

  @override
  String get stateStopped => 'Berhenti';

  @override
  String get stateError => 'Kesalahan';

  @override
  String get terminalHelp =>
      'Shell di komputer ini. Bot memakai shell yang sama, jadi kamu bisa melihat dan memperbaiki yang dilakukannya.';

  @override
  String get up => 'Naik';

  @override
  String get emptyFolderHelp =>
      'File yang dibuat botmu, dan file yang kamu unggah, muncul di sini.';

  @override
  String deleteFileTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get botComputerAuto => 'Otomatis';

  @override
  String get botComputerHelp =>
      'Komputer bot sendiri: tempatnya menjalankan perintah, menjelajah, dan menyimpan filenya.';

  @override
  String get billingOffTitle => 'Tidak ada tagihan di sini';

  @override
  String revokeKeyTitle(String name) {
    return 'Cabut kunci untuk $name?';
  }

  @override
  String get revokeKeyBody =>
      'Server itu langsung berhenti memakai komputer cloud dan kredit.';

  @override
  String get handBackHelp =>
      'Bot melanjutkan dari bagian terakhirmu. Beri tahu apa yang kamu lakukan, jika membantu.';

  @override
  String get serverHelp =>
      'Pakai server Casama-mu sendiri. Masukkan alamat yang kamu atau adminmu siapkan.';

  @override
  String get ssoHelp =>
      'Masukkan email kerjamu dan kami akan mengarahkanmu ke halaman masuk perusahaanmu.';

  @override
  String get colorScheme => 'Skema warna';

  @override
  String get searchThemes => 'Cari skema';

  @override
  String get noThemesFound => 'Tidak ada skema yang cocok.';

  @override
  String get noAppsMatch =>
      'Tidak ada aplikasi yang cocok. Kamu bisa menambahkan servermu sendiri di Lanjutan.';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aplikasi',
      one: '1 aplikasi',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => 'Semua';

  @override
  String get familyPurple => 'Ungu';

  @override
  String get familyBlue => 'Biru';

  @override
  String get familyTeal => 'Teal';

  @override
  String get familyGreen => 'Hijau';

  @override
  String get familyWarm => 'Hangat';

  @override
  String get familyRed => 'Merah & merah muda';

  @override
  String get familyNeutral => 'Netral';

  @override
  String get background => 'Latar belakang';

  @override
  String get backgroundPattern => 'Pola';

  @override
  String get backgroundColors => 'Warna';

  @override
  String get backgroundThemeColors => 'Tema';

  @override
  String get patternStrength => 'Ketebalan pola';

  @override
  String get wallpaperEverywhere => 'Tampilkan di setiap layar';

  @override
  String get wallpaperEverywhereHelp =>
      'Matikan agar hanya tampil di belakang chat.';

  @override
  String get resetBackground => 'Kembalikan ke default';

  @override
  String get copyMessage => 'Salin';

  @override
  String get selectText => 'Pilih teks';

  @override
  String get shareMessage => 'Bagikan';

  @override
  String get messageCopied => 'Disalin';

  @override
  String get botUiBroken => 'Bagian balasan ini tidak dapat ditampilkan.';

  @override
  String get botUiSent => 'Terkirim';

  @override
  String get botUiConnected => 'Terhubung';

  @override
  String get draftNewEmail => 'Email baru';

  @override
  String get draftNewMessage => 'Pesan baru';

  @override
  String get draftNewPost => 'Postingan baru';

  @override
  String get draftReadyToSend => 'Siap dikirim';

  @override
  String get draftReadyToPost => 'Siap diposting';

  @override
  String get draftEdited => 'Diedit';

  @override
  String get draftSendEmail => 'Kirim email';

  @override
  String get draftSend => 'Kirim';

  @override
  String get draftPost => 'Posting';

  @override
  String get draftDiscard => 'Buang';

  @override
  String get draftEdit => 'Edit';

  @override
  String get draftDoneEditing => 'Selesai';

  @override
  String get draftFrom => 'Dari';

  @override
  String get draftTo => 'Kepada';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Bcc';

  @override
  String get draftSubject => 'Subjek';

  @override
  String get botCardNewEvent => 'Acara baru';

  @override
  String get botCardEvent => 'Acara';

  @override
  String get botCardReadyToAdd => 'Siap ditambahkan';

  @override
  String get botCardAddToCalendar => 'Tambahkan ke kalender';

  @override
  String get botCardChange => 'Ubah';

  @override
  String get botCardSkip => 'Lewati';

  @override
  String get botCardAllDay => 'Seharian';

  @override
  String botCardMore(int count) {
    return '+$count lainnya';
  }

  @override
  String get botCardAgenda => 'Agenda';

  @override
  String get botCardMessages => 'Pesan';

  @override
  String botCardUnread(int count) {
    return '$count belum dibaca';
  }

  @override
  String get botCardReply => 'Balas';

  @override
  String botCardReplyTo(String name) {
    return 'Balas ke $name';
  }

  @override
  String get botCardTasks => 'Tugas';

  @override
  String botCardDoneOf(int done, int total) {
    return '$done dari $total selesai';
  }

  @override
  String get botCardSaveChanges => 'Simpan perubahan';

  @override
  String get botCardChoose => 'Pilih';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'Siapa yang kamu maksud?';

  @override
  String get botCardNoneOfThese => 'Bukan salah satu ini';

  @override
  String get botCardReminder => 'Pengingat';

  @override
  String get botCardRoutine => 'Rutinitas';

  @override
  String get botCardWatcher => 'Memantau';

  @override
  String get botCardScheduled => 'Terjadwal';

  @override
  String botCardNext(String when) {
    return 'Berikutnya: $when';
  }

  @override
  String get botCardCancelIt => 'Batalkan';

  @override
  String get botIcon => 'Ikon';

  @override
  String get botIconInitials => 'Inisial';

  @override
  String get errorDetailsTitle => 'Yang salah';

  @override
  String get exportLabel => 'Ekspor';

  @override
  String get openTimeline => 'Buka linimasa eksekusi';

  @override
  String get details => 'Detail';

  @override
  String get themes => 'Tema';

  @override
  String get myThemes => 'Temamu';

  @override
  String get saveTheme => 'Simpan tema saat ini';

  @override
  String get themeName => 'Nama tema';

  @override
  String get importTheme => 'Impor tema';

  @override
  String get themeCode => 'Kode tema';

  @override
  String get themeCodeHelp =>
      'Tempel kode yang dibagikan kepadamu. Diawali dengan casama-theme:';

  @override
  String get invalidThemeCode => 'Itu bukan kode tema Casama.';

  @override
  String themeImported(String name) {
    return '$name ditambahkan ke temamu';
  }

  @override
  String get themeCodeCopied =>
      'Kode tema disalin. Siapa saja bisa menempelkannya di Tampilan → Impor tema.';

  @override
  String get shareTheme => 'Bagikan kode';

  @override
  String deleteThemeTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get fonts => 'Font';

  @override
  String get headingFont => 'Judul';

  @override
  String get bodyFont => 'Teks';

  @override
  String get fontsHelp =>
      'Google Sans dan Noto Serif sudah tersedia di aplikasi dan berfungsi offline. Google Fonts lainnya diunduh saat pertama kali kamu pilih.';

  @override
  String get searchFonts => 'Cari semua Google Fonts';

  @override
  String get suggestedFonts => 'Disarankan';

  @override
  String get allFonts => 'Semua Google Fonts';

  @override
  String get noFontsFound => 'Tidak ada font dengan nama itu';

  @override
  String get resetFonts => 'Pakai default';

  @override
  String get fontSample => 'Botmu, bekerja bersamamu.';

  @override
  String get backgroundPhoto => 'Foto';

  @override
  String get yourPhoto => 'Fotomu';

  @override
  String get browsePhotos => 'Jelajahi foto';

  @override
  String get removePhoto => 'Hapus foto';

  @override
  String get photoBlur => 'Buram';

  @override
  String get photoDim => 'Redup';

  @override
  String photoBy(String name) {
    return 'Foto oleh $name di Unsplash';
  }

  @override
  String get searchPhotos => 'Cari foto';

  @override
  String get photosUnavailable => 'Gagal memuat foto.';

  @override
  String get noPhotos => 'Foto tidak ditemukan';

  @override
  String get photoHelp =>
      'Foto ditempatkan di bawah coretan. Buram dan redup menjaga teks tetap terbaca di atasnya.';

  @override
  String get periodToday => 'Hari ini';

  @override
  String get periodWeek => 'Minggu ini';

  @override
  String get periodYear => 'Tahun ini';

  @override
  String get totalSpend => 'Pengeluaran';

  @override
  String get tokensIn => 'Token masuk';

  @override
  String get tokensOut => 'Token keluar';

  @override
  String get runsLabel => 'Eksekusi';

  @override
  String get spendByDay => 'Pengeluaran harian';

  @override
  String get byBot => 'Per bot';

  @override
  String get byModel => 'Per model';

  @override
  String get everythingMetered => 'Semua terukur';

  @override
  String get bySource => 'Per sumber';

  @override
  String get byPerson => 'Per orang';

  @override
  String get usageAllBots => 'Semua bot';

  @override
  String get usageAllModels => 'Semua model';

  @override
  String get usageAllSources => 'Semua sumber';

  @override
  String get usageEveryone => 'Semua orang';

  @override
  String get usageJustMe => 'Hanya saya';

  @override
  String get usageClearFilters => 'Bersihkan';

  @override
  String get usageFilterBot => 'Filter berdasarkan bot';

  @override
  String get usageFilterModel => 'Filter berdasarkan model';

  @override
  String get usageFilterSource => 'Filter berdasarkan sumber';

  @override
  String get usageFilterPerson => 'Filter berdasarkan orang';

  @override
  String get usageSourceChat => 'Chat';

  @override
  String get usageSourceChatApp => 'Aplikasi chat';

  @override
  String get usageSourceRoutine => 'Rutinitas';

  @override
  String get usageSourceApi => 'API dan agent lainnya';

  @override
  String get usageSourceOther => 'Lainnya';

  @override
  String get usageNoPerson => 'Otomatis';

  @override
  String get usageUnnamedPerson => 'Anggota tanpa nama';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n eksekusi',
      one: '1 eksekusi',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'Ekspor CSV';

  @override
  String get exportJson => 'Ekspor JSON';

  @override
  String get askBotAboutUsage => 'Tanya bot tentang ini';

  @override
  String get noUsageYet => 'Belum ada penggunaan dalam periode ini.';

  @override
  String get otherModel => 'Komputer dan lainnya';

  @override
  String get deletedBot => 'Tidak terkait bot';

  @override
  String get usageHelp =>
      'Biaya adalah perkiraan dari jumlah token dan harga resmi. Tagihan penyedia modelmu adalah angka finalnya.';

  @override
  String usageAskPrompt(String period, String summary) {
    return 'Ini penggunaan Casama saya untuk $period. Bantu saya memahami ke mana uangnya keluar dan bagaimana saya bisa lebih hemat. Kamu juga bisa memeriksa angka langsung dengan alat penggunaanmu.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Input model';

  @override
  String get kindTokensOut => 'Output model';

  @override
  String get kindComputer => 'Waktu komputer cloud';

  @override
  String get kindModels => 'Model AI';

  @override
  String get creditsThisMonth => 'Kredit bulan ini';

  @override
  String creditsUsedPercent(int percent) {
    return '$percent% terpakai';
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
      other: 'Sekitar $nString eksekusi lagi dengan biaya biasamu',
      one: 'Sekitar 1 eksekusi lagi dengan biaya biasamu',
      zero: 'Kurang dari satu eksekusi lagi dengan biaya biasamu',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'Kreditmu habis. Tambahkan lagi agar botmu tetap berjalan.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 kredit = $price. Paketmu menambahkan $amount setiap bulan; kredit yang tidak terpakai terbawa satu bulan lagi.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 kredit = $price. Paket kredit dari App Store atau Google Play tidak pernah kedaluwarsa; paket kredit yang dibeli di web berlaku 12 bulan.';
  }

  @override
  String get creditsDailyLabel => 'Batas hari ini';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used dari $cap';
  }

  @override
  String get creditsDailyExplainer =>
      'Batas yang bisa dipakai paketmu per hari untuk model, suara, dan aplikasi Casama, berapa pun sisa kreditnya.';

  @override
  String get creditsDailyReached =>
      'Batas hari ini tercapai, jadi botmu dijeda. Upgrade untuk batas harian lebih tinggi.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Direset sekitar $n jam lagi.',
      one: 'Direset sekitar 1 jam lagi.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => 'Direset kurang dari satu jam lagi.';

  @override
  String get creditsHoursLabel => 'Jam komputer';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used dari $limit j';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Waktu berjalannya komputer botmu bulan ini. Jika habis, chat tetap berfungsi; hanya komputernya yang berhenti. Direset pada $date.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'Jam komputer bulan ini sudah habis, jadi komputermu tidak bisa dimulai. Chat tetap berfungsi. Direset pada $date. Upgrade untuk jam lebih banyak.';
  }

  @override
  String get kindStream => 'Tampilan langsung';

  @override
  String get kindTts => 'Bacakan';

  @override
  String get computerMissingTitle => 'Komputer tidak ditemukan';

  @override
  String get computerMissingHelp =>
      'Mungkin sudah dihapus, atau daftarnya belum diperbarui. Muat ulang untuk memeriksa lagi.';

  @override
  String get computerMissingBotHelp =>
      'Komputer bot ini mungkin sudah dihapus, atau daftarnya belum diperbarui. Muat ulang, atau pilih komputer lain untuk bot ini.';

  @override
  String get computerChoose => 'Pilih komputer';

  @override
  String get personaWork => 'Kerja';

  @override
  String get personaResearch => 'Riset';

  @override
  String get personaBuild => 'Bangun';

  @override
  String get personaCreate => 'Buat';

  @override
  String get personaLife => 'Hidup';

  @override
  String get personaOther => 'Lainnya';

  @override
  String get blankBotHelp => 'Mulai dari awal dan tulis instruksimu sendiri.';

  @override
  String get browse => 'Jelajahi';

  @override
  String get browseAllPersonas => 'Jelajahi semua';

  @override
  String get botIdentity => 'Nama dan ikon';

  @override
  String get serviceKeys => 'Kunci layanan';

  @override
  String get noServiceKeys => 'Belum ada kunci layanan.';

  @override
  String get serviceKeysHelp => 'Kunci pencarian, peta, atau datamu sendiri';

  @override
  String get serviceKeysIntro =>
      'Casama menjalankan model, suara, dan gambar untukmu. Tambahkan kunci di sini hanya untuk memakai layanan pencarian, peta, atau datamu sendiri. Kunci disimpan terenkripsi dan tidak akan ditampilkan lagi.';

  @override
  String get choosePersona => 'Pilih persona';

  @override
  String get choosePersonaHelp =>
      'Masing-masing dilengkapi instruksi, gaya, serta terkadang keahlian dan rutinitas. Kamu bisa mengubah apa pun setelahnya.';

  @override
  String get searchPersonas => 'Cari persona';

  @override
  String get noPersonasFound => 'Tidak ada persona yang cocok';

  @override
  String get previewPersona => 'Pratinjau';

  @override
  String get personaInstructions => 'Instruksi';

  @override
  String get personaTryAsking => 'Coba tanyakan';

  @override
  String usePersona(String name) {
    return 'Pakai $name';
  }

  @override
  String get loadPersona => 'Muat persona';

  @override
  String get replaceInstructionsTitle => 'Ganti instruksi?';

  @override
  String replaceInstructionsBody(String name) {
    return 'Instruksi bot saat ini akan diganti dengan milik $name. Keahlian dan rutinitas tetap seperti semula.';
  }

  @override
  String get replace => 'Ganti';

  @override
  String get appsTitle => 'Aplikasi';

  @override
  String get appsSubtitle => 'Beri botmu alat yang sudah dipakai timmu.';

  @override
  String get connectedTab => 'Terhubung';

  @override
  String get browseTab => 'Jelajahi';

  @override
  String get searchApps => 'Cari aplikasi';

  @override
  String get popularApps => 'Populer';

  @override
  String get allApps => 'Semua aplikasi';

  @override
  String get appCatDeveloper => 'Developer';

  @override
  String get appCatProductivity => 'Produktivitas';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Pembayaran';

  @override
  String get appCatDesign => 'Desain';

  @override
  String get appCatSales => 'Penjualan & dukungan';

  @override
  String get appCatData => 'Data & pencarian';

  @override
  String get appCatAutomation => 'Otomasi';

  @override
  String get authOneClick => 'Satu klik';

  @override
  String get authApiKey => 'Kunci API';

  @override
  String get authNone => 'Tanpa masuk';

  @override
  String get authAdminSetup => 'Perlu disiapkan';

  @override
  String get connectedBadge => 'Terhubung';

  @override
  String get whatBotsCanDo => 'Yang bisa dilakukan botmu';

  @override
  String continueWith(String app) {
    return 'Lanjutkan dengan $app';
  }

  @override
  String get signInTab => 'Masuk';

  @override
  String get connectNoSignIn => 'Aplikasi ini berfungsi tanpa masuk.';

  @override
  String finishSignIn(String app) {
    return 'Selesaikan proses masuk ke $app';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app terbuka di browsermu. Setujui akses di sana dan ini akan diperbarui sendiri.';
  }

  @override
  String get reopenSignIn => 'Buka halaman masuk lagi';

  @override
  String appConnected(String app) {
    return '$app terhubung';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app sudah terhubung di ruang kerja ini. Pakai koneksi itu, atau tambah akun lain.';
  }

  @override
  String get useConnection => 'Pakai';

  @override
  String get addAnotherAccount => 'Tambah akun lain';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString alat siap untuk botmu.',
      one: '1 alat siap untuk botmu.',
      zero: 'Siap dipakai.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'Bot mana yang bisa memakainya?';

  @override
  String get whichBotsHelp =>
      'Bot tetap bertanya kepadamu sebelum hal berisiko.';

  @override
  String get doneLabel => 'Selesai';

  @override
  String openApp(String app) {
    return 'Buka $app';
  }

  @override
  String get pasteLabel => 'Tempel';

  @override
  String get connectingLabel => 'Menghubungkan…';

  @override
  String get connectFailedTitle => 'Gagal menghubungkan';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'Atau hubungkan $app lewat salah satu ini. Masuk sekali, lalu minta botmu memakai $app.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'Info masuk disimpan terenkripsi dan tidak akan ditampilkan lagi. Putuskan kapan saja.';

  @override
  String get composioHelp =>
      'Ratusan aplikasi, dengan proses masuk yang ditangani untukmu.';

  @override
  String get pipedreamHelp => 'Ribuan aplikasi lewat Pipedream Connect.';

  @override
  String get customServer => 'Server kustom';

  @override
  String get customServerHelp =>
      'Server MCP atau spesifikasi OpenAPI apa saja. Untuk developer.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dipakai $countString bot',
      one: 'Dipakai 1 bot',
      zero: 'Belum diberikan ke bot mana pun',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Siap';

  @override
  String get statusNeedsAttention => 'Perlu perhatian';

  @override
  String get statusChecking => 'Memeriksa';

  @override
  String get toolsHelp =>
      'Alat baca-saja berjalan sendiri. Alat yang membuat perubahan akan tanya dulu jika bot membaca sesuatu yang tidak tepercaya, dan alat bertanda “Selalu tanya” menunggumu setiap saat.';

  @override
  String get botsWithAccess => 'Bot dengan akses';

  @override
  String get reconnect => 'Hubungkan ulang';

  @override
  String get disconnect => 'Putuskan';

  @override
  String disconnectTitle(String app) {
    return 'Putuskan $app?';
  }

  @override
  String get disconnectBody =>
      'Bot langsung kehilangan alatnya, dan info masuk yang tersimpan dihapus.';

  @override
  String get testConnection => 'Uji koneksi';

  @override
  String get signedInOAuth => 'Masuk dengan akunmu';

  @override
  String get signedInKey => 'Terhubung dengan kunci API';

  @override
  String get signedInNone => 'Tidak perlu masuk';

  @override
  String get noConnectionsTitle => 'Hubungkan aplikasi pertamamu';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail, dan lainnya. Sebagian besar cukup satu klik.';

  @override
  String get browseApps => 'Jelajahi aplikasi';

  @override
  String providerSetupTitle(String provider) {
    return 'Hubungkan $provider';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider masuk ke aplikasi untukmu, jadi kamu tidak pernah mengelola kuncinya.';
  }

  @override
  String get getFreeKey => 'Dapatkan kunci gratis';

  @override
  String connectedThroughHub(String provider) {
    return 'Lewat $provider';
  }

  @override
  String providerAppsTitle(String provider) {
    return 'Aplikasi lewat $provider';
  }

  @override
  String get addAnApp => 'Tambah aplikasi';

  @override
  String searchProviderApps(String provider) {
    return 'Cari aplikasi $provider';
  }

  @override
  String get accountConnected => 'Masuk';

  @override
  String get accountPending => 'Menunggu masuk';

  @override
  String get accountError => 'Masalah saat masuk';

  @override
  String get providerReconnectHint =>
      'Masuk langsung dengan Casama untuk biaya panggilan aplikasi lebih rendah';

  @override
  String get noProviderAccounts =>
      'Belum ada aplikasi. Tambahkan satu dan masuk ke dalamnya.';

  @override
  String get projectId => 'ID proyek';

  @override
  String get toolRiskLow => 'Baca saja';

  @override
  String get toolRiskMedium => 'Membuat perubahan';

  @override
  String get toolRiskHigh => 'Selalu tanya';

  @override
  String get askWhichBot => 'Bot mana yang harus memeriksa ini?';

  @override
  String get computerWake => 'Bangunkan';

  @override
  String get computerAsleepTitle => 'Komputer sedang tidur';

  @override
  String get computerAsleepFilesHelp =>
      'Bangunkan untuk melihat dan mengunggah filenya.';

  @override
  String get computerFilesTimedOut =>
      'File terlalu lama dimuat. Pastikan komputer menyala, lalu coba lagi.';

  @override
  String get computerGoingToSleep => 'Akan tidur';

  @override
  String get liveViewWakesHelp =>
      'Komputer ini sedang tidur. Membuka tampilan langsung akan membangunkannya; komputer kembali tidur setelah beberapa saat tidak dipakai.';

  @override
  String get wakeAndWatch => 'Bangunkan dan tonton langsung';

  @override
  String get chatGptPlan => 'Paket ChatGPT';

  @override
  String get continueWithChatGpt => 'Lanjutkan dengan ChatGPT';

  @override
  String get chatGptConnectHelp =>
      'Jalankan botmu dengan paket ChatGPT-mu alih-alih kunci API. Panggilan modelnya dihitung ke batas paketmu, dan hanya kamu yang bisa memakainya.';

  @override
  String get chatGptDesktopOnly =>
      'Untuk menghubungkan paket ChatGPT-mu, buka aplikasi desktop, atau jalankan \"casama credential chatgpt\" di CLI.';

  @override
  String get chatGptWaiting =>
      'Selesaikan proses masuk dengan ChatGPT di browsermu…';

  @override
  String chatGptConnected(String account) {
    return 'Terhubung dengan paket ChatGPT-mu ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'Kamu sudah masuk, tetapi penggunaan paket tidak diizinkan. Hubungkan ulang dan izinkan, atau tambahkan kunci API.';

  @override
  String get orAddApiKey => 'Atau tambahkan kunci API';

  @override
  String get planOnlyYou => 'Hanya kamu yang bisa memakainya';

  @override
  String get planOtherMember => 'Paket anggota lain';

  @override
  String get planConnected => 'Terhubung';

  @override
  String get planUsageOff => 'Penggunaan paket nonaktif';

  @override
  String get planNeedsReconnect => 'Masuk lagi';

  @override
  String get useNextModelAtLimit =>
      'Pakai model berikutnya dari bot saat batas paket saya tercapai';

  @override
  String get useNextModelAtLimitHelp =>
      'Nonaktif: eksekusi berhenti saat batas ChatGPT-mu tercapai. Aktif: berlanjut ke model bot berikutnya, yang mungkin berbiaya.';

  @override
  String get manageUsage => 'Kelola penggunaan';

  @override
  String get removeKey => 'Hapus';

  @override
  String removeKeyConfirm(String label) {
    return 'Hapus $label? Bot yang memakainya berhenti bekerja sampai kamu memberinya kunci lain.';
  }

  @override
  String get removeKeyChatGptNote => 'Info masuk ChatGPT-mu juga dicabut.';

  @override
  String modelFallbackNotice(String message) {
    return 'Beralih ke model berikutnya: $message';
  }

  @override
  String get twoStepSignIn => 'Masuk dua langkah';

  @override
  String get twoStepHelp =>
      'Minta kode dari aplikasi autentikator setiap kali kamu masuk.';

  @override
  String get signInWithPasskey => 'Masuk dengan kunci sandi';

  @override
  String get account => 'Akun';

  @override
  String get accountRow => 'Email, kata sandi, dan keluar di semua perangkat';

  @override
  String get forgotPassword => 'Lupa kata sandi?';

  @override
  String get newPassword => 'Kata sandi baru';

  @override
  String get newPasswordAgain => 'Kata sandi baru lagi';

  @override
  String get passwordsDontMatch => 'Kata sandi tidak cocok';

  @override
  String get newPasswordTitle => 'Pilih kata sandi baru';

  @override
  String get newPasswordBody =>
      'Kamu sudah masuk. Pilih kata sandi baru untuk masuk dengan emailmu.';

  @override
  String get savePassword => 'Simpan kata sandi';

  @override
  String get passwordSaved => 'Kata sandi tersimpan.';

  @override
  String get passwordTitle => 'Kata sandi';

  @override
  String get passwordRow =>
      'Atur atau ubah kata sandi untuk masuk dengan emailmu';

  @override
  String get passwordHelp =>
      'Gunakan minimal 6 karakter. Kamu tetap bisa masuk dengan Google, Apple, kunci sandi, atau tautan email.';

  @override
  String passwordCodeSent(String email) {
    return 'Untuk menjaga keamanan akunmu, masukkan kode yang baru saja kami kirim ke $email.';
  }

  @override
  String get changeEmailTitle => 'Ubah email';

  @override
  String get changeEmailHelp =>
      'Kami akan mengirim tautan konfirmasi ke alamatmu saat ini dan ke alamat baru. Perubahan terjadi setelah keduanya dikonfirmasi.';

  @override
  String get newEmail => 'Email baru';

  @override
  String get changeEmailSend => 'Kirim konfirmasi';

  @override
  String get changeEmailRow => 'Ubah email yang kamu pakai untuk masuk';

  @override
  String changeEmailSent(String email) {
    return 'Cek kedua kotak masukmu. $email akan menjadi emailmu setelah kedua tautan dikonfirmasi.';
  }

  @override
  String changeEmailPending(String email) {
    return 'Menunggu konfirmasi: $email';
  }

  @override
  String get signOutEverywhere => 'Keluar di semua perangkat';

  @override
  String get signOutEverywhereHelp =>
      'Setiap ponsel, komputer, dan browser, termasuk yang ini';

  @override
  String get signOutEverywhereConfirm =>
      'Keluar di setiap perangkat, termasuk yang ini? Pakai ini jika perangkatmu hilang atau kamu menduga ada orang lain yang masuk.';

  @override
  String get passkeySuggestTitle => 'Masuk lebih cepat lain kali?';

  @override
  String get passkeySuggestBody =>
      'Tambahkan kunci sandi dan masuk dengan Face ID, sidik jari, atau kunci layarmu. Tidak perlu kata sandi atau email.';

  @override
  String get passkeys => 'Kunci sandi';

  @override
  String get passkeysRow =>
      'Masuk dengan Face ID, sidik jari, atau kunci layarmu';

  @override
  String get passkeysHelp =>
      'Kunci sandi membuatmu masuk dengan Face ID, sidik jari, atau kunci layarmu, tanpa kata sandi atau email. Setiap ponsel, komputer, atau pengelola kata sandi menyimpan kunci sandinya masing-masing.';

  @override
  String get passkeyAdd => 'Tambah kunci sandi';

  @override
  String get passkeyAddAnother => 'Tambah kunci sandi lain';

  @override
  String get passkeyAdded =>
      'Kunci sandi ditambahkan. Lain kali, masuk dengan itu.';

  @override
  String get passkeyRename => 'Ganti nama';

  @override
  String get passkeyRenameTitle => 'Ganti nama kunci sandi';

  @override
  String get passkeyNameLabel => 'Nama';

  @override
  String get passkeyRemove => 'Hapus';

  @override
  String passkeyRemoveConfirm(String name) {
    return 'Hapus “$name”? Kamu tidak akan bisa masuk dengannya lagi.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Ditambahkan $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Terakhir dipakai $when';
  }

  @override
  String get twoStepSetUp => 'Siapkan aplikasi autentikator';

  @override
  String get twoStepAddAnother => 'Tambah autentikator lain';

  @override
  String get twoStepScan =>
      'Pindai kode ini dengan aplikasi autentikator (seperti 1Password, Google Authenticator, atau Authy), atau ketik kunci penyiapannya, lalu masukkan kode 6 digit yang muncul.';

  @override
  String get twoStepKey => 'Kunci penyiapan';

  @override
  String get twoStepCode => 'Kode 6 digit';

  @override
  String get twoStepVerify => 'Verifikasi';

  @override
  String get twoStepNowOn => 'Masuk dua langkah aktif.';

  @override
  String get twoStepAuthenticators => 'Aplikasi autentikator';

  @override
  String get twoStepRename => 'Ganti nama';

  @override
  String get twoStepRenameTitle => 'Ganti nama autentikator';

  @override
  String get twoStepNameLabel => 'Nama';

  @override
  String get twoStepNameHint => 'Misalnya: Ponsel kerja';

  @override
  String get twoStepRemove => 'Hapus';

  @override
  String get twoStepRemoveConfirm =>
      'Hapus aplikasi autentikator ini? Jika ini satu-satunya, kamu akan masuk hanya dengan kata sandimu.';

  @override
  String get twoStepPromptTitle => 'Masukkan kodemu';

  @override
  String get twoStepPromptBody =>
      'Buka aplikasi autentikatormu dan masukkan kode 6 digit untuk menyelesaikan proses masuk.';

  @override
  String get twoStepPromptAccount => 'Masuk sebagai';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'Kata sandi baru untuk';

  @override
  String get connectAiAppAccount => 'Mendapat akses ke';

  @override
  String joinAsAccount(String email, String server) {
    return 'Kamu akan bergabung sebagai $email di $server.';
  }

  @override
  String get requireTwoStep =>
      'Wajibkan masuk dua langkah untuk pemilik dan admin';

  @override
  String get requireTwoStepHelp =>
      'Pemilik dan admin harus memakainya. Aktifkan milikmu dulu.';

  @override
  String get twoStepNeededForAdmin =>
      'Ruang kerja ini mewajibkan masuk dua langkah untuk pemilik dan admin. Siapkan dulu, atau masuk lagi dengan kodemu, untuk memakai pengaturan admin.';

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
  String get suspendWorkspace => 'Tangguhkan';

  @override
  String get unsuspendWorkspace => 'Cabut penangguhan';

  @override
  String get suspendReason => 'Alasan';

  @override
  String get suspendWorkspaceHelp =>
      'Komputernya berhenti dan botnya berhenti berjalan. Tidak ada yang dihapus, dan kamu bisa mencabutnya kapan saja.';

  @override
  String workspaceSuspended(String reason) {
    return 'Ditangguhkan: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'Ruang kerja ini ditangguhkan, jadi bot tidak bisa berjalan dan komputer tidak bisa dimulai. Hubungi pengelola server ini.';

  @override
  String get abuseKind_mining_pool => 'Penambangan kripto diblokir';

  @override
  String get abuseKind_blocked_port => 'Port email diblokir';

  @override
  String get abuseKind_egress_flood => 'Lonjakan trafik';

  @override
  String get abuseKind_signup_blocked => 'Pendaftaran ditolak';

  @override
  String get abuseKind_suspended => 'Ruang kerja ditangguhkan';

  @override
  String get abuseKind_unsuspended => 'Penangguhan dicabut';

  @override
  String get kindLocalMcp => 'Di komputer';

  @override
  String get capMcp => 'Alat lokal (MCP)';

  @override
  String get localMcpServers => 'Alat lokal (MCP)';

  @override
  String get localMcpHelp =>
      'Server MCP di komputer ini atau jaringanmu yang bisa dipakai botmu, seperti T3 Code, Claude Code, Codex, atau aplikasi desain. Token dan info masuknya tetap di komputer ini.';

  @override
  String get localMcpAdd => 'Tambah server MCP lokal';

  @override
  String get localMcpEmpty => 'Belum ada server MCP lokal.';

  @override
  String get localMcpName => 'Nama';

  @override
  String get localMcpStdio => 'Perintah';

  @override
  String get localMcpLoopback => 'Alamat';

  @override
  String get localMcpCommand => 'Perintah';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Alamat';

  @override
  String get localMcpFolder => 'Folder kerja (opsional)';

  @override
  String get localMcpEnv =>
      'Lingkungan (satu KEY=value per baris, disimpan di komputer ini)';

  @override
  String get localMcpNeedsCapability =>
      'Aktifkan Alat lokal (MCP) di atas agar bot bisa memakainya.';

  @override
  String get localMcpBadUrl =>
      'Gunakan alamat http:// di komputer ini atau jaringanmu sendiri, seperti http://127.0.0.1:3845/mcp, atau alamat https://.';

  @override
  String get localMcpBadFolder =>
      'Pilih folder di dalam salah satu folder bersama.';

  @override
  String get codingAgents => 'Coding agent';

  @override
  String get codingAgentsHelp =>
      'Bot bisa menyerahkan tugas coding ke agent ini di komputer ini. Mereka memakai info masukmu sendiri dan bekerja di folder yang kamu bagikan.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString coding agent ditemukan',
      one: '1 coding agent ditemukan',
      zero: 'Tidak ada coding agent ditemukan',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'Server ini belum disimpan ke ruang kerja. Hapus dan tambahkan lagi.';

  @override
  String get localMcpSignInKind => 'Masuk';

  @override
  String get localMcpAuthNone => 'Tidak ada';

  @override
  String get localMcpAuthToken => 'Token';

  @override
  String get localMcpAuthHeader => 'Header';

  @override
  String get localMcpAuthOAuth => 'Browser';

  @override
  String get localMcpToken => 'Token (disimpan di komputer ini)';

  @override
  String get localMcpHeaderName => 'Nama header';

  @override
  String get localMcpHeaderValue => 'Nilai header (disimpan di komputer ini)';

  @override
  String get localMcpOAuthHelp =>
      'Casama membuka browsermu agar kamu bisa masuk ke server ini. Info masuk tetap di komputer ini.';

  @override
  String get localMcpNetworkWarning =>
      'Server ini tidak ada di komputer ini. Bot yang bisa memakai komputer ini dapat menjangkaunya.';

  @override
  String get localMcpSignIn => 'Masuk';

  @override
  String get localMcpNeedsSignIn => 'Perlu masuk';

  @override
  String get localMcpEdit => 'Edit server MCP lokal';

  @override
  String get localMcpImport => 'Tambahkan dari aplikasi lain';

  @override
  String get localMcpImportHelp =>
      'Server MCP yang sudah disiapkan di T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex, atau Windsurf di komputer ini.';

  @override
  String get localMcpImportNone =>
      'Tidak ada server MCP ditemukan di aplikasi lain di komputer ini.';

  @override
  String get localMcpImportAdded => 'Sudah ditambahkan';

  @override
  String get localMcpImportRemote =>
      'Di internet, jadi biasanya ditambahkan di Koneksi. Tambahkan di sini hanya jika cuma komputer ini yang bisa menjangkaunya.';

  @override
  String get mcpQuestionDecline => 'Tolak';

  @override
  String get mcpQuestionSend => 'Kirim';

  @override
  String get cardMcpQuestion => 'Pertanyaan';

  @override
  String get cardMcpSignIn => 'Masuk';

  @override
  String get mcpSignInHereHelp => 'Masuk agar botmu bisa memakainya lagi.';

  @override
  String localMcpSignedIn(String name) {
    return 'Masuk ke $name';
  }

  @override
  String localMcpImportFrom(String source) {
    return 'Dari $source';
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
      other: 'Tambah $nString server',
      one: 'Tambah 1 server',
      zero: 'Tambah',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (disimpan di komputer ini)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name memintamu untuk masuk';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return 'Buka Casama di $device dan masuk di sana.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Buka Casama di komputer tempat alat ini berjalan dan masuk di sana.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection bertanya';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return '$connection sudah dijawab';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return 'Pertanyaan $connection ditolak';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return 'Pertanyaan $connection ditutup';
  }

  @override
  String get codingAgentsNone =>
      'Tidak ada coding agent ditemukan. Pasang Claude Code, Codex, atau agent baris perintah Cursor untuk memberi mereka tugas coding.';

  @override
  String get codingAgentsNeedShell =>
      'Coding agent berjalan sebagai perintah, jadi memerlukan Jalankan perintah dalam keadaan aktif.';

  @override
  String get allowCommands => 'Aktifkan';

  @override
  String get codingAgentAllow => 'Izinkan';

  @override
  String get codingAgentAllowed => 'Diizinkan';

  @override
  String get codingAgentsAllowHelp =>
      'Agent dengan tanda Izinkan belum pernah berjalan di komputer ini. Izinkan sekali dan bot bisa memberinya tugas.';

  @override
  String get ownAgentsAdd => 'Tambah milikmu sendiri';

  @override
  String get ownAgentYours => 'Milikmu';

  @override
  String get ownAgentNotFound => 'Tidak ditemukan di komputer ini';

  @override
  String get ownAgentsHelp =>
      'Agent milikmu sendiri hanya berjalan di komputer ini, di chat yang bertindak untukmu. Tidak seorang pun di ruang kerja yang bisa melihat atau mengubahnya.';

  @override
  String get ownAgentFormTitle => 'Tambah agent milikmu';

  @override
  String get ownAgentEditTitle => 'Edit agent milikmu';

  @override
  String get ownAgentName => 'Nama';

  @override
  String get ownAgentBin => 'Nama perintah';

  @override
  String get ownAgentCommand => 'Perintah';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Letakkan $task di tempat tugas berada; Casama mengutipnya. Setiap perintah di dalamnya diawali dengan nama perintah. Kamu juga bisa memakai $folder, dan $result_file saat agent menulis jawabannya ke file.';
  }

  @override
  String get ownAgentResult => 'Membaca jawaban';

  @override
  String get ownAgentResultTail => 'Bagian akhir keluarannya';

  @override
  String get ownAgentResultJson => 'Baris JSON dengan bidang result';

  @override
  String get ownAgentResultStream => 'Aliran baris JSON';

  @override
  String get ownAgentResultField => 'Bidang JSON';

  @override
  String get ownAgentResultFile => 'Ditulis ke file';

  @override
  String get ownAgentResultFieldName => 'Nama bidang';

  @override
  String get ownAgentTimeLimit => 'Batas waktu (menit)';

  @override
  String get ownAgentTest => 'Uji';

  @override
  String get ownAgentTestHelp =>
      'Uji memintanya membalas hanya dengan kata pong di komputer ini dan menampilkan yang dicetaknya.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'Jawabannya: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'Tidak menjawab sesuai harapan (keluar $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'Tidak selesai tepat waktu.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Isi nama, nama perintah, dan perintah dengan $task.';
  }

  @override
  String get board => 'Papan';

  @override
  String get newTicket => 'Tiket baru';

  @override
  String get newTicketSubtitle =>
      'Tugas untuk salah satu botmu, dilacak di papan.';

  @override
  String get allProjects => 'Semua proyek';

  @override
  String get manageProjects => 'Kelola proyek';

  @override
  String get filterByProject => 'Filter berdasarkan proyek';

  @override
  String get moveTo => 'Pindahkan ke';

  @override
  String get noMatchingTickets => 'Tidak ada tiket yang cocok';

  @override
  String get noMatchingTicketsHelp =>
      'Tidak ada tiket yang cocok dengan filter ini.';

  @override
  String get clearFilters => 'Bersihkan filter';

  @override
  String get ticketTitle => 'Judul';

  @override
  String get ticketDetails => 'Detail';

  @override
  String get taskInReview => 'Dalam tinjauan';

  @override
  String get priority => 'Prioritas';

  @override
  String get priorityUrgent => 'Mendesak';

  @override
  String get priorityHigh => 'Tinggi';

  @override
  String get priorityMedium => 'Sedang';

  @override
  String get priorityLow => 'Rendah';

  @override
  String get priorityNone => 'Tanpa prioritas';

  @override
  String get filterAll => 'Semua';

  @override
  String get filterMine => 'Milik saya';

  @override
  String get filterBots => 'Bot';

  @override
  String get assignee => 'Ditugaskan ke';

  @override
  String get unassigned => 'Belum ditugaskan';

  @override
  String get assignToMe => 'Saya';

  @override
  String get reviewRequired => 'Perlu ditinjau';

  @override
  String get reviewRequiredHelp =>
      'Bot berakhir dalam tinjauan, bukan selesai.';

  @override
  String get comments => 'Komentar';

  @override
  String get addComment => 'Tambah komentar';

  @override
  String get sendComment => 'Kirim';

  @override
  String get openThread => 'Buka utas bot';

  @override
  String get deleteTicket => 'Hapus tiket';

  @override
  String get ticketResult => 'Hasil';

  @override
  String get noCommentsYet =>
      'Belum ada komentar. Tinggalkan catatan untuk bot atau timmu.';

  @override
  String get noTickets => 'Beri botmu pekerjaan';

  @override
  String get noTicketsHelp =>
      'Serahkan satu pekerjaan, atau seluruh tujuan. Kamu bisa memantau perkembangannya dari sini.';

  @override
  String get tasksStartTicket => 'Tambah tiket';

  @override
  String get tasksStartTicketHelp =>
      'Satu pekerjaan. Tugaskan ke bot dan bot akan mulai.';

  @override
  String get tasksStartProject => 'Mulai proyek';

  @override
  String get tasksStartProjectHelp =>
      'Tujuan lebih besar. Bot merencanakannya sebagai tiket dan menunggu persetujuanmu.';

  @override
  String get tasksExamples => 'Atau mulai dari salah satu ini';

  @override
  String get tasksExampleResearch => 'Riset tiga kompetitor teratas saya';

  @override
  String get tasksExampleDraft => 'Buat draf pengumuman peluncuran';

  @override
  String get tasksExampleTidy => 'Rapikan file saya';

  @override
  String get ticketStatus => 'Status';

  @override
  String get spaces => 'Ruang kerja';

  @override
  String get newWorkspace => 'Ruang kerja baru';

  @override
  String get newWorkspaceSubtitle =>
      'Rumah terpisah untuk tim, dengan bot, chat, dan anggotanya sendiri.';

  @override
  String get joinWorkspaceHelp =>
      'Tempel tautan undangan yang dikirimkan kepadamu.';

  @override
  String get inviteLinkField => 'Tautan undangan';

  @override
  String get workspaceIcon => 'Ikon';

  @override
  String get workspaceColor => 'Warna';

  @override
  String get workspaceSettings => 'Pengaturan ruang kerja';

  @override
  String get workspaceSettingsHelp => 'Nama, ikon, warna, dan tautan undangan';

  @override
  String get inviteLinks => 'Tautan undangan';

  @override
  String get inviteLinksHelp =>
      'Siapa saja yang punya tautan bisa bergabung setelah masuk, sampai kedaluwarsa, habis dipakai, atau kamu cabut.';

  @override
  String get createInviteLink => 'Buat tautan';

  @override
  String get linkExpires => 'Kedaluwarsa';

  @override
  String get linkNever => 'Tidak pernah';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Dalam $daysString hari',
      one: 'Dalam 1 hari',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Pemakaian';

  @override
  String get linkUnlimited => 'Tanpa batas';

  @override
  String linkUses(String uses) {
    return '$uses terpakai';
  }

  @override
  String get linkRevoked => 'Dicabut';

  @override
  String get revokeLink => 'Cabut';

  @override
  String get linkCopied => 'Tautan undangan disalin.';

  @override
  String get inviteRole => 'Peran';

  @override
  String get shareLinkLabel => 'Bagikan';

  @override
  String get botFolder => 'Folder';

  @override
  String get noFolder => 'Tanpa folder';

  @override
  String get newFolder => 'Folder baru…';

  @override
  String get folderName => 'Nama folder';

  @override
  String get archiveBot => 'Arsipkan bot';

  @override
  String archiveBotTitle(String name) {
    return 'Arsipkan $name?';
  }

  @override
  String get archiveBotBody =>
      'Bot keluar dari bilah samping dan berhenti berjalan. Chat dan riwayatnya tetap ada, dan kamu bisa mengembalikannya dari Bot yang diarsipkan.';

  @override
  String get archive => 'Arsipkan';

  @override
  String get archivedBots => 'Bot yang diarsipkan';

  @override
  String get unarchive => 'Kembalikan';

  @override
  String botArchived(String name) {
    return '$name diarsipkan.';
  }

  @override
  String get deleteBot => 'Delete Bot';

  @override
  String deleteBotTitle(String name) {
    return 'Delete $name?';
  }

  @override
  String deleteBotBody(String name) {
    return 'Every chat with $name is deleted for good, with its messages, photos and files, and $name stops running and leaves the sidebar. Group chats and usage records stay. Its settings and memory move to Archived bots.';
  }

  @override
  String botDeleted(String name) {
    return '$name deleted.';
  }

  @override
  String get settingsHistory => 'Riwayat pengaturan';

  @override
  String get settingsHistoryHelp =>
      'Setiap perubahan pada pengaturan bot ini, dan siapa yang membuatnya';

  @override
  String get noHistory => 'Belum ada perubahan.';

  @override
  String get restoreSettings => 'Pulihkan pengaturan ini';

  @override
  String restoreSettingsBody(String fields) {
    return 'Kembalikan $fields seperti sebelum perubahan ini? Pengaturan saat ini tetap ada di riwayat.';
  }

  @override
  String changedByBot(String name) {
    return 'Diubah oleh $name';
  }

  @override
  String get changedByPerson => 'Diubah oleh seseorang';

  @override
  String get changedBySystem => 'Diubah oleh Casama';

  @override
  String get fieldName => 'nama';

  @override
  String get fieldInstructions => 'instruksi';

  @override
  String get fieldModel => 'model';

  @override
  String get fieldAutonomy => 'otonomi';

  @override
  String get fieldBudget => 'anggaran';

  @override
  String get fieldComputer => 'komputer';

  @override
  String get fieldArchived => 'diarsipkan';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot butuh kunci $service';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Hanya untuk $hosts';
  }

  @override
  String get secretRequestHelp =>
      'Langsung masuk ke brankas. Bot tidak pernah melihatnya.';

  @override
  String secretSaved(String name) {
    return '$name disimpan';
  }

  @override
  String get secretDeclined => 'Ditolak';

  @override
  String secretWhat(String service) {
    return 'Kunci $service';
  }

  @override
  String totpWhat(String service) {
    return 'Kode masuk $service';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Dikembalikan: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return 'Info masukmu untuk $host sudah dibagikan';
  }

  @override
  String get shareLogin => 'Bagikan info masuk';

  @override
  String get shareLoginUsername => 'Email atau nama pengguna';

  @override
  String get shareLoginPassword => 'Kata sandi';

  @override
  String get shareLoginRemember => 'Ingat untuk lain kali';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Hanya dipakai di $host. $bot tidak pernah melihat kata sandimu.';
  }

  @override
  String get shareLoginSave => 'Simpan dan masuk';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot memintamu masuk ke $host';
  }

  @override
  String get signInOnPage => 'Masuk di halaman';

  @override
  String loginOnPageLine(String host) {
    return 'Masuk ke $host di halaman';
  }

  @override
  String get loginOnPageHelp => 'Masuk di halaman, lalu ketuk Kembalikan.';

  @override
  String get back => 'Kembali';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Tidak dibagikan: kalendermu',
      'reminders': 'Tidak dibagikan: pengingatmu',
      'contacts': 'Tidak dibagikan: kontakmu',
      'places': 'Tidak dibagikan: tempatmu',
      'photos': 'Tidak dibagikan: fotomu',
      'health': 'Tidak dibagikan: data kesehatanmu',
      'notifications': 'Tidak dibagikan: notifikasimu',
      'activity': 'Tidak dibagikan: aktivitas komputermu',
      'browserTab': 'Tidak dibagikan: tab browsermu saat ini',
      'browserHistory': 'Tidak dibagikan: riwayat dan marka browsermu',
      'alarm': 'Tidak dibagikan: alarmmu',
      'home': 'Tidak dibagikan: aksesori Rumah kamu',
      'other': 'Tidak dibagikan: data perangkatmu',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Tolak';

  @override
  String get signInCode => 'Kode masuk';

  @override
  String get secretKindValue => 'Kunci atau kata sandi';

  @override
  String get totpSeedLabel =>
      'Kunci penyiapan, tautan otpauth://, atau kode yang kamu lihat sekarang';

  @override
  String get totpSeedHelp =>
      'Kunci penyiapan dari pengaturan dua langkah situs memungkinkan bot membuat setiap kode berikutnya (bot tidak pernah melihat kuncinya). Atau ketik kode yang kamu lihat sekarang: kode langsung dikirim ke bot.';

  @override
  String get scanQrCode => 'Pindai kode QR';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot butuh kode masuk $service';
  }

  @override
  String get search => 'Cari';

  @override
  String get searchHint => 'Cari chat, memori, keahlian, tiket, dan file';

  @override
  String get searchEmptyPrompt => 'Ketik minimal 2 karakter.';

  @override
  String searchNoResults(String query) {
    return 'Tidak ada hasil untuk “$query”.';
  }

  @override
  String get searchMessages => 'Pesan';

  @override
  String get searchChats => 'Chat';

  @override
  String get searchTickets => 'Tiket';

  @override
  String get searchFiles => 'File';

  @override
  String get searchFilesAsleep =>
      'File di komputer yang tidur tidak dicari. Nyalakan komputer untuk menyertakan filenya.';

  @override
  String get searchSearching => 'Mencari…';

  @override
  String get searchJumpHint => 'Cari atau lompat ke…';

  @override
  String get searchRecent => 'Terbaru';

  @override
  String get searchClearRecent => 'Bersihkan';

  @override
  String get searchRemoveRecent => 'Hapus dari pencarian terbaru';

  @override
  String get searchJumpBackIn => 'Lanjutkan lagi';

  @override
  String get searchNeedsYou => 'Perlu kamu';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n hal menunggumu',
      one: '1 hal menunggumu',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Buka';

  @override
  String get searchTopHits => 'Hasil teratas';

  @override
  String get searchScopeAll => 'Semua';

  @override
  String get searchMemories => 'Memori';

  @override
  String get searchKeepTyping =>
      'Terus ketik untuk mencari pesan, memori, dan file.';

  @override
  String searchAskBot(String bot, String query) {
    return 'Tanya $bot tentang “$query”';
  }

  @override
  String get searchAskBotHelp => 'Memulai chat baru dengan pertanyaan ini';

  @override
  String get searchKeysHint => '↑ ↓ pindah   ↵ buka   esc tutup';

  @override
  String get searchClear => 'Bersihkan pencarian';

  @override
  String get installFor => 'Pasang untuk';

  @override
  String get wholeWorkspace => 'Seluruh ruang kerja';

  @override
  String get skillCatalog => 'Katalog keahlian';

  @override
  String get searchSkills => 'Cari keahlian';

  @override
  String get all => 'Semua';

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
  String get install => 'Pasang';

  @override
  String skillInstalled(String name) {
    return '$name terpasang.';
  }

  @override
  String get noResults => 'Tidak ada hasil.';

  @override
  String get importFromGitHub => 'Impor dari GitHub';

  @override
  String get importFromGitHubHelp =>
      'Tempel tautan ke folder berisi SKILL.md. Kamu akan melihat setiap file sebelum apa pun dipasang. Repositori privat memakai rahasia GITHUB_TOKEN yang diizinkan untuk api.github.com.';

  @override
  String get preview => 'Pratinjau';

  @override
  String get skillScriptsNote =>
      'Skrip di dalam keahlian hanya berjalan di komputer bot, tidak pernah di server.';

  @override
  String get binaryFile => '(file biner)';

  @override
  String skillUpdate(String name) {
    return 'Perbarui $name';
  }

  @override
  String get checkingForUpdates => 'Memeriksa pembaruan…';

  @override
  String get skillUpToDate => 'Sudah terbaru.';

  @override
  String get update => 'Perbarui';

  @override
  String get filesAdded => 'Ditambahkan';

  @override
  String get filesChanged => 'Diubah';

  @override
  String get filesRemoved => 'Dihapus';

  @override
  String get fromCatalog => 'Dari katalog';

  @override
  String get savedByBot => 'Disimpan oleh bot';

  @override
  String get checkForUpdates => 'Periksa pembaruan';

  @override
  String get attachSkill => 'Lampirkan keahlian';

  @override
  String get rerunSetup => 'Jalankan penyiapan lagi';

  @override
  String get rerunSetupHelp =>
      'Jawab pertanyaan penyiapan lagi dan tinjau usulan baru';

  @override
  String get trace => 'Jejak';

  @override
  String get openTrace => 'Buka jejak';

  @override
  String get editMessage => 'Edit';

  @override
  String get editMessageHelp =>
      'Mengirim akan menjalankan ulang percakapan dari titik ini. Versi aslinya tetap ada; beralihlah dengan panah.';

  @override
  String get previousVersion => 'Versi sebelumnya';

  @override
  String get nextVersion => 'Versi berikutnya';

  @override
  String get quietHours => 'Jam tenang';

  @override
  String get quietHoursHelp =>
      'Notifikasi menunggu hingga jam tenang berakhir; kotak masukmu tetap terisi. Persetujuan untuk chat yang sedang kamu buka tetap masuk.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start hingga $end';
  }

  @override
  String get off => 'Nonaktif';

  @override
  String get botNotifications => 'Notifikasi dari bot ini';

  @override
  String get botNotificationsHelp => 'Apakah bot ini mengikuti jam tenangmu';

  @override
  String get botMayCall => 'Bisa menelepon saya';

  @override
  String get botMayCallHelp =>
      'Bot ini bisa meneleponmu saat ada hal yang layak ditelepon. Nonaktif: mengirim notifikasi saja.';

  @override
  String get quietDefault => 'Ikuti jam tenang saya';

  @override
  String get quietAlways => 'Selalu beri tahu saya';

  @override
  String get quietCustom => 'Jam tenangnya sendiri';

  @override
  String get from => 'Dari';

  @override
  String get until => 'Hingga';

  @override
  String get shareAsTemplate => 'Bagikan sebagai templat';

  @override
  String get shareAsTemplateRow =>
      'File atau tautan berisi instruksi, keahlian, dan rutinitasnya';

  @override
  String get shareAsTemplateHelp =>
      'Mencakup instruksi, keahlian, rutinitas, dan layanan yang dipakainya. Tidak pernah kunci atau rahasia.';

  @override
  String get copyLink => 'Salin tautan';

  @override
  String get includeMemories => 'Sertakan memori';

  @override
  String get includeMemoriesHelp =>
      'Yang telah dipelajarinya tentang kamu. Bagikan dengan hati-hati.';

  @override
  String get saveAsFile => 'Simpan sebagai file';

  @override
  String get notABotTemplate => 'File itu bukan templat bot Casama.';

  @override
  String get importBot => 'Impor bot';

  @override
  String botImported(String name) {
    return '$name siap.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name siap. Hubungkan $services di Integrasi agar bisa memakainya.';
  }

  @override
  String get whatComesWithIt => 'Yang ikut masuk';

  @override
  String get connectAfterImport => 'Hubungkan setelah mengimpor';

  @override
  String get importRoutines => 'Jadwalkan rutinitasnya';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Simpan $countString memorinya',
      one: 'Simpan 1 memorinya',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Memulai rutinitas…';

  @override
  String get offlineSaved => 'Offline. Menampilkan pesan tersimpan.';

  @override
  String get loadEarlierMessages => 'Pesan sebelumnya';

  @override
  String get chatLoadFailedTitle => 'Chat ini gagal dimuat';

  @override
  String get chatLoadFailedBody => 'Periksa koneksimu, lalu coba lagi.';

  @override
  String get projects => 'Proyek';

  @override
  String get newProject => 'Proyek baru';

  @override
  String get noProjects => 'Belum ada proyek';

  @override
  String get projectsHelp =>
      'Proyek menyatukan satu pekerjaan: chat, rencana, daftar tugas, file, dan semua yang dibuat untuknya. Kerjakan bersama bot, atau biarkan bot merencanakan dan mengerjakannya sendiri.';

  @override
  String get newProjectHelp =>
      'Menyatukan satu pekerjaan: chat, rencana, daftar tugas, file, dan semua yang dibuat untuknya.';

  @override
  String get startPlanning => 'Mulai merencanakan';

  @override
  String get projectTitle => 'Judul';

  @override
  String get projectGoal => 'Tujuan';

  @override
  String get projectDoneWhen => 'Selesai jika';

  @override
  String get projectLead => 'Bot pemimpin';

  @override
  String get projectBudget => 'Anggaran';

  @override
  String get projectGoalHint =>
      'Apa yang harus ada di akhir? Halaman arahan aktif di domain saya…';

  @override
  String get projectDoneHint =>
      'Opsional. Cara kamu tahu pekerjaan ini selesai';

  @override
  String get projectBudgetHint =>
      'Opsional. Pekerjaan dijeda saat habis terpakai';

  @override
  String get projectThread => 'Chat proyek';

  @override
  String get approvePlan => 'Setujui rencana';

  @override
  String get pause => 'Jeda';

  @override
  String get resume => 'Lanjutkan';

  @override
  String get milestones => 'Tonggak pencapaian';

  @override
  String get needsSignoff => 'perlu persetujuanmu';

  @override
  String get signOff => 'Setujui';

  @override
  String get projectPlan => 'Rencana';

  @override
  String get tickets => 'Tiket';

  @override
  String get projectTimeline => 'Linimasa';

  @override
  String get projectPlanning => 'Merencanakan';

  @override
  String get projectActive => 'Aktif';

  @override
  String get projectPaused => 'Dijeda';

  @override
  String get projectBlocked => 'Terhalang';

  @override
  String get projectDone => 'Selesai';

  @override
  String get projectCancelled => 'Dibatalkan';

  @override
  String get projectName => 'Nama';

  @override
  String get projectNameHint => 'Space Dodger, buletin musim semi…';

  @override
  String get createProject => 'Buat proyek';

  @override
  String projectWorksAlone(String bot) {
    return 'Biarkan $bot mengerjakannya sendiri';
  }

  @override
  String get projectWorksAloneHelp =>
      'Bot menyusun rencana untuk kamu setujui, lalu bekerja per sesi hingga tujuan tercapai. Tidak ada yang dimulai sebelum kamu setujui.';

  @override
  String get projectWorksAloneOn => 'Bekerja per sesi hingga tujuan tercapai.';

  @override
  String get projectWorksAloneOff =>
      'Kalian mengerjakannya bersama di chatnya.';

  @override
  String get projectMade => 'Dibuat di proyek ini';

  @override
  String projectMadeEmpty(String bot) {
    return 'Belum ada. Yang dibuat $bot di chat proyek ini akan muncul di sini.';
  }

  @override
  String get projectSeeAll => 'Lihat semua';

  @override
  String get projectTodos => 'Daftar tugas';

  @override
  String get projectFiles => 'File';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$folder di komputer $bot';
  }

  @override
  String get projectMarkDone => 'Tandai selesai';

  @override
  String get projectReopen => 'Buka kembali';

  @override
  String get projectCover => 'Sampul';

  @override
  String get projectCoverNone => 'Tidak ada';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Perahu layar',
      'mountain': 'Gunung',
      'seedling': 'Tunas',
      'compass': 'Kompas',
      'lantern': 'Lentera',
      'telescope': 'Teleskop',
      'map': 'Peta',
      'chess': 'Catur',
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
      other: '$countString item',
      one: '1 item',
      zero: 'Belum ada',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Proyek';

  @override
  String get creationMoveToProject => 'Pindahkan ke proyek';

  @override
  String get creationNoProject => 'Tanpa proyek';

  @override
  String get makeProject => 'Jadikan proyek';

  @override
  String get makeProjectTitle => 'Jadikan topik ini sebuah proyek';

  @override
  String makeProjectHelp(String bot) {
    return 'Yang dibuat $bot di topik ini disimpan di proyek, begitu juga yang dibuatnya di sini nanti.';
  }

  @override
  String get openProject => 'Buka proyek';

  @override
  String get theBot => 'bot';

  @override
  String get forYou => 'Untukmu';

  @override
  String get inboxNeedsYou => 'Perlu kamu';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Perlu kamu ($nString)';
  }

  @override
  String get inboxBriefs => 'Ringkasan';

  @override
  String get inboxUpdates => 'Pembaruan';

  @override
  String get inboxEmptyHelp =>
      'Permintaan, ringkasan pagi, notifikasi, dan halaman baru dari botmu muncul di sini.';

  @override
  String get inboxNeedsYouEmpty => 'Tidak ada yang perlu kamu tangani saat ini';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'Saat bot butuh keputusan, bantuanmu, atau punya ide, itu muncul di sini.';

  @override
  String get noBriefs => 'Belum ada ringkasan pagi';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot menerbitkan $title';
  }

  @override
  String get forYouEmpty => 'Belum ada untukmu saat ini';

  @override
  String get forYouEmptyHelp =>
      'Aktifkan sapaan di pengaturan bot untuk mendapatkan ringkasan pagi dan saran sepanjang hari.';

  @override
  String morningBriefFrom(String name) {
    return 'Ringkasan pagi dari $name';
  }

  @override
  String get suggestions => 'Saran';

  @override
  String suggestedBy(String name) {
    return 'Disarankan oleh $name';
  }

  @override
  String get dismissSuggestion => 'Tutup saran ini?';

  @override
  String dismissSuggestionHelp(String bot) {
    return 'Pilih apakah $bot boleh membicarakannya lagi.';
  }

  @override
  String get justThisOnce => 'Kali ini saja';

  @override
  String justThisOnceHelp(String bot) {
    return 'Sembunyikan sementara. Jika masih penting nanti, $bot mungkin menyarankannya lagi.';
  }

  @override
  String get dontSuggestAgain => 'Jangan sarankan lagi';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Hilang selamanya. $bot akan ingat kamu lebih suka tidak melihatnya.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Mengerti. $bot tidak akan menyarankannya lagi.';
  }

  @override
  String get doIt => 'Lakukan';

  @override
  String get checkins => 'Sapaan';

  @override
  String get checkinsHelp =>
      'Ringkasan pagi dan pemeriksaan tiap beberapa jam untuk hal yang membutuhkanmu. Nonaktif secara default.';

  @override
  String get briefTime => 'Ringkasan pagi pukul';

  @override
  String get scanEvery => 'Periksa tiap';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString jam',
      one: '1 jam',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => 'Batas harian';

  @override
  String get on => 'Aktif';

  @override
  String get actionRules => 'Aturan tindakan';

  @override
  String get actionRulesRow => 'Yang boleh dilakukan tanpa bertanya';

  @override
  String get actionRulesHelp =>
      'Aturan menentukan per tindakan: lanjutkan, lanjutkan dalam batas, tanya dulu, atau serahkan kepadamu untuk diselesaikan. Aturan paling spesifik yang berlaku; tanpa aturan, otonomi bot yang menentukan. Bot tidak bisa mengubah aturannya sendiri.';

  @override
  String get addRule => 'Tambah aturan';

  @override
  String get addRuleHelp => 'Pilih tindakan bot dan cara menanganinya.';

  @override
  String get noRules =>
      'Belum ada aturan. Tingkat otonomi bot yang menentukan.';

  @override
  String get otherTools => 'Alat tertentu';

  @override
  String get workspaceRule => 'Aturan ruang kerja';

  @override
  String get catSend => 'Mengirim pesan';

  @override
  String get catPay => 'Pembayaran';

  @override
  String get catDelete => 'Menghapus';

  @override
  String get catPublish => 'Menerbitkan';

  @override
  String get catShare => 'Berbagi dan undangan';

  @override
  String get catSignIn => 'Masuk';

  @override
  String get whenTheBot => 'Saat bot sedang';

  @override
  String get itShould => 'Bot harus';

  @override
  String get ruleAllow => 'Lanjutkan saja';

  @override
  String get ruleAllowLimits => 'Lanjutkan dalam batas';

  @override
  String get ruleAsk => 'Tanya saya dulu';

  @override
  String get ruleHandOff => 'Serahkan ke saya untuk selesai';

  @override
  String get ruleDomains => 'Hanya ke domain ini (dipisahkan koma)';

  @override
  String get ruleMaxAmount => 'Hingga jumlah ini';

  @override
  String get ruleForWorkspace => 'Untuk setiap bot di ruang kerja';

  @override
  String get watchers => 'Pemantau';

  @override
  String get watchersRow => 'Yang sedang dipantaunya';

  @override
  String get noWatchers => 'Tidak memantau apa pun';

  @override
  String get watchersHelp =>
      'Minta bot \"beri tahu saya jika…\" dan bot akan memantau halaman, balasan, hasil, atau waktu. Pemeriksaan gratis sampai ada yang berubah.';

  @override
  String get watcherActive => 'Memantau';

  @override
  String get watcherPaused => 'Dijeda';

  @override
  String get watcherDone => 'Selesai';

  @override
  String get watcherExpired => 'Kedaluwarsa';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'terpicu $countString kali',
      one: 'terpicu sekali',
      zero: 'belum pernah terpicu',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'Hubungkan aplikasi AI';

  @override
  String connectAiAppAsk(String app) {
    return '$app ingin memakai Casama';
  }

  @override
  String get connectAiAppHelpShort =>
      'Aplikasi ini bisa melihat daftar botmu, memintanya bekerja, dan membaca hasil di ruang kerja pilihanmu, sebagai kamu. Persetujuan dan aturan botmu tetap berlaku.';

  @override
  String get connectAiAppSendsTo => 'Setelah kamu izinkan, kamu kembali ke';

  @override
  String get connectAiAppUnknown =>
      'Casama tidak mengenali alamat ini. Siapa saja bisa memberi nama apa pun ke sebuah aplikasi, jadi izinkan hanya jika kamu sendiri yang memulai koneksi ini dan memercayai situs ini.';

  @override
  String get connectAiAppDone => 'Selesai. Kamu bisa kembali ke aplikasi AI.';

  @override
  String get refuse => 'Tolak';

  @override
  String get allow => 'Izinkan';

  @override
  String get connectAiApps => 'Hubungkan aplikasi AI';

  @override
  String get connectAiAppsHelp =>
      'Aplikasi yang mendukung MCP terhubung ke alamat ini dan masuk, atau memakai kunci API. Mereka bertindak sebagai orang yang menghubungkannya.';

  @override
  String get connectedAiApps => 'Aplikasi AI terhubung';

  @override
  String get connectedAiAppsHelp =>
      'Aplikasi yang kamu hubungkan dengan masuk. Putuskan salah satu dan aksesnya ke ruang kerja ini langsung hilang.';

  @override
  String get connectedAiAppsAdminHelp =>
      'Aplikasi yang dihubungkan anggota ruang kerja ini dengan masuk. Putuskan salah satu dan aksesnya langsung hilang.';

  @override
  String get noConnectedAiApps => 'Belum ada aplikasi AI terhubung.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Dipakai $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Terhubung $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'Aplikasi ini langsung berhenti bekerja di ruang kerja ini. Untuk memakainya lagi, hubungkan kembali dari aplikasinya.';

  @override
  String get mcpApprovals => 'Izinkan persetujuan dari aplikasi AI';

  @override
  String get mcpApprovalsHelp =>
      'Aplikasi terhubung bisa menyetujui tindakan botmu.';

  @override
  String get newApiKey => 'Kunci API baru';

  @override
  String get apiKeyName => 'Nama';

  @override
  String get newGroupChat => 'Chat grup baru';

  @override
  String get groupChats => 'Chat grup';

  @override
  String groupWhoAnswers(String names) {
    return '$names akan menjawab';
  }

  @override
  String get groupEveryoneAnswers => 'Semua akan menjawab';

  @override
  String get groupMentionHint => '@sebut bot, atau @everyone';

  @override
  String routineRan(String name) {
    return 'Rutinitas “$name” berjalan';
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
      other: '$countString hal menunggumu',
      one: '1 hal menunggumu',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Masukkan 2 hingga 10 bot ke satu chat. @Nama bertanya ke satu bot; @everyone meminta pemimpin merencanakan dan membagi pekerjaan.';

  @override
  String get groupCreate => 'Buat chat grup';

  @override
  String get groupCrewEmpty => 'Pilih bot di bawah untuk membentuk grup.';

  @override
  String get groupLeadShort => 'Pemimpin';

  @override
  String get groupMakeLead => 'Jadikan pemimpin';

  @override
  String groupRemoveBot(String name) {
    return 'Hapus $name';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pilih $count bot lagi',
      one: 'Pilih 1 bot lagi',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'Sudah 10 bot, batas maksimal satu grup.';

  @override
  String get groupLeadHint =>
      'Pemimpin merencanakan pekerjaan saat kamu mengetik @everyone. Ketuk bot lain di atas untuk menjadikannya pemimpin.';

  @override
  String groupLeadIs(String name) {
    return '$name leads: it plans the work when you @everyone. Tap another bot at the top to make it lead.';
  }

  @override
  String groupPickOneMoreLead(String name) {
    return 'Pick 1 more bot. $name leads; tap another bot at the top to make it lead.';
  }

  @override
  String get groupNeedTwoBots =>
      'Chat grup butuh minimal dua bot. Buat bot lain dulu.';

  @override
  String get groupSearchBots => 'Cari bot';

  @override
  String get groupNoMatch => 'Tidak ada bot yang cocok dengan nama itu.';

  @override
  String get groupTitle => 'Nama (opsional)';

  @override
  String get groupPickBots => 'Bot';

  @override
  String get groupLead => 'Memimpin grup';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Halaman';

  @override
  String get pagesRow => 'Laporan dan dasbor yang diterbitkannya';

  @override
  String get noPages => 'Belum ada halaman';

  @override
  String get pagesHelp =>
      'Minta laporan, dasbor, atau pelacak ke bot dan bot bisa menerbitkannya sebagai halaman. Halaman terbuka di browsermu dan tetap privat sampai kamu bagikan.';

  @override
  String get pagePrivate => 'Hanya saya';

  @override
  String get pageWorkspace => 'Ruang kerja';

  @override
  String get pagePublic => 'Siapa saja yang punya tautan';

  @override
  String get pageRefreshes => 'Diperbarui sesuai jadwal';

  @override
  String get pageCardOpen => 'Halaman · Ketuk untuk buka';

  @override
  String get exportPdf => 'Ekspor PDF';

  @override
  String get pageMakePublicTitle => 'Jadikan halaman ini publik?';

  @override
  String get pageMakePublicBody =>
      'Siapa saja yang punya tautan bisa membukanya, termasuk data di dalamnya. Kamu bisa mencabutnya kapan saja; tautannya akan berhenti berfungsi.';

  @override
  String get pageMakePublic => 'Jadikan publik';

  @override
  String get pagePublicLinkTitle => 'Tautan publik';

  @override
  String get pagePublicLinkBody =>
      'Disalin. Halaman ini tidak tercantum di mesin pencari.';

  @override
  String deletePageTitle(String title) {
    return 'Hapus \"$title\"?';
  }

  @override
  String get openPages => 'Buka di Halaman';

  @override
  String get discard => 'Buang';

  @override
  String get discardChangesTitle => 'Buang perubahan?';

  @override
  String get discardChangesBody => 'Editanmu belum disimpan.';

  @override
  String get keepEditing => 'Lanjut mengedit';

  @override
  String get teachTask => 'Ajari tugas';

  @override
  String get teachWhichBot => 'Bot mana yang harus mempelajari ini?';

  @override
  String get teachRecording => 'Merekam';

  @override
  String get teachRecordingPaused => 'Rekaman dihentikan';

  @override
  String get teachRecordingHelp =>
      'Lakukan tugas seperti biasa. Setiap langkah disimpan bersama tampilan layar; kolom kata sandi tidak pernah disimpan.';

  @override
  String get teachStop => 'Hentikan';

  @override
  String get teachMarkSecret => 'Tandai sebagai rahasia';

  @override
  String get teachMarkSecretHelp =>
      'Yang baru kamu ketik dihapus dari rekaman dan menjadi input rahasia yang diminta bot.';

  @override
  String get teachDraftTitle => 'Keahlian baru';

  @override
  String get teachDrafting => 'Menulis keahlian dari rekamanmu…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString langkah',
      one: '1 langkah',
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
      other: '$countString langkah',
      one: '1 langkah',
    );
    return 'Yang kamu contohkan ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Periksa langkah, input, dan pemeriksaan keberhasilan, lalu simpan. Kamu bisa langsung mencobanya.';

  @override
  String get teachDraftFailed =>
      'Bot gagal menulis draf. Tulis langkahnya sendiri dari rekaman di bawah, atau buang.';

  @override
  String get teachAlreadySaved => 'Keahlian ini tersimpan';

  @override
  String get teachSaveAndTry => 'Simpan dan coba';

  @override
  String teachSaved(String name) {
    return '$name disimpan';
  }

  @override
  String get teachDiscardTitle => 'Buang rekaman ini?';

  @override
  String get teachDiscardBody =>
      'Setiap langkah, snapshot, dan tangkapan layar yang direkam akan dihapus.';

  @override
  String teachStepClick(int x, int y) {
    return 'Klik di $x, $y';
  }

  @override
  String teachStepType(String text) {
    return 'Ketik “$text”';
  }

  @override
  String teachStepSecret(String name) {
    return 'Ketik rahasia $name';
  }

  @override
  String teachStepKey(String key) {
    return 'Tekan $key';
  }

  @override
  String get teachStepScroll => 'Gulir';

  @override
  String get plugins => 'Plugin';

  @override
  String get pluginsRow => 'Keahlian dan alat dari paket plugin';

  @override
  String get noPlugins => 'Belum ada plugin';

  @override
  String get pluginsHelp =>
      'Plugin adalah paket Agent Plugins 1.0 di GitHub. Plugin bisa membawa keahlian dan alat MCP; servernya berjalan di komputer bot ini, tidak pernah di server Casama.';

  @override
  String get addPlugin => 'Tambah plugin';

  @override
  String get addPluginHelp =>
      'Tempel tautan GitHub ke folder plugin. Kamu akan melihat apa yang ditambahkannya sebelum apa pun dipasang.';

  @override
  String get pluginAdds => 'Menambahkan';

  @override
  String pluginStdio(String command) {
    return 'Berjalan di komputer bot: $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Terhubung ke $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'Berbicara dengan: $hosts';
  }

  @override
  String get pluginSkill => 'Keahlian';

  @override
  String get pluginHosts => 'Jaringan';

  @override
  String get pluginServerError => 'Gagal memulai';

  @override
  String get pluginRunsOnComputer => 'Berjalan di komputer bot';

  @override
  String get pluginWhereToolsRun => 'Tempat alatnya berjalan';

  @override
  String get pluginWhereToolsRunHelp =>
      'Di komputermu sendiri, alatnya bisa memakai yang ada di sana, dan hanya kamu yang bisa memakainya dari chatmu sendiri. Server di internet tidak terpengaruh.';

  @override
  String get pluginPlaceBot => 'Komputer bot';

  @override
  String pluginPlaceMine(String name) {
    return 'Komputer saya: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return 'Berjalan di $name';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'Alatnya hanya berfungsi di chat dengan pemilik komputer itu';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Offline: alatnya berfungsi lagi saat aplikasi Casama dibuka di sana';

  @override
  String get pluginUpToDate => 'Sudah terbaru';

  @override
  String get checkForUpdate => 'Periksa pembaruan';

  @override
  String get uninstall => 'Copot';

  @override
  String uninstallPluginTitle(String name) {
    return 'Copot $name?';
  }

  @override
  String get uninstallPluginBody =>
      'Keahlian, alat, file, dan rahasia tersimpannya dihapus dari bot ini.';

  @override
  String updatePluginTitle(String name) {
    return 'Perbarui $name';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'Keahlian baru: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Keahlian berubah: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Keahlian dihapus: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'Server alat baru: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Server alat berubah: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Server alat dihapus: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'Berbicara dengan host baru: $hosts';
  }

  @override
  String get pluginDiffNone => 'Tidak ada perubahan pada yang ditambahkannya.';

  @override
  String get next => 'Berikutnya';

  @override
  String get botNameLabel => 'Nama';

  @override
  String get importAgent => 'Impor agent';

  @override
  String get importAgentHelp =>
      'Bawa bot dari OpenClaw atau Hermes Agent, atau tempel pengaturan dari Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, atau Instinct: persona, keahlian, jadwal, dan memorinya. Kamu akan meninjau semuanya sebelum dibuat. Kunci dan file pengaturan tidak pernah dibaca.';

  @override
  String get importAgentPickFolder => 'Pilih foldernya';

  @override
  String get importAgentPickZip => 'Unggah ZIP foldernya';

  @override
  String get importPasteChoice => 'Tempel pengaturan bot';

  @override
  String get importPasteChoiceHelp =>
      'Dari Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct, atau aplikasi lain';

  @override
  String get importPasteTitle => 'Tempel pengaturan bot';

  @override
  String get importPasteHelp =>
      'Kirim prompt di bawah ini ke botmu, lalu tempel seluruh balasannya. Kamu akan meninjau semuanya sebelum bot baru dibuat.';

  @override
  String get importPasteSource => 'Di mana botmu sekarang?';

  @override
  String get importPasteOther => 'Di tempat lain';

  @override
  String get importPasteStep1 => '1. Kirim prompt ini ke botmu';

  @override
  String get importPasteReply => '2. Tempel balasannya';

  @override
  String get importPasteSafety =>
      'Baris yang terlihat seperti kunci, kata sandi, atau nomor kartu dihapus. Masuk ke aplikasinya lagi setelah mengimpor.';

  @override
  String get importPasteSubtitle => 'Pengaturan yang ditempel';

  @override
  String get agentImportReviewHelp =>
      'Hapus centang yang tidak kamu inginkan. Tidak ada yang dibuat sampai kamu mengimpor.';

  @override
  String get agentImportNoPersona => 'Tidak ada file persona yang ditemukan.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString keahlian',
      one: '1 keahlian',
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
      other: '$countString rutinitas',
      one: '1 rutinitas',
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
      other: '$countString memori',
      one: '1 memori',
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
      other: '$countString file lain',
      one: '1 file lain',
    );
    return 'Salin $_temp0 ke ~/imported/ di komputernya';
  }

  @override
  String agentImportSkipped(String files) {
    return 'Tidak diimpor: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return '$name diimpor dan $countString file disalin ke komputernya';
  }

  @override
  String agentImportedFilesLater(String name) {
    return '$name diimpor. File lainnya belum bisa disalin; beri bot komputer dan impor lagi untuk menyalinnya.';
  }

  @override
  String get importMemoryTitle => 'Impor memori dari ChatGPT atau Claude';

  @override
  String get importMemoryHelp =>
      'Salin prompt ini ke ChatGPT atau Claude, lalu tempel jawabannya di bawah.';

  @override
  String get importMemoryPick => 'Simpan yang benar; hapus centang sisanya.';

  @override
  String get importMemoryPaste => 'Jawabannya';

  @override
  String get importMemoryNone =>
      'Tidak ada memori yang ditemukan di jawaban itu.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString memori ditambahkan',
      one: '1 memori ditambahkan',
    );
    return '$_temp0';
  }

  @override
  String get routinesAsFiles => 'Rutinitas dan keahlian sebagai file';

  @override
  String get routinesAsFilesHelp =>
      'Setiap rutinitas dan keahlian sebagai file Markdown: ekspor, edit di mana saja, impor kembali, atau simpan di repositori GitHub.';

  @override
  String get exportFiles => 'Ekspor sebagai file';

  @override
  String get importFiles => 'Impor file';

  @override
  String get importFilesApply => 'Terapkan';

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

    return '$createdString baru, $updatedString berubah, $unchangedString tidak berubah';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'Diimpor: $createdString baru, $updatedString berubah';
  }

  @override
  String get gitSync => 'Sinkronisasi Git';

  @override
  String get gitSyncOff => 'Nonaktif';

  @override
  String get gitSyncHelp =>
      'Perubahan di Casama di-commit ke repositori, dan push ke repositori memperbarui Casama setelah diperiksa. Jika file berubah di kedua tempat, Casama mempertahankan versinya dan membuka pull request. Memerlukan rahasia GITHUB_TOKEN yang diizinkan untuk api.github.com.';

  @override
  String get gitSyncNeedsToken => 'Memerlukan rahasia GITHUB_TOKEN';

  @override
  String gitSyncedWhen(String when) {
    return 'Disinkronkan $when';
  }

  @override
  String get gitSyncPr => 'Pull request menunggumu';

  @override
  String get syncNow => 'Sinkronkan sekarang';

  @override
  String get syncQueued => 'Menyinkronkan dalam semenit';

  @override
  String get gitBranch => 'Branch';

  @override
  String get gitFolder => 'Folder di repositori (opsional)';

  @override
  String get gitSyncOn => 'Sinkronisasi aktif';

  @override
  String get gitSyncRemove => 'Hentikan sinkronisasi';

  @override
  String get gitWebhookTitle => 'Tambahkan webhook ini ke repositori';

  @override
  String get gitWebhookHelp =>
      'Di pengaturan repositori, tambahkan webhook untuk peristiwa push dengan alamat dan rahasia ini (tipe konten application/json). Rahasia hanya ditampilkan sekarang.';

  @override
  String get gitWebhookUrl => 'URL payload';

  @override
  String get gitWebhookSecret => 'Rahasia';

  @override
  String get knowledge => 'Pengetahuan';

  @override
  String get knowledgeRow => 'Dokumen yang bisa dicari dan dikutipnya';

  @override
  String get noKnowledge => 'Belum ada pengetahuan';

  @override
  String get knowledgeHelp =>
      'Beri bot file, situs web, atau repositori GitHub. Bot mencarinya saat relevan dan memberi tahu dokumen asal jawabannya.';

  @override
  String get addKnowledge => 'Tambah pengetahuan';

  @override
  String get addKnowledgeHelp =>
      'File PDF, Word, Markdown, HTML, CSV, atau teks; situs web (satu domain, mengikuti robots.txt); atau dokumen repositori. Situs web dan repositori diperbarui setiap hari.';

  @override
  String get knowledgeFiles => 'File';

  @override
  String get knowledgeWebsite => 'Situs web';

  @override
  String get knowledgePickFiles => 'Pilih file';

  @override
  String get knowledgeWebsiteUrl => 'Alamat situs web';

  @override
  String get knowledgeRepoUrl => 'Tautan GitHub';

  @override
  String get knowledgeShareAll => 'Bagikan ke semua bot di ruang kerja';

  @override
  String get knowledgeShared => 'Seluruh ruang kerja';

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
      other: '$docsString dokumen',
      one: '1 dokumen',
    );
    return '$_temp0, $chunksString bagian';
  }

  @override
  String get knowledgeError => 'Gagal membacanya';

  @override
  String get knowledgeSyncing => 'Membaca…';

  @override
  String get knowledgePending => 'Menunggu dibaca';

  @override
  String get add => 'Tambah';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot menyarankan keahlian: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot menyarankan perbaikan $name';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Memakai: $tools';
  }

  @override
  String get saveSkill => 'Simpan keahlian';

  @override
  String get applyEdit => 'Terapkan perubahan';

  @override
  String skillSaved(String name) {
    return '$name disimpan';
  }

  @override
  String skillUpdated(String name) {
    return '$name diperbarui';
  }

  @override
  String get skillStats => 'Performa';

  @override
  String get skillNotUsedYet => 'Belum pernah dipakai';

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

    return 'Dipakai $usesString kali · $rateString% berhasil · $failuresString gagal · $correctionsString dikoreksi';
  }

  @override
  String skillLastFailure(String date) {
    return 'Masalah terakhir: $date';
  }

  @override
  String get skillHistory => 'Versi sebelumnya';

  @override
  String get replays => 'Putar ulang';

  @override
  String get replaysRow => 'Langkah terekam yang dijalankan tanpa berpikir';

  @override
  String get noReplays => 'Belum ada putar ulang';

  @override
  String get replaysHelp =>
      'Putar ulang adalah serangkaian langkah browser atau desktop terekam yang dijalankan ulang bot apa adanya, sehingga lebih cepat dan lebih murah. Jika suatu langkah tidak berfungsi lagi, bot mengambil alih dari sana dan dapat memperbarui putar ulang tersebut. Simpan dari rekaman ajari, atau minta bot menyimpan yang baru saja dilakukannya.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString langkah',
      one: '1 langkah',
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
      other: 'dijalankan $runsString kali',
      one: 'dijalankan 1 kali',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '$failuresString perlu bantuan',
      one: '1 perlu bantuan',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return 'Jalankan $name';
  }

  @override
  String get runReplayHelp => 'Periksa nilai yang diisikannya, lalu jalankan.';

  @override
  String get run => 'Jalankan';

  @override
  String get saveAsReplay => 'Simpan juga sebagai putar ulang';

  @override
  String replaySaved(String name) {
    return 'Putar ulang $name disimpan';
  }

  @override
  String get passwordManagers => 'Pengelola kata sandi';

  @override
  String get passwordManagersRow =>
      'Info masuk 1Password atau Bitwarden untuk bot';

  @override
  String get noPasswordManagers => 'Tidak ada pengelola kata sandi terhubung';

  @override
  String get passwordManagersHelp =>
      'Bot bisa masuk dengan info masuk dari brankas pilihanmu. Bot tidak pernah melihat kata sandi: kata sandi hanya diisikan ke browser di situs milik info masuk itu.';

  @override
  String get connectPasswordManager => 'Hubungkan pengelola kata sandi';

  @override
  String get pmWorkspace => 'Seluruh ruang kerja';

  @override
  String get pmJustMe => 'Hanya saya';

  @override
  String get pmNoVaults => 'Belum ada brankas yang dipilih';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString brankas',
      one: '1 brankas',
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
      other: '$countString info masuk',
      one: '1 info masuk',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Memakai server 1Password Connect dengan token akun layanan.';

  @override
  String get pmBitwardenHelp =>
      'Memakai API Manajemen Brankas Bitwarden (bw serve) untuk koleksi organisasimu.';

  @override
  String get pmConnectUrl => 'Alamat server Connect';

  @override
  String get pmConnectToken => 'Token Connect';

  @override
  String get pmBwUrl => 'Alamat bw serve';

  @override
  String get pmBwToken => 'Token akses (opsional)';

  @override
  String get pmForWorkspace => 'Untuk seluruh ruang kerja';

  @override
  String get pmChooseVaults => 'Brankas yang boleh dipakai bot';

  @override
  String get pmChooseVaultsHelp =>
      'Hanya info masuk di brankas atau koleksi yang kamu centang yang tersedia untuk bot.';

  @override
  String get welcomeGettingReady => 'Menyiapkan ruangmu…';

  @override
  String get setUpManually => 'Siapkan secara manual';

  @override
  String get tryAgain => 'Coba lagi';

  @override
  String get inviteLinkCopied =>
      'Tautan undangan disalin. Kirim ke rekan kerjamu.';

  @override
  String get inviteFriends => 'Undang teman';

  @override
  String inviteFriendsRow(String amount) {
    return 'Dapatkan $amount kuota gratis untuk setiap teman yang bergabung';
  }

  @override
  String get inviteFriendsRowPlain => 'Bagikan Casama ke teman-temanmu';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Beri Casama, dapatkan $amount';
  }

  @override
  String get inviteFriendsHeadlinePlain => 'Bagikan Casama ke teman';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Kirim tautanmu ke teman. Saat mereka mendaftar dan menyelesaikan chat pertamanya, kamu mendapat $amount kuota gratis.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Kirim tautanmu ke teman. Mereka bisa langsung mendaftar.';

  @override
  String get inviteFriendsYourCode => 'Kode undanganmu. Ketuk untuk salin.';

  @override
  String get inviteFriendsShare => 'Bagikan tautan';

  @override
  String get inviteFriendsCopyLink => 'Salin tautan';

  @override
  String get inviteFriendsCopied => 'Disalin. Kirim ke teman.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Gabung dengan saya di Casama, tempat rekan tim AI menyelesaikan pekerjaan untukmu: $link (kode undangan $code)';
  }

  @override
  String get inviteFriendsProgress => 'Undanganmu';

  @override
  String get inviteFriendsJoined => 'Teman yang bergabung';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString belum menyelesaikan chat pertamanya',
      one: '1 belum menyelesaikan chat pertamanya',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Kuota gratis yang didapat';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString teman lagi bisa memberimu hadiah',
      one: '1 teman lagi bisa memberimu hadiah',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'Kamu sudah mendapatkan hadiah undangan maksimal. Terima kasih!';

  @override
  String get inviteFriendsHow => 'Cara kerjanya';

  @override
  String get inviteFriendsStep1 => 'Bagikan tautan atau kodemu ke teman';

  @override
  String get inviteFriendsStep2 =>
      'Mereka mendaftar dan memasukkan kodemu dalam seminggu';

  @override
  String inviteFriendsStep3(String amount) {
    return 'Saat mereka menyelesaikan chat pertamanya, kamu mendapat $amount kuota gratis';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'Mereka langsung mulai dengan rekan tim AI mereka sendiri';

  @override
  String get inviteFriendsUnavailable =>
      'Undangan tidak tersedia di server ini.';

  @override
  String get referralHaveCode => 'Punya kode teman?';

  @override
  String get referralCodeHint => 'Kode undangan';

  @override
  String get referralUse => 'Pakai';

  @override
  String get referralRedeemed =>
      'Kode undangan ditambahkan. Selamat datang di Casama!';

  @override
  String referralRedeemedFrom(String name) {
    return 'Kamu bergabung lewat undangan $name. Selamat datang di Casama!';
  }

  @override
  String referralJoinedThrough(String name) {
    return 'Kamu bergabung lewat undangan $name.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'Kamu bergabung lewat undangan teman.';

  @override
  String referralInvitedBy(String name) {
    return '$name mengundangmu';
  }

  @override
  String get referralInvitedByFriend => 'Seorang teman mengundangmu';

  @override
  String get referralWelcomeTitle => 'Selamat datang di Casama';

  @override
  String get referralWelcomeHelp =>
      'Rekan tim AI yang bekerja untukmu di komputer mereka sendiri. Terima undangan agar temanmu mendapat bonus.';

  @override
  String get referralAccept => 'Terima undangan';

  @override
  String get referralGetStarted => 'Mulai';

  @override
  String get referralInvalid => 'Undangan ini tidak berfungsi';

  @override
  String get referralInvalidHelp =>
      'Kodenya mungkin salah ketik. Kamu tetap bisa mendaftar dan memakai Casama.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return 'Beri $amount, dapatkan $amount';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Kirim tautanmu ke teman. Saat mereka mendaftar dengan kodemu dan menyelesaikan chat pertamanya, kalian masing-masing mendapat $amount kuota gratis.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Kirim tautanmu ke teman. Saat mereka mendaftar dengan kodemu dan menyelesaikan chat pertamanya, kamu mendapat $reward kuota gratis dan mereka mendapat $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'Saat mereka menyelesaikan chat pertamanya, kalian masing-masing mendapat $amount kuota gratis';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'Saat mereka menyelesaikan chat pertamanya, kamu mendapat $reward dan mereka mendapat $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Gabung dengan saya di Casama, tempat rekan tim AI menyelesaikan pekerjaan untukmu. Daftar dengan kode undangan saya $code dan kamu mendapat $amount kuota gratis: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Masukkan dalam seminggu setelah mendaftar dan dapatkan $amount kuota gratis setelah chat pertamamu.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return 'Bonus selamat datang $amount sudah masuk ke ruang kerjamu.';
  }

  @override
  String referralWelcomePending(String amount) {
    return 'Bonus selamat datang $amount tiba setelah chat pertamamu.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'Rekan tim AI yang bekerja untukmu di komputer mereka sendiri. Terima undangan dan dapatkan $amount kuota gratis setelah chat pertamamu.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return 'Kamu sudah masuk! Bonus selamat datang $amount tiba setelah chat pertamamu.';
  }

  @override
  String get connectManaged => 'Masuk lewat Composio';

  @override
  String connectManagedHelp(String app) {
    return 'Casama menghubungkan $app lewat Composio, yang menangani proses masuk. Kamu bisa memutuskan kapan saja.';
  }

  @override
  String get sharing => 'Berbagi';

  @override
  String get sharingRow => 'Yang bisa chat, mengedit, atau mengelolanya';

  @override
  String get sharingHelp =>
      'Semua orang di ruang kerja bisa chat dengan bot kecuali kamu membuatnya privat. Orang yang kamu tambahkan bisa chat, mengedit pengaturannya, atau juga mengelola siapa yang punya akses. Bot yang bekerja untuk seseorang hanya memakai komputer pribadi dan koneksinya sendiri.';

  @override
  String get sharingPrivate => 'Privat';

  @override
  String get sharingPrivateOn =>
      'Hanya kamu dan orang di bawah yang bisa melihatnya';

  @override
  String get sharingPrivateOff =>
      'Semua orang di ruang kerja bisa chat dengannya';

  @override
  String get sharingPeople => 'Orang';

  @override
  String get sharingOnlyCreator => 'Hanya pembuatnya';

  @override
  String get sharingEveryoneChats =>
      'Semua orang bisa chat; tambahkan orang yang boleh mengeditnya';

  @override
  String sharingEveryoneRole(String role) {
    return 'Semua orang yang berstatus $role';
  }

  @override
  String get accessChat => 'Bisa chat';

  @override
  String get accessEdit => 'Bisa edit';

  @override
  String get accessAdmin => 'Bisa kelola';

  @override
  String get sharingSaved => 'Pengaturan berbagi tersimpan';

  @override
  String get triggerCalendar => 'Rapat';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Sekitar rapat yang cocok ($minutesString mnt)',
      zero: 'Di awal rapat yang cocok',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Hubungkan Google Calendar atau Outlook dulu.';

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
      other: '$minutesString mnt',
      zero: 'Saat mulai',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests =>
      'Hanya rapat dengan orang di luar perusahaan saya';

  @override
  String get calendarVideoLink => 'Hanya rapat dengan tautan video';

  @override
  String get calendarTitleMatch => 'Hanya judul yang berisi (opsional)';

  @override
  String get fullAccess => 'Akses penuh';

  @override
  String get fullAccessHelp =>
      'Bot bertindak tanpa bertanya dulu, di komputernya dan di Mac kamu. Pembayaran, perubahan kata sandi, dan aturan \"tanya\" buatanmu sendiri tetap bertanya.';

  @override
  String get fullAccessConfirmTitle => 'Aktifkan akses penuh?';

  @override
  String get fullAccessConfirmBody =>
      'Setiap bot di ruang kerja ini akan mengirim pesan, menghapus file, menjalankan perintah di Mac kamu, dan menambahkan koneksi tanpa bertanya kepadamu lebih dulu. Pembayaran dan perubahan kata sandi tetap bertanya.';

  @override
  String get fullAccessTurnOn => 'Aktifkan';

  @override
  String get botToBot => 'Bot bisa saling berbicara';

  @override
  String get botToBotHelp =>
      'Bot bisa @menyebut, berkirim pesan, dan menyerahkan pekerjaan satu sama lain.';

  @override
  String get capMessages => 'Pesan (iMessage)';

  @override
  String get chatApps => 'Aplikasi chat';

  @override
  String get chatAppsRow =>
      'Telegram, email, SMS, Slack, WhatsApp, dan lainnya';

  @override
  String get botEmail => 'Alamat email';

  @override
  String get botEmailRow => 'Beri bot ini alamatnya sendiri';

  @override
  String botEmailClaimTitle(String name) {
    return 'Beri $name alamat email';
  }

  @override
  String get botEmailClaimHelp =>
      'Orang-orang bisa mengirim email ke sini, dan bot membalas lewat email. Teruskan apa saja: tagihan, pemesanan, buletin.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'Nama tidak bisa diubah nanti.';

  @override
  String get botEmailNameLabel => 'Nama';

  @override
  String botEmailWillBe(String address) {
    return 'Alamat botmu: $address.';
  }

  @override
  String get botEmailClaim => 'Buat alamat';

  @override
  String get botEmailTaken => 'Nama itu sudah dipakai. Coba salah satu ini:';

  @override
  String get botEmailClaimed => 'Botmu sudah punya alamat';

  @override
  String get botEmailClaimedHelp =>
      'Email selamat datang sedang dikirim kepadamu. Balas email itu, atau teruskan apa saja.';

  @override
  String get botEmailCopy => 'Salin';

  @override
  String get botEmailCopied => 'Disalin';

  @override
  String get botEmailContacts => 'Tambahkan ke kontak';

  @override
  String botEmailWrite(String name) {
    return 'Tulis ke $name';
  }

  @override
  String get botEmailPaused =>
      'Dijeda. Bot tetap menerima dan menyimpan email, tetapi tidak membalas apa pun.';

  @override
  String get botEmailPause => 'Jeda';

  @override
  String get botEmailResume => 'Lanjutkan';

  @override
  String get botEmailSenders => 'Pengirim yang diizinkan';

  @override
  String get botEmailSendersHelp =>
      'Hanya orang-orang ini yang mendapat balasan. Email orang asing disimpan dan tidak memulai apa pun.';

  @override
  String get botEmailEditSenders => 'Edit di aplikasi chat';

  @override
  String get botEmailMove => 'Pindahkan ke bot lain';

  @override
  String get botEmailMoveHelp => 'Alamat dan emailnya dipindahkan ke bot lain.';

  @override
  String get botEmailRelease => 'Lepas alamat';

  @override
  String get botEmailReleaseHelp =>
      'Berhenti menerima selamanya. Nama tidak akan diberikan lagi.';

  @override
  String botEmailReleaseConfirm(String address) {
    return 'Lepas $address? Alamat langsung berhenti menerima, dan namanya tidak akan diberikan lagi.';
  }

  @override
  String get botEmailReleaseNow => 'Lepas';

  @override
  String get botEmailMoved => 'Dipindahkan';

  @override
  String botEmailNewBotRow(String name) {
    return 'Beri $name alamat email';
  }

  @override
  String get botEmailInbox => 'Kotak masuk';

  @override
  String get botEmailInboxRow => 'Email tersimpan, orang asing, dan file';

  @override
  String get botEmailEmpty => 'Belum ada email';

  @override
  String get botEmailStrangers => 'Orang asing';

  @override
  String get botEmailAll => 'Semua email';

  @override
  String get botEmailUnconfirmed => 'Tidak dapat memastikan pengirim ini';

  @override
  String get botEmailAllow => 'Izinkan';

  @override
  String get botEmailBlock => 'Blokir';

  @override
  String get botEmailBlocked => 'Diblokir. Email baru dari sini ditolak.';

  @override
  String get botEmailUnblock => 'Buka blokir';

  @override
  String get botEmailOpenChat => 'Buka chat';

  @override
  String get botEmailFiles => 'File';

  @override
  String get botEmailNewSenders => 'Beri tahu saya tentang pengirim baru';

  @override
  String get botEmailNewSendersHelp =>
      'Paling banyak sekali sehari. Nonaktif kecuali kamu aktifkan.';

  @override
  String get botEmailTryTitle => 'Hal untuk dicoba';

  @override
  String get botEmailTryForward => 'Teruskan tagihan atau pemesanan';

  @override
  String get botEmailTryForwardHelp =>
      'Teruskan apa saja ke alamat di atas. Bot membacanya dan menjawab di sini.';

  @override
  String get botEmailTryReceipts => 'Simpan struk saya';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return 'Membuat rutinitas yang mengarsipkan email ke $address.';
  }

  @override
  String get botEmailTryDigest => 'Satu rangkuman per minggu';

  @override
  String botEmailTryDigestHelp(String address) {
    return 'Membuat rutinitas yang mengumpulkan buletin dari $address menjadi ringkasan mingguan.';
  }

  @override
  String get botEmailTryCopied => 'Alamat disalin';

  @override
  String get botEmailTryMade => 'Rutinitas dibuat';

  @override
  String get botEmailReceiptsName => 'Simpan struk saya';

  @override
  String get botEmailReceiptsInstructions =>
      'Arsipkan struk dari email ini: untuk apa, berapa jumlahnya, dan kapan. Jangan katakan apa pun kecuali ada yang terlihat salah.';

  @override
  String get botEmailDigestName => 'Rangkuman buletin mingguan';

  @override
  String get botEmailDigestInstructions =>
      'Kumpulkan buletin minggu ini dan kirim satu rangkuman singkat: berita utama yang perlu diketahui, tidak lebih.';

  @override
  String get botEmailTriggerTag => 'Tag alamat';

  @override
  String get botEmailTriggerTagHelp =>
      'Hanya email ke tag ini, seperti shop untuk ada+shop@. Hanya alamat email.';

  @override
  String get botEmailTriggerUnconfirmed =>
      'Dengarkan pengirim belum terkonfirmasi juga';

  @override
  String get botEmailTriggerAutomatic => 'Tanggapi email otomatis juga';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used dari $limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return '$used terpakai';
  }

  @override
  String get botEmailStorageFull =>
      'Kotak surat penuh, jadi email baru ditolak. Hapus email lama untuk memberi ruang.';

  @override
  String get botEmailSelect => 'Pilih';

  @override
  String get botEmailSelectDone => 'Selesai';

  @override
  String get botEmailDelete => 'Hapus';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hapus $n email',
      one: 'Hapus 1 email',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Hapus $n email?',
      one: 'Hapus email ini?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'Teks dan filenya akan terhapus permanen. Salinan yang sudah ada di chat tetap di sana.';

  @override
  String get botEmailDeleteOlder => 'Hapus email yang lebih lama';

  @override
  String get botEmailOlder30Days => 'Lebih lama dari 30 hari';

  @override
  String get botEmailOlder6Months => 'Lebih lama dari 6 bulan';

  @override
  String get botEmailOlderYear => 'Lebih lama dari setahun';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': 'Hapus semua email yang lebih lama dari 30 hari?',
      'months6': 'Hapus semua email yang lebih lama dari 6 bulan?',
      'other': 'Hapus semua email yang lebih lama dari setahun?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n email dihapus',
      one: '1 email dihapus',
      zero: 'Tidak ada yang perlu dihapus',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n alamat email bot',
      one: '1 alamat email bot',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew => 'Bot menulis ke orang baru lewat email';

  @override
  String get botEmailPerkRepliesOnly => 'Bot membalasmu lewat email';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Hubungkan aplikasi chat';

  @override
  String get chatAppsEmpty => 'Belum ada aplikasi chat';

  @override
  String get chatAppsHelp =>
      'Izinkan orang mengirim pesan ke bot ini dari Telegram, email, SMS, Slack, WhatsApp, Messenger, Feishu, atau iMessage. Bot ini hanya menjawab orang di daftar yang diizinkan; semua yang lain dicatat di sini.';

  @override
  String get chatAppsAddHelp =>
      'Tempel kredensial dari pengaturan pengembang aplikasi tersebut. Kredensial disimpan terenkripsi dan tidak pernah ditampilkan lagi.';

  @override
  String get chatAppsKind => 'Aplikasi';

  @override
  String get chatAppsSenders => 'Pengirim yang diizinkan';

  @override
  String get chatAppsSendersHelp =>
      'Satu per baris: alamat email (atau *@perusahaan.com), nomor telepon, atau ID pengguna. Tidak tahu ID-nya? Biarkan kosong, kirim pesan ke bot, lalu salin ID dari Aktivitas.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Nyalakan \"Gunakan komputer ini untuk bot\" dengan Pesan diizinkan di aplikasi desktop di Mac-mu terlebih dahulu.';

  @override
  String chatAppsConnected(String name) {
    return '$name terhubung';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram sudah mengirim pesan ke sini. Kirim pesan ke botmu untuk mencobanya.';

  @override
  String get chatAppsPasteUrl =>
      'Tempel alamat ini ke pengaturan webhook aplikasi tersebut.';

  @override
  String get chatAppsWebhookUrl => 'Alamat webhook';

  @override
  String get chatAppsVerifyToken => 'Token verifikasi';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString pengirim diizinkan',
      one: '1 pengirim diizinkan',
      zero: 'Tidak ada yang diizinkan',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Aktivitas';

  @override
  String get chatAppsNoActivity => 'Belum ada pesan.';

  @override
  String get chatAppsIgnored => 'Diabaikan: tidak ada di daftar yang diizinkan';

  @override
  String get chatAppsAllow => 'Izinkan';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender sekarang bisa mengirim pesan ke bot ini';
  }

  @override
  String get chatAppsRoutine => 'Rutinitas dimulai';

  @override
  String get chatAppsFailed => 'Tidak bisa mengirim';

  @override
  String get chatAppsSent => 'Terkirim';

  @override
  String get chatAppsAnswered => 'Dijawab';

  @override
  String get chatAppsRemove => 'Putuskan';

  @override
  String get chBotToken => 'Token bot';

  @override
  String get chAddress => 'Alamat email';

  @override
  String get chApiKey => 'Kunci API';

  @override
  String get chSigningSecret => 'Rahasia penandatanganan';

  @override
  String get chPhoneNumber => 'Nomor telepon';

  @override
  String get chAccountSid => 'SID akun';

  @override
  String get chAuthToken => 'Token autentikasi';

  @override
  String get chPhoneNumberId => 'ID nomor telepon';

  @override
  String get chAccessToken => 'Token akses';

  @override
  String get chAppSecret => 'Rahasia aplikasi';

  @override
  String get chPageToken => 'Token akses halaman';

  @override
  String get chAppId => 'ID aplikasi';

  @override
  String get chEncryptKey => 'Kunci enkripsi';

  @override
  String get chVerificationToken => 'Token verifikasi';

  @override
  String get chPublicKey => 'Kunci publik';

  @override
  String get chTrackerUser => 'ID pengguna bot di pelacak';

  @override
  String get chSiteUrl => 'Alamat situs (https://…)';

  @override
  String get chAccountEmail => 'Email akun';

  @override
  String get routineMessage => 'Saat pesan yang cocok tiba';

  @override
  String get triggerMessage => 'Pesan';

  @override
  String get messageTriggerHelp =>
      'Dimulai saat email atau pesan chat ke bot ini cocok. Hubungkan aplikasinya di Aplikasi chat terlebih dahulu.';

  @override
  String get messageTriggerAnyApp => 'Aplikasi apa saja';

  @override
  String get messageTriggerSender =>
      'Dari (alamat, nomor, atau *@perusahaan.com)';

  @override
  String get messageTriggerSubject => 'Subjek berisi';

  @override
  String get messageTriggerWords => 'Pesan berisi';

  @override
  String callIncoming(String name) {
    return '$name menelepon';
  }

  @override
  String get callAnswer => 'Jawab';

  @override
  String get callDecline => 'Tolak';

  @override
  String get callFullScreenTitle => 'Panggilan di Layar Terkunci';

  @override
  String get callFullScreenOff =>
      'Nonaktif: panggilan bot hanya tampil sebagai notifikasi. Ketuk agar panggilan berdering di layar penuh.';

  @override
  String get encryption => 'Enkripsi konten';

  @override
  String get encryptionHelp =>
      'Pesan, memori, tiket, halaman, dan pengetahuan dienkripsi sebelum disimpan, dengan kunci ruang kerja ini sendiri. Pencarian lalu mencocokkan judul dan makna, bukan kata persis dalam teks terenkripsi.';

  @override
  String get encryptionOff => 'Nonaktif';

  @override
  String get encryptionUnavailable =>
      'Tidak tersedia: server ini belum memiliki kunci enkripsi';

  @override
  String get encryptionEncrypting =>
      'Menyalakan: mengenkripsi data yang sudah tersimpan';

  @override
  String get encryptionOnServer => 'Aktif, dengan kunci server';

  @override
  String get encryptionOnKms => 'Aktif, dengan AWS KMS';

  @override
  String get encryptionDecrypting =>
      'Mematikan: mendekripsi data yang tersimpan';

  @override
  String get encryptionConfirm =>
      'Konten akan dienkripsi dengan kunci ruang kerja ini. Jika ruang kerja dihapus, kuncinya ikut dimusnahkan dan kontennya tidak bisa dipulihkan. Pencarian kata persis berhenti mencocokkan teks terenkripsi.';

  @override
  String get encryptionTurnOn => 'Nyalakan';

  @override
  String get encryptionRotate => 'Putar kunci';

  @override
  String get encryptionKeyManaged =>
      'Casama membuat dan menyimpan kunci ruang kerja ini untukmu, dibungkus dengan kunci server sendiri. Tidak ada yang perlu disimpan atau disalin.';

  @override
  String get encryptionRotateTitle => 'Putar kuncinya?';

  @override
  String get encryptionRotateBody =>
      'Kunci ruang kerja dibungkus ulang dengan kunci server saat ini. Kontenmu tetap terbaca dan tidak ada yang perlu dienkripsi ulang. Lakukan ini setelah mengganti kunci server, atau secara berkala.';

  @override
  String get encryptionRotateHelp =>
      'Membungkus ulang kunci ruang kerja dengan kunci server saat ini';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Terakhir diganti $when';
  }

  @override
  String get memoryBackend => 'Tempat memori disimpan';

  @override
  String get memoryBuiltIn => 'Bawaan';

  @override
  String get memoryBackendHelp => 'Memori jangka panjang bot';

  @override
  String get memoryBackendSheetHelp =>
      'Simpan memori botmu di Honcho atau Supermemory dengan akunmu sendiri. Layar memori, ekspor, dan penghapusan bekerja dengan cara yang sama.';

  @override
  String get memoryHonchoWorkspace => 'Ruang kerja Honcho';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Kosongkan untuk memakai yang dibuat bagi ruang kerja Casama ini';

  @override
  String get memoryBaseUrl => 'Alamat server (opsional)';

  @override
  String get memoryBaseUrlHelp =>
      'Hanya untuk Honcho atau Supermemory yang dihosting sendiri';

  @override
  String get memoryCopyExisting => 'Salin memori saat ini';

  @override
  String get memoryUseBuiltIn => 'Gunakan memori bawaan lagi';

  @override
  String get providerHintData => 'data berbayar (tempat, email, SEO)';

  @override
  String get kindA2a => 'Agen AI (A2A)';

  @override
  String get a2aAgentUrl => 'Alamat agen atau URL kartu agen';

  @override
  String get a2aAgentToken => 'Token akses (opsional)';

  @override
  String get a2a => 'Agent-to-Agent (A2A)';

  @override
  String get a2aHelp =>
      'Agen dari luar dapat memberi tugas kepada bot yang kamu terbitkan.';

  @override
  String get chromeExtensionSwitch => 'Casama untuk Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      'Anggota dapat memakai ekstensi browser dengan ruang kerja ini.';

  @override
  String get chromeActSwitch => 'Bot di browser anggota';

  @override
  String get chromeActSwitchHelp =>
      'Anggota dapat mengizinkan bot membuka halaman dan bertindak di Chrome mereka sendiri, dalam grup tab yang bisa mereka hentikan.';

  @override
  String get a2aPublish => 'Terbitkan sebagai agen A2A';

  @override
  String get a2aPublishHelp =>
      'Agen dari luar dengan kunci API ruang kerja dapat memberi tugas kepada bot ini.';

  @override
  String get a2aWorkspaceOff =>
      'Nyalakan agent-to-agent di pengaturan ruang kerja terlebih dahulu.';

  @override
  String get a2aCardUrl => 'Kartu agen';

  @override
  String get phoneCalls => 'Panggilan telepon';

  @override
  String get phoneCallsHelp =>
      'Izinkan bot menelepon bisnis untukmu lewat akun Twilio-mu. Setiap panggilan tetap minta persetujuanmu dulu, seperti biasa.';

  @override
  String get twilioSid => 'SID akun';

  @override
  String get twilioToken => 'Token autentikasi';

  @override
  String get twilioFrom => 'Panggilan berasal dari';

  @override
  String get phoneCallsPersonal => 'Izinkan menelepon nomor pribadi';

  @override
  String get phoneCallsCap => 'Panggilan per hari';

  @override
  String get phoneCallsOff => 'Belum terhubung';

  @override
  String get outCall => 'Telepon';

  @override
  String get outCallRinging => 'Berdering…';

  @override
  String get outCallLive => 'Sedang dalam panggilan';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Berakhir setelah $secondsString dtk';
  }

  @override
  String get outCallEndedByYou => 'Kamu mengakhiri panggilan';

  @override
  String get outCallTakenOver => 'Kamu mengambil alih panggilan';

  @override
  String get outCallFailed => 'Tidak tersambung';

  @override
  String get outCallNothingYet => 'Belum ada yang diucapkan.';

  @override
  String get outCallTakeOver => 'Ambil alih';

  @override
  String get outCallEnd => 'Akhiri panggilan';

  @override
  String get outCallYourPhone => 'Nomor teleponmu';

  @override
  String get outCallYourPhoneHelp =>
      'Format internasional, seperti +14155550123. Kosongkan untuk memakai nomor yang tersimpan.';

  @override
  String get payments => 'Pembayaran';

  @override
  String get paymentsHelp =>
      'Izinkan bot membayar merchant dengan kartu virtual sekali pakai yang kamu setujui setiap kali. Bawa akun Stripe Issuing milikmu sendiri.';

  @override
  String paymentsOn(String spent, String cap) {
    return '$spent terpakai bulan ini dari $cap';
  }

  @override
  String get paymentsSheetHelp =>
      'Setiap kartu disetujui olehmu dengan jumlah yang ditampilkan, berlaku sekali di merchant tersebut selama satu jam, dan tidak pernah untuk sekuritas, kripto, kartu hadiah, atau transfer.';

  @override
  String get paymentsStripeKey => 'Kunci rahasia Stripe (dengan Issuing)';

  @override
  String get paymentsWebhookSecret => 'Rahasia penandatanganan webhook';

  @override
  String get paymentsWebhook => 'Arahkan webhook Stripe ke sini';

  @override
  String get paymentsCardholder => 'Nama di kartu';

  @override
  String get paymentsAddress => 'Alamat penagihan';

  @override
  String get paymentsCity => 'Kota';

  @override
  String get paymentsState => 'Provinsi atau wilayah';

  @override
  String get paymentsZip => 'Kode pos';

  @override
  String get paymentsCountry => 'Negara (2 huruf)';

  @override
  String get paymentsCap => 'Batas ruang kerja per bulan (USD)';

  @override
  String get paymentsBotCap => 'Batas per bot per bulan (USD)';

  @override
  String get links => 'Bot tertaut';

  @override
  String get linksRow => 'Tautkan dengan bot kontak tepercaya';

  @override
  String get linksHelp =>
      'Botmu dapat meminta bantuan bot kontak tepercaya untuk hal-hal seperti jadwal makan malam. Setiap bot menjawab sesuai aturan pemiliknya masing-masing dan hanya membagikan yang diperlukan; kalian berdua melihat setiap pertukaran.';

  @override
  String get linksEmpty => 'Belum ada bot tertaut';

  @override
  String get linksInvite => 'Undang kontak';

  @override
  String get linksContactName => 'Nama kontak';

  @override
  String get linksInviteReady => 'Kirim undangan ini';

  @override
  String get linksInviteHelp =>
      'Kirimkan ke kontakmu. Mereka menerimanya di Casama dengan salah satu bot mereka. Berlaku sekali, selama 7 hari.';

  @override
  String get linksAccept => 'Terima undangan';

  @override
  String get linksAcceptHelp => 'Tempel undangan yang dikirim kontakmu.';

  @override
  String get linksInviteText => 'Undangan';

  @override
  String linksActive(String bot) {
    return 'Tertaut dengan $bot';
  }

  @override
  String get linksPending => 'Menunggu kontakmu menerima';

  @override
  String get linksRevoked => 'Tautan diputus';

  @override
  String get linksExchanges => 'Pertukaran';

  @override
  String get linksNoExchanges => 'Belum ada yang ditanyakan.';

  @override
  String get linksNoAnswer => 'Tidak ada jawaban';

  @override
  String get linksWorking => 'Sedang bekerja…';

  @override
  String get linksRevoke => 'Putus tautan';

  @override
  String get wakeWord => 'Kata pemicu';

  @override
  String get wakeWordRow => 'Ucapkan frasa untuk memulai panggilan dengan bot';

  @override
  String wakeWordOnRow(String phrase) {
    return 'Mendengarkan \"$phrase\"';
  }

  @override
  String get wakeWordHelp =>
      'Saat Casama terbuka, perangkat ini mendengarkan frasamu dan memulai panggilan langsung dengan bot yang kamu pilih.';

  @override
  String get wakeWordListen => 'Dengarkan kata pemicu';

  @override
  String get wakeWordPhrase => 'Frasa';

  @override
  String get wakeWordPhraseHelp => 'Dua atau tiga kata, seperti \"hei casama\"';

  @override
  String get wakeWordBot => 'Hubungi bot ini';

  @override
  String get wakeWordDownloading => 'Mengunduh model di perangkat…';

  @override
  String get wakeWordTest => 'Uji frasa';

  @override
  String get wakeWordTesting => 'Mendengarkan… ucapkan frasamu';

  @override
  String get wakeWordHeard => 'Terdengar!';

  @override
  String get wakeWordStopTest => 'Hentikan';

  @override
  String get wakeWordPrivacy =>
      'Mendengarkan terjadi di perangkat ini dengan model sumber terbuka (sekitar 18 MB, diunduh sekali). Tidak ada yang dikirim ke mana pun sampai panggilan dimulai.';

  @override
  String get secretStore => 'Tempat rahasia disimpan';

  @override
  String get secretStoreVault => 'Brankas server ini';

  @override
  String get secretStoreHelp =>
      'Simpan rahasia bernama milik bot di proyek Infisical-mu sendiri. Casama hanya menyimpan nama setiap rahasia dan di mana rahasia itu boleh dipakai.';

  @override
  String get secretStoreSite => 'Alamat Infisical';

  @override
  String get secretStoreProject => 'ID proyek';

  @override
  String get secretStoreEnv => 'Lingkungan';

  @override
  String get secretStoreClientId => 'ID klien identitas mesin';

  @override
  String get secretStoreClientSecret => 'Rahasia klien';

  @override
  String get secretStoreMove => 'Pindahkan rahasia saat ini ke Infisical';

  @override
  String get secretStoreBack => 'Gunakan brankas server ini lagi';

  @override
  String get localServer => 'Jalankan Casama di komputer ini';

  @override
  String get setupTitleMac => 'Siapkan Casama di Mac ini';

  @override
  String get setupTitle => 'Siapkan Casama di komputer ini';

  @override
  String get setupEntryMac => 'Jalankan di Mac ini';

  @override
  String get setupEntry => 'Jalankan di komputer ini';

  @override
  String get setupEntryHelp =>
      'Server pribadimu sendiri di komputer ini. Gratis untuk penggunaan pribadi.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Server';

  @override
  String get setupStepAccount => 'Akun';

  @override
  String get setupStepModel => 'Model AI';

  @override
  String get setupStepPhone => 'Ponsel';

  @override
  String get setupDockerChecking => 'Memeriksa Docker…';

  @override
  String get setupDockerMissingTitle => 'Pertama, instal Docker';

  @override
  String get setupDockerMissingBodyMac =>
      'Server Casama berjalan di dalam Docker Desktop, aplikasi gratis yang memisahkannya dari bagian lain Mac-mu.';

  @override
  String get setupDockerMissingBodyLinux =>
      'Server Casama berjalan di dalam Docker, yang memisahkannya dari bagian lain komputermu.';

  @override
  String get setupDockerGetMac => 'Unduh Docker Desktop';

  @override
  String get setupDockerGetLinux => 'Buka panduan instalasi Docker';

  @override
  String get setupDockerStep1 =>
      'Buka file yang diunduh lalu seret Docker ke Applications.';

  @override
  String get setupDockerStep2 => 'Buka Docker lalu setujui ketentuannya.';

  @override
  String get setupDockerStep3 =>
      'Kembali ke sini. Halaman ini berlanjut sendiri.';

  @override
  String get setupDockerWaiting => 'Menunggu Docker…';

  @override
  String get setupDockerStoppedTitle => 'Docker harus berjalan';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker sudah terpasang tapi belum terbuka. Begitu selesai dimulai, yang bisa memakan waktu satu menit, halaman ini berlanjut sendiri.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker sudah terpasang tapi belum berjalan. Jalankan dengan perintah ini, lalu halaman ini berlanjut sendiri.';

  @override
  String get setupDockerOpen => 'Buka Docker';

  @override
  String get setupDockerOpening => 'Memulai Docker…';

  @override
  String get setupDockerPermissionTitle => 'Docker memerlukan izinmu';

  @override
  String get setupDockerPermissionBody =>
      'Docker berjalan, tapi penggunamu tidak diizinkan memakainya. Jalankan perintah ini, lalu keluar dan masuk lagi.';

  @override
  String get setupDockerComposeTitle => 'Docker belum memiliki Compose';

  @override
  String get setupDockerComposeBody =>
      'Docker ini tidak memiliki Compose v2. Docker Desktop sudah menyertakannya; di Linux, pasang paket docker-compose-plugin.';

  @override
  String get setupStepSkipped => 'Dilewati';

  @override
  String get setupArtDocker => 'Pertama, wadah tempat servermu berjalan.';

  @override
  String get setupArtServer =>
      'Membangun rumahmu. Ini bagian yang paling lama.';

  @override
  String get setupArtAccount => 'Servermu sudah berjalan!';

  @override
  String get setupArtModel => 'Sekarang beri ia otak.';

  @override
  String get setupArtPhone => 'Langkah terakhir: bawa ke mana-mana.';

  @override
  String get setupDockerSlowTitle => 'Memakan waktu lama?';

  @override
  String get setupDockerSlowMenuBar =>
      'Cari ikon paus di bar menu. Docker siap saat ikon itu berhenti bergerak.';

  @override
  String get setupDockerSlowTerms =>
      'Jika Docker menampilkan jendela yang memintamu menyetujui ketentuannya, selesaikan itu dulu. Masuk ke Docker bersifat opsional.';

  @override
  String get setupDockerSlowRestart =>
      'Masih macet? Keluar dari Docker lewat menunya, lalu tekan Periksa Lagi.';

  @override
  String get setupDockerSlowInstalled =>
      'Sudah menginstalnya? Buka Docker sekali dari Applications agar bisa menyiapkan dirinya sendiri.';

  @override
  String get setupDockerSlowOther =>
      'Memakai OrbStack atau Colima sebagai gantinya? Jalankan saja. Casama bekerja dengan Docker apa pun yang merespons docker info.';

  @override
  String get setupDockerSlowTerminal =>
      'Jalankan docker info di terminal untuk melihat apa kata Docker.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker berkata: $detail';
  }

  @override
  String get setupDockerRecheck => 'Periksa lagi';

  @override
  String get setupDockerGuide => 'Panduan pemecahan masalah';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Hanya $gb GB ruang disk yang kosong. Server membutuhkan sekitar $need GB.';
  }

  @override
  String get setupServerTitle => 'Unduh dan jalankan servermu';

  @override
  String get setupServerBody =>
      'Unduhan sekitar 2,5 GB yang memakan waktu 5 hingga 10 menit pada kali pertama, dan sekitar 10 GB ruang disk setelah terpasang. Kamu tetap bisa memakai komputermu.';

  @override
  String setupServerBodySized(String download, String disk) {
    return 'Unduhan $download GB, lalu sekitar $disk GB ruang disk setelah terpasang. Pertama kali memakan waktu 5 hingga 10 menit. Kamu tetap bisa memakai komputermu.';
  }

  @override
  String get setupServerBodyNothing =>
      'Semua yang dibutuhkannya sudah ada di komputer ini, jadi akan dimulai dalam satu atau dua menit.';

  @override
  String get setupServerStart => 'Mulai';

  @override
  String get setupServerStageDownload => 'Mengunduh server';

  @override
  String get setupServerStagePrepare => 'Menyiapkannya';

  @override
  String get setupServerStageParts => 'Mengunduh bagian-bagiannya';

  @override
  String setupServerDownloaded(int megabytes) {
    return '$megabytes MB sejauh ini';
  }

  @override
  String get setupServerStagePartsNote => 'Langkah paling lama';

  @override
  String setupServerPartsCount(int done, int total) {
    return '$done dari $total diunduh sejauh ini';
  }

  @override
  String get setupServerStageStart => 'Menjalankannya';

  @override
  String get setupServerStageWait => 'Menunggu responsnya';

  @override
  String get setupServerKeepOpen =>
      'Biarkan Casama tetap terbuka hingga ini selesai.';

  @override
  String get setupServerFailed => 'Server tidak mau mulai.';

  @override
  String get setupServerConnecting => 'Siap. Menghubungkan…';

  @override
  String get setupShowDetails => 'Tampilkan detail';

  @override
  String get setupHideDetails => 'Sembunyikan detail';

  @override
  String get setupAccountTitle => 'Buat akunmu';

  @override
  String get setupAccountBody =>
      'Akun ini hanya ada di komputer ini, dan memiliki server ini. Tidak ada email yang dikirim.';

  @override
  String get setupAccountName => 'Namamu';

  @override
  String get setupAccountNameMissing => 'Masukkan namamu';

  @override
  String get setupAccountCreate => 'Buat akun';

  @override
  String get setupAccountHave => 'Saya sudah punya akun di sini';

  @override
  String get setupAccountNew => 'Buat akun baru saja';

  @override
  String get setupAccountSignInTitle => 'Masuk ke servermu';

  @override
  String get setupAccountSignInBody =>
      'Gunakan akun yang kamu buat di server ini.';

  @override
  String get setupAccountClosed =>
      'Server ini sudah punya pemilik. Masuk dengan akun itu.';

  @override
  String get setupAccountPreparing => 'Menyiapkan ruangmu…';

  @override
  String get setupModelTitle => 'Beri botmu model';

  @override
  String get setupModelBody =>
      'Bot butuh model AI untuk berpikir. Masuk dengan paket ChatGPT, atau tempel kunci dari OpenRouter, Google, atau penyedia lainnya.';

  @override
  String get setupSkip => 'Lewati dulu';

  @override
  String get setupPhoneTitle => 'Hubungkan ponselmu';

  @override
  String get setupPhoneBody =>
      'Casama Link memberi komputer ini alamat pribadi, sehingga ponselmu bisa menjangkaunya dari mana saja. Kamu menyetujuinya sekali dengan akun Casama Cloud gratis. Chatmu tetap di komputer ini.';

  @override
  String get setupPhoneTurnOn => 'Beri komputer ini alamat';

  @override
  String get setupPhoneScanTitle => 'Pindai ini dengan kamera ponselmu';

  @override
  String get setupPhoneScanBody =>
      'Ini membuka Casama di ponsel dan memasukkanmu. Jika Casama belum ada di ponsel, halaman yang terbuka memberi tahu tempat mendapatkannya.';

  @override
  String get setupPhoneWaiting => 'Menunggu ponselmu…';

  @override
  String get setupPhoneConnected => 'Ponsel terhubung';

  @override
  String get setupPhoneConnectedBody =>
      'Ponselmu sudah masuk. Tampilkan kode baru untuk menambah perangkat lain.';

  @override
  String get setupPhoneOwnerOnly =>
      'Hanya pemilik server ini yang bisa memberinya alamat.';

  @override
  String get setupFinish => 'Selesai';

  @override
  String get setupCardTitle => 'Selesaikan penyiapan';

  @override
  String get setupCardModel => 'Tambahkan model AI agar botmu bisa menjawab.';

  @override
  String get setupCardPhone => 'Hubungkan ponselmu ke komputer ini.';

  @override
  String get setupCardOpen => 'Lanjutkan penyiapan';

  @override
  String get desktopUsers => 'Pengguna desktop sekaligus';

  @override
  String get desktopUsersHelp =>
      'Bot di komputer tim ini berbagi satu layar. Yang lain menunggu (dan tetap bekerja dengan shell, file, serta browser) selagi layar sedang dipakai.';

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
      'calendar': '$bot ingin menggunakan kalendermu',
      'reminders': '$bot ingin menggunakan pengingatmu',
      'contacts': '$bot ingin menggunakan kontakmu',
      'places': '$bot ingin menggunakan tempatmu',
      'photos': '$bot ingin menggunakan fotomu',
      'health': '$bot ingin menggunakan data kesehatanmu',
      'notifications': '$bot ingin menggunakan notifikasimu',
      'activity': '$bot ingin menggunakan aktivitas komputermu',
      'browserTab': '$bot ingin menggunakan tab browser saat ini',
      'browserHistory': '$bot ingin menggunakan riwayat dan bookmark browsermu',
      'alarm': '$bot ingin menggunakan alarmmu',
      'home': '$bot ingin menggunakan aksesori Rumah milikmu',
      'other': '$bot ingin menggunakan data perangkatmu',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Hanya di chatmu sendiri. Kamu bisa menghentikannya kapan saja di Pengaturan → Koneksi perangkat.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Diizinkan menggunakan kalendermu',
      'reminders': 'Diizinkan menggunakan pengingatmu',
      'contacts': 'Diizinkan menggunakan kontakmu',
      'places': 'Diizinkan menggunakan tempatmu',
      'photos': 'Diizinkan menggunakan fotomu',
      'health': 'Diizinkan menggunakan data kesehatanmu',
      'notifications': 'Diizinkan menggunakan notifikasimu',
      'activity': 'Diizinkan menggunakan aktivitas komputermu',
      'browserTab': 'Diizinkan menggunakan tab browser saat ini',
      'browserHistory': 'Diizinkan menggunakan riwayat dan bookmark browsermu',
      'alarm': 'Diizinkan menggunakan alarmmu',
      'home': 'Diizinkan menggunakan aksesori Rumah milikmu',
      'other': 'Diizinkan menggunakan data perangkatmu',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'Tidak dibagikan';

  @override
  String get deviceKindCalendar => 'kalender';

  @override
  String get deviceKindReminders => 'pengingat';

  @override
  String get deviceKindContacts => 'kontak';

  @override
  String get deviceKindPlaces => 'tempat';

  @override
  String get deviceKindPhotos => 'foto';

  @override
  String get deviceKindHealth => 'data kesehatan';

  @override
  String get deviceKindNotifications => 'notifikasi';

  @override
  String get deviceKindActivity => 'aktivitas komputer';

  @override
  String get deviceKindBrowserTab => 'tab browser saat ini';

  @override
  String get deviceKindBrowserHistory => 'riwayat dan bookmark browser';

  @override
  String get deviceKindAlarm => 'alarm';

  @override
  String get deviceKindHome => 'aksesori Rumah';

  @override
  String get deviceBrowserAsks => 'Yang boleh ditanyakan bot ke browsermu';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama untuk Chrome menjawab ini secara langsung dan tidak ada yang disimpan. Nyalakan atau matikan di pengaturan ekstensi.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return 'Berhenti mengizinkan $bot bertanya';
  }

  @override
  String get deviceConnections => 'Koneksi perangkat';

  @override
  String get deviceConnectionsHelp =>
      'Bagikan data dari perangkat ini ke botmu. Setiap jenis nonaktif hingga kamu menyalakannya, dan hanya bot yang kamu izinkan yang bisa membacanya, hanya di chatmu sendiri.';

  @override
  String get deviceConnectionsNone =>
      'Perangkat ini belum bisa membagikan data. Di ponselmu, buka Casama lalu nyalakan apa yang ingin kamu bagikan.';

  @override
  String get deviceKeepFor => 'Simpan selama';

  @override
  String get deviceKeepLiveOnly => 'Hanya langsung';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hari',
      one: '1 hari',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Hanya model privat';

  @override
  String get devicePrivateModelHelp =>
      'Hanya bot dengan model lokal yang bisa membacanya';

  @override
  String get deviceNoBots =>
      'Belum ada bot. Bot akan bertanya saat memerlukannya, atau izinkan sekarang.';

  @override
  String get deviceAllowBot => 'Izinkan bot';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Bot mana yang boleh membaca kalendermu?',
      'reminders': 'Bot mana yang boleh membaca pengingatmu?',
      'contacts': 'Bot mana yang boleh membaca kontakmu?',
      'places': 'Bot mana yang boleh membaca tempatmu?',
      'photos': 'Bot mana yang boleh membaca fotomu?',
      'health': 'Bot mana yang boleh membaca data kesehatanmu?',
      'notifications': 'Bot mana yang boleh membaca notifikasimu?',
      'activity': 'Bot mana yang boleh membaca aktivitas komputermu?',
      'browserTab': 'Bot mana yang boleh membaca tab browser saat ini?',
      'browserHistory':
          'Bot mana yang boleh membaca riwayat dan bookmark browsermu?',
      'alarm': 'Bot mana yang boleh membaca alarmmu?',
      'home': 'Bot mana yang boleh membaca aksesori Rumah milikmu?',
      'other': 'Bot mana yang boleh membaca data perangkatmu?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama tidak memiliki izin. Izinkan di pengaturan sistem, lalu coba lagi.';

  @override
  String get deviceOtherDevices => 'Perangkat lainmu';

  @override
  String get deviceForget => 'Lupakan perangkat ini';

  @override
  String get deviceBrowsers => 'Browser yang dapat digunakan bot';

  @override
  String get deviceBrowsersHelp =>
      'Dipasangkan di Casama untuk Chrome. Bot yang kamu izinkan bekerja di sana dalam grup tabnya sendiri, masuk sebagai kamu.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bot',
      one: '1 bot',
      zero: 'Belum ada bot',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'Online';

  @override
  String get deviceBrowserOffline => 'Offline';

  @override
  String get deviceBrowserUnpair => 'Putus pasangan browser ini';

  @override
  String get deviceBrowserAllBots => 'Semua bot';

  @override
  String get deviceChromeNotPaired => 'Casama untuk Chrome: belum dipasangkan';

  @override
  String get deviceChromeHowToPair =>
      'Instal Casama untuk Chrome, masuk, lalu buka Lainnya → “Izinkan bot menggunakan browser ini”.';

  @override
  String get deviceConnectionsRowHelp =>
      'Kalender, kontak, dan lainnya dari perangkat ini';

  @override
  String get healthExtraCycle => 'Pelacakan siklus';

  @override
  String get healthExtraGlucose => 'Glukosa darah';

  @override
  String get healthExtraBloodPressure => 'Tekanan darah';

  @override
  String get appleHealth => 'Apple Health';

  @override
  String get appleHealthAbout =>
      'Membaca ringkasan harian tidur, aktivitas, olahraga, dan detak jantungmu dari Apple Health (HealthKit), hanya saat ini aktif. Casama tidak pernah menulis ke Apple Health.';

  @override
  String get healthNotMedical =>
      'Hanya ringkasan harian (tidur, aktivitas, olahraga, detak jantung). Bot menjelaskan bagaimana kondisimu dibanding biasanya dan tidak pernah memberi saran medis.';

  @override
  String get healthNeedsEncryption =>
      'Data kesehatan memerlukan enkripsi saat disimpan. Nyalakan untuk ruang kerja yang kamu miliki, lalu coba lagi.';

  @override
  String get placeAddHere => 'Tambahkan lokasiku sekarang';

  @override
  String get placeName => 'Beri nama tempat ini (Rumah, Kantor, Gym)';

  @override
  String get placeNoLocation =>
      'Lokasimu tidak tersedia. Izinkan lokasi untuk Casama, lalu coba lagi.';

  @override
  String get placesHelp =>
      'Bot diberi tahu saat kamu tiba di atau meninggalkan tempat-tempat ini. Hanya nama tempat dan waktunya yang dibagikan, tidak pernah rutemu.';

  @override
  String get watchedAppsHelp =>
      'Hanya notifikasi dari aplikasi ini yang dibagikan. Kode sekali pakai disembunyikan sebelum apa pun keluar dari ponselmu.';

  @override
  String get watchedAppAdd => 'Tambahkan aplikasi (nama atau ID paket)';

  @override
  String get providerHintMaps => 'waktu tempuh untuk berangkat sekarang';

  @override
  String routineDevice(String event, String detail) {
    return 'Di ponselmu: $event $detail';
  }

  @override
  String get ctxSelection => 'Teks terpilih';

  @override
  String get ctxAddScreenshot => 'Tambahkan tangkapan layar';

  @override
  String get ctxScreenshotAdded => 'Tangkapan layar ditambahkan';

  @override
  String get ctxScreenshotFailed =>
      'Tidak bisa mengambil tangkapan layar. Izinkan perekaman layar untuk Casama di pengaturan sistemmu.';

  @override
  String get watchedFolders => 'Folder yang dipantau';

  @override
  String get watchedFoldersHelp =>
      'File baru di salah satu folder ini dapat memulai rutinitas (misalnya, merapikan PDF baru di Unduhan). Hanya namanya yang dibagikan; bot membaca file hanya jika bekerja di komputer ini.';

  @override
  String get whyTitle => 'Kenapa saya melihat ini?';

  @override
  String whyData(String data) {
    return 'Digunakan: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Urgensi: $urgency';
  }

  @override
  String get heldMeeting =>
      'Pesan ini menunggu saat kamu sedang rapat dan datang bersama ringkasanmu.';

  @override
  String get heldFocus =>
      'Pesan ini menunggu saat Fokus aktif dan datang bersama ringkasanmu.';

  @override
  String get heldDriving =>
      'Pesan ini menunggu saat kamu sedang mengemudi dan datang bersama ringkasanmu.';

  @override
  String get heldCap =>
      'Bot sudah mengirim 5 pesan hari ini, jadi yang satu ini menunggu ringkasanmu.';

  @override
  String get heldLow =>
      'Ini tidak mendesak, jadi menunggu ringkasanmu alih-alih menggetarkan ponselmu.';

  @override
  String get lessLikeThis => 'Kurangi yang seperti ini';

  @override
  String get lessLikeThisDone => 'Sip, yang seperti ini dikurangi';

  @override
  String get widgetStatusWorking => 'Sedang bekerja…';

  @override
  String get widgetStatusOff => 'Dimatikan';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner => 'Ditangguhkan oleh pemilik instans';

  @override
  String get previewHi => 'Hai!';

  @override
  String get previewAsk => 'Bisakah kamu merapikan catatanku?';

  @override
  String get previewOnIt => 'Siap';

  @override
  String get previewDone => 'Selesai! Sekarang sudah tersimpan di tiga folder.';

  @override
  String get previewMessage => 'Pesan';

  @override
  String get fontPreviewGreeting => 'Selamat pagi';

  @override
  String get photosFromUnsplash => 'Foto dari Unsplash';

  @override
  String get showBotSteps => 'Tampilkan langkah bot';

  @override
  String get showBotStepsHelp =>
      'Perintah dan kesalahan teknis di setiap chat.';

  @override
  String get showScreenCard => 'Tampilkan layar bot saat bekerja';

  @override
  String get showScreenCardHelp =>
      'Kartu live kecil di chat. Ketuk untuk menonton layar penuh.';

  @override
  String get showReplyUsage => 'Tampilkan penggunaan di balasan';

  @override
  String get showReplyUsageHelp =>
      'Biaya setiap balasan, dalam satu baris di bawahnya.';

  @override
  String get openLinksInApp => 'Buka tautan di dalam aplikasi';

  @override
  String get openLinksInAppHelp =>
      'Tautan web terbuka di browser di dalam Casama. Nonaktif: terbuka di browser bawaanmu.';

  @override
  String replyUsageTokens(String count) {
    return '$count token';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '$amount di kuncimu';
  }

  @override
  String get replyUsageOnPlan => 'Di paket ChatGPT-mu';

  @override
  String replyUsageSoFar(String amount) {
    return '$amount sejauh ini';
  }

  @override
  String get replyUsageTooltip => 'Biaya balasan ini';

  @override
  String get replyUsageTitle => 'Biaya balasan ini';

  @override
  String get replyUsageFromCredits => 'Dari kreditmu';

  @override
  String get replyUsageYourKeys => 'Di kuncimu sendiri';

  @override
  String get replyUsageTotal => 'Total';

  @override
  String get replyUsageTime => 'Waktu';

  @override
  String get replyUsageTokensLabel => 'Token';

  @override
  String get replyUsageSteps => 'Langkah';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Termasuk $n eksekusi pembantu',
      one: 'Termasuk 1 eksekusi pembantu',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing => 'Tidak ada yang dihitung untuk balasan ini.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 kredit = $price. Kuncimu sendiri dan paketmu ditagih oleh penyedianya, bukan oleh Casama.';
  }

  @override
  String get replyUsageOpenRun => 'Buka eksekusi';

  @override
  String get replyUsageLoadFailed =>
      'Tidak bisa memuat penggunaan balasan ini.';

  @override
  String get replyUsageOurCost => 'Biaya kami';

  @override
  String get replyUsageMargin => 'Margin';

  @override
  String replyUsageItemCost(String amount) {
    return 'Biaya kami $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Biaya kami dan margin ditampilkan kepadamu karena kamu menjalankan server ini. Tidak ada orang lain yang melihatnya.';

  @override
  String get kindSpeechToText => 'Suara ke teks';

  @override
  String get kindVoice => 'Panggilan suara';

  @override
  String get kindImages => 'Gambar';

  @override
  String get kindVideo => 'Video';

  @override
  String get kindSearch => 'Pencarian web';

  @override
  String get kindData => 'Pencarian data';

  @override
  String get kindPhone => 'Panggilan telepon';

  @override
  String get kindApps => 'Tindakan aplikasi';

  @override
  String get activityReady => 'Menyiapkan…';

  @override
  String get activitySearching => 'Mencari di web…';

  @override
  String get activityBrowsing => 'Menjelajahi web…';

  @override
  String get activityComputer => 'Bekerja di komputernya…';

  @override
  String get activityFiles => 'Memeriksa file…';

  @override
  String get activityImage => 'Membuat gambar…';

  @override
  String get activityVideo => 'Membuat video…';

  @override
  String get activityMemory => 'Memeriksa yang diketahuinya…';

  @override
  String get activityApps => 'Menggunakan aplikasimu…';

  @override
  String get activityScheduling => 'Menyiapkan jadwal…';

  @override
  String get activityWorking => 'Sedang mengerjakan…';

  @override
  String get activityWaitingForScreen => 'Menunggumu mengembalikan layar…';

  @override
  String get runFailedPlain =>
      'Terjadi kesalahan. Coba lagi, atau buka Detail untuk melihat sebabnya.';

  @override
  String get newKeyTitle => 'Salin kunci barumu';

  @override
  String get newKeyHelp =>
      'Ini hanya ditampilkan kali ini saja. Tempelkan ke aplikasi yang kamu hubungkan, lalu ketuk Selesai.';

  @override
  String get copyKey => 'Salin kunci';

  @override
  String get keyCopied => 'Kunci disalin';

  @override
  String revokeApiKeyTitle(String name) {
    return 'Cabut “$name”?';
  }

  @override
  String get revokeApiKeyBody =>
      'Aplikasi yang memakai kunci ini langsung berhenti terhubung. Ini tidak bisa dibatalkan; untuk menghubungkan lagi, buat kunci baru.';

  @override
  String unlinkTitle(String name) {
    return 'Putus tautan “$name”?';
  }

  @override
  String get unlinkBody =>
      'Bot-bot tersebut langsung berhenti berbicara satu sama lain. Menautkannya lagi memerlukan undangan baru.';

  @override
  String get alreadyMember => 'Kamu sudah ada di ruang kerja ini.';

  @override
  String get askAdminToInvite =>
      'Hanya pemilik dan admin yang bisa mengundang orang. Minta tautan undangan kepada salah satu dari mereka.';

  @override
  String get askBeforeJoining => 'Tanya saya sebelum orang bergabung';

  @override
  String get askBeforeJoiningHelp =>
      'Admin menyetujui setiap orang yang menggunakan tautan ini.';

  @override
  String get askToJoin => 'Minta bergabung';

  @override
  String get customLinks => 'Tautan kustom';

  @override
  String get customLinksHelp =>
      'Tautan dengan peran, masa berlaku, atau jumlah penggunaan sendiri.';

  @override
  String get emailAddresses => 'Alamat email';

  @override
  String get emailAddressesHelp =>
      'Tempel satu atau lebih, dipisahkan koma atau baris baru.';

  @override
  String get getCode => 'Dapatkan kode';

  @override
  String get getNewCode => 'Dapatkan kode baru';

  @override
  String get getStarted => 'Mulai';

  @override
  String get welcomeCta => 'Ayo mulai';

  @override
  String get inviteAsAdmin => 'Undang sebagai Admin';

  @override
  String get inviteByEmail => 'Undang lewat email';

  @override
  String get inviteExpired => 'Kedaluwarsa';

  @override
  String inviteExpires(String when) {
    return 'Kedaluwarsa $when';
  }

  @override
  String get inviteInvalid => 'Undangan ini tidak berfungsi';

  @override
  String get inviteInvalidHelp =>
      'Mungkin sudah kedaluwarsa, habis dipakai, atau dimatikan. Minta yang baru.';

  @override
  String get inviteLink => 'Tautan undangan';

  @override
  String get inviteLinkApprovalHelp =>
      'Siapa pun dengan tautan ini bisa meminta bergabung. Kamu menyetujuinya di bawah.';

  @override
  String get inviteLinkHelp =>
      'Siapa pun dengan tautan ini bisa bergabung sebagai anggota. Bagikan di chat atau email.';

  @override
  String get inviteLinkOrCode => 'Tautan atau kode undangan';

  @override
  String inviteOtherServer(String host) {
    return 'Undangan ini untuk $host, sedangkan aplikasi ini terhubung ke server lain.';
  }

  @override
  String get inviteRenewed =>
      'Undangan berlaku selama 7 hari lagi. Kirimkan tautan barunya.';

  @override
  String inviteSentTo(String email) {
    return 'Masuk dengan $email untuk menerima.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Bergabung ke $workspace di Casama: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name mengundangmu bergabung';
  }

  @override
  String get invitedToJoin => 'Kamu diundang untuk bergabung';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString undangan terkirim.',
      one: 'Undangan terkirim.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'Kamu akan bergabung sebagai admin';

  @override
  String get joinAsMember => 'Kamu akan bergabung sebagai anggota';

  @override
  String get joinByDomain => 'Bergabung lewat domain email';

  @override
  String get joinByDomainHelp =>
      'Alamat terverifikasi bergabung tanpa undangan.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Siapa pun dengan email @$domain terverifikasi bisa bergabung';
  }

  @override
  String get joinByDomainUnavailable =>
      'Tersedia saat kamu masuk dengan email kerja terverifikasi (bukan gmail.com dan sejenisnya).';

  @override
  String get joinNeedsApproval =>
      'Admin menyetujui orang baru sebelum mereka bergabung.';

  @override
  String get joinRequestSent => 'Permintaan terkirim';

  @override
  String joinRequestSentHelp(String name) {
    return 'Admin $name akan memeriksanya. Kamu akan mendapat notifikasi saat sudah masuk.';
  }

  @override
  String get joinWithLinkOrCode => 'Bergabung dengan tautan atau kode';

  @override
  String get spacesInvite => 'Undang orang';

  @override
  String spacesInviteTo(String name) {
    return 'Ke $name';
  }

  @override
  String get spacesNew => 'Ruang kerja baru';

  @override
  String get spacesNewHint => 'Bot, anggota, dan penagihan sendiri';

  @override
  String get spacesJoin => 'Bergabung ke ruang kerja';

  @override
  String get spacesJoinHint => 'Dengan tautan atau kode undangan';

  @override
  String joinWorkspaceNamed(String name) {
    return 'Gabung ke $name';
  }

  @override
  String get joinedBotsHelp =>
      'Bot-bot ini siap membantu. Sapa salah satunya untuk memulai.';

  @override
  String get joinedNoBots =>
      'Belum ada bot di sini. Buat satu, atau lihat-lihat dulu.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString anggota',
      one: '1 anggota',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Anggota';

  @override
  String openToDomain(String domain) {
    return 'Terbuka untuk @$domain';
  }

  @override
  String openWorkspace(String name) {
    return 'Buka $name';
  }

  @override
  String get pendingInvites => 'Undangan belum diterima';

  @override
  String get people => 'Orang';

  @override
  String get workspaceAdvancedSummary =>
      'Rahasia, memori, enkripsi, pembayaran, MCP';

  @override
  String get peopleAdvancedSummary =>
      'Kode undangan, domain email, tautan kustom';

  @override
  String get inviteLinkToCopy => 'Tautan undangan, siap disalin';

  @override
  String linkMade(String when) {
    return 'Dibuat $when';
  }

  @override
  String get billingAdvancedSummary =>
      'Tagihan per server, server Casama Link, dan kunci';

  @override
  String get billingChargesSummary => 'Tagihan per server';

  @override
  String get billingUsageRow => 'Yang dipakai bot dan biayanya';

  @override
  String billingUsageSoFar(String amount) {
    return 'Bulan ini sejauh ini: $amount';
  }

  @override
  String get usageAdvancedSummary => 'Jumlah token, ekspor JSON';

  @override
  String get peopleHelp => 'Undang orang dan tentukan siapa yang bisa masuk.';

  @override
  String get peopleRow => 'Undang orang, setujui permintaan, lihat anggota';

  @override
  String get qrCode => 'Kode QR';

  @override
  String get remove => 'Hapus';

  @override
  String get resendInvite => 'Kirim lagi';

  @override
  String get resetLink => 'Reset tautan';

  @override
  String get resetLinkHelp =>
      'Tautan saat ini langsung berhenti bekerja dan kamu mendapat yang baru. Orang yang sudah masuk tetap masuk.';

  @override
  String get revokeInvite => 'Batalkan undangan';

  @override
  String scanToJoin(String name) {
    return 'Pindai untuk bergabung ke $name';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Kirim $countString undangan';
  }

  @override
  String get sendInvitesYourself => 'Kirim sendiri undangan ini';

  @override
  String get sendInvitesYourselfHelp =>
      'Email belum disiapkan di server ini. Kirimkan tautan ke masing-masing orang, dan mereka masuk dengan alamat tersebut untuk bergabung.';

  @override
  String get signInToJoin => 'Masuk untuk bergabung';

  @override
  String get startOwnWorkspace => 'Buat ruang kerja sendiri saja';

  @override
  String switchToServer(String host) {
    return 'Beralih ke $host';
  }

  @override
  String get waitingToJoin => 'Menunggu bergabung';

  @override
  String welcomeToWorkspace(String name) {
    return 'Selamat datang di $name';
  }

  @override
  String get workspacesYouCanJoin => 'Ruang kerja yang dapat kamu ikuti';

  @override
  String get yourTeamIsHere => 'Timmu sudah ada di sini';

  @override
  String yourTeamIsHereHelp(String domain) {
    return 'Orang-orang di $domain memakai ruang kerja ini. Gabung ke salah satunya, atau mulai milikmu sendiri.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Mudah dibacakan atau diketik. Berlaku selama 48 jam. Orang memasukkannya di Gabung dengan tautan atau kode.';

  @override
  String get inviteSomeoneNew => 'Undang orang baru ke ruang kerja';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app hanya bisa masuk di alamat aman (https), sedangkan server Casama ini berada di $address. Sajikan Casama melalui https untuk memakai fitur masuk ini.';
  }

  @override
  String get aboutYou => 'Tentang kamu';

  @override
  String get aboutYouRow =>
      'Panggilan yang dipakai bot untukmu dan apa yang mereka ketahui tentangmu';

  @override
  String get aboutYouIntro =>
      'Botmu membaca ini agar mereka bisa memanggilmu dengan namamu dan menjawab sesuai caramu. Hanya kamu yang bisa melihatnya.';

  @override
  String get photoChange => 'Ubah foto profil';

  @override
  String get photoTake => 'Ambil foto';

  @override
  String get photoChoose => 'Pilih foto';

  @override
  String get photoUseGoogle => 'Gunakan foto Google saya';

  @override
  String get photoRemove => 'Hapus foto';

  @override
  String get photoUnreadable =>
      'File itu bukan foto yang bisa dipakai Casama. Coba JPEG atau PNG.';

  @override
  String get whatToCallYou => 'Bot harus memanggilmu apa?';

  @override
  String get pronounsOptional => 'Kata ganti (opsional)';

  @override
  String get aboutMe => 'Tentang saya';

  @override
  String get aboutMeHint =>
      'Pekerjaanmu, orang-orang dalam hidupmu, hal yang kamu sukai. Apa pun yang membantu.';

  @override
  String get replyStyle => 'Gaya balasan yang saya sukai';

  @override
  String get replyStyleHint =>
      'Contoh: jawaban singkat, tanpa emoji, jelaskan seperti saya masih pemula';

  @override
  String get learnAboutMe => 'Pelajari tentang saya dari chat';

  @override
  String get learnAboutMeHelp =>
      'Bot menyimpan fakta tentangmu. Edit kapan saja.';

  @override
  String get adultSites => 'Situs dewasa';

  @override
  String get adultSitesHelp =>
      'Bot boleh membuka situs web dewasa saat kamu minta. Khusus usia 18 tahun ke atas.';

  @override
  String get adultSitesConfirmTitle => 'Nyalakan situs dewasa?';

  @override
  String get adultSitesConfirmBody =>
      'Kamu menyatakan bahwa kamu berusia 18 tahun ke atas. Saat kamu meminta, bot boleh membuka situs web dewasa untukmu dan mencantumkan isinya sebagai teks. Ini hanya berfungsi saat kamu meminta dari Casama di web atau aplikasi desktop, tidak pernah di chat bersama.';

  @override
  String get adultSitesConfirm => 'Saya berusia 18 tahun ke atas';

  @override
  String get adultSitesApprovalDetail =>
      'Izinkan berarti kamu menyatakan bahwa kamu berusia 18 tahun ke atas dan menyalakan situs dewasa untuk akunmu. Kamu bisa mematikannya di Tentang kamu.';

  @override
  String useInThisSpace(String workspace) {
    return 'Gunakan yang saya bagikan di $workspace';
  }

  @override
  String get useInThisSpaceHelp =>
      'Nonaktif: hanya namamu dan gaya balasanmu yang dipakai di sini.';

  @override
  String get learnedAboutYou => 'Yang dipelajari bot';

  @override
  String get noLearnedFacts =>
      'Belum ada. Fakta yang dipelajari bot tentangmu di chat muncul di sini.';

  @override
  String get addFact => 'Tambah fakta';

  @override
  String get editFact => 'Edit fakta';

  @override
  String get deleteFactTitle => 'Hapus fakta ini?';

  @override
  String get deleteFactConfirm => 'Botmu tidak akan mengetahuinya lagi.';

  @override
  String get importToProfile => 'Impor dari ChatGPT atau Claude';

  @override
  String get savedToProfile => 'Tersimpan ke profilmu';

  @override
  String get undo => 'Urungkan';

  @override
  String get suggestedLookApplied => 'Tema baru diterapkan';

  @override
  String get suggestedLookUnavailable =>
      'Aplikasi ini tidak memiliki tema tersebut';

  @override
  String get removedFromProfile => 'Dihapus dari profilmu';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString fakta ditambahkan',
      one: '1 fakta ditambahkan',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'Botmu akan memakainya di setiap ruang kerja. Kamu bisa mengubahnya nanti di Pengaturan → Tentang kamu.';

  @override
  String get nameStepBubble => 'Senang bertemu denganmu!';

  @override
  String get heardFromTitle => 'Dari mana kamu tahu tentang kami?';

  @override
  String get heardFromHelp =>
      'Satu ketukan membantu kami melihat apa yang berhasil. Kamu bisa melewatinya.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'Seorang teman';

  @override
  String get heardFromSearch => 'Pencarian';

  @override
  String get heardFromAiAssistant => 'Asisten AI';

  @override
  String get heardFromOther => 'Lainnya';

  @override
  String get heardFromSkip => 'Lewati';

  @override
  String get nameStepHint => 'Namamu';

  @override
  String get skillCatalogSubtitle =>
      'Keahlian siap pakai yang dimuat botmu saat tugas membutuhkannya.';

  @override
  String get skillCategoryWork => 'Kerja';

  @override
  String get skillCategoryWriting => 'Menulis';

  @override
  String get skillCategoryResearch => 'Riset';

  @override
  String get skillCategoryData => 'Data';

  @override
  String get skillCategoryMoney => 'Keuangan';

  @override
  String get skillCategoryBuild => 'Bangun';

  @override
  String get skillCategoryLife => 'Kehidupan';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString keahlian',
      one: '1 keahlian',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Terpasang';

  @override
  String skillInstalledFor(String names) {
    return 'Terpasang untuk $names';
  }

  @override
  String installSkillFor(String name) {
    return 'Pasang $name untuk';
  }

  @override
  String skillUseHint(String name) {
    return 'Bot memuatnya sendiri saat tugasnya cocok, atau ketik /$name di chat untuk memakainya.';
  }

  @override
  String get skillInstructions => 'Instruksi';

  @override
  String get skillAlreadyEverywhere =>
      'Sudah terpasang di mana pun yang tersedia.';

  @override
  String get gallery => 'Galeri';

  @override
  String get galleryEmpty => 'Tidak ada di galeri yang cocok.';

  @override
  String get galleryOffline =>
      'Galeri tidak dapat dijangkau saat ini. Gaya dan keahlian bawaan masih ada di sini.';

  @override
  String get galleryUse => 'Pakai';

  @override
  String get galleryInstall => 'Pasang';

  @override
  String get galleryReport => 'Laporkan';

  @override
  String get galleryShare => 'Bagikan ke Galeri';

  @override
  String galleryBy(String name) {
    return 'Oleh $name';
  }

  @override
  String get galleryFeatured => 'Pilihan';

  @override
  String get galleryAll => 'Semua';

  @override
  String get galleryThemes => 'Tema';

  @override
  String get gallerySchemes => 'Warna';

  @override
  String get galleryWallpapers => 'Wallpaper';

  @override
  String get gallerySkills => 'Keahlian';

  @override
  String get fromGallery => 'Galeri';

  @override
  String galleryApplied(String name) {
    return 'Memakai $name';
  }

  @override
  String get gallerySeeAll => 'Lihat semua';

  @override
  String get galleryInUse => 'Sedang dipakai';

  @override
  String galleryInstalled(String name) {
    return '$name terpasang';
  }

  @override
  String get galleryPreviewDark => 'Pratinjau mode gelap';

  @override
  String get galleryPreviewLight => 'Pratinjau mode terang';

  @override
  String get galleryClearSearch => 'Hapus pencarian';

  @override
  String get galleryOfflineTitle => 'Galeri sedang offline';

  @override
  String galleryNoMatches(String query) {
    return 'Tidak ada yang cocok dengan “$query”';
  }

  @override
  String get galleryInstructions => 'Instruksi';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$pattern pada $palette';
  }

  @override
  String get galleryImage => 'Gambar';

  @override
  String get galleryMeshGradient => 'gradien mesh';

  @override
  String get galleryOwnDoodles => 'Coretan sendiri';

  @override
  String get galleryLightAndDark => 'Terang dan gelap';

  @override
  String get galleryContribute =>
      'Membuat gaya yang kamu suka? Bagikan, dan semua orang di Casama bisa menemukannya di sini.';

  @override
  String get galleryTypeTheme => 'Tema';

  @override
  String get galleryTypeScheme => 'Skema warna';

  @override
  String get galleryTypeWallpaper => 'Wallpaper';

  @override
  String get galleryTypeSkill => 'Keahlian';

  @override
  String get galleryBehindChats => 'Di balik chatmu';

  @override
  String celebrateNewBot(String name) {
    return 'Sapa $name!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name sudah siap!';
  }

  @override
  String get celebrateJoined =>
      'Kamu sudah masuk! Selamat datang di ruang kerja.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name sudah siap.';
  }

  @override
  String get fewerEffects => 'Kurangi efek';

  @override
  String get fewerEffectsHelp =>
      'Tanpa selebrasi, tab memantul, atau animasi bot.';

  @override
  String get haptics => 'Haptik';

  @override
  String get trackpadHaptics => 'Haptik Trackpad';

  @override
  String get hapticsHelp =>
      'Getaran lembut saat sesuatu terjadi atau bot membutuhkan Anda.';

  @override
  String get watchHaptics => 'Haptik';

  @override
  String get settingsAppSection => 'Aplikasi';

  @override
  String get settingsSecuritySection => 'Masuk & keamanan';

  @override
  String get customize => 'Sesuaikan';

  @override
  String get customizeColors => 'Warna';

  @override
  String get appearanceCustomLook => 'Tema kustom';

  @override
  String get appearanceCustomHelp =>
      'Perubahanmu sendiri. Simpan sebagai tema untuk mempertahankannya.';

  @override
  String get appearanceFromGallery => 'Dari Galeri';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Tampilkan Semua ($countString)';
  }

  @override
  String appearanceSwitched(String name) {
    return 'Beralih ke $name';
  }

  @override
  String appearanceSaved(String name) {
    return '$name disimpan ke temamu';
  }

  @override
  String get appearanceAboutTheme => 'Tentang tema ini';

  @override
  String settingsOnDevServer(String host) {
    return 'Pengaturan · server pengembangan $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'Kamu: $text';
  }

  @override
  String get chatPreviewPhoto => 'Foto';

  @override
  String get chatPreviewVideo => 'Video';

  @override
  String get chatPreviewVoice => 'Pesan suara';

  @override
  String get chatPreviewNone => 'Belum ada pesan';

  @override
  String get chatTimeYesterday => 'Kemarin';

  @override
  String get chatDayToday => 'Hari ini';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day pukul $time';
  }

  @override
  String get anyPriority => 'Prioritas apa saja';

  @override
  String get readingAloud => 'Sedang dibacakan';

  @override
  String get readAloudPreparing => 'Menyiapkan…';

  @override
  String get readAloudPaused => 'Dijeda';

  @override
  String get stopReading => 'Berhenti membaca';

  @override
  String get readAloudSpeed => 'Kecepatan putar';

  @override
  String readAloudTimeLeft(String time) {
    return 'Tersisa $time';
  }

  @override
  String get readAloudShowMessage => 'Tampilkan pesan yang sedang dibacakan';

  @override
  String mentionOpenProfile(String name) {
    return '$name, buka profil';
  }

  @override
  String get paywallSubtitle =>
      'Lebih banyak bot, lebih banyak waktu komputer, dan kredit baru setiap bulan, agar botmu terus bekerja.';

  @override
  String get paywallPerkBots => 'Bot';

  @override
  String get paywallPerkBotsBody =>
      'Satu tim lengkap, masing-masing dengan tugasnya sendiri.';

  @override
  String get paywallPerkComputers => 'Waktu komputer';

  @override
  String get paywallPerkComputersBody =>
      'Bot mendapat komputernya sendiri untuk menjelajah, menulis kode, dan membangun.';

  @override
  String get paywallPerkCredits => 'Kredit bulanan';

  @override
  String get paywallPerkCreditsBody => 'Untuk model, pencarian, dan alat.';

  @override
  String get paywallPerkSeats => 'Slot';

  @override
  String get paywallPerkSeatsBody => 'Bawa timmu ke ruang kerja yang sama.';

  @override
  String paywallHours(String hours) {
    return '$hours j';
  }

  @override
  String get paywallWeekly => 'Mingguan';

  @override
  String get paywallMonthly => 'Bulanan';

  @override
  String get paywallYearly => 'Tahunan';

  @override
  String get paywallPerMonth => '/ bulan';

  @override
  String get paywallPerYear => '/ tahun';

  @override
  String get paywallContinue => 'Lanjutkan';

  @override
  String get paywallContinueCheckout => 'Lanjutkan ke pembayaran';

  @override
  String get paywallRestore => 'Pulihkan';

  @override
  String get paywallFineStore =>
      'Diperpanjang otomatis. Batalkan kapan saja di pengaturan toko.';

  @override
  String get paywallFineWeb =>
      'Diperpanjang otomatis. Batalkan kapan saja dari Penagihan.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, diperpanjang otomatis hingga kamu membatalkannya. Pembayaran ditagih ke Akun Apple milikmu. Batalkan kapan saja di pengaturan Akun Apple milikmu setidaknya 24 jam sebelum perpanjangan.',
      'google_play':
          '$price, diperpanjang otomatis hingga kamu membatalkannya. Pembayaran ditagih ke akun Google Play milikmu. Batalkan kapan saja di pengaturan akun Google Play milikmu setidaknya 24 jam sebelum perpanjangan.',
      'other':
          '$price, diperpanjang otomatis hingga kamu membatalkannya. Pembayaran ditagih ke akun toko milikmu. Batalkan kapan saja di pengaturan akun toko milikmu setidaknya 24 jam sebelum perpanjangan.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis selama $days hari, lalu $price, diperpanjang otomatis hingga kamu membatalkannya.',
      one:
          'Gratis selama 1 hari, lalu $price, diperpanjang otomatis hingga kamu membatalkannya.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis selama $days hari, lalu $price, diperpanjang otomatis hingga kamu membatalkannya.',
      one:
          'Gratis selama 1 hari, lalu $price, diperpanjang otomatis hingga kamu membatalkannya.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis selama $days hari, lalu $price, diperpanjang otomatis hingga kamu membatalkannya.',
      one:
          'Gratis selama 1 hari, lalu $price, diperpanjang otomatis hingga kamu membatalkannya.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 Pembayaran ditagih ke Akun Apple milikmu saat uji coba berakhir. Batalkan di pengaturan Akun Apple milikmu setidaknya 24 jam sebelum uji coba berakhir dan kamu tidak akan ditagih.',
      'google_play':
          '$_temp1 Pembayaran ditagih ke akun Google Play milikmu saat uji coba berakhir. Batalkan di pengaturan akun Google Play milikmu setidaknya 24 jam sebelum uji coba berakhir dan kamu tidak akan ditagih.',
      'other':
          '$_temp2 Pembayaran ditagih ke akun toko milikmu saat uji coba berakhir. Batalkan di pengaturan akun toko milikmu setidaknya 24 jam sebelum uji coba berakhir dan kamu tidak akan ditagih.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Mulai uji coba gratis';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Gratis $days hari, lalu $price/thn',
      one: 'Gratis 1 hari, lalu $price/thn',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Gratis $days hari, lalu $price/bln',
      one: 'Gratis 1 hari, lalu $price/bln',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, diperpanjang otomatis hingga kamu membatalkannya. Batalkan kapan saja dari Penagihan; kamu tetap mendapatkan paket hingga periode berakhir.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Gratis selama $days hari, lalu $price, diperpanjang otomatis hingga kamu membatalkannya.',
      one:
          'Gratis selama 1 hari, lalu $price, diperpanjang otomatis hingga kamu membatalkannya.',
    );
    return '$_temp0 Batalkan dari Tagihan sebelum uji coba berakhir dan kamu tidak akan ditagih.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price per minggu',
      'year': '$price per tahun',
      'other': '$price per bulan',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Ketentuan penggunaan';

  @override
  String get privacyPolicy => 'Kebijakan privasi';

  @override
  String get aiConsentTitle => 'Chatmu dikirim ke perusahaan AI';

  @override
  String get aiConsentBody =>
      'Untuk menulis balasan, Casama mengirim apa yang kamu bagikan ke botmu ke penyedia AI luar. Tidak ada yang dikirim sebelum kamu setuju.';

  @override
  String get aiConsentUpdatedNotice =>
      'Kami menambahkan halaman web ke daftar ini.';

  @override
  String get aiConsentWhatTitle => 'Apa yang dikirim';

  @override
  String get aiConsentWhat =>
      'Pesan, file, dan fotomu, suaramu dalam panggilan, pesan suara dan dikte, apa yang bot ingat tentangmu, halaman web yang dibuka bot untukmu (di komputernya sendiri atau di browser pada perangkat ini), serta data ponsel apa pun yang kamu nyalakan, seperti kalender atau kesehatan.';

  @override
  String get aiConsentWhoTitle => 'Siapa yang menerimanya';

  @override
  String get aiConsentWho =>
      'OpenRouter, yang meneruskannya ke perusahaan pembuat model yang kamu pakai, seperti DeepSeek, Google, atau OpenAI. Panggilan memakai Google Gemini, dan OpenAI mengubah pesan suara serta dikte menjadi teks. Pencarian web masuk ke Parallel, Serper, atau DeepSeek. Dengan kunci API milikmu sendiri, data langsung menuju penyedia tersebut.';

  @override
  String get aiConsentWhyTitle => 'Apa yang mereka lakukan dengan data itu';

  @override
  String get aiConsentWhy =>
      'Mereka menggunakannya untuk menulis balasan. Kamu bisa menghentikannya kapan saja di Pengaturan › Privasi, dan kebijakan privasi memuat detailnya.';

  @override
  String get aiConsentAgree => 'Setuju dan lanjutkan';

  @override
  String get aiConsentTile => 'Penyedia AI';

  @override
  String get aiConsentTileOn =>
      'Diizinkan. Yang kamu bagikan ke bot dikirim ke penyedia AI luar untuk menulis balasan.';

  @override
  String get aiConsentWithdrawQuestion =>
      'Berhenti berbagi dengan penyedia AI?';

  @override
  String get aiConsentWithdrawBody =>
      'Bot tidak bisa membalas tanpa mereka. Casama meminta persetujuanmu lagi sebelum apa pun dikirim kembali.';

  @override
  String get aiConsentWithdraw => 'Berhenti berbagi';

  @override
  String get planChanged => 'Paket diubah';

  @override
  String get purchasesRestored => 'Pembelian dipulihkan';

  @override
  String get creditsAdded => 'Kredit ditambahkan';

  @override
  String get purchasePending =>
      'Menunggu pembelian disetujui. Pembelian langsung ditambahkan setelah disetujui.';

  @override
  String get purchaseFailed =>
      'Pembelian tidak berhasil, dan kamu tidak dikenai biaya.';

  @override
  String get purchaseVerifyFailed =>
      'Kami belum bisa mengonfirmasi pembelianmu. Sistem akan mencobanya ulang sendiri; jika belum muncul juga, ketuk Pulihkan Pembelian.';

  @override
  String paywallTitleFor(String plan) {
    return 'Kembangkan timmu dengan $plan';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return 'Selamat datang di $plan!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Gratis $n bulan',
      one: 'Gratis 1 bulan',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return 'Beralih ke $plan';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Kamu berlangganan lewat App Store. Untuk mengubah paket, gunakan App Store di perangkat tempat kamu berlangganan.',
      'google_play': 'Kamu berlangganan lewat Google Play. Untuk mengubah paket, gunakan Google Play di perangkat tempat kamu berlangganan.',
      'other': 'Kamu berlangganan lewat toko aplikasi. Untuk mengubah paket, gunakan toko tersebut di perangkat tempat kamu berlangganan.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Kamu berlangganan di web. Ubah paket di sini lewat pembayaran web, atau kelola langgananmu.';

  @override
  String get subscribedOutsideAppNote =>
      'Langgananmu ditagih di luar aplikasi ini, jadi tidak bisa diubah di sini.';

  @override
  String get outOfCreditsTitle => 'Kreditmu habis';

  @override
  String get outOfCreditsPaidBody =>
      'Botmu dijeda hingga kamu menambah kredit. Paket kredit dari App Store atau Google Play tidak pernah kedaluwarsa; paket kredit yang dibeli di web berlaku 12 bulan.';

  @override
  String get outOfCreditsFreeBody =>
      'Upgrade untuk kredit lebih banyak setiap bulan, lebih banyak bot, dan lebih banyak waktu komputer.';

  @override
  String get addCredits => 'Tambah kredit';

  @override
  String get seePlansButton => 'Lihat paket';

  @override
  String get paywallAskAdmin =>
      'Hanya pemilik dan admin ruang kerja yang bisa mengubah paket. Minta salah satu dari mereka untuk melakukan upgrade.';

  @override
  String get upgradeToPro => 'Upgrade ke Pro';

  @override
  String get upgradeToProBody =>
      'Lebih banyak bot, waktu komputer, dan kredit bulanan.';

  @override
  String get manageTab => 'Kelola';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'Memori';

  @override
  String get vitalsDisk => 'Disk';

  @override
  String get fixItTitle => 'Tidak bekerja dengan benar?';

  @override
  String get fixItSubtitle =>
      'Coba langkah ini berurutan. Masing-masing melangkah sedikit lebih jauh.';

  @override
  String get fixRestart => 'Mulai ulang';

  @override
  String get fixRestartHelp => 'Sekitar 20 detik · tidak ada yang hilang';

  @override
  String get fixResetSystem => 'Reset sistem';

  @override
  String get fixResetSystemHelp => 'Sistem baru · filemu tetap aman';

  @override
  String get fixErase => 'Hapus semuanya';

  @override
  String get fixEraseHelp => 'Seperti baru · bisa dibatalkan selama 7 hari';

  @override
  String get fixResetAction => 'Reset…';

  @override
  String get fixEraseAction => 'Hapus…';

  @override
  String get computerRestarting => 'Memulai ulang…';

  @override
  String get computerRestarted => 'Dimulai ulang. Semua filemu tetap utuh.';

  @override
  String get computerUpdateTitle => 'Pembaruan tersedia';

  @override
  String get computerUpdateBody =>
      'Alat dan perbaikan baru siap dipasang. Memperbarui akan memulai ulang komputer ini: filemu tetap aman, jendela yang terbuka dan program yang berjalan akan tertutup.';

  @override
  String get computerUpdateBotWorking =>
      'Bot sedang bekerja di komputer ini sekarang. Memperbarui akan menghentikan apa yang sedang dikerjakannya.';

  @override
  String get computerUpdateNow => 'Perbarui sekarang';

  @override
  String get computerUpdateLater => 'Nanti';

  @override
  String get computerUpdateConfirmTitle => 'Perbarui komputer ini?';

  @override
  String get computerUpdateMenu => 'Perbarui komputer';

  @override
  String get computerUpdating => 'Memperbarui…';

  @override
  String get computerUpdated => 'Diperbarui. Semua filemu tetap utuh.';

  @override
  String get computerUpdateBusyTitle => 'Perintah masih berjalan';

  @override
  String get computerUpdateBusyBody =>
      'Memperbarui sekarang akan menghentikannya. Tunggu sampai selesai, atau perbarui saja.';

  @override
  String get computerUpdateAnyway => 'Perbarui saja';

  @override
  String resetSheetTitle(String name) {
    return 'Reset $name';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots tidak dapat memakainya selama sekitar satu menit.';
  }

  @override
  String get resetSheetBusyNone =>
      'Komputer tidak dapat dipakai selama sekitar satu menit.';

  @override
  String get resetOptionSystem => 'Reset sistem, simpan file saya';

  @override
  String get resetOptionSystemHelp =>
      'Memperbaiki instalasi rusak, pengaturan, dan program macet.';

  @override
  String get resetOptionErase => 'Hapus semuanya';

  @override
  String get resetOptionEraseHelp => 'Kembali ke komputer baru lagi.';

  @override
  String get resetKept => 'Dipertahankan';

  @override
  String get resetRemoved => 'Dihapus';

  @override
  String get resetKeptFiles => 'Filemu di folder workspace';

  @override
  String get resetKeptSettings => 'Nama, pengaturan, dan bot';

  @override
  String get resetKeptRestorePoints => 'Titik pemulihan';

  @override
  String get resetRemovedApps => 'Aplikasi dan alat yang kamu pasang';

  @override
  String get resetRemovedPrograms => 'Program yang berjalan';

  @override
  String get resetRemovedCaches => 'Cache dan pengaturan folder beranda';

  @override
  String get resetRemovedFiles => 'Semua file, termasuk ruang kerja';

  @override
  String get resetSavePoint => 'Simpan titik pemulihan dulu';

  @override
  String get resetSavePointHelp =>
      'Agar kamu bisa mengurungkannya selama 7 hari';

  @override
  String eraseTypeName(String name) {
    return 'Ketik $name untuk mengonfirmasi';
  }

  @override
  String get resetConfirmSystem => 'Reset sistem';

  @override
  String get resetConfirmErase => 'Hapus semuanya';

  @override
  String get resetStepSaving => 'Menyimpan titik pemulihan';

  @override
  String get resetStepWipingSystem => 'Menghapus aplikasi dan pengaturan';

  @override
  String get resetStepWipingErase => 'Menghapus semua file';

  @override
  String get resetStepRestarting => 'Memulai sistem baru';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Mereset… $stepString dari $totalString';
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

    return 'Menghapus… $stepString dari $totalString';
  }

  @override
  String get resetLeaveHint =>
      'Kamu boleh meninggalkan layar ini. Proses berjalan sendiri.';

  @override
  String get resetDone => 'Sistem baru siap';

  @override
  String get eraseDone => 'Komputer sudah dikosongkan';

  @override
  String get resetFailed => 'Reset belum selesai';

  @override
  String get resetUndoHint =>
      'Urungkan mengembalikan semuanya seperti semula. Titik pemulihan disimpan selama 7 hari.';

  @override
  String get restoredPrevious => 'Dikembalikan seperti semula';

  @override
  String get usageThisMonth => 'Bulan ini';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString j $minutesString mnt';
  }

  @override
  String get usageCostNote =>
      'Dihitung hanya saat menyala. Saat tidur tidak dikenakan biaya.';

  @override
  String get usageNone => 'Belum digunakan bulan ini';

  @override
  String get sleepTimerTitle => 'Tidur otomatis setelah';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString mnt';
  }

  @override
  String get sleepTimerHour => '1 jam';

  @override
  String get sleepTimerHelp =>
      'Tidak pernah saat bot sedang bekerja atau kamu memakainya. Waktu tunggu lebih lama membuatnya menyala lebih lama, sehingga biayanya lebih besar.';

  @override
  String sleepTimerSaved(String label) {
    return 'Tidur setelah $label tanpa aktivitas';
  }

  @override
  String get storageTitle => 'Penyimpanan';

  @override
  String storageOf(String total) {
    return 'dari $total';
  }

  @override
  String get storageFiles => 'Filemu';

  @override
  String get storageApps => 'Aplikasi dan alat';

  @override
  String get storageCaches => 'Cache';

  @override
  String get storageBrowser => 'Browser';

  @override
  String get storageOther => 'Lainnya';

  @override
  String get storageFree => 'Kosong';

  @override
  String storageFreeUp(String size) {
    return 'Kosongkan $size';
  }

  @override
  String get storageNothingToClean => 'Tidak ada cache yang perlu dibersihkan';

  @override
  String storageFreed(String size) {
    return '$size dibebaskan';
  }

  @override
  String get storageAsleep =>
      'Bangunkan komputer untuk melihat apa saja yang memakan ruang.';

  @override
  String get processesTitle => 'Berjalan sekarang';

  @override
  String get processesNone =>
      'Tidak ada yang berjalan selain komputer itu sendiri.';

  @override
  String get processesAsleep => 'Tidak ada yang berjalan saat sedang tidur.';

  @override
  String get processStop => 'Hentikan';

  @override
  String processStopTitle(String name) {
    return 'Hentikan $name?';
  }

  @override
  String get processStopMessage => 'Semua yang belum disimpan akan hilang.';

  @override
  String processStopped(String name) {
    return '$name dihentikan';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · CPU $cpu% · $memory';
  }

  @override
  String get usedByTitle => 'Digunakan oleh';

  @override
  String get usedByNone => 'Belum ada bot yang memakai komputer ini.';

  @override
  String botLastActive(String when) {
    return 'Aktif $when';
  }

  @override
  String get botNeverActive => 'Belum aktif';

  @override
  String get restorePointsTitle => 'Titik pemulihan';

  @override
  String get restorePointsNone =>
      'Belum ada. Bot menyimpannya sebelum perubahan berisiko.';

  @override
  String get restorePointSaveNow => 'Simpan titik pemulihan sekarang';

  @override
  String get restorePointSaveTitle => 'Simpan titik pemulihan';

  @override
  String get restorePointDefaultLabel => 'Disimpan manual';

  @override
  String get restorePointSaved => 'Titik pemulihan disimpan';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Tampilkan semua ($nString)';
  }

  @override
  String get historyTitle => 'Riwayat';

  @override
  String get historyNone => 'Belum ada yang terjadi.';

  @override
  String get historyStarted => 'Bangun';

  @override
  String get historySlept => 'Tidur';

  @override
  String get historySleptIdle => 'Tidur (tanpa aktivitas)';

  @override
  String get historyRestarted => 'Dimulai ulang';

  @override
  String get historyReset => 'Mereset sistem';

  @override
  String get historyErased => 'Semuanya dihapus';

  @override
  String get historyCheckpointCreated => 'Titik pemulihan disimpan';

  @override
  String get historyCheckpointRestored => 'Titik pemulihan dipulihkan';

  @override
  String historyStorageCleaned(String size) {
    return 'Membebaskan $size';
  }

  @override
  String get historyStorageCleanedPlain => 'Membebaskan ruang';

  @override
  String historyProcessStopped(String name) {
    return '$name dihentikan';
  }

  @override
  String get historyUpdated => 'Pengaturannya diubah';

  @override
  String get historyYou => 'kamu';

  @override
  String get yourDataTitle => 'Datamu';

  @override
  String get downloadAllFiles => 'Unduh semua file';

  @override
  String get downloadAllFilesHelp =>
      'File .zip berisi semua yang ada di ruang kerja';

  @override
  String get downloadNothing => 'Belum ada file untuk diunduh.';

  @override
  String get deleteComputerHelp => 'Menghapusnya beserta titik pemulihannya';

  @override
  String get manageComputer => 'Kelola';

  @override
  String get restartComputer => 'Mulai ulang';

  @override
  String get resetComputerMenu => 'Reset…';

  @override
  String get moreFixes => 'Perbaikan lainnya';

  @override
  String durationMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString mnt';
  }

  @override
  String durationHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString j';
  }

  @override
  String durationDays(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString h';
  }

  @override
  String get remoteUpdateTitle => 'Waktunya memperbarui Casama';

  @override
  String get remoteUpdateBody =>
      'Versi Casama ini tidak lagi didukung. Perbarui untuk melanjutkan.';

  @override
  String get remoteUpdateNoLink =>
      'Versi Casama ini tidak lagi didukung. Perbarui dari tempat kamu menginstalnya.';

  @override
  String get remoteMaintenanceTitle => 'Casama sedang dalam pemeliharaan';

  @override
  String get openLink => 'Buka';

  @override
  String get routineIdeas => 'Ide';

  @override
  String get routineIdeasHelp => 'Mulai dari satu ide, lalu ubah apa saja.';

  @override
  String get pluginDirectory => 'Plugin tertinjau';

  @override
  String get pluginDirectoryHelp =>
      'Diperiksa oleh Casama dan dikunci pada versi yang diperiksa.';

  @override
  String get pluginOrPaste => 'Atau tambahkan dari tautan GitHub';

  @override
  String byAuthor(String name) {
    return 'Oleh $name';
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
  String get paywallBillingPeriod => 'Periode penagihan';

  @override
  String get paywallNotSoldTitle => 'Tidak ada paket di server ini';

  @override
  String get paywallNotSoldBody =>
      'Server ini tidak menjual paket, jadi tidak ada yang perlu ditingkatkan di sini.';

  @override
  String get paywallPlansFailedTitle => 'Paket gagal dimuat';

  @override
  String get paywallPlansFailedBody => 'Periksa koneksimu, lalu coba lagi.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'App Store tidak menampilkan paket',
      'google_play': 'Google Play tidak menampilkan paket',
      'other': 'Toko tidak menampilkan paket',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Pastikan kamu sudah masuk ke App Store di perangkat ini, lalu coba lagi.',
      'google_play': 'Pastikan kamu sudah masuk ke Google Play di perangkat ini, lalu coba lagi.',
      'other': 'Pastikan kamu sudah masuk ke toko aplikasi di perangkat ini, lalu coba lagi.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return 'Hemat hingga $pct%';
  }

  @override
  String get paywallMostPopular => 'Paling populer';

  @override
  String get paywallTaglinePlus => 'Untuk kamu dan beberapa bot';

  @override
  String get paywallTaglinePro => 'Untuk tim sibuk dan tim kecil';

  @override
  String get paywallTaglineMax =>
      'Untuk tim dengan bot yang bekerja sepanjang hari';

  @override
  String get paywallPerMonthShort => '/bln';

  @override
  String paywallBilledYearly(String price) {
    return '$price ditagih per tahun';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Setara $price/bln';
  }

  @override
  String get paywallBilledMonthly => 'Ditagih per bulan';

  @override
  String get paywallBilledWeekly => 'Ditagih per minggu';

  @override
  String get paywallPerWeekShort => '/mgg';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'Setara $price per minggu';
  }

  @override
  String get paywallBilledYearlyPlain => 'Ditagih per tahun';

  @override
  String get paywallPerYearShort => '/thn';

  @override
  String paywallStartTrial(int n) {
    return 'Mulai uji coba gratis $n hari';
  }

  @override
  String paywallGetPlan(String plan) {
    return 'Berlangganan $plan';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count orang',
      one: '1 orang',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString jam komputer';
  }

  @override
  String get billingChangePlan => 'Ubah paket';

  @override
  String get billingChangePlanBody =>
      'Bandingkan setiap paket, bulanan atau tahunan.';

  @override
  String paywallWhatYouGet(String plan) {
    return 'Yang kamu dapatkan di $plan';
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
  String get updatesRow => 'Pembaruan';

  @override
  String get updatesRowSubtitle => 'Kabar dari ruang kerjamu';

  @override
  String get updatesEmpty => 'Tidak ada pembaruan';

  @override
  String get updatesEmptyHelp =>
      'Pemberitahuan ruang kerja dan halaman baru akan muncul di sini. Yang dikirim botmu ada di chat mereka.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n hal perlu kamu tangani',
      one: '1 hal perlu kamu tangani',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'Sedang dikerjakan: $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Tidak sekarang: $title';
  }

  @override
  String openTopic(String title) {
    return 'Buka $title';
  }

  @override
  String get newTopic => 'Topik baru';

  @override
  String get topics => 'Topik';

  @override
  String get olderTopics => 'Lebih lama';

  @override
  String get generalChat => 'Umum';

  @override
  String get allTopics => 'Semua topik';

  @override
  String get cardSecrets => 'Rahasia';

  @override
  String get cardApproval => 'Persetujuan';

  @override
  String get cardTakeover => 'Ambil alih';

  @override
  String get cardDevice => 'Akses perangkat';

  @override
  String get cardSuggestion => 'Saran';

  @override
  String get formBack => 'Kembali';

  @override
  String get formNext => 'Lanjut';

  @override
  String get formSkip => 'Lewati';

  @override
  String formStep(int n, int total) {
    return 'Pertanyaan $n dari $total';
  }

  @override
  String get cardSuggestions => 'Saran';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Ditemukan $n hal yang patut dilihat',
      one: 'Ditemukan 1 hal yang patut dilihat',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Dimulai $when';
  }

  @override
  String get suggestionStartedPlain => 'Dimulai';

  @override
  String get suggestionPutAway => 'Simpan';

  @override
  String get suggestionExpired => 'Kedaluwarsa';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Kedaluwarsa: $title';
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
      other: 'Kedaluwarsa dalam $nString menit',
      one: 'Kedaluwarsa dalam 1 menit',
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
      other: 'Kedaluwarsa dalam $nString jam',
      one: 'Kedaluwarsa dalam 1 jam',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n saran ditangani',
      one: '1 saran ditangani',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Gunakan server ini di ponselmu';

  @override
  String get linkIntro =>
      'Beri server ini alamat yang bisa dijangkau ponselmu dari mana saja. Tanpa domain dan tanpa pengaturan router.';

  @override
  String get linkIntroDetails =>
      'Ini menghubungkan server ini ke akun Casama Cloud gratis. Lalu lintas ponselmu melewati Cloudflare langsung ke komputer ini, tidak pernah melalui server Casama.';

  @override
  String get linkTurnOn => 'Gunakan di ponselmu';

  @override
  String get linkSignupsNote =>
      'Pendaftaran baru ditutup saat ini aktif. Hanya orang yang sudah punya akun di sini yang bisa masuk.';

  @override
  String get linkStepSignIn => 'Tautkan server ini';

  @override
  String get linkSignInBody =>
      'Setujui kode ini di halaman yang baru terbuka di browsermu. Pastikan halaman tersebut menampilkan kode yang sama.';

  @override
  String get linkSignInOpen => 'Buka halamannya lagi';

  @override
  String get linkStepAddress => 'Dapatkan alamat';

  @override
  String get linkStepRestart => 'Mulai ulang server';

  @override
  String get linkStepConnect => 'Hubungkan';

  @override
  String get linkStateOnline => 'Online';

  @override
  String get linkStateStarting => 'Memulai';

  @override
  String get linkStateOffline => 'Offline';

  @override
  String get linkStateAttention => 'Perlu perhatian';

  @override
  String get linkStateOff => 'Nonaktif';

  @override
  String get linkAddress => 'Alamat';

  @override
  String get linkLocalAddress => 'Di komputer ini';

  @override
  String get linkShowCode => 'Tampilkan kode masuk';

  @override
  String get linkCheck => 'Periksa lagi';

  @override
  String get linkTurnOff => 'Matikan';

  @override
  String get linkTurnOffConfirm =>
      'Matikan akses jarak jauh? Alamatnya berhenti bekerja, dan ponsel kehilangan akses ke server ini sampai kamu menyalakannya lagi. Nantinya server mendapat alamat yang sama kembali.';

  @override
  String get linkTurningOff => 'Mematikan';

  @override
  String get linkNeedsOwner =>
      'Hanya pemilik server ini yang bisa menyalakannya.';

  @override
  String get linkTwoStepTip =>
      'Server ini sekarang bisa dijangkau dari internet. Masuk dua langkah memastikan kata sandi yang ditebak tidak akan cukup.';

  @override
  String get linkProblemNotLinked =>
      'Server ini tidak tertaut ke Casama Cloud. Nyalakan lagi untuk menautkannya.';

  @override
  String get linkProblemCloudUnreachable =>
      'Casama Cloud tidak dapat dijangkau saat ini. Jika alamatnya tadi berfungsi, sekarang juga masih berfungsi.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud tidak lagi menerima kunci server ini. Nyalakan lagi untuk menautkannya.';

  @override
  String get linkProblemSuspended =>
      'Casama Cloud mematikan akses jarak jauh untuk server ini.';

  @override
  String get linkProblemRemoved =>
      'Server ini dihapus dari ruang kerjanya di Casama Cloud. Nyalakan lagi untuk menautkannya.';

  @override
  String get linkProblemPlanLimit =>
      'Paket Casama Cloud kamu hanya menghubungkan lebih sedikit server. Hapus satu di sana, atau upgrade.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud tidak lagi memiliki alamat untuk server ini. Nyalakan lagi.';

  @override
  String get linkProblemAddressChanged =>
      'Alamat server ini berubah. Nyalakan lagi untuk memakai alamat yang baru.';

  @override
  String get connectProblemConnectorMissing =>
      'Konektornya tidak berjalan. Pastikan Docker berjalan, lalu periksa lagi.';

  @override
  String get connectProblemConnectorBlocked =>
      'Jaringan ini memblokir koneksi. Biasanya penyebabnya VPN atau firewall ketat (port keluar 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Semua sudah terhubung, tapi alamatnya belum merespons. Alamat baru bisa butuh satu menit.';

  @override
  String get linkServers => 'Server tertaut';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Paketmu menghubungkan $limit server.',
      one: 'Paketmu menghubungkan 1 server.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'Belum ada server yang tertaut. Di servermu sendiri, buka Pengaturan, lalu Casama Link.';

  @override
  String linkServerRemoveConfirm(String name) {
    return 'Hapus $name? Alamatnya akan berhenti bekerja. Server bisa ditautkan lagi nanti.';
  }

  @override
  String get linkStatusActive => 'Memiliki alamat';

  @override
  String get linkStatusParked => 'Tidak terlihat akhir-akhir ini';

  @override
  String get linkStatusSuspended => 'Ditangguhkan';

  @override
  String get pairDevice => 'Masuk di perangkat lain';

  @override
  String get pairDeviceRow => 'Tampilkan kode untuk dipindai ponselmu';

  @override
  String get pairDeviceHelp =>
      'Pindai ini dengan kamera ponselmu. Atau di Casama di ponsel: Masuk, lalu Pindai kode.';

  @override
  String get pairDeviceWarning =>
      'Siapa pun yang memindainya akan masuk sebagai kamu. Ini berlaku sekali, selama beberapa menit.';

  @override
  String pairDeviceServer(String host) {
    return 'Masuk ke $host';
  }

  @override
  String get pairDeviceNewCode => 'Kode baru';

  @override
  String get pairDeviceExpired => 'Kode ini sudah habis masa berlakunya.';

  @override
  String get pairDeviceNotReachable =>
      'Server ini hanya merespons di komputer ini, jadi ponsel belum bisa menjangkaunya.';

  @override
  String get pairDeviceNotReachableOther =>
      'Alamat server ini hanya bekerja di jaringannya sendiri. Minta pengelolanya memberikan alamat yang bisa dijangkau dari luar.';

  @override
  String get pairDeviceCopyLink => 'Salin tautan';

  @override
  String get pairDeviceLinkCopied =>
      'Tautan disalin. Tempel ke Casama untuk Chrome atau di perangkat lain.';

  @override
  String get pairDeviceConnectChrome => 'Hubungkan Chrome';

  @override
  String get pairDeviceChromeDone => 'Casama untuk Chrome sudah masuk.';

  @override
  String get pairDeviceChromeFinish =>
      'Selesaikan di tab Casama untuk Chrome yang terbuka.';

  @override
  String get pairDeviceChromeMissing =>
      'Casama untuk Chrome belum terpasang di browser ini.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama untuk Chrome tidak bisa masuk. $error';
  }

  @override
  String get scanToSignIn => 'Pindai kode dari komputermu';

  @override
  String get scanToSignInTitle => 'Pindai kodenya';

  @override
  String get scanToSignInHelp =>
      'Di komputer tempat kamu sudah masuk, buka Pengaturan, lalu Masuk di Perangkat Lain.';

  @override
  String pairSignInTo(String host) {
    return 'Masuk ke $host?';
  }

  @override
  String get pairSignInBody =>
      'Kode ini memasukkan perangkat ini ke akun yang menampilkannya.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'Perangkat ini sekarang memakai $current. Masuk ke $host akan mengalihkannya.';
  }

  @override
  String get pairSigningIn => 'Sedang masuk';

  @override
  String get pairCodeInvalid =>
      'Kode itu tidak berlaku lagi. Tampilkan yang baru lalu pindai lagi.';

  @override
  String get pairLinkInvalid => 'Ini bukan kode masuk Casama.';

  @override
  String get linkServerTitle => 'Tautkan server';

  @override
  String linkServerBody(String name) {
    return '$name ingin terhubung ke akun Casama Cloud kamu.';
  }

  @override
  String get linkServerCode => 'Kode di server';

  @override
  String get linkServerCheck =>
      'Hanya tautkan jika kamu memulai ini di servermu sendiri dan menampilkan kode yang sama.';

  @override
  String get linkServerWhat =>
      'Server mendapat alamat publik dan bisa mengirimimu notifikasi. Server tidak bisa memakai kreditmu.';

  @override
  String get linkServerApprove => 'Tautkan';

  @override
  String get linkServerDone => 'Tertaut';

  @override
  String linkServerDoneBody(String name) {
    return 'Kembali ke $name. Prosesnya berjalan sendiri.';
  }

  @override
  String get linkServerInvalid =>
      'Kode itu tidak berlaku lagi. Mulai ulang di servermu.';

  @override
  String get linkServerEnterCode => 'Kode yang ditampilkan servermu';

  @override
  String get linkServerFind => 'Cari';

  @override
  String get linkServerNeedAdmin =>
      'Hanya pemilik dan admin ruang kerja yang bisa menautkan server.';

  @override
  String get localDockerStopped =>
      'Docker tidak berjalan, jadi servermu berhenti';

  @override
  String get localDockerStoppedBody =>
      'Server Casama kamu berjalan di Docker di komputer ini. Buka Docker dan Casama akan terhubung kembali secara otomatis setelah server kembali aktif, yang bisa memakan waktu satu menit.';

  @override
  String get serverOfflineTitle => 'Servermu offline';

  @override
  String get serverOfflineBody =>
      'Apakah komputer yang menjalankannya menyala dan aktif? Ini akan terhubung lagi secara otomatis.';

  @override
  String get signUpsClosed =>
      'Server ini tidak menerima akun baru. Masuk dengan akun yang sudah kamu miliki di sini.';

  @override
  String get signUpsByInvitation =>
      'Akun baru di sini harus dengan undangan. Gunakan alamat email yang diundang.';

  @override
  String get linkPrivateNotifications => 'Notifikasi pribadi';

  @override
  String get linkPrivateNotificationsHelp =>
      'Notifikasi sampai ke ponselmu lewat Casama Cloud. Saat ini aktif, notifikasi tidak membawa teks dan hanya berbunyi \"Aktivitas baru\"; aplikasi memuat sisanya dari server ini.';

  @override
  String get linkInvites => 'Izinkan orang yang diundang mendaftar';

  @override
  String get linkInvitesHelp =>
      'Nonaktif: tidak ada yang bisa membuat akun baru. Aktif: orang yang kamu undang lewat email bisa. Mengubah ini akan memulai ulang server.';

  @override
  String get linkKeepAwake => 'Jaga Mac ini tetap aktif saat tersambung daya';

  @override
  String get linkKeepAwakeHelp =>
      'Ponsel hanya bisa menjangkau server ini saat komputer ini aktif dan Casama terbuka.';

  @override
  String get linkLiveView => 'Tampilan langsung dari jarak jauh';

  @override
  String get linkLiveViewIncluded =>
      'Termasuk dalam paketmu. Saat jauh dari komputer ini, layar bot diputar langsung lewat relai Casama Cloud.';

  @override
  String get linkLiveViewPlan =>
      'Tersedia mulai Plus ke atas di Casama Cloud. Saat jauh dari komputer ini kamu melihat layar bot sekitar sekali per detik. Di komputer ini tampilannya selalu langsung.';

  @override
  String get liveAwayNeedsPlan =>
      'Saat jauh dari komputer server, video langsung tersedia mulai Plus ke atas di Casama Cloud. Hingga saat itu layar diperbarui sekitar sekali per detik.';

  @override
  String get chatShareExport => 'Bagikan atau ekspor';

  @override
  String get chatShareExportHelp =>
      'Simpan chat ini sebagai file, atau buat tautan baca-saja ke sana.';

  @override
  String get chatExportMarkdown => 'Ekspor sebagai Markdown';

  @override
  String get chatExportMarkdownHelp => 'File teks yang bisa dibaca siapa saja';

  @override
  String get chatExportJson => 'Ekspor sebagai JSON';

  @override
  String get chatExportJsonHelp => 'Untuk aplikasi dan skrip lain';

  @override
  String get chatShareLink => 'Bagikan tautan baca-saja';

  @override
  String get chatShareLinkHelp =>
      'Siapa pun dengan tautan bisa membaca chat ini';

  @override
  String get chatStopSharing => 'Berhenti berbagi tautan';

  @override
  String get chatStopSharingHelp => 'Tautannya berhenti bekerja';

  @override
  String get chatMakePublicTitle => 'Bagikan chat ini dengan tautan?';

  @override
  String get chatMakePublicBody =>
      'Siapa pun dengan tautan bisa membaca chat ini seperti yang kamu lihat. File lampiran hanya dicantumkan namanya, tidak dibagikan. Kamu bisa menghentikannya kapan saja.';

  @override
  String get chatMakePublic => 'Buat tautan';

  @override
  String get chatLinkTitle => 'Tautan baca-saja';

  @override
  String get chatLinkBody =>
      'Disalin. Tidak tercantum di mesin pencari. Membuat tautan baru akan menghentikan tautan ini.';

  @override
  String get chatSharingStopped => 'Tautan tidak lagi berfungsi';

  @override
  String get creationDuplicate => 'Duplikat';

  @override
  String creationDuplicated(String title) {
    return 'Salinan dibuat: “$title”';
  }

  @override
  String get slackInstall => 'Tambahkan ke Slack';

  @override
  String slackInstallHelp(String bot) {
    return 'Hubungkan ruang kerja Slack dalam satu langkah. $bot menjawab @mention dan pesan langsung di sana.';
  }

  @override
  String get slackInstallFinish => 'Selesaikan di Slack, lalu kembali ke sini.';

  @override
  String get helpAndSupport => 'Bantuan & dukungan';

  @override
  String get helpAndSupportRow => 'Tanya Casama Help, hubungi kami, panduan';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Jawaban instan dari panduan kami dan akunmu. Tim kami bisa dihubungi dalam satu ketukan.';

  @override
  String get supportIntro =>
      'Ada pertanyaan, masalah dengan pembelian, atau sesuatu yang tidak berfungsi? Tulis ke kami.';

  @override
  String supportSelfHosted(String host) {
    return 'Ruang kerjamu berjalan di $host. Untuk urusan masuk, akun, dan paket, tanyakan kepada pengelola server tersebut. Kami dapat membantu soal aplikasinya sendiri.';
  }

  @override
  String get supportTalkToPerson => 'Bicara dengan staf';

  @override
  String get contactSupport => 'Hubungi dukungan';

  @override
  String contactSupportRow(String email) {
    return 'Tulis ke tim kami di $email';
  }

  @override
  String get sendFeedback => 'Kirim masukan';

  @override
  String get sendFeedbackRow =>
      'Ide, hal yang disukai, maupun yang tidak disukai. Kami membaca semuanya.';

  @override
  String get feedbackHelp =>
      'Beri tahu kami apa yang kamu ingin Casama lakukan, apa yang kamu sukai, atau apa yang menghalangimu.';

  @override
  String get feedbackKindPrompt => 'Jenis masukan apa ini?';

  @override
  String get feedbackKindIdea => 'Ide';

  @override
  String get feedbackKindLike => 'Saya suka';

  @override
  String get feedbackKindDislike => 'Saya tidak suka';

  @override
  String get feedbackKindConfusing => 'Membingungkan';

  @override
  String get feedbackMessageLabel => 'Masukanmu';

  @override
  String get feedbackMessageHint =>
      'Misalnya: Saya harap saya bisa menyematkan chat ke paling atas.';

  @override
  String get feedbackContactOk => 'Saya bersedia dihubungi tentang hal ini';

  @override
  String get feedbackContactOkHelp =>
      'Kami mungkin mengirimimu pertanyaan lewat email, atau memberi tahu saat sudah selesai.';

  @override
  String get feedbackNote =>
      'Versi aplikasi dan paketmu ikut dikirimkan. Punya masalah dengan akun atau pembelian? Gunakan Hubungi dukungan saja.';

  @override
  String get feedbackThanks => 'Terima kasih! Kami membaca semuanya.';

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
  String get supportIdeasBoard => 'Papan ide';

  @override
  String get supportIdeasBoardHelp =>
      'Lihat apa yang diminta orang lain, dan pilih yang kamu inginkan berikutnya';

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
      'Beri tahu kami apa yang terjadi. Kami akan membalas lewat email.';

  @override
  String get contactSupportHelpMail =>
      'Beri tahu kami apa yang terjadi. Ini membuka aplikasi emailmu dengan detail sudah terisi.';

  @override
  String get supportSend => 'Kirim';

  @override
  String get supportWriteEmail => 'Buka email';

  @override
  String get supportTopicPrompt => 'Tentang apa ini?';

  @override
  String get supportTopicBilling => 'Penagihan & pembelian';

  @override
  String get supportTopicBroken => 'Ada yang tidak berfungsi';

  @override
  String get supportTopicAccount => 'Akun & masuk';

  @override
  String get supportTopicQuestion => 'Pertanyaan atau ide';

  @override
  String get supportTopicOther => 'Hal lainnya';

  @override
  String get supportMessageLabel => 'Pesanmu';

  @override
  String get supportMessageHint =>
      'Apa yang terjadi, dan apa yang kamu harapkan?';

  @override
  String get supportMessageMore =>
      'Tambahkan satu atau dua kalimat: apa yang sedang kamu lakukan dan apa yang salah.';

  @override
  String get supportIncludeChat =>
      'Sertakan percakapan saya dengan Casama Help';

  @override
  String get supportIncludeChatHelp =>
      'Agar kamu tidak perlu menjelaskannya dua kali.';

  @override
  String get supportDetailsNote =>
      'Kami menyertakan versi aplikasi serta ID ruang kerja dan akunmu agar kami dapat menemukan akunmu. Tidak pernah menyertakan chatmu.';

  @override
  String get supportSentTitle => 'Pesan terkirim';

  @override
  String supportSentBody(String email, String reference) {
    return 'Kami akan membalas ke $email. Nomor referensimu adalah $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'Aplikasi email tidak ditemukan, jadi pesanmu kami salin. Tempelkan ke email untuk $email.';
  }

  @override
  String get supportGuides => 'Panduan dan FAQ';

  @override
  String get supportGuidesHelp =>
      'Bantuan langkah demi langkah untuk semuanya di Casama';

  @override
  String get introVideoTitle => 'Lihat cara kerja Casama';

  @override
  String get introVideoSubtitle => 'Video 1½ menit';

  @override
  String get supportIntroVideo => 'Tonton video pengenalan';

  @override
  String get introVideoFailed =>
      'Tidak bisa memutar video. Periksa koneksimu dan coba lagi.';

  @override
  String get introVideoOnYoutube => 'Tonton di YouTube';

  @override
  String get introVideoReplay => 'Putar ulang';

  @override
  String get supportIntroVideoHelp =>
      'Lihat apa yang bisa dilakukan Casama dalam 1½ menit';

  @override
  String get supportRate => 'Beri nilai Casama';

  @override
  String get supportRateHelp =>
      'Beri tahu orang lain pendapatmu di halaman toko';

  @override
  String get supportIds => 'ID dukungan';

  @override
  String get supportIdsHelp =>
      'Tim dukungan mungkin menanyakan ini. Ini membantu menemukan akun dan pembelianmu, dan tidak memberi siapa pun akses.';

  @override
  String supportWorkspaceId(String name) {
    return 'ID ruang kerja · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'Juga ID pembelianmu di App Store dan Google Play';

  @override
  String get supportAccountId => 'ID akun';

  @override
  String get supportCopyAll => 'Salin semua detail';

  @override
  String get supportCopyAllHelp =>
      'Versi aplikasi, platform, dan ID, untuk ditempel ke pesan';

  @override
  String get supportNewChat => 'Percakapan baru';

  @override
  String get supportAskHint => 'Tanya apa saja tentang Casama';

  @override
  String get supportAiNote =>
      'Casama Help adalah AI dan bisa membuat kesalahan. Ia melihat paketmu dan error bot, bukan chatmu.';

  @override
  String get supportGreeting =>
      'Hai! Saya Casama Help. Tanya saya tentang Casama, paketmu, atau masalah yang kamu alami. Jika saya tidak bisa memperbaikinya, saya akan meneruskannya ke tim dukungan kami.';

  @override
  String get supportStarterPurchase => 'Pembelian saya tidak berhasil';

  @override
  String get supportStarterCancel => 'Bagaimana cara membatalkan paket saya?';

  @override
  String get supportStarterBot => 'Bot saya tidak menjawab';

  @override
  String get supportStarterHowTo => 'Apa saja yang bisa dilakukan bot saya?';

  @override
  String get supportAskPerson => 'Tanya staf';

  @override
  String get supportHandoffTitle => 'Kirim ini ke tim dukungan kami?';

  @override
  String get supportHandoffButton => 'Tinjau dan kirim';

  @override
  String get supportThinking => 'Sedang memeriksa…';

  @override
  String get supportAssistantError =>
      'Casama Help tidak bisa menjawab. Coba lagi, atau tanya staf.';

  @override
  String get supportAssistantLimit =>
      'Casama Help tidak bisa menjawab lagi saat ini. Staf kami bisa membantu.';

  @override
  String get purchaseHelp => 'Bermasalah dengan pembelian? Dapatkan bantuan';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Laporkan';

  @override
  String get reportAndBlock => 'Laporkan dan blokir';

  @override
  String get reportReply => 'Laporkan balasan';

  @override
  String get reportBot => 'Laporkan bot';

  @override
  String get reportBotRow =>
      'Ada yang tidak beres di nama, deskripsi, atau balasannya';

  @override
  String get reportPerson => 'Laporkan orang';

  @override
  String get reportGalleryItem => 'Laporkan item galeri';

  @override
  String get reportGalleryRequest => 'Laporkan permintaan';

  @override
  String get reportWorkspace => 'Laporkan ruang kerja';

  @override
  String get reportHelp =>
      'Beri tahu pengelola server ini apa yang salah. Mereka meninjau setiap laporan.';

  @override
  String get reportPersonHelp =>
      'Beri tahu pengelola server ini apa yang terjadi. Kami juga akan memblokir orang ini untukmu.';

  @override
  String get reportNote => 'Hal lain yang perlu mereka ketahui (opsional)';

  @override
  String reportAlsoBlock(String name) {
    return 'Blokir juga $name';
  }

  @override
  String get reportSent =>
      'Terima kasih. Laporanmu sudah dikirim untuk ditinjau.';

  @override
  String get reportReasonSpam => 'Spam atau penipuan';

  @override
  String get reportReasonSexual => 'Konten seksual';

  @override
  String get reportReasonViolence => 'Kekerasan atau ancaman';

  @override
  String get reportReasonHarassment => 'Pelecehan atau ujaran kebencian';

  @override
  String get reportReasonIllegal => 'Ilegal atau berbahaya';

  @override
  String get reportReasonImpersonation => 'Berpura-pura menjadi seseorang';

  @override
  String get reportReasonOther => 'Hal lainnya';

  @override
  String get thisPerson => 'orang ini';

  @override
  String blockPerson(String name) {
    return 'Blokir $name';
  }

  @override
  String blocked(String name) {
    return '$name diblokir';
  }

  @override
  String get blockHelp =>
      'Orang yang diblokir tidak dapat mengundangmu ke ruang kerja, dan kamu tidak akan menerima kabar dari mereka.';

  @override
  String get blockedPeople => 'Orang yang diblokir';

  @override
  String get blockedPeopleRow =>
      'Orang yang tidak bisa mengundang atau menghubungimu';

  @override
  String get noBlockedPeople => 'Tidak ada orang yang diblokir';

  @override
  String get unblock => 'Buka blokir';

  @override
  String get emailTips => 'Tips dan kabar lewat email';

  @override
  String get emailTipsHelp =>
      'Tips awal dan pembaruan sesekali. Email tentang paket dan akunmu akan selalu dikirim.';

  @override
  String get reportsInApp => 'Dilaporkan di aplikasi';

  @override
  String get reportsNone =>
      'Tidak ada laporan terbuka. Laporan yang dikirim orang dari aplikasi muncul di sini.';

  @override
  String get reportsPublicLinks => 'Tautan publik yang dilaporkan';

  @override
  String get reportsNoLinks => 'Tidak ada tautan publik yang dilaporkan.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count laporan',
      one: '1 laporan',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Turunkan';

  @override
  String get reportsRestore => 'Pulihkan';

  @override
  String get reportKindReply => 'Balasan bot';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Orang';

  @override
  String get reportKindGallery => 'Item galeri';

  @override
  String get reportKindWorkspace => 'Ruang kerja';

  @override
  String get reportMarkActioned => 'Sudah ditangani';

  @override
  String reportSuspendWorkspace(String name) {
    return 'Tangguhkan ruang kerja $name';
  }

  @override
  String get reportDismiss => 'Abaikan: tidak ada yang salah';

  @override
  String get supportWebTitle => 'Casama Help di situs web';

  @override
  String get supportWebOn => 'Aktif';

  @override
  String get supportWebOff => 'Nonaktif';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alamat IP dijeda',
      one: '1 alamat IP dijeda',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return 'Tampilkan $count pertanyaan tak terjawab';
  }

  @override
  String get ticketsOpen => 'Terbuka';

  @override
  String get ticketsClosed => 'Ditutup';

  @override
  String get ticketsAll => 'Semua';

  @override
  String get ticketsNone => 'Tidak ada pesan di sini.';

  @override
  String get ticketClose => 'Tutup';

  @override
  String get ticketReopen => 'Buka kembali';

  @override
  String get serviceStatus => 'Status';

  @override
  String get supportStatus => 'Status Casama Cloud';

  @override
  String get supportStatusHelp =>
      'Periksa apakah ada layanan yang bermasalah saat ini';

  @override
  String get galleryChatSuggestionLabel => 'Dari galeri';

  @override
  String get galleryChatAdd => 'Tambahkan';

  @override
  String galleryChatAdded(String name) {
    return '$name ditambahkan';
  }

  @override
  String galleryChatReads(String things) {
    return 'Membaca: $things';
  }

  @override
  String get galleryChatRunsCode => 'Menjalankan kode';

  @override
  String get galleryChatComputer => 'Memakai komputer';

  @override
  String galleryChatNeeds(String apps) {
    return 'Perlu: $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Draf keahlian';

  @override
  String get galleryChatShowInstructions => 'Tampilkan instruksi';

  @override
  String get galleryChatHideInstructions => 'Sembunyikan instruksi';

  @override
  String get galleryChatSaveSkill => 'Simpan ke keahlian saya';

  @override
  String get galleryChatSaved => 'Tersimpan';

  @override
  String get galleryChatSavedSkill => 'Tersimpan di keahlianmu';

  @override
  String get galleryChatSubmit => 'Kirim ke galeri';

  @override
  String galleryChatSubmitTitle(String name) {
    return 'Kirim $name ke galeri?';
  }

  @override
  String get galleryChatSubmitBody =>
      'Pengelola akan meninjaunya terlebih dahulu. Setelah masuk, siapa pun dapat menemukan dan memakainya. Nama tampilanmu ditampilkan sebagai pembuat, tidak pernah emailmu.';

  @override
  String get galleryChatSent => 'Terkirim';

  @override
  String get galleryChatSubmitted => 'Terkirim ke galeri untuk ditinjau';

  @override
  String get galleryChatSubmissionsOff =>
      'Server ini tidak menerima kiriman galeri.';

  @override
  String get galleryPicksTitle => 'Pilihan untukmu';

  @override
  String get galleryPicksHelp =>
      'Mulai dengan set keahlian, aplikasi, dan rutinitas yang cocok. Kamu bisa mengubah apa pun nanti.';

  @override
  String get galleryPicksAdd => 'Tambahkan set ini';

  @override
  String get galleryPicksSkip => 'Lewati dulu';

  @override
  String galleryPicksAddNamed(String name) {
    return 'Tambahkan $name';
  }

  @override
  String get galleryPicksBestMatch => 'Paling cocok';

  @override
  String get galleryPicksInside => 'Isinya';

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
      other: '$count keahlian',
      one: '1 keahlian',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rutinitas',
      one: '1 rutinitas',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aplikasi',
      one: '1 aplikasi',
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
      other: '$count gaya',
      one: '1 gaya',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return '$name ditambahkan';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return '$name ditambahkan. Hubungkan $apps di Aplikasi untuk menyelesaikan.';
  }

  @override
  String galleryPicksPending(String name) {
    return 'Admin akan memeriksa $name sebelum ditambahkan.';
  }

  @override
  String get galleryPolicyTitle => 'Galeri';

  @override
  String get galleryPolicyRow =>
      'Apa yang boleh ditambahkan orang di sini dari galeri';

  @override
  String get galleryPolicyMode => 'Siapa yang boleh menambahkan';

  @override
  String get galleryPolicyOpen => 'Terbuka';

  @override
  String get galleryPolicyOpenHelp =>
      'Siapa pun di sini bisa menambahkan apa saja yang tidak diblokir.';

  @override
  String get galleryPolicyApproval => 'Tanya dulu';

  @override
  String get galleryPolicyApprovalHelp =>
      'Menambahkan akan bertanya kepada admin dulu, untuk hal yang kamu pilih di bawah.';

  @override
  String get galleryPolicyAllowlist => 'Hanya yang diizinkan';

  @override
  String get galleryPolicyAllowlistHelp =>
      'Orang hanya bisa menambahkan yang ada di daftar diizinkan.';

  @override
  String get galleryPolicyApprovalFor => 'Tanya dulu untuk';

  @override
  String get galleryPolicyRunsCode => 'Hal yang menjalankan kode';

  @override
  String get galleryPolicyApps => 'Hal yang menghubungkan aplikasi';

  @override
  String get galleryPolicyAll => 'Semuanya';

  @override
  String get galleryPolicyAllowed => 'Diizinkan';

  @override
  String get galleryPolicyAllowedHelp =>
      'Ditambahkan tanpa bertanya. Dengan Hanya yang diizinkan, hanya ini yang boleh ditambahkan orang.';

  @override
  String get galleryPolicyBlocked => 'Diblokir';

  @override
  String get galleryPolicyBlockedHelp =>
      'Tidak ada orang di sini yang bisa menambahkan ini.';

  @override
  String get galleryPolicyAddItem => 'Tambahkan dari galeri';

  @override
  String get galleryPolicyNone => 'Belum ada';

  @override
  String get galleryPolicySearch => 'Cari galeri';

  @override
  String get galleryPolicyNoResults => 'Tidak ada di galeri yang cocok.';

  @override
  String get galleryPolicySaved => 'Aturan galeri disimpan';

  @override
  String galleryPolicyRemove(String name) {
    return 'Hapus $name';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Hanya admin dan pemilik yang bisa mengubah ini.';

  @override
  String get galleryPolicyWaiting => 'Menunggu persetujuan';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name meminta';
  }

  @override
  String get galleryPolicyApprove => 'Setujui';

  @override
  String get galleryPolicyDecline => 'Tolak';

  @override
  String galleryPolicyApproved(String name) {
    return '$name disetujui dan ditambahkan';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return '$name ditolak';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Disetujui, tetapi $name tidak bisa ditambahkan. $error';
  }

  @override
  String get galleryDigestEmails => 'Pilihan galeri bulanan';

  @override
  String get galleryDigestHelp =>
      'Hingga enam keahlian, aplikasi, dan rutinitas baru yang sesuai dengan pemakaianmu, sebulan sekali.';

  @override
  String get newsletterTitle => 'Email bulanan Casama';

  @override
  String get newsletterHelp =>
      'Yang baru dan yang akan datang, paling banyak sebulan sekali.';

  @override
  String get newsletterSignUp =>
      'Kirimi saya email bulanan Casama: apa yang baru dan yang akan datang, paling banyak sebulan sekali.';

  @override
  String get newsletterCardTitle => 'Terima email bulanan Casama?';

  @override
  String get newsletterCardBody =>
      'Yang baru dan yang akan datang, paling banyak sebulan sekali. Hentikan kapan saja.';

  @override
  String get newsletterCardYes => 'Ya, kirimkan';

  @override
  String get newsletterCardNo => 'Tidak, terima kasih';

  @override
  String get newsletterCardDone =>
      'Kamu sudah masuk daftar. Matikan kapan saja di Pengaturan.';

  @override
  String get galleryKindApp => 'Aplikasi';

  @override
  String get galleryKindApps => 'Aplikasi';

  @override
  String get galleryKindBot => 'Bot awal';

  @override
  String get galleryKindBots => 'Bot awal';

  @override
  String get galleryKindRoutine => 'Rutinitas';

  @override
  String get galleryKindRoutines => 'Rutinitas';

  @override
  String get galleryKindPlugin => 'Plugin';

  @override
  String get galleryKindPlugins => 'Plugin';

  @override
  String get galleryKindSet => 'Set awal';

  @override
  String get galleryKindSets => 'Set awal';

  @override
  String get galleryTabBrowse => 'Jelajahi';

  @override
  String get galleryTabInstalled => 'Terpasang';

  @override
  String get gallerySearchEverything => 'Cari semuanya';

  @override
  String get galleryNewBadge => 'Baru';

  @override
  String get galleryRowPicks => 'Pilihan';

  @override
  String get galleryRowNew => 'Baru';

  @override
  String get galleryRowTrending => 'Tren minggu ini';

  @override
  String get galleryRowMostUsed => 'Paling sering dipakai';

  @override
  String get galleryRowWorksWith => 'Cocok dengan yang kamu miliki';

  @override
  String get galleryRowSets => 'Set awal';

  @override
  String get galleryRowSeasonal => 'Musiman';

  @override
  String get galleryFilterFree => 'Gratis';

  @override
  String get galleryFilterPlan => 'Memakai kredit';

  @override
  String get galleryFilterSelfHosted => 'Bekerja secara host mandiri';

  @override
  String get galleryFilterComputer => 'Memerlukan komputer';

  @override
  String get galleryNoFilterMatches => 'Tidak ada yang cocok dengan filter ini';

  @override
  String get galleryClearFilters => 'Hapus filter';

  @override
  String get galleryRequestThis => 'Minta ini';

  @override
  String get galleryAskCasama => 'Minta Casama membuatnya';

  @override
  String galleryAskPrompt(String query) {
    return 'Buatkan saya sesuatu untuk ini: $query';
  }

  @override
  String get galleryAccessTitle => 'Yang dapat diaksesnya';

  @override
  String galleryAccessReads(String things) {
    return 'Membaca: $things';
  }

  @override
  String get galleryAccessRunsCode => 'Menjalankan kode';

  @override
  String get galleryAccessComputer => 'Memakai komputer';

  @override
  String get galleryAccessNothing =>
      'Tidak membaca atau mengubah apa pun milikmu';

  @override
  String get galleryCreditsNone => 'Tidak memakai kredit';

  @override
  String get galleryCreditsLow => 'Memakai sedikit kredit';

  @override
  String get galleryCreditsMedium => 'Memakai beberapa kredit';

  @override
  String get galleryCreditsHigh => 'Memakai banyak kredit';

  @override
  String get galleryTryIt => 'Coba';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dipakai oleh $shown orang',
      one: 'Dipakai oleh 1 orang',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '$percent% eksekusi selesai';
  }

  @override
  String get galleryAbout => 'Tentang';

  @override
  String get galleryMadeByCasama => 'Dibuat oleh Casama';

  @override
  String get galleryMadeByCommunity => 'Dibuat oleh komunitas';

  @override
  String get galleryMadeReviewed => 'Ditinjau';

  @override
  String get galleryReviewedHelp => 'Pengujiannya lolos untuk versi ini';

  @override
  String galleryMoreFrom(String name) {
    return 'Lainnya dari $name';
  }

  @override
  String galleryVersion(int version) {
    return 'Versi $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Diperbarui $date';
  }

  @override
  String galleryRemixOf(String name) {
    return 'Remix dari $name';
  }

  @override
  String galleryChangesTitle(String name) {
    return 'Yang berubah di $name';
  }

  @override
  String get galleryBreaking => 'Cara kerjanya berbeda';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item di galeri',
      one: '1 item di galeri',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty => 'Belum ada di galeri oleh pembuat ini.';

  @override
  String get galleryInstalledWorkspace => 'Di ruang kerja ini';

  @override
  String get galleryInstalledDevice => 'Gaya di perangkat ini';

  @override
  String get galleryInstalledEmptyTitle => 'Belum ada yang ditambahkan';

  @override
  String get galleryInstalledEmpty =>
      'Keahlian, aplikasi, rutinitas, dan gaya yang kamu tambahkan dari galeri muncul di sini, beserta pembaruannya.';

  @override
  String get galleryInstalledError => 'Tidak bisa memuat yang terpasang.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pembaruan',
      one: '1 pembaruan',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Perbarui';

  @override
  String galleryUpdated(String name) {
    return '$name diperbarui';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Versi $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return 'Perbarui $name?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'Versi baru dapat melakukan lebih banyak dari yang kamu miliki:';

  @override
  String get galleryUpdateBreakingHelp =>
      'Versi baru bekerja secara berbeda, jadi periksa setelah memperbarui.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Sekarang membaca: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Sekarang bisa: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Sekarang menjalankan kode';

  @override
  String get galleryUpdateNowComputer => 'Sekarang memakai komputer';

  @override
  String get galleryRemove => 'Hapus';

  @override
  String galleryRemoveTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get galleryRemoveHelp =>
      'Ini dihapus dari ruang kerja ini. Kamu bisa menambahkannya lagi dari galeri.';

  @override
  String galleryRemoved(String name) {
    return '$name dihapus';
  }

  @override
  String get galleryRetired => 'Tidak lagi di galeri';

  @override
  String get galleryRetiredReplaced => 'Tidak lagi di galeri; ada penggantinya';

  @override
  String get gallerySeeReplacement => 'Lihat pengganti';

  @override
  String get galleryForgetLook => 'Hapus dari daftar ini';

  @override
  String galleryWizardTitle(String name) {
    return 'Tambahkan $name';
  }

  @override
  String get galleryWizardAdd => 'Tambahkan';

  @override
  String get galleryWizardRequired => 'Isi bagian ini';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Termasuk $count item',
      one: 'Termasuk 1 item',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'Yang dibutuhkannya';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count keahlian, ditambahkan untukmu',
      one: '1 keahlian, ditambahkan untukmu',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'Aplikasi untuk dihubungkan: $apps';
  }

  @override
  String get galleryWizardBot => 'Tambahkan ke bot mana';

  @override
  String get galleryWizardPickBot => 'Pilih bot';

  @override
  String get galleryWizardSetBotHelp =>
      'Tempat rutinitas set ini masuk. Tanpa bot, rutinitas dilewati.';

  @override
  String get galleryWizardSetNotAdded => 'Tidak ditambahkan';

  @override
  String get galleryWizardNeedsTitle => 'Hubungkan aplikasimu';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '$name berfungsi setelah semuanya terhubung.';
  }

  @override
  String get galleryWizardSkillAdded => 'Ditambahkan';

  @override
  String get galleryWizardConnected => 'Terhubung';

  @override
  String get galleryWizardConnect => 'Hubungkan';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Hubungkan $name di Pengaturan → Aplikasi.';
  }

  @override
  String get galleryWizardContinue => 'Lanjutkan';

  @override
  String get galleryWizardSkip => 'Nanti';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name siap';
  }

  @override
  String get galleryWizardDoneHelp =>
      'Kamu akan menemukannya bersama itemmu lainnya.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'Agar berfungsi penuh, aplikasi berikut perlu terhubung: $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'Menunggu persetujuan';

  @override
  String get galleryWizardPendingHelp =>
      'Ruang kerjamu bertanya kepada admin terlebih dahulu. Item ditambahkan setelah disetujui.';

  @override
  String get galleryRequestsTitle => 'Permintaan';

  @override
  String get galleryRequestsHelp =>
      'Ide untuk galeri. Pilih yang kamu inginkan; pembuat memilih dari yang teratas.';

  @override
  String get galleryRequestsLinkHelp =>
      'Minta sesuatu yang belum ada di sini, atau pilih';

  @override
  String get galleryRequestsTop => 'Teratas';

  @override
  String get galleryRequestsNew => 'Baru';

  @override
  String get galleryRequestsEmpty =>
      'Belum ada permintaan. Jadilah yang pertama.';

  @override
  String get galleryRequestsError => 'Tidak bisa memuat permintaan.';

  @override
  String get galleryRequestNew => 'Permintaan baru';

  @override
  String get galleryRequestNewHelp =>
      'Sebutkan apa yang ingin kamu buat seseorang. Permintaan serupa akan digabung.';

  @override
  String get galleryRequestKind => 'Jenis';

  @override
  String get galleryRequestTitleLabel => 'Harus melakukan apa?';

  @override
  String get galleryRequestTitleLength => 'Gunakan 4 hingga 80 karakter.';

  @override
  String get galleryRequestDetails => 'Detail (opsional)';

  @override
  String get galleryRequestSend => 'Kirim permintaan';

  @override
  String get galleryRequestSent => 'Permintaan terkirim';

  @override
  String galleryRequestSimilar(String title) {
    return '\"$title\" sudah pernah diminta, jadi suaramu masuk ke sana';
  }

  @override
  String get galleryRequestMine => 'Milikmu';

  @override
  String get galleryRequestVote => 'Pilih';

  @override
  String get galleryRequestOpen => 'Terbuka';

  @override
  String get galleryRequestPlanned => 'Direncanakan';

  @override
  String get galleryRequestDone => 'Selesai';

  @override
  String get galleryRequestDeclined => 'Ditolak';

  @override
  String get gallerySubmitStart => 'Kirim ke galeri';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Bagikan gaya, keahlian, rutinitas, atau bot buatanmu';

  @override
  String get gallerySubmitPick => 'Apa yang ingin kamu bagikan?';

  @override
  String get gallerySubmitPickHelp =>
      'Pilih sesuatu buatanmu. Itu akan ditinjau sebelum tampil di galeri.';

  @override
  String get galleryLooksMine => 'Gayamu';

  @override
  String get gallerySubmitCurrentScheme => 'Skema warna yang dipakai';

  @override
  String get gallerySubmitCurrentWallpaper => 'Wallpaper yang dipakai';

  @override
  String get gallerySubmitMyWallpaper => 'Wallpaper saya';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'Kirim Aplikasi',
      'bot': 'Kirim Bot awal',
      'routine': 'Kirim Rutinitas',
      'plugin': 'Kirim Plugin',
      'set': 'Kirim Set awal',
      'theme': 'Kirim Tema',
      'scheme': 'Kirim Skema warna',
      'wallpaper': 'Kirim Wallpaper',
      'other': 'Kirim Keahlian',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Nama tampilanmu ditunjukkan sebagai pembuat. Emailmu tidak pernah dibagikan.';

  @override
  String get gallerySubmitName => 'Nama';

  @override
  String get gallerySubmitNameLength => 'Gunakan 1 hingga 60 karakter.';

  @override
  String get gallerySubmitTags => 'Tag';

  @override
  String get gallerySubmitTagsHelp => 'Maksimal enam, dipisahkan koma';

  @override
  String get gallerySubmitLicense => 'Lisensi';

  @override
  String gallerySubmitRemix(String name) {
    return 'Mencantumkan karya asli: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed => 'Mencantumkan item galeri asli';

  @override
  String get gallerySubmitSend => 'Kirim';

  @override
  String get gallerySubmitted => 'Terkirim untuk ditinjau';

  @override
  String get gallerySubmissionsTitle => 'Kiriman saya';

  @override
  String get gallerySubmissionsHelp =>
      'Yang kamu kirim ke galeri dan statusnya saat ini.';

  @override
  String get gallerySubmissionsSent => 'Terkirim';

  @override
  String get gallerySubmissionsEmpty => 'Belum ada yang dikirim.';

  @override
  String get gallerySubmissionsError => 'Tidak bisa memuat kirimanmu.';

  @override
  String get gallerySubmissionOpen => 'Sedang ditinjau';

  @override
  String get gallerySubmissionMerged => 'Di galeri';

  @override
  String get gallerySubmissionClosed => 'Tidak diterima';

  @override
  String get gallerySubmissionFailed => 'Tidak bisa dikirim';

  @override
  String get galleryMyItems => 'Itemmu di galeri';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count laporan terbuka',
      one: '1 laporan terbuka',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'Bot';

  @override
  String get islandNeedsOk => 'Perlu persetujuanmu';

  @override
  String get islandTakeOver => 'Ingin kamu ambil alih';

  @override
  String get islandWriting => 'Menulis balasan';

  @override
  String get islandWorking => 'Bekerja';

  @override
  String get islandFinished => 'Selesai';

  @override
  String get islandStoppedProblem => 'Berhenti karena masalah';

  @override
  String get islandOnThisMac => 'Di Mac ini';

  @override
  String get islandStale => 'Buka Casama untuk yang terbaru';

  @override
  String get islandOpen => 'Buka';

  @override
  String get islandStop => 'Hentikan';

  @override
  String get islandAllow => 'Izinkan';

  @override
  String get islandDeny => 'Tolak';

  @override
  String get islandReview => 'Tinjau';

  @override
  String get islandNothing => 'Belum ada bot yang bekerja saat ini';

  @override
  String get islandQuickAsk => 'Tanya cepat…';

  @override
  String get islandOpenCasama => 'Buka Casama';

  @override
  String get islandSettings => 'Pengaturan…';

  @override
  String get islandQuit => 'Tutup Casama';

  @override
  String get islandAskHint => 'Tanya bot…';

  @override
  String get islandNeedsYou => 'Perlu kamu';

  @override
  String get islandDropHere => 'Lepas untuk bertanya ke bot';

  @override
  String get siriSignedOut => 'Masuk ke Casama terlebih dahulu.';

  @override
  String get siriOpenToFinish => 'Buka Casama untuk menyelesaikan.';

  @override
  String get siriTooMany =>
      'Terlalu banyak permintaan dalam satu menit. Buka Casama untuk melanjutkan.';

  @override
  String get siriNoCredits =>
      'Kreditmu habis. Buka Casama untuk menambah lagi.';

  @override
  String get siriOffline => 'Casama tidak bisa terhubung ke internet saat ini.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot perlu persetujuanmu dulu. Buka Casama untuk meninjaunya.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot mengalami masalah. Buka Casama untuk melihat yang terjadi.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot membalas. Buka Casama untuk membacanya.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot masih mengerjakannya. Kamu akan mendapat notifikasi saat selesai.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot menjawab.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return '$routine dimulai.';
  }

  @override
  String get siriNothingNeedsYou =>
      'Tidak ada yang perlu kamu tangani saat ini.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hal perlu kamu tangani.',
      one: 'Satu hal perlu kamu tangani.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'Menunggumu: $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'Komputer tidak tersedia untuk akun ini.';

  @override
  String get siriNoComputers => 'Kamu belum punya komputer di ruang kerja ini.';

  @override
  String siriStartingComputer(String computer) {
    return 'Menjalankan $computer.';
  }

  @override
  String get siriComputerFailed => 'Tidak bisa menyalakan komputer saat ini.';

  @override
  String get siriWhichBotToStop => 'Bot mana yang harus saya hentikan?';

  @override
  String get siriBotNotRunning => 'Bot itu sedang tidak berjalan saat ini.';

  @override
  String get siriStopped => 'Dihentikan.';

  @override
  String get siriStopFailed => 'Tidak bisa menghentikan bot saat ini.';

  @override
  String get focusFilterShowingAll => 'Filter Fokus · Menampilkan semua';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Filter Fokus · $count ditampilkan',
      one: 'Filter Fokus · 1 ditampilkan',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casama untuk pengguna berusia 13 tahun ke atas';

  @override
  String get under13Body =>
      'Akun ini tidak dapat memakai Casama berdasarkan rentang usia yang dinyatakan. Kamu dapat keluar, atau mengekspor datamu dari akun lain.';

  @override
  String get siriSpotlightSetting => 'Tampilkan di Spotlight dan Siri';

  @override
  String get siriSpotlightSettingHelp =>
      'Nama bot, nama rutinitas, dan judul chat muncul di Spotlight dan Siri pada perangkat ini. Tidak pernah isi percakapan. Nonaktif saat kunci aplikasi menyala.';

  @override
  String get geminiSetting => 'Izinkan Gemini memakai Casama';

  @override
  String get geminiSettingHelp =>
      'Saat kamu meminta Gemini memakai Casama, ia bisa bertanya ke botmu, melihat apa yang perlu kamu tangani, dan menjalankan rutinitasmu di ponsel ini. Ia tidak pernah menyetujui apa pun: permintaan dibuka di sini. Balasan tetap disembunyikan jika ruang kerjanya privat, Sembunyikan teks balasan aktif, atau kunci aplikasi menyala.';

  @override
  String get geminiOff =>
      'Gemini dimatikan untuk Casama di ponsel ini. Nyalakan di Casama: Pengaturan, Privasi.';

  @override
  String get islandBotWorking => 'Ada bot sedang bekerja';

  @override
  String get islandOnThisComputer => 'di komputer ini';

  @override
  String get islandOnACall => 'Dalam panggilan';

  @override
  String get islandStartElsewhere => 'Bot yang kamu mulai di tempat lain';

  @override
  String get islandStartElsewhereHelp =>
      'Tampilkan juga di Layar Terkunci ponsel ini apa yang kamu mulai di perangkat lain, seperti Mac-mu.';

  @override
  String get islandBotsAtWork => 'Bot sedang bekerja';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count langkah',
      one: '1 langkah',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Tampilkan bot di notch';

  @override
  String get showBotsInNotchHelp =>
      'Apa yang sedang dilakukan botmu, di sekitar kamera. Ikon bar menu tetap menampilkannya.';

  @override
  String get notchOnHover => 'Buka notch saat kursor diarahkan';

  @override
  String get notchOnHoverHelp => 'Nonaktif: klik notch untuk membukanya.';

  @override
  String get sitePublishToWeb => 'Terbitkan ke web';

  @override
  String get sitePublishToWebHelp => 'Beri alamat web sendiri.';

  @override
  String get siteAddressName => 'Nama alamat';

  @override
  String get siteAddressRules =>
      '3 hingga 40 huruf kecil, angka, dan tanda hubung, diawali dan diakhiri huruf atau angka.';

  @override
  String get siteAddressChecking => 'Memeriksa…';

  @override
  String get siteAddressAvailable => 'Tersedia';

  @override
  String get siteAddressTaken => 'Nama ini tidak tersedia.';

  @override
  String get siteAnyoneCanOpen =>
      'Siapa pun dengan alamat ini akan dapat membukanya.';

  @override
  String get sitePublish => 'Terbitkan';

  @override
  String get siteOnTheWeb => 'Di web';

  @override
  String get siteSearchEngines => 'Izinkan mesin pencari menemukannya';

  @override
  String get siteSearchEnginesHelp =>
      'Mencantumkannya di Google dan mesin pencari lainnya.';

  @override
  String get siteSearchEnginesPaid => 'Memerlukan paket berbayar.';

  @override
  String get siteUseOwnDomain => 'Gunakan domainmu sendiri';

  @override
  String get siteUnpublish => 'Batalkan penerbitan';

  @override
  String get siteUnpublishTitle => 'Batalkan penerbitan situs ini?';

  @override
  String get siteUnpublishBody =>
      'Situs berhenti terbuka di alamat webnya. Tetap tersimpan di Pustakamu.';

  @override
  String get siteHostLive => 'Aktif';

  @override
  String get siteHostWaitingForDns => 'Menunggu DNS';

  @override
  String get siteHostGettingCertificate => 'Mendapatkan sertifikatnya';

  @override
  String get siteHostNeedsAttention => 'Perlu perhatian';

  @override
  String get siteHostPaused => 'Dijeda';

  @override
  String get siteHostSuspended => 'Ditangguhkan';

  @override
  String get settingsDomains => 'Domain';

  @override
  String get settingsDomainsHelp => 'Buka situsmu di domain milikmu.';

  @override
  String get settingsSearchHint => 'Cari pengaturan';

  @override
  String settingsSearchNone(String query) {
    return 'Tidak ada pengaturan yang cocok dengan “$query”.';
  }

  @override
  String get domainsEmpty =>
      'Hubungkan domain milikmu, seperti bakery.com, lalu situsmu terbuka di sana.';

  @override
  String get domainsConnectOwn => 'Hubungkan domain milikmu';

  @override
  String get domainStateLive => 'Aktif';

  @override
  String get domainStateWaitingDns => 'Menunggu DNS';

  @override
  String get domainStateWaitingCert => 'Mendapatkan sertifikatnya';

  @override
  String get domainStatePaused => 'Dijeda';

  @override
  String get domainStateNeedsAttention => 'Perlu perhatian';

  @override
  String get domainNoSite => 'Belum ada situs';

  @override
  String get domainConnectField => 'Domainmu';

  @override
  String get domainConnectHelp =>
      'Ketik seperti bakery.com, www.bakery.com, atau shop.bakery.com.';

  @override
  String get domainConnectSite => 'Situs yang ditampilkan';

  @override
  String get domainSiteNone => 'Tidak ada';

  @override
  String get domainSiteNoneHelp =>
      'Domain tidak menampilkan apa pun hingga kamu memilih situs.';

  @override
  String get domainConnect => 'Hubungkan';

  @override
  String get domainClaimTitle => 'Tunjukkan bahwa ini milikmu';

  @override
  String get domainClaimBody =>
      'Ruang kerja lain telah menghubungkan domain ini. Tambahkan data DNS ini untuk menunjukkan ini milikmu, lalu ketuk Hubungkan lagi.';

  @override
  String get domainRecordType => 'Jenis';

  @override
  String get domainRecordName => 'Nama';

  @override
  String get domainRecordValue => 'Nilai';

  @override
  String get domainSite => 'Situs';

  @override
  String get domainPickSite => 'Pilih situs';

  @override
  String get domainHosts => 'Alamat';

  @override
  String get domainPrimary => 'Utama';

  @override
  String get domainPrimaryHelp =>
      'Pengunjung mendarat di sini; alamat lainnya mengarahkan ke sini.';

  @override
  String get domainMakePrimary => 'Jadikan utama';

  @override
  String get domainRecordsTitle => 'Data yang perlu ditambahkan';

  @override
  String get domainRecordsAtCloudflare =>
      'Tambahkan ini di Cloudflare. Atur datanya ke DNS only.';

  @override
  String domainRecordsAt(String provider) {
    return 'Tambahkan ini di pengaturan DNS-mu di $provider.';
  }

  @override
  String get domainRecordsGeneric =>
      'Tambahkan ini di tempat DNS domainmu dikelola, biasanya di perusahaan tempat kamu membelinya.';

  @override
  String get domainRecordsNone =>
      'Tidak ada yang perlu ditambahkan. Semuanya siap.';

  @override
  String get domainRecordOptional => 'Opsional';

  @override
  String domainRecordForward(String from, String to) {
    return 'Nyalakan penerusan dari $from ke $to di perusahaan tempat kamu membeli domainnya.';
  }

  @override
  String get domainRecordFound => 'Ditemukan';

  @override
  String get domainRecordNotFound => 'Belum ditemukan';

  @override
  String get domainCheckAgain => 'Periksa lagi';

  @override
  String get domainCheckTooSoon =>
      'Kami baru saja memeriksa. Coba lagi dalam beberapa detik.';

  @override
  String get domainChecksItself =>
      'Kami juga memeriksanya secara otomatis, jadi kamu bisa meninggalkan layar ini.';

  @override
  String get domainHistory => 'Riwayat';

  @override
  String get domainEventConnected => 'Terhubung';

  @override
  String get domainEventProved => 'Data ditemukan';

  @override
  String get domainEventLive => 'Aktif';

  @override
  String get domainEventNeedsDns => 'Masih menunggu DNS';

  @override
  String get domainEventFailed => 'Tidak bisa menyelesaikan penyiapan';

  @override
  String get domainEventDisconnected =>
      'Data dihapus, sehingga koneksi terputus';

  @override
  String get domainEventPaused => 'Dijeda: paketmu tidak mencakupnya';

  @override
  String get domainEventResumed => 'Kembali aktif';

  @override
  String get domainEventRemoved => 'Terputus';

  @override
  String get domainEventClaim => 'Diminta menunjukkan kepemilikan';

  @override
  String get domainEventClaimAttempt =>
      'Ruang kerja lain mencoba menghubungkannya';

  @override
  String get domainEventOverLimit => 'Melebihi batas paketmu';

  @override
  String get domainEventSuspended => 'Ditangguhkan';

  @override
  String get domainEventOther => 'Diperbarui';

  @override
  String domainDisconnectTitle(String name) {
    return 'Putuskan $name?';
  }

  @override
  String get domainDisconnectBody =>
      'Situsmu berhenti terbuka di domain ini. Kamu bisa menghapus data DNS-nya di perusahaan DNS-mu setelahnya.';

  @override
  String get domainsFind => 'Cari domain';

  @override
  String get domainsEmptyBuy =>
      'Beli domain untuk situsmu, atau hubungkan yang kamu miliki.';

  @override
  String get domainFindField => 'Nama atau beberapa kata';

  @override
  String get domainFindHint => 'tokoroti';

  @override
  String get domainFindHelp =>
      'Harga berlaku per tahun dan belum termasuk pajak.';

  @override
  String get domainFindNone => 'Tidak ada nama yang ditemukan. Coba kata lain.';

  @override
  String get domainFindNotOffered =>
      'Membeli domain tidak tersedia di aplikasi ini. Kamu masih bisa menghubungkan domain yang kamu miliki.';

  @override
  String domainPricePerYear(String price) {
    return '$price setahun ditambah pajak';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Diperpanjang pada $price';
  }

  @override
  String get domainReasonTaken => 'Sudah diambil';

  @override
  String get domainReasonPremium => 'Nama premium, tidak dijual di sini';

  @override
  String get domainReasonNotSold => 'Tidak dijual di sini';

  @override
  String get domainBuy => 'Beli';

  @override
  String domainBuyTitle(String name) {
    return 'Beli $name';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '$price untuk tahun pertama, lalu $renew setahun, ditambah pajak.';
  }

  @override
  String get domainBuyFinal =>
      'Pembelian bersifat final setelah domain didaftarkan. Jika tidak dapat didaftarkan, kamu mendapat pengembalian dana penuh.';

  @override
  String get domainBuyTerms => 'Saya menyetujui ketentuan domain';

  @override
  String get domainBuyReadTerms => 'Baca ketentuan';

  @override
  String get domainRenewAuto => 'Perpanjang otomatis';

  @override
  String get domainRenewAutoHelp =>
      'Menagih metode pembayaran tersimpanmu sekitar dua minggu sebelum kedaluwarsa.';

  @override
  String get domainBuySite => 'Situs yang ditampilkan';

  @override
  String get domainBuyPayInBrowser =>
      'Selesaikan pembayaran di browsermu. Layar ini akan mengikuti.';

  @override
  String get domainContactTitle => 'Detail Kontak';

  @override
  String get domainContactHelp =>
      'Orang atau bisnis yang mendaftarkan domain ini. Registrar menjaga kerahasiaan data ini.';

  @override
  String get domainContactFirstName => 'Nama depan';

  @override
  String get domainContactLastName => 'Nama belakang';

  @override
  String get domainContactOrganization => 'Bisnis (opsional)';

  @override
  String get domainContactAddress1 => 'Alamat';

  @override
  String get domainContactAddress2 => 'Baris alamat 2 (opsional)';

  @override
  String get domainContactCity => 'Kota';

  @override
  String get domainContactState => 'Provinsi atau wilayah';

  @override
  String get domainContactZip => 'Kode pos';

  @override
  String get domainContactCountry => 'Kode negara';

  @override
  String get domainContactCountryHint => 'US';

  @override
  String get domainContactPhone => 'Telepon';

  @override
  String get domainContactPhoneHint => '+1 415 555 0100';

  @override
  String get domainContactEmail => 'Email';

  @override
  String get domainContactRequired => 'Wajib';

  @override
  String get domainContactCountryInvalid =>
      'Gunakan kode dua huruf, seperti US';

  @override
  String get domainContactPhoneInvalid =>
      'Gunakan format internasional, seperti +1 415 555 0100';

  @override
  String get domainContactEmailInvalid => 'Masukkan email yang valid';

  @override
  String get domainContactSave => 'Simpan';

  @override
  String get domainContactSaved => 'Detail kontak disimpan.';

  @override
  String get domainContactChangeNote =>
      'Perubahan berlaku untuk setiap domain yang dibeli ruang kerja ini. Email baru harus dikonfirmasi lagi.';

  @override
  String get domainOrderTitle => 'Pesananmu';

  @override
  String get domainOrderWaitingPayment => 'Menunggu pembayaranmu di browser.';

  @override
  String domainOrderRegistering(String name) {
    return 'Mendaftarkan $name…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return 'Menyiapkan $name…';
  }

  @override
  String domainOrderRefunding(String name) {
    return 'Kami tidak dapat mendaftarkan $name. Memproses pengembalian danamu sekarang…';
  }

  @override
  String domainOrderRefunded(String name) {
    return 'Kami tidak dapat mendaftarkan $name, jadi kami mengembalikan danamu secara penuh.';
  }

  @override
  String get domainOrderAbandoned =>
      'Pembayaran ini tidak dibayar, jadi tidak ada biaya yang ditagih.';

  @override
  String get domainOrderNeedsAttention =>
      'Ada masalah dengan pesanan ini. Kami sudah diberitahu dan akan menanganinya.';

  @override
  String domainOrderDone(String name) {
    return '$name milikmu.';
  }

  @override
  String get domainOrderLeave =>
      'Kamu boleh meninggalkan layar ini. Kami akan memberi tahu saat sudah siap.';

  @override
  String get domainOrderBack => 'Kembali ke domain';

  @override
  String domainRenewsOn(String date) {
    return 'Diperpanjang pada $date';
  }

  @override
  String domainExpiresOn(String date) {
    return 'Kedaluwarsa pada $date';
  }

  @override
  String domainRenewPrice(String price) {
    return '$price setahun ditambah pajak';
  }

  @override
  String get domainRenewNow => 'Perpanjang sekarang';

  @override
  String get domainRenewPayInBrowser =>
      'Selesaikan pembayaran di browsermu. Tanggal baru muncul di sini setelah dibayar.';

  @override
  String get domainRenewCharged =>
      'Diperpanjang. Tanggal baru muncul di sini sebentar lagi.';

  @override
  String get domainRegistration => 'Pendaftaran';

  @override
  String domainExpired(String date) {
    return 'Kedaluwarsa pada $date. Perpanjang dalam 25 hari sejak tanggal tersebut untuk mempertahankannya.';
  }

  @override
  String get domainLapsed =>
      'Domain ini sudah kedaluwarsa. Hubungi dukungan untuk menanyakan pemulihannya; itu tidak dijamin.';

  @override
  String get domainSuspendedLine =>
      'Domain ini ditangguhkan. Hubungi dukungan untuk mengetahui alasannya.';

  @override
  String get domainVerifyTitle => 'Konfirmasi email pendaftar';

  @override
  String get domainVerifyBody =>
      'Registrar mengirim email ke alamat pendaftar. Buka dan konfirmasi, atau domain berhenti bekerja.';

  @override
  String get domainVerifySendAgain => 'Kirim lagi';

  @override
  String get domainVerifySent => 'Terkirim. Periksa kotak masuk pendaftar.';

  @override
  String get domainDnsRecords => 'Data DNS';

  @override
  String get domainDnsRecordsHelp => 'Email, subdomain, dan pemeriksaan situs';

  @override
  String get domainMoveOut => 'Pindah ke registrar lain';

  @override
  String domainMoveOutAfter(String date) {
    return 'Dapat pindah setelah $date';
  }

  @override
  String get domainMoveOutHelp => 'Dapatkan kode transfer untuk registrar lain';

  @override
  String domainMoveOutTitle(String name) {
    return 'Pindahkan $name?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'Ini membuka kunci domain dan menampilkan kode transfernya satu kali. Ketik $name untuk mengonfirmasi.';
  }

  @override
  String get domainMoveOutConfirm => 'Dapatkan kode transfer';

  @override
  String domainMoveOutLocked(String date) {
    return 'Dapat pindah setelah $date.';
  }

  @override
  String get domainTransferCodeTitle => 'Kode transfer';

  @override
  String get domainTransferCodeBody =>
      'Berikan kode ini ke registrar baru. Ini hanya ditampilkan kali ini saja, jadi salin sekarang.';

  @override
  String get domainTransferCode => 'Kode';

  @override
  String get domainUnlocked => 'Kunci dibuka untuk pemindahan';

  @override
  String get domainLockAgain => 'Kunci lagi';

  @override
  String get domainLocked => 'Dikunci kembali.';

  @override
  String get domainReauthTitle => 'Masuk lagi';

  @override
  String get domainReauthSendCode => 'Kirimi saya kode lewat email';

  @override
  String domainReauthCodeSent(String email) {
    return 'Kami mengirim kode ke $email.';
  }

  @override
  String get domainReauthCode => 'Kode dari email';

  @override
  String get domainReauthSignIn => 'Masuk';

  @override
  String get domainReauthSignOut =>
      'Keluar lalu masuk lagi, kemudian coba sekali lagi.';

  @override
  String get dnsRecordsEmpty => 'Belum ada data DNS.';

  @override
  String get dnsRecordAdd => 'Tambah data';

  @override
  String get dnsRecordEdit => 'Edit data';

  @override
  String get dnsRecordManaged => 'Dipakai oleh situs Casama-mu';

  @override
  String get dnsRecordType => 'Jenis';

  @override
  String get dnsRecordHost => 'Nama';

  @override
  String dnsRecordHostHelp(String name) {
    return 'Biarkan kosong untuk $name itu sendiri, atau ketik www, shop…';
  }

  @override
  String get dnsRecordAnswer => 'Nilai';

  @override
  String get dnsRecordTtl => 'TTL (detik)';

  @override
  String get dnsRecordPriority => 'Prioritas';

  @override
  String get dnsRecordSave => 'Simpan';

  @override
  String get dnsRecordDeleteTitle => 'Hapus data ini?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => '300 detik atau lebih';

  @override
  String get dnsRecordAnswerRequired => 'Wajib';

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
  String get deleteAccountDomains => 'Domain yang dibeli di ruang kerjamu';

  @override
  String get deleteAccountDomainsBody =>
      'Domain ini tetap terdaftar hingga kedaluwarsa. Domain tidak akan diperpanjang otomatis, dan situsnya berhenti online.';

  @override
  String get whatsNew010Sites =>
      'Pasang halaman di web pada alamatnya sendiri, dan gunakan domainmu sendiri untuk itu.';

  @override
  String get inAppAlertOpen => 'Buka';

  @override
  String get pushPrefsTitle => 'Notifikasi';

  @override
  String get pushPrefsHelp =>
      'Pilih apa yang menggetarkan perangkatmu. Semuanya tetap masuk ke Kotak masuk.';

  @override
  String get pushAllOn => 'Semua aktif';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Balasan nonaktif',
      'needsYou': 'Perlu kamu nonaktif',
      'routines': 'Rutinitas dan ringkasan nonaktif',
      'suggestions': 'Saran dan sapaan nonaktif',
      'other': 'Akun nonaktif',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return '$count jenis nonaktif';
  }

  @override
  String get pushReplies => 'Balasan';

  @override
  String get pushRepliesHelp =>
      'Saat bot menjawab sesuatu yang kamu tanyakan, jika kamu sudah keluar dari chat.';

  @override
  String get pushNeedsYou => 'Perlu kamu';

  @override
  String get pushNeedsYouHelp =>
      'Persetujuan, kata sandi, dan pengambilalihan yang ditunggu botmu.';

  @override
  String get pushNeedsYouOffWarning =>
      'Nonaktif: botmu akan menunggu hingga kamu membuka aplikasi.';

  @override
  String get pushRoutines => 'Rutinitas dan ringkasan';

  @override
  String get pushRoutinesHelp => 'Hasil rutinitas dan ringkasan pagimu.';

  @override
  String get pushSuggestions => 'Saran dan sapaan';

  @override
  String get pushSuggestionsHelp =>
      'Hal-hal yang ditawarkan botmu untuk dikerjakan bagimu.';

  @override
  String get pushAccount => 'Akun';

  @override
  String get pushAccountHelp => 'Kredit hampir habis, proyek, dan servermu.';

  @override
  String get pushHideReplyText => 'Sembunyikan teks balasan';

  @override
  String get pushHideReplyTextHelp =>
      'Notifikasi memberi tahu bot sudah membalas, tanpa kata-katanya.';

  @override
  String get reactToMessage => 'Beri reaksi';

  @override
  String get moreReactions => 'Reaksi lainnya';

  @override
  String get reactionsTitle => 'Reaksi';

  @override
  String get reactionsAll => 'Semua';

  @override
  String get reactionsYou => 'Kamu';

  @override
  String get reactionsTapToRemove => 'Ketuk untuk menghapus';

  @override
  String get reactionsNone => 'Belum ada reaksi.';

  @override
  String get reactionsLoadFailed => 'Tidak bisa memuat siapa yang bereaksi.';

  @override
  String get searchEmoji => 'Cari emoji';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reaksi',
      one: '1 reaksi',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reaksi',
      one: '1 reaksi',
    );
    return '$emoji, $_temp0, termasuk milikmu';
  }

  @override
  String reactionQuick(String emoji) {
    return 'Beri reaksi $emoji';
  }

  @override
  String reactionRemove(String emoji) {
    return 'Hapus reaksi $emoji milikmu';
  }

  @override
  String get packsShelfTitle => 'Bundel';

  @override
  String get packsShelfHelp =>
      'Bot, keahlian, dan rutinitas yang bekerja bersama, ditambahkan sekaligus.';

  @override
  String get packReviewed => 'Ditinjau';

  @override
  String get packNotReviewed => 'Belum ditinjau oleh Casama';

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
      other: '$count keahlian',
      one: '1 keahlian',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count rutinitas',
      one: '1 rutinitas',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aplikasi',
      one: '1 aplikasi',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gaya',
      one: '1 gaya',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count alat',
      one: '1 alat',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count item',
      one: '1 item',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Set awal';

  @override
  String get packAddFromLink => 'Tambahkan bundel dari tautan';

  @override
  String get packAddFromLinkHelp =>
      'Tempel tautan GitHub ke sebuah bundel dan lihat dulu apa yang ditambahkannya.';

  @override
  String get packAddFromFile => 'Tambahkan dari file';

  @override
  String get packAddFromFileHelp => 'Pilih file .zip bundel.';

  @override
  String get packLinkLabel => 'Tautan GitHub';

  @override
  String get packFileUnreadable => 'File itu bukan .zip bundel.';

  @override
  String get packFileTooBig => 'File itu terlalu besar untuk sebuah bundel.';

  @override
  String packSource(String where, String commit) {
    return '$where di $commit';
  }

  @override
  String get packFromFile => 'Dari file';

  @override
  String get packFromShare => 'Dibagikan denganmu';

  @override
  String get packAlreadyHere => 'Ruang kerja ini sudah memiliki bundel ini.';

  @override
  String get packOpenInstalled => 'Lihat bundel terpasang';

  @override
  String get packAdd => 'Tambahkan bundel';

  @override
  String packWizardTitle(String name) {
    return 'Tambahkan $name';
  }

  @override
  String get packWhatsInside => 'Isinya';

  @override
  String get packWhatsInsideHelp =>
      'Hilangkan centang pada apa pun yang tidak kamu inginkan.';

  @override
  String get packSectionBots => 'Bot';

  @override
  String get packSectionSkills => 'Keahlian';

  @override
  String get packSectionRoutines => 'Rutinitas';

  @override
  String get packSectionApps => 'Aplikasi';

  @override
  String get packSectionLooks => 'Gaya';

  @override
  String get packSectionIncludes => 'Dari galeri';

  @override
  String get packSectionTools => 'Alat';

  @override
  String get packSkillRunsScripts => 'Menjalankan skrip di komputer bot';

  @override
  String get packSkillForWorkspace => 'Untuk seluruh ruang kerja';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Berjalan sekitar $count kali seminggu',
      one: 'Berjalan sekitar seminggu sekali',
      zero: 'Berjalan sesekali',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Berbicara dengan $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Terhubung ke $url';
  }

  @override
  String get packIncludeMissing => 'Tidak ditemukan di galeri';

  @override
  String get packLookHelp =>
      'Kamu dapat memakainya di perangkat ini setelah ditambahkan.';

  @override
  String get packNothingTicked =>
      'Centang minimal satu item untuk ditambahkan.';

  @override
  String get packQuestions => 'Beberapa pertanyaan';

  @override
  String get packQuestionsHelp =>
      'Bundel ini mengisikan jawaban tersebut ke bot dan rutinitasnya.';

  @override
  String get packSecretsTitle => 'Kunci dan pengaturan';

  @override
  String get packSecretsHelp =>
      'Alat dalam bundel ini membutuhkannya agar berfungsi.';

  @override
  String get packReachTitle => 'Yang dapat dijangkaunya';

  @override
  String get packReachHelp =>
      'Diperiksa oleh Casama dari file bundel tersebut.';

  @override
  String get packReachRunsCode => 'Menjalankan kode';

  @override
  String get packReachComputer => 'Menggunakan komputer bot';

  @override
  String packReachHosts(String hosts) {
    return 'Berbicara dengan $hosts';
  }

  @override
  String get packReachNoHosts => 'Tidak berbicara dengan situs lain';

  @override
  String packReachSecrets(String names) {
    return 'Menggunakan kunci: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sekitar $count eksekusi terjadwal seminggu',
      one: 'Sekitar 1 eksekusi terjadwal seminggu',
      zero: 'Tidak ada eksekusi terjadwal',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama belum meninjau bundel ini. Tambahkan hanya jika kamu memercayai asalnya. Rutinitasnya dimulai dalam keadaan mati.';

  @override
  String get packPickBotTitle => 'Masuk ke bot mana?';

  @override
  String get packPickBotHelp =>
      'Bundel ini tidak membawa bot. Pilih satu bot untuk rutinitas dan alatnya.';

  @override
  String packDoneTitle(String name) {
    return '$name sudah ditambahkan';
  }

  @override
  String get packDoneHelp => 'Ini yang ditambahkannya.';

  @override
  String get packPendingHelp =>
      'Kami sudah meminta persetujuan admin. Bundel ditambahkan setelah disetujui.';

  @override
  String get packStatusInstalled => 'Ditambahkan';

  @override
  String get packStatusPending => 'Menunggu admin';

  @override
  String get packStatusSkipped => 'Dilewati';

  @override
  String get packStatusFailed => 'Tidak berhasil';

  @override
  String get packStatusDevice => 'Di perangkat ini';

  @override
  String get packConnectTitle => 'Hubungkan aplikasinya';

  @override
  String get packConnectHelp =>
      'Botnya bekerja maksimal setelah ini terhubung.';

  @override
  String get packLooksTitle => 'Pakai gaya di perangkat ini?';

  @override
  String get packUseLook => 'Pakai';

  @override
  String get packLookInUse => 'Sedang dipakai';

  @override
  String get packInstalledTitle => 'Bundel itu sudah ada di sini';

  @override
  String get packsInstalledTitle => 'Bundel terpasang';

  @override
  String get packsInstalledRow =>
      'Bundel yang ditambahkan ruang kerja ini, beserta pembaruan';

  @override
  String get packsInstalledEmpty =>
      'Belum ada bundel. Temukan satu di rak Bundel, atau tambahkan dari tautan.';

  @override
  String get packEditedBadge => 'Diedit olehmu';

  @override
  String get packRemove => 'Hapus';

  @override
  String get packUpToDate => 'Bundel ini sudah versi terbaru.';

  @override
  String get packCantCheck =>
      'Bundel ini berasal dari file atau tautan sehingga tidak bisa memeriksa pembaruan.';

  @override
  String packUpdateTitle(String name) {
    return 'Perbarui $name';
  }

  @override
  String packDiffAdded(String names) {
    return 'Baru: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Dihapus: $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Diubah: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'Situs baru yang dihubungi: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'Kunci baru yang dibutuhkan: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'Jadwal baru: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Eksekusi terjadwal seminggu: $from → $to';
  }

  @override
  String get packDiffNone => 'Tidak ada perubahan yang terasa.';

  @override
  String get packEditedTitle => 'Hal yang kamu ubah';

  @override
  String get packEditedHelp =>
      'Versimu tetap dipertahankan kecuali kamu menggantinya.';

  @override
  String get packTakeTheirs => 'Gunakan versi bundel';

  @override
  String get packReachGrewTitle => 'Jangkauannya bertambah luas';

  @override
  String get packReachGrewHelp =>
      'Versi baru dapat menjangkau lebih banyak daripada yang kamu miliki.';

  @override
  String get packReachConfirm =>
      'Saya sudah memeriksa apa saja yang bisa dijangkaunya sekarang';

  @override
  String packUpdated(String name) {
    return '$name diperbarui.';
  }

  @override
  String packRemoveTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get packRemoveBody =>
      'Alat dan kuncinya dihapus, begitu juga keahlian dan rutinitas yang tidak kamu ubah. Koneksi aplikasi tetap dipertahankan.';

  @override
  String get packRemoveBots => 'Hapus juga bot yang dibuat oleh bundel ini';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bundel dihapus. $count item dipertahankan karena kamu mengubahnya.',
      one: 'Bundel dihapus. 1 item dipertahankan karena kamu mengubahnya.',
      zero: 'Bundel dihapus.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Bagikan sebagai bundel';

  @override
  String get sharePackRow => 'Satukan bot dan keahlian untuk orang lain';

  @override
  String get sharePackHelp =>
      'Kunci, chat, memori, Tentang kamu, dan pilihan model tidak pernah disertakan.';

  @override
  String get sharePackBots => 'Bot';

  @override
  String get sharePackBotsHelp =>
      'Pilih hingga 5. Masing-masing membawa instruksi, keahlian, dan rutinitasnya.';

  @override
  String get sharePackSkills => 'Keahlian ruang kerja';

  @override
  String get sharePackName => 'Nama';

  @override
  String get sharePackSummary => 'Satu baris penjelasannya';

  @override
  String get sharePackLook => 'Sertakan tema perangkat ini';

  @override
  String get sharePackCheck => 'Periksa dan bagikan';

  @override
  String get sharePackFindingsTitle => 'Beberapa baris tampak seperti kunci';

  @override
  String get sharePackFindingsHelp =>
      'Periksa ini sebelum berbagi. Kembali untuk memperbaikinya, atau bagikan jika aman.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, baris $line: $what';
  }

  @override
  String get sharePackGoBack => 'Kembali';

  @override
  String get sharePackAnyway => 'Bagikan saja';

  @override
  String get sharePackLinkTitle => 'Tautan bundelmu';

  @override
  String sharePackLinkHelp(String date) {
    return 'Siapa pun yang masuk ke Casama dapat membukanya hingga $date.';
  }

  @override
  String get sharePackShare => 'Bagikan';

  @override
  String get sharePackSaveFile => 'Simpan sebagai file';

  @override
  String get sharePackLinkCopied => 'Tautan disalin.';

  @override
  String get sharePackStop => 'Berhenti berbagi';

  @override
  String get sharePackStopped => 'Tautan tidak lagi berfungsi.';

  @override
  String pluginFromPack(String pack) {
    return 'Dari bundel $pack';
  }

  @override
  String get pluginFromPackHelp =>
      'Perbarui atau hapus bersama bundelnya, di Galeri → Bundel terpasang.';

  @override
  String get pluginSettings => 'Pengaturan';

  @override
  String get pluginEditSettings => 'Edit pengaturan';

  @override
  String get pluginSettingsSaved => 'Pengaturan disimpan.';

  @override
  String get galleryPolicyKeyHelp =>
      'Kamu juga bisa mengetik repositori (repo/pemilik:nama) atau bundel (pack/nama).';

  @override
  String galleryPolicyUseKey(String key) {
    return 'Tambahkan $key';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Bundel: $name';
  }

  @override
  String get reportPackShare => 'Laporkan bundel ini';

  @override
  String get appLock => 'Kunci aplikasi';

  @override
  String get appLockRow => 'Minta buka kunci Casama saat dibuka';

  @override
  String get appLockHelp =>
      'Casama memintamu membuka kunci saat aplikasi dibuka dan setelah lama ditinggalkan. Saat ini aktif, status masukmu disimpan di keychain perangkat ini.';

  @override
  String get appLockSwitch => 'Kunci Casama';

  @override
  String get appLockLocked => 'Casama terkunci';

  @override
  String get appLockUnlock => 'Buka kunci';

  @override
  String get appLockUnlockWithPasskey => 'Buka kunci dengan kunci sandi';

  @override
  String get appLockUnlockReason => 'Buka kunci Casama';

  @override
  String get appLockTurnOnReason => 'Nyalakan kunci aplikasi';

  @override
  String get appLockConfirmReason => 'Konfirmasi bahwa ini kamu';

  @override
  String get appLockConfirmTitle => 'Konfirmasi bahwa ini kamu';

  @override
  String get approvalConfirmTitle => 'Allow This?';

  @override
  String get approvalConfirmBody =>
      'This is a high-risk request. Allow the bot to go ahead?';

  @override
  String get approvalConfirmAllow => 'Allow';

  @override
  String appLockUnlockWith(String method) {
    return 'Gunakan $method.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID, atau kode sandi';

  @override
  String get appLockDeviceAndroid => 'sidik jari, wajah, atau kunci layar';

  @override
  String get appLockDeviceMac => 'Touch ID atau kata sandi Mac-mu';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'kunci layar perangkatmu';

  @override
  String appLockMethodDevice(String method) {
    return 'Terbuka dengan $method';
  }

  @override
  String get appLockMethodPin => 'Terbuka dengan PIN 6 digit';

  @override
  String get appLockMethodPasskey => 'Terbuka dengan kunci sandi';

  @override
  String get appLockPinHint => 'Masukkan PIN-mu';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'PIN salah. Sisa $count percobaan.',
      one: 'PIN salah. Sisa 1 percobaan.',
      zero: 'PIN salah.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Terlalu banyak PIN salah. Keluar, lalu masuk lagi untuk membuka Casama.';

  @override
  String get appLockFailed => 'Tidak berhasil. Coba lagi.';

  @override
  String get appLockUnavailable =>
      'Perangkat ini tidak bisa membuka kunci Casama saat ini. Keluar, lalu masuk lagi untuk kembali masuk.';

  @override
  String get appLockSignOutConfirm =>
      'Keluar akan mematikan kunci aplikasi di perangkat ini. Masuk lagi untuk membuka Casama.';

  @override
  String get appLockCallRinging =>
      'Ada panggilan berdering. Buka kunci untuk menjawabnya.';

  @override
  String get appLockRequiredTitle => 'Nyalakan kunci aplikasi';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace mewajibkan kunci aplikasi di setiap perangkat yang membuka Casama.';
  }

  @override
  String get appLockRequiredNoWay =>
      'Browser ini tidak bisa memakai kunci sandi dengan server ini, jadi tidak bisa mengunci Casama. Buka Casama di aplikasi pada ponsel atau komputermu.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'Aktif. Diwajibkan oleh $workspace';
  }

  @override
  String get appLockTurnOn => 'Nyalakan';

  @override
  String get appLockTurnedOn => 'Kunci aplikasi aktif';

  @override
  String get appLockNoWayHere =>
      'Browser ini tidak bisa memakai kunci sandi dengan server ini, jadi Casama tidak bisa dikunci di sini.';

  @override
  String get appLockNotChecked => 'Tidak bisa memastikan ini kamu.';

  @override
  String get appLockPinSetupTitle => 'Pilih PIN';

  @override
  String get appLockPinAgainTitle => 'Masukkan PIN lagi';

  @override
  String get appLockPinSetupBody =>
      '6 digit. Kamu akan memasukkannya untuk membuka Casama.';

  @override
  String get appLockPinNext => 'Lanjutkan';

  @override
  String get appLockPinMismatch => 'PIN tidak cocok. Pilih lagi.';

  @override
  String get appLockPinNotSaved => 'Tidak bisa menyimpan PIN di perangkat ini.';

  @override
  String get appLockPinChanged => 'PIN diubah';

  @override
  String get appLockChangePin => 'Ubah PIN';

  @override
  String get appLockAfter => 'Kunci setelah';

  @override
  String get appLockAfterHelp =>
      'Waktu di latar belakang, diminimalkan, atau di balik aplikasi lain di komputer.';

  @override
  String get appLockAfterImmediately => 'Langsung';

  @override
  String get appLockAfterOneMinute => '1 menit';

  @override
  String get appLockAfterFiveMinutes => '5 menit';

  @override
  String get appLockAfterFifteenMinutes => '15 menit';

  @override
  String get appLockAfterOneHour => '1 jam';

  @override
  String get appLockBlockScreenshots => 'Blokir tangkapan layar';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Tangkapan layar, rekaman layar, dan berbagi layar tidak akan menampilkan apa pun dari Casama.';

  @override
  String get appLockLockNow => 'Kunci sekarang';

  @override
  String get appLockPrivacySection => 'Privasi lainnya';

  @override
  String get appLockAskBeforeRisky => 'Konfirmasi tindakan berisiko';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Buka kunci lagi sebelum menghapus akunmu, membuat kunci, mengubah penagihan, mengekspor data, menyetujui permintaan berisiko tinggi, dan mengambil alih komputer.';

  @override
  String get requireAppLock => 'Wajibkan kunci aplikasi';

  @override
  String get requireAppLockHelp =>
      'Anggota harus mengunci Casama di setiap perangkat sebelum dibuka. Di web, itu membutuhkan kunci sandi.';

  @override
  String get requireAppLockOwnFirst =>
      'Nyalakan kunci aplikasi di perangkat ini terlebih dahulu.';

  @override
  String get permLocation => 'Lokasi';

  @override
  String get permLocationAlways => 'Lokasi di latar belakang';

  @override
  String get permCamera => 'Kamera';

  @override
  String get permMicrophone => 'Mikrofon';

  @override
  String get permSpeech => 'Pengenalan suara';

  @override
  String get permPhotos => 'Foto';

  @override
  String get permContacts => 'Kontak';

  @override
  String get permCalendar => 'Kalender';

  @override
  String get permHealth => 'Kesehatan';

  @override
  String get permNotifications => 'Notifikasi';

  @override
  String get permNotificationAccess => 'Akses notifikasi';

  @override
  String get permAccessibility => 'Aksesibilitas';

  @override
  String get permScreenRecording => 'Perekaman Layar';

  @override
  String get permAutomation => 'Automasi';

  @override
  String get permFullDisk => 'Akses Disk Penuh';

  @override
  String get permSharedFolders => 'Folder bersama';

  @override
  String get permLocalTools => 'Alat lokal';

  @override
  String get cardPermissions => 'Izin';

  @override
  String permissionsTitle(String device) {
    return 'Nyalakan ini untuk $device';
  }

  @override
  String get permStateOn => 'Aktif';

  @override
  String get permStateOff => 'Nonaktif';

  @override
  String get permStateNotAsked => 'Belum ditanyakan';

  @override
  String get permStateLimited => 'Terbatas';

  @override
  String get permStateUnknown => 'Tidak diketahui';

  @override
  String get permStateUnavailable => 'Tidak tersedia di perangkat ini';

  @override
  String get permStateUpdate => 'Perbarui Casama untuk menyalakan ini di sini';

  @override
  String get permTurnOn => 'Nyalakan';

  @override
  String get permOpenSettings => 'Buka pengaturan';

  @override
  String get permOpenHealth => 'Buka Kesehatan';

  @override
  String get permHealthIosHow =>
      'Di Kesehatan, ketuk fotomu, lalu Aplikasi, lalu Casama, dan nyalakan apa yang boleh dibaca botmu.';

  @override
  String get permChoose => 'Pilih';

  @override
  String get permRestart => 'Mulai ulang Casama';

  @override
  String get permRestartToFinish => 'Mulai ulang Casama untuk menyelesaikan';

  @override
  String permOpenedOn(String device) {
    return 'Dibuka di $device';
  }

  @override
  String permSentTo(String device) {
    return 'Dikirim ke $device: ketuk notifikasinya di sana';
  }

  @override
  String permOffline(String device) {
    return '$device sedang offline';
  }

  @override
  String permRestarting(String device) {
    return 'Memulai ulang Casama di $device';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Hanya pemilik $device yang bisa menyalakan ini';
  }

  @override
  String get permNotNowLine => 'Tidak sekarang';

  @override
  String get permContinue => 'Lanjutkan';

  @override
  String get permContinueMessage => 'Izinnya sudah aktif, silakan lanjut.';

  @override
  String get permContinuedLine => 'Dinyalakan';

  @override
  String get permissionsScreenTitle => 'Izin';

  @override
  String get permissionsScreenHelp =>
      'Yang boleh dipakai bot di perangkat ini. Tidak ada yang diminta sebelum kamu mengetuk.';

  @override
  String get permissionsRowHelp =>
      'Lokasi, layar, mikrofon, dan lainnya di perangkat ini';

  @override
  String permOtherDevice(String device) {
    return 'Ini untuk $device. Buka Casama di sana untuk menyalakannya.';
  }

  @override
  String get permAnotherDevice => 'perangkat lain';

  @override
  String get permissionsNone =>
      'Tidak ada yang perlu dinyalakan di perangkat ini.';

  @override
  String get widgetNeedsYou => 'Perlu kamu';

  @override
  String get widgetAllClear => 'Semua beres';

  @override
  String get widgetAllow => 'Izinkan';

  @override
  String get widgetDeny => 'Tolak';

  @override
  String get widgetReview => 'Tinjau';

  @override
  String get widgetOpen => 'Buka';

  @override
  String get widgetDoIt => 'Lakukan';

  @override
  String get widgetRunNow => 'Jalankan sekarang';

  @override
  String get widgetStarted => 'Dimulai';

  @override
  String get widgetStop => 'Hentikan';

  @override
  String get widgetAsk => 'Tanya';

  @override
  String widgetAskBot(String bot) {
    return 'Tanya $bot';
  }

  @override
  String get widgetTalk => 'Bicara';

  @override
  String get widgetTry => 'Coba';

  @override
  String get widgetUpNext => 'Berikutnya';

  @override
  String get widgetNoRoutines => 'Belum ada rutinitas';

  @override
  String get widgetWorking => 'Bekerja';

  @override
  String get widgetWaiting => 'Menunggumu';

  @override
  String get widgetIdle => 'Siaga';

  @override
  String widgetRepliedAt(String time) {
    return 'Dibalas $time';
  }

  @override
  String get widgetBrief => 'Ringkasan';

  @override
  String widgetBriefAt(String time) {
    return 'Ringkasan pukul $time';
  }

  @override
  String get widgetNoBrief => 'Belum ada ringkasan';

  @override
  String get widgetToday => 'Hari ini';

  @override
  String get widgetCredits => 'Kredit';

  @override
  String widgetCreditsLeft(String amount) {
    return 'Tersisa $amount';
  }

  @override
  String widgetSpentToday(String amount) {
    return '$amount hari ini';
  }

  @override
  String widgetUsedPct(String n) {
    return '$n% terpakai';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Diulang $time';
  }

  @override
  String get widgetFinished => 'Selesai';

  @override
  String get widgetLibrary => 'Pustaka';

  @override
  String get widgetNoCreations => 'Belum ada yang dibuat';

  @override
  String get widgetTasks => 'Tugas';

  @override
  String get widgetTodo => 'Belum dikerjakan';

  @override
  String get widgetInProgress => 'Sedang dikerjakan';

  @override
  String get widgetInReview => 'Ditinjau';

  @override
  String get widgetBlocked => 'Terhambat';

  @override
  String get widgetSignIn => 'Buka Casama untuk masuk';

  @override
  String get widgetNoBots => 'Temui bot pertamamu';

  @override
  String widgetAsOf(String time) {
    return 'per $time';
  }

  @override
  String get widgetUpdateServer =>
      'Perbarui server Casama-mu untuk memakai widget ini';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot perlu persetujuanmu';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot menyarankan';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot memintamu mengambil alih';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Ringkasan berikutnya $time';
  }

  @override
  String get widgetNothingNext => 'Tidak ada jadwal';

  @override
  String get widgetsTitle => 'Widget';

  @override
  String get widgetsRow => 'Botmu di Layar Utama dan Layar Terkunci';

  @override
  String get widgetsIntro =>
      'Widget menampilkan apa yang sedang dikerjakan botmu dan yang menunggumu, tanpa membuka Casama.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Rutinitas';

  @override
  String get widgetDescNeedsYou => 'Lihat bot mana yang sedang menunggumu';

  @override
  String get widgetDescBot => 'Lihat yang sedang dikerjakan satu bot';

  @override
  String get widgetDescAsk => 'Tanya atau bicara dengan bot dalam satu ketukan';

  @override
  String get widgetDescRoutines =>
      'Lihat jadwal berikutnya dan jalankan sekarang';

  @override
  String get widgetDescToday => 'Lihat harimu dalam satu widget besar';

  @override
  String get widgetDescBrief => 'Baca ringkasan pagimu';

  @override
  String get widgetDescLibrary => 'Lihat yang baru dibuat botmu';

  @override
  String get widgetDescTasks => 'Lihat status papan tugas';

  @override
  String get widgetDescCredits => 'Pantau kreditmu';

  @override
  String get widgetsAddToHome => 'Tambahkan ke Layar Utama';

  @override
  String get widgetsPinUnsupported =>
      'Peluncurmu tidak bisa menambahkan widget dari sini. Sentuh dan tahan ruang kosong di Layar Utama, ketuk Widget, lalu pilih Casama.';

  @override
  String get widgetsHowToAdd => 'Cara menambahkan';

  @override
  String get widgetsHowToIos =>
      'Sentuh dan tahan area kosong di Layar Utama, ketuk Edit, lalu Tambah Widget, dan pilih Casama.';

  @override
  String get widgetsHowToMac =>
      'Klik tanggal dan waktu di bar menu, lalu Edit Widget, dan pilih Casama. Atau klik kanan desktop lalu pilih Edit Widget.';

  @override
  String get widgetsLockScreen => 'Layar Terkunci dan kontrol';

  @override
  String get widgetsLockScreenHelp =>
      'Sentuh dan tahan Layar Terkunci, ketuk Sesuaikan, lalu Layar Terkunci, dan ketuk ruang di bawah jam untuk menambah Perlu kamu, Berikutnya, Bot, atau Kredit. Permintaan tetap tersembunyi sampai kamu membuka kunci.';

  @override
  String get widgetsControlsHelp =>
      'Buka Pusat Kontrol, sentuh dan tahan, ketuk Tambah Kontrol, lalu pilih Tanya Casama, Bicara dengan bot, atau Jalankan rutinitas. Kontrol ini juga muat di sudut Layar Terkunci dan tombol Tindakan.';

  @override
  String get widgetsShowDetails => 'Tampilkan detail di widget';

  @override
  String get widgetsShowDetailsHelp =>
      'Saat kunci aplikasi aktif, widget hanya menampilkan angka dan nama bot, dan tombolnya membuka Casama. Nyalakan ini untuk menampilkan permintaan, pesan, dan nama rutinitas juga.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Hanya berpengaruh saat kunci aplikasi aktif. Tanpanya, widget selalu menampilkan detail.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace mewajibkan kunci aplikasi, jadi widget menyembunyikan detail.';
  }

  @override
  String get widgetsPinBot => 'Sematkan bot ke Layar Utama';

  @override
  String get widgetsPinBotHelp =>
      'Menaruh bot di Layar Utama sebagai ikonnya sendiri. Ketuk untuk chat.';

  @override
  String get widgetsPin => 'Sematkan';

  @override
  String get widgetNudgeNeedsYou =>
      'Jawab permintaan dari Layar Utama dengan widget Perlu kamu.';

  @override
  String get widgetNudgeRoutines =>
      'Jalankan rutinitas dari Layar Utama dengan widget Rutinitas.';

  @override
  String get widgetNameCanvas => 'Kanvas';

  @override
  String get widgetDescCanvas =>
      'Menampilkan apa yang ditaruh botmu di sana, seperti kutipan harian atau hitung mundur';

  @override
  String get canvasEmpty => 'Minta bot menaruh sesuatu di sini';

  @override
  String get canvasTry => 'Coba: pasang kutipan harian di Layar Terkunci saya';

  @override
  String get canvasAutomatic => 'Otomatis';

  @override
  String canvasIn(String time) {
    return '$time lagi';
  }

  @override
  String canvasSince(String time) {
    return '$time sejaknya';
  }

  @override
  String get canvasNow => 'Sekarang';

  @override
  String canvasLeft(String n) {
    return 'Sisa $n';
  }

  @override
  String get canvasLeftUnit => 'tersisa';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'hari',
      one: 'hari',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Widget';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot ingin menampilkan ini di widgetmu';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Begitu kamu menyetujui, $bot bisa mengubahnya tanpa bertanya. Kamu bisa menghentikannya kapan saja di Pengaturan, Widget.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot menaruh ini di widgetmu';
  }

  @override
  String get canvasShow => 'Tampilkan di widget saya';

  @override
  String get canvasShowing => 'Menampilkan di widgetmu';

  @override
  String canvasNotShown(String bot) {
    return 'Tidak ditampilkan. $bot bisa bertanya lagi di lain hari.';
  }

  @override
  String get canvasGone => 'Tidak lagi ada di widgetmu';

  @override
  String get canvasNotPlaced => 'Tambahkan widget Kanvas untuk melihatnya.';

  @override
  String get canvasHowToIos =>
      'Sentuh dan tahan Layar Utama atau Layar Terkunci, ketuk Edit, lalu Tambah Widget, dan pilih Casama, lalu Kanvas.';

  @override
  String get canvasHowToMac =>
      'Klik kanan desktop, pilih Edit Widget, lalu pilih Casama, kemudian Kanvas.';

  @override
  String get canvasHowToElsewhere =>
      'Tambahkan widget Kanvas Casama di ponsel atau Mac-mu untuk melihatnya di sana.';

  @override
  String get canvasAdded => 'Widget Kanvas ditambahkan';

  @override
  String get canvasLockScreen => 'Di Layar Terkunci';

  @override
  String get widgetsFromBots => 'Dari botmu';

  @override
  String get widgetsFromBotsEmpty =>
      'Belum ada. Minta sesuatu ke bot, misalnya \"Pasang kutipan harian di Layar Terkunci saya\".';

  @override
  String canvasSetAt(String time) {
    return 'Diatur $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Tampil di $devices';
  }

  @override
  String get canvasNoWidget => 'Belum ada widget Kanvas yang dipasang';

  @override
  String get canvasPausedLine => 'Dijeda';

  @override
  String get canvasWaitingLine => 'Menunggu persetujuanmu';

  @override
  String get canvasHideLocked => 'Sembunyikan saat ponsel terkunci';

  @override
  String get canvasPause => 'Jeda';

  @override
  String get canvasResume => 'Lanjutkan';

  @override
  String get canvasClear => 'Bersihkan';

  @override
  String canvasClearTitle(String name) {
    return 'Bersihkan $name?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'Tampilan ini dihapus dari widgetmu. $bot dapat menaruh sesuatu di sana lagi.';
  }

  @override
  String get canvasAllowedBots => 'Bot di widgetmu';

  @override
  String get canvasMayShow => 'Boleh menampilkan konten di widgetmu';

  @override
  String canvasStopTitle(String bot) {
    return 'Hentikan $bot?';
  }

  @override
  String canvasStopMessage(String bot) {
    return 'Apa yang ditampilkan $bot di widgetmu dibersihkan, dan ia harus bertanya lagi.';
  }

  @override
  String get canvasStop => 'Hentikan';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Ponsel Android';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Tampilkan';

  @override
  String get widgetLowRisk => 'Risiko rendah';

  @override
  String get widgetThisMonth => 'Bulan ini';

  @override
  String get watchNow => 'Sekarang';

  @override
  String get watchAsk => 'Tanya';

  @override
  String watchAskBot(String bot) {
    return 'Tanya $bot';
  }

  @override
  String get watchBots => 'Bot';

  @override
  String get watchUpNext => 'Berikutnya';

  @override
  String get watchBrief => 'Ringkasan';

  @override
  String get watchSettings => 'Pengaturan';

  @override
  String get watchChat => 'Chat';

  @override
  String get watchTalk => 'Bicara';

  @override
  String get watchCredits => 'Kredit';

  @override
  String get watchNeedsYou => 'Perlu kamu';

  @override
  String get watchNeedsYouOne => '1 perlu kamu';

  @override
  String watchNeedsYouMany(String count) {
    return '$count perlu kamu';
  }

  @override
  String get watchNeedsOk => 'Perlu persetujuanmu';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot perlu persetujuanmu';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot menyarankan';
  }

  @override
  String get watchTakeOver => 'Memintamu mengambil alih';

  @override
  String get watchAllClear => 'Semua beres';

  @override
  String get watchNothingWaiting => 'Tidak ada yang menunggu';

  @override
  String get watchAllow => 'Izinkan';

  @override
  String get watchDeny => 'Tolak';

  @override
  String get watchHoldToAllow => 'Tahan untuk izinkan';

  @override
  String get watchHoldHint => 'Izinkan ini? Ketuk dua kali untuk mengizinkan.';

  @override
  String get watchReview => 'Tinjau';

  @override
  String get watchReviewOnIphone => 'Tinjau di iPhone';

  @override
  String get watchReviewOnPhone => 'Tinjau di ponsel';

  @override
  String get watchWhyHighRisk => 'Risiko tinggi: jawab di ponselmu';

  @override
  String get watchWhyPayment => 'Pembayaran dijawab di ponselmu';

  @override
  String get watchWhySetting => 'Pengaturanmu menahan ini di ponselmu';

  @override
  String get watchWhyWorkspace => 'Ruang kerjamu menahan ini di ponselmu';

  @override
  String get watchWhyNotYours =>
      'Hanya pemulai chat ini yang boleh mengizinkannya';

  @override
  String get watchHighRisk => 'Risiko tinggi';

  @override
  String get watchMediumRisk => 'Risiko sedang';

  @override
  String get watchLowRisk => 'Risiko rendah';

  @override
  String get watchAllowed => 'Diizinkan';

  @override
  String get watchDenied => 'Ditolak';

  @override
  String get watchDone => 'Selesai';

  @override
  String get watchAlreadyAnswered => 'Sudah dijawab';

  @override
  String get watchLockToAllow =>
      'Atur kode sandi di jam tangan ini agar bisa mengizinkan darinya';

  @override
  String get watchDoIt => 'Lakukan';

  @override
  String get watchNotNow => 'Tidak sekarang';

  @override
  String get watchOpenOnIphone => 'Buka di iPhone';

  @override
  String get watchOpenOnPhone => 'Buka di ponsel';

  @override
  String get watchSentToPhone => 'Dikirim ke ponselmu';

  @override
  String get watchWorking => 'Bekerja';

  @override
  String watchIsWorking(String bot) {
    return '$bot sedang bekerja';
  }

  @override
  String get watchWaitingForYou => 'Menunggumu';

  @override
  String watchRepliedAt(String time) {
    return 'Dibalas $time';
  }

  @override
  String get watchIdle => 'Siaga';

  @override
  String get watchOff => 'Nonaktif';

  @override
  String watchStepCount(String count) {
    return 'Langkah $count';
  }

  @override
  String get watchStop => 'Hentikan';

  @override
  String get watchStopped => 'Dihentikan';

  @override
  String get watchFinished => 'Selesai';

  @override
  String get watchProblem => 'Berhenti karena masalah';

  @override
  String get watchCouldntFinish => 'Tidak bisa diselesaikan';

  @override
  String get watchListening => 'Mendengarkan…';

  @override
  String get watchTapToStop => 'Ketuk untuk berhenti';

  @override
  String get watchTypeInstead => 'Ketik saja';

  @override
  String get watchSending => 'Mengirim…';

  @override
  String get watchHeard => 'Terdengar';

  @override
  String get watchUndo => 'Urungkan';

  @override
  String get watchKeptOffline =>
      'Tersimpan. Akan dikirim saat kamu kembali online';

  @override
  String watchKeptOld(String time) {
    return 'Kirim yang kamu tanyakan pukul $time?';
  }

  @override
  String get watchSend => 'Kirim';

  @override
  String get watchDiscard => 'Buang';

  @override
  String get watchMicDenied =>
      'Izinkan mikrofon di Pengaturan untuk bertanya lewat suara';

  @override
  String get watchNoDictation =>
      'Server ini tidak memiliki layanan suara. Gunakan Ketik saja';

  @override
  String get watchDidntCatch => 'Kurang jelas. Coba lagi';

  @override
  String get watchReply => 'Balas';

  @override
  String get watchReadAloud => 'Bacakan lantang';

  @override
  String get watchStopReading => 'Berhenti membaca';

  @override
  String get watchContinuesOnIphone => 'Lanjut di iPhone';

  @override
  String get watchContinuesOnPhone => 'Lanjut di ponsel';

  @override
  String get watchReplyReady => 'Balasan siap';

  @override
  String get watchYou => 'Kamu';

  @override
  String get watchQuickYes => 'Ya';

  @override
  String get watchQuickNo => 'Tidak';

  @override
  String get watchQuickTellMore => 'Beri tahu lebih lanjut';

  @override
  String get watchQuickNotNow => 'Nanti';

  @override
  String get watchRunNow => 'Jalankan sekarang';

  @override
  String get watchStarted => 'Dimulai';

  @override
  String watchInMinutes(String minutes) {
    return 'dalam $minutes mnt';
  }

  @override
  String get watchNoRoutines => 'Belum ada rutinitas';

  @override
  String watchBriefAt(String time) {
    return 'Ringkasan pukul $time';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Ringkasan pukul $time besok';
  }

  @override
  String get watchNoBrief => 'Belum ada ringkasan diatur';

  @override
  String get watchNoBots => 'Belum ada bot. Buat satu di ponselmu';

  @override
  String get watchSigningIn => 'Sedang masuk';

  @override
  String watchSignedInAs(String name) {
    return 'Masuk sebagai $name';
  }

  @override
  String get watchOpenPhoneToFinishIphone =>
      'Buka Casama di iPhone-mu untuk menyelesaikan';

  @override
  String get watchOpenPhoneToFinish =>
      'Buka Casama di ponselmu untuk menyelesaikan';

  @override
  String get watchUseCode => 'Masuk dengan kode';

  @override
  String get watchCodeHelp =>
      'Ketik di Casama pada ponsel atau komputermu: Pengaturan → Jam Tangan';

  @override
  String get watchNewCode => 'Kode baru';

  @override
  String get watchSignedOut => 'Jam tangan ini sedang keluar';

  @override
  String get watchOpenToSignIn => 'Buka Casama untuk masuk';

  @override
  String watchAsOf(String time) {
    return 'per $time';
  }

  @override
  String get watchOffline => 'Offline';

  @override
  String get watchCouldntReach => 'Tidak bisa menjangkau Casama';

  @override
  String get watchTryAgain => 'Coba lagi';

  @override
  String get watchServerTooOld =>
      'Perbarui server Casama-mu untuk memakai jam tangan';

  @override
  String get watchOutOfCredits => 'Kredit habis';

  @override
  String get watchTalkOnPhone => 'Memulai panggilan di ponselmu';

  @override
  String get watchSignOut => 'Keluar dari jam tangan ini';

  @override
  String get watchHideDetails =>
      'Sembunyikan detail saat pergelangan tanganku turun';

  @override
  String get watchReadRepliesAloud => 'Bacakan balasan dengan suara';

  @override
  String get watchAskUses => 'Bot untuk Tanya';

  @override
  String get watchWorkspace => 'Ruang kerja';

  @override
  String get watchSignedInAsLabel => 'Masuk sebagai';

  @override
  String get watchCompNeedsYou => 'Perlu kamu';

  @override
  String get watchCompAsk => 'Tanya bot';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'Berikutnya';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou =>
      'Berapa banyak permintaan menunggu, dan yang pertama';

  @override
  String get watchCompDescAsk => 'Tanya bot lewat suara dalam satu ketukan';

  @override
  String get watchCompDescBot => 'Kondisi bot dan yang sedang dikerjakannya';

  @override
  String get watchCompDescUpNext => 'Rutinitas berikutnya dan kapan berjalan';

  @override
  String get watchCompDescCredits => 'Kredit terpakai periode ini';

  @override
  String get watchNeedYouShort => 'perlu kamu';

  @override
  String get watchControlAsk => 'Tanya Casama';

  @override
  String get watchControlTalk => 'Bicara dengan bot';

  @override
  String get watchControlRun => 'Jalankan rutinitas';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count perlu kamu. Pertama: $text';
  }

  @override
  String get watchPhoneTitle => 'Jam tangan';

  @override
  String get watchPhoneIntro =>
      'Jawab bot, tanya lewat suara, dan lihat siapa yang sedang bekerja, dari pergelangan tanganmu.';

  @override
  String get watchPhoneWatches => 'Jam tangan yang sudah masuk';

  @override
  String get watchPhoneNone =>
      'Belum ada jam tangan yang masuk. Buka Casama di jam tanganmu dan aplikasi akan masuk sendiri.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Terakhir dipakai $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Belum pernah dipakai';

  @override
  String get watchPhoneRemove => 'Hapus';

  @override
  String watchPhoneRemoveTitle(String name) {
    return 'Hapus $name?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'Jam tangan langsung keluar. Kamu bisa memasukkannya lagi nanti.';

  @override
  String get watchPhoneUseCode => 'Masukkan jam tangan dengan kode';

  @override
  String get watchPhoneCodeHint => 'Kode di jam tanganmu';

  @override
  String watchPhoneCodeAsk(String name) {
    return 'Masukkan $name?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'Perangkat ini akan masuk ke $workspace sebagai kamu. Hanya izinkan kode yang tampil di jam tanganmu sendiri.';
  }

  @override
  String get watchPhoneCodeAllow => 'Masukkan';

  @override
  String get watchPhoneCodeWrong =>
      'Kode itu tidak berfungsi. Periksa di jam tanganmu';

  @override
  String get watchPhoneCodeTaken =>
      'Jam tangan ini masih masuk ke akun lain. Hapus di sana melalui Pengaturan → Jam Tangan, lalu buat kode baru';

  @override
  String watchPhoneElsewhere(String workspace) {
    return 'Masuk ke $workspace';
  }

  @override
  String get watchPhoneElsewhereUnknown => 'Masuk ke ruang kerja lain';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name sudah masuk';
  }

  @override
  String get watchPhoneAllowTitle => 'Izinkan dari jam tangan';

  @override
  String get watchPhoneAllowMedium => 'Risiko rendah dan sedang';

  @override
  String get watchPhoneAllowMediumBody =>
      'Risiko rendah dengan satu ketukan, risiko sedang dengan menahan tombol. Risiko tinggi dan pembayaran selalu membutuhkan ponselmu.';

  @override
  String get watchPhoneAllowLow => 'Hanya risiko rendah';

  @override
  String get watchPhoneAllowNone => 'Tidak pernah';

  @override
  String get watchPhoneDetails => 'Tampilkan detail di jam tangan';

  @override
  String get watchPhoneDetailsBody =>
      'Nonaktif: jam tangan hanya menampilkan jumlah dan nama bot, bukan tulisan bot.';

  @override
  String get watchPhoneQuickReplies => 'Balasan cepat';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Jawaban singkat yang bisa kamu kirim dari notifikasi balasan. Maksimal enam.';

  @override
  String get watchPhoneQuickAdd => 'Tambah balasan cepat';

  @override
  String get watchPhoneQuickReset => 'Pakai balasan bawaan';

  @override
  String get watchPhoneHowTo => 'Tambahkan Casama ke wajah jammu';

  @override
  String get watchPhoneHowToApple =>
      'Sentuh dan tahan wajah jammu, ketuk Edit, lalu pilih Casama untuk komplikasi. Putar Digital Crown di wajah jam untuk menemukan Casama di Tumpukan Cerdas.';

  @override
  String get watchPhoneHowToWear =>
      'Sentuh dan tahan wajah jammu untuk menambah komplikasi Casama. Geser ke kiri dari wajah jam lalu ketuk + untuk menambah kartu Casama.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return 'Memasukkan $name…';
  }

  @override
  String get watchPhoneLockAsk => 'Masukkan jam tanganmu?';

  @override
  String get watchPhoneNudge =>
      'Casama ada di jam tanganmu juga. Jawab bot dari pergelangan tanganmu.';

  @override
  String get watchPhoneHandoffTitle => 'Dari jam tanganmu';

  @override
  String get watchPhoneRow => 'Botmu di Apple Watch atau jam Wear OS';

  @override
  String get watchPhoneAllowLowBody =>
      'Risiko rendah dalam satu ketukan. Semua lainnya membutuhkan ponselmu.';

  @override
  String get watchPhoneAllowNoneBody =>
      'Jam tangan hanya bisa menolak. Izinkan di ponselmu.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Dimatikan karena kunci aplikasi aktif, jadi jam tanganmu tidak menampilkan kata dari chatmu. Nyalakan untuk melihatnya.';

  @override
  String get watchPhoneQuickHint => 'Balasan singkat';

  @override
  String get watchPhoneQuickTooLong => 'Maksimal 40 karakter';

  @override
  String get watchPhoneQuickMoveUp => 'Naikkan';

  @override
  String get watchPhoneQuickMoveDown => 'Turunkan';

  @override
  String get watchPhoneQuickDelete => 'Hapus balasan ini';

  @override
  String get watchPhoneCodeBody =>
      'Di jam tanganmu, buka Casama lalu pilih Masuk dengan kode.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking =>
      'Siapa yang bekerja dan apa yang dikerjakannya';

  @override
  String get watchCompDescBrief => 'Ringkasan pagi ini';

  @override
  String get watchCodeWaiting => 'Menunggu kodenya…';

  @override
  String watchCodeA11y(String code) {
    return 'Kode masuk $code';
  }

  @override
  String get watchChooseBot => 'Pilih bot';

  @override
  String get watchChannelRequests => 'Permintaan';

  @override
  String get watchChannelReplies => 'Balasan';

  @override
  String get watchChannelRuns => 'Bot bekerja';

  @override
  String get watchChannelOther => 'Lainnya';

  @override
  String get watchOtherWorkspace =>
      'Ini ada di ruang kerja lain. Jawab di ponselmu';

  @override
  String get watchReplySent => 'Terkirim';

  @override
  String get watchReplyNotSent => 'Tidak bisa mengirim balasanmu';

  @override
  String watchAskDropped(String time) {
    return 'Tidak bisa mengirim yang kamu tanyakan pukul $time';
  }

  @override
  String get watchNeedsHttps =>
      'Jam tangan ini hanya bisa menjangkau servermu lewat https atau di jaringan rumahmu';

  @override
  String get watchSignIn => 'Masuk';

  @override
  String get watchNotOnWatch =>
      'Jam tangan ini tidak bisa menjawab yang satu ini. Buka di ponselmu';

  @override
  String watchMoreOnPhone(String count) {
    return '$count lagi di ponselmu';
  }

  @override
  String get watchShareCrashReports => 'Bagikan laporan kerusakan';

  @override
  String get showList => 'Tampilkan daftar';

  @override
  String get hideList => 'Sembunyikan daftar';

  @override
  String get panePickLibrary =>
      'Pilih sesuatu dari Pustaka untuk melihatnya di sini.';

  @override
  String get panePickSetting => 'Pilih pengaturan untuk melihatnya di sini.';

  @override
  String get trackpad => 'Trackpad';

  @override
  String get trackpadHint =>
      'Satu jari menggerakkan penunjuk, dua jari menggulir, satu ketukan mengeklik.';

  @override
  String get trackpadTakeControl => 'Ambil kendali untuk memakai trackpad.';

  @override
  String get foldScreenTitle => 'Layar lipat';

  @override
  String get foldRowHelp => 'Yang dilihat Casama dari layar perangkat ini';

  @override
  String get foldScreenHelp =>
      'Bagaimana perangkat ini dipegang dan di mana lipatannya, seperti yang dilihat Casama sekarang. Buka, tutup, atau lipat perangkat dan angkanya mengikuti. Salin jika tampilan layar tampak salah.';

  @override
  String get foldPose => 'Postur';

  @override
  String get foldWindow => 'Jendela';

  @override
  String get foldInsets => 'Area aman';

  @override
  String get foldStrip => 'Strip samping';

  @override
  String get foldFold => 'Lipatan';

  @override
  String get foldHinge => 'Engsel';

  @override
  String get foldSystemSays => 'Yang dilaporkan sistem';

  @override
  String get inviteGateLine =>
      'Untuk saat ini Casama Cloud hanya dengan undangan.';

  @override
  String get inviteGateSelfHost =>
      'Menjalankan Casama di servermu sendiri terbuka untuk semua orang.';

  @override
  String get joinTheWaitlist => 'Gabung daftar tunggu';

  @override
  String get iHaveAnInvite => 'Saya punya undangan';

  @override
  String get waitlistSubtitle =>
      'Kami memasukkan pengguna sedikit demi sedikit. Kamu akan menerima satu email saat giliranmu tiba.';

  @override
  String get waitlistNote =>
      'Tugas apa yang pertama ingin kamu berikan ke bot?';

  @override
  String get waitlistNoteHint => 'Opsional';

  @override
  String get waitlistSelfHosting =>
      'Saya menjalankan Casama di server saya sendiri';

  @override
  String get waitlistNewsletter =>
      'Kirimi saya juga email bulanan Casama (paling banyak sebulan sekali)';

  @override
  String get waitlistAppleRelay =>
      'Ini alamat pribadi yang dibuatkan Apple untukmu. Simpan jika kamu akan masuk dengan Apple; Apple meneruskan email kami ke kotak masukmu.';

  @override
  String get waitlistJoinedTitle => 'Kamu masuk dalam daftar.';

  @override
  String get waitlistJoinedBody =>
      'Kami memasukkan pengguna sedikit demi sedikit. Kamu akan menerima satu email saat giliranmu tiba, dan tidak ada yang lain kecuali kamu meminta email bulanan. Kenal seseorang yang memakai Casama? Undangan darinya langsung memasukkanmu.';

  @override
  String get waitlistJoinedCode => 'Punya kode undangan? Masukkan di sini.';

  @override
  String get waitlistJoinedSelfHost =>
      'Tidak mau menunggu? Casama bersifat open source. Jalankan di komputermu sendiri hari ini.';

  @override
  String get waitlistRunItYourself => 'Jalankan sendiri';

  @override
  String get inviteSubtitle =>
      'Masukkan kode undanganmu, atau tempel tautan undangannya.';

  @override
  String get inviteCodeLabel => 'Kode undangan';

  @override
  String get inviteNotFound =>
      'Kode itu tidak cocok dengan undangan mana pun. Periksa dan coba lagi.';

  @override
  String inviteFromName(String name) {
    return '$name mengundangmu ke Casama';
  }

  @override
  String get inviteFromFriend => 'Seorang teman mengundangmu ke Casama';

  @override
  String inviteFromCampaign(String label) {
    return 'Undanganmu: $label';
  }

  @override
  String get inviteFromCasama => 'Undanganmu ke Casama';

  @override
  String get inviteChooseSignIn =>
      'Sekarang pilih cara masukmu. Gunakan alamat yang kamu inginkan untuk akunmu.';

  @override
  String get inviteGoneHelp =>
      'Undangan ini sudah habis. Masukkan emailmu dan kamu akan masuk daftar tunggu di urutan depan.';

  @override
  String get inviteEmailHelp =>
      'Kami akan mengizinkan alamat ini masuk, lalu mengiriminya tautan masuk.';

  @override
  String inviteCheckInbox(String email) {
    return 'Kamu sudah masuk. Periksa $email untuk tautan masuk, atau ketik kodenya di sini.';
  }

  @override
  String get inviteWaitlistedTitle => 'Kamu ada di daftar tunggu';

  @override
  String get inviteWaitlisted =>
      'Undangan ini sudah habis, tapi kamu ada di urutan depan.';

  @override
  String get inviteUseEmailHere =>
      'Di perangkat ini, gunakan Lanjutkan dengan Email. Apple dan Google berfungsi dengan undangan di aplikasi iPhone, Mac, dan Android.';

  @override
  String get inviteDifferentCode => 'Gunakan kode lain';

  @override
  String get inviteRefusedHelp =>
      'Gabung daftar tunggu dan kami akan mengirimi email saat giliranmu tiba, atau masukkan kode undangan jika kamu punya.';

  @override
  String get inviteRefusedWaitlisted =>
      'Untuk saat ini Casama Cloud hanya dengan undangan. Kami akan mengirimi email saat giliranmu tiba. Punya kode undangan? Gunakan sekarang.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count undangan tersisa',
      one: '1 undangan tersisa',
      zero: 'Tidak ada undangan tersisa',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return '$used dari $total terpakai. Masing-masing memungkinkan seorang teman membuat akun.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'Undanganmu terbuka setelah chat pertamamu selesai.';

  @override
  String get inviteWaitingTitle => 'Menunggu undanganmu';

  @override
  String get inviteWaitingUses =>
      'Mengizinkan mereka masuk memakai salah satu undanganmu.';

  @override
  String get inviteWaitingNoneLeft =>
      'Kamu mendapat satu undangan kembali saat teman yang kamu undang menyelesaikan chat pertamanya.';

  @override
  String get inviteWaitingLetIn => 'Izinkan masuk';

  @override
  String inviteWaitingLetInLabel(String email) {
    return 'Izinkan $email masuk';
  }

  @override
  String get inviteWaitingDone =>
      'Mereka akan menerima email untuk mendaftar dalam beberapa menit.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Saya menyisihkan salah satu dari $count undangan Casama milik saya untukmu.',
      one: 'Saya menyisihkan undangan Casama milik saya untukmu.',
    );
    return '$_temp0 Untuk saat ini Casama hanya dengan undangan, dan ini langsung memasukkanmu: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Saya menyisihkan salah satu dari $count undangan Casama milik saya untukmu.',
      one: 'Saya menyisihkan undangan Casama milik saya untukmu.',
    );
    return '$_temp0 Untuk saat ini Casama hanya dengan undangan. Ini langsung memasukkanmu, dan kamu mendapat kuota gratis sebesar $amount setelah chat pertamamu: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => 'Untuk siapa ini?';

  @override
  String get inviteNameHelp =>
      'Tambahkan nama depannya dan halaman undangan akan menyapanya dengan nama itu. Kamu boleh mengosongkannya.';

  @override
  String get inviteNameHint => 'Nama depan';

  @override
  String get inviteNameShare => 'Bagikan undangan';

  @override
  String get inviteAskTitle => 'Siapa lagi yang akan memakainya?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Kamu punya $count undangan ke Casama. Masing-masing langsung memasukkan seorang teman.',
      one: 'Kamu punya 1 undangan ke Casama. Ini langsung memasukkan seorang teman.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'Kalian masing-masing mendapat kuota gratis sebesar $amount setelah chat pertamanya.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'Kamu mendapat kuota gratis sebesar $amount setelah chat pertamanya.';
  }

  @override
  String get inviteAskSend => 'Kirim undangan';

  @override
  String get inviteAskNotNow => 'Tidak sekarang';

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
      other: '$count isi ulang tersimpan',
      one: '1 isi ulang tersimpan',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'Gunakan sebelum $date';
  }

  @override
  String get savedResetUse => 'Gunakan isi ulang';

  @override
  String get savedResetConfirmTitle => 'Gunakan isi ulang ini?';

  @override
  String get savedResetConfirmDaily =>
      'Menghapus batas hari ini agar botmu dapat bekerja lagi hari ini. Ini tidak bisa dibatalkan.';

  @override
  String get savedResetConfirmComputer =>
      'Mengembalikan jam komputer bulan ini. Ini tidak bisa dibatalkan.';

  @override
  String get savedResetOwnerRequired =>
      'Hanya pemilik ruang kerja yang bisa memakainya.';

  @override
  String get savedResetPaused => 'Dijeda untuk saat ini. Periksa lagi nanti.';

  @override
  String get savedResetPeriodLimit =>
      'Kamu sudah memakai isi ulang periode ini. Kamu bisa memakai yang ini di periode berikutnya.';

  @override
  String get savedResetNothingToRefill =>
      'Belum ada yang perlu diisi ulang. Simpan untuk saat kuotamu menipis.';

  @override
  String get savedResetNoBillingPeriod =>
      'Tersedia setelah paketmu selesai disiapkan.';

  @override
  String get savedResetUnavailable => 'Tidak tersedia saat ini.';

  @override
  String savedResetDone(String amount) {
    return 'Isi ulang dipakai: $amount ditambahkan';
  }

  @override
  String get savedResetDoneNoCredits => 'Isi ulang dipakai';

  @override
  String savedResetConfirm(String amount) {
    return 'Mengisi ulang $amount dari kredit bawaan periode ini. Ini tidak bisa dibatalkan.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Aktifkan isi ulang tersimpan';

  @override
  String get resetsOffNote =>
      'Nonaktif: tidak ada yang mendapat isi ulang tersimpan.';

  @override
  String get resetsDecrease => 'Kurangi';

  @override
  String get resetsIncrease => 'Tambah';

  @override
  String get resetsSettings => 'Pengaturan';

  @override
  String get resetsCampaigns => 'Kampanye';

  @override
  String get resetsStatLive => 'Aktif';

  @override
  String get resetsStatGiven => 'Diberikan';

  @override
  String get resetsStatUsed => 'Dipakai';

  @override
  String get resetsStatRefilled => 'Diisi ulang';

  @override
  String get resetsFilterActive => 'Aktif';

  @override
  String get resetsFilterEnded => 'Selesai';

  @override
  String get resetsFilterAll => 'Semua';

  @override
  String get resetsStateDraft => 'Draf';

  @override
  String get resetsStateScheduled => 'Terjadwal';

  @override
  String get resetsStateLive => 'Aktif';

  @override
  String get resetsStatePaused => 'Dijeda';

  @override
  String get resetsStateEnded => 'Selesai';

  @override
  String get resetsStateCancelled => 'Dibatalkan';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return '$used dari anggaran $budget';
  }

  @override
  String resetsGivenN(String count) {
    return '$count diberikan';
  }

  @override
  String resetsUsedN(String count) {
    return '$count dipakai';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Mulai $start · Berakhir $end';
  }

  @override
  String get resetsToday => 'hari ini';

  @override
  String get resetsTomorrow => 'besok';

  @override
  String get resetsYesterday => 'kemarin';

  @override
  String get resetsAudienceEveryone => 'Setiap ruang kerja';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ruang kerja',
      one: '1 ruang kerja',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return 'Bergabung sebelum $date';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Mencapai batas dalam $days hari terakhir',
      one: 'Mencapai batas hari ini',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Batalkan kampanye';

  @override
  String get resetsCancelConfirm => 'Batalkan kampanye ini?';

  @override
  String get resetsCancelConfirmBody =>
      'Berhenti memberikan isi ulang tersimpan. Ini tidak bisa dibatalkan.';

  @override
  String get resetsDeleteConfirm => 'Hapus kampanye ini?';

  @override
  String get resetsDeleteConfirmBody => 'Draf ini dihapus permanen.';

  @override
  String get resetsNoCampaigns =>
      'Belum ada kampanye. Mulai satu untuk memberi isi ulang tersimpan ke banyak ruang kerja sekaligus.';

  @override
  String get resetsNoMatches => 'Tidak ada kampanye di sini.';

  @override
  String get resetsEditCampaign => 'Edit kampanye';

  @override
  String get resetsSectionBasics => 'Dasar';

  @override
  String get resetsSectionAudience => 'Audiens';

  @override
  String get resetsSectionTiming => 'Waktu';

  @override
  String get resetsSectionRefill => 'Isi ulang';

  @override
  String get resetsSectionWhat => 'Yang diisi ulang';

  @override
  String get resetsSectionNotify => 'Notifikasi';

  @override
  String get resetsPreviewLabel => 'Yang dilihat pengguna';

  @override
  String get resetsMonthly => 'Bulanan';

  @override
  String get resetsYearly => 'Tahunan';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Paket';

  @override
  String get resetsPlansHint =>
      'Jangan centang apa pun untuk menyertakan semua paket.';

  @override
  String get resetsWorkspacesLabel => 'Ruang kerja';

  @override
  String get resetsWorkspacesHint =>
      'Kosongkan untuk menyertakan semua ruang kerja.';

  @override
  String get resetsSearchWorkspaces => 'Cari ruang kerja menurut nama';

  @override
  String get resetsNoWorkspaceMatch => 'Tidak ada ruang kerja yang cocok.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Hanya $name';
  }

  @override
  String get resetsJoinedBefore => 'Bergabung sebelum';

  @override
  String get resetsLimitedDaysLabel => 'Mencapai batas dalam N hari terakhir';

  @override
  String get resetsStartsLabel => 'Mulai';

  @override
  String get resetsEndsLabel => 'Kedaluwarsa';

  @override
  String resetsPercentValue(int percent) {
    return 'Isi ulang $percent% dari kredit bawaan';
  }

  @override
  String get resetsCapLabel => 'Maksimal per pemakaian';

  @override
  String get resetsBudgetLabel => 'Total anggaran';

  @override
  String get resetsOptional => 'Opsional';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Menjangkau sekitar $count ruang kerja · $credits dalam kredit · biaya sekitar $cost';
  }

  @override
  String get resetsEstimating => 'Menghitung jangkauan…';

  @override
  String get resetsEstimateNeedsFields => 'Isi kolom untuk melihat jangkauan.';

  @override
  String get resetsLockedNote =>
      'Kampanye ini sedang berjalan: hanya pesan, masa berlaku, anggaran, dan pengingat yang bisa diubah.';

  @override
  String get resetsRequired => 'Wajib diisi.';

  @override
  String get resetsTooLong => 'Maksimal 120 karakter.';

  @override
  String get resetsDaysInvalid => 'Masukkan 1 hingga 365 hari.';

  @override
  String get resetsMoneyInvalid => 'Masukkan 0 atau lebih.';

  @override
  String get resetsExpiryBeforeStart =>
      'Pilih waktu selesai setelah waktu mulai.';

  @override
  String resetsGivenTo(String name) {
    return 'Isi ulang tersimpan diberikan kepada $name';
  }

  @override
  String get resetsCampaignSaved => 'Kampanye disimpan';

  @override
  String get resetsDefaultMessage =>
      'Isi ulang tersimpan, dari kami untukmu. Pakai saat kamu mencapai batas.';

  @override
  String resetsGiveName(String name) {
    return 'Isi ulang tersimpan untuk $name';
  }

  @override
  String get resetsOneWorkspace => 'Satu ruang kerja';

  @override
  String get resetsPickWorkspace =>
      'Pilih ruang kerja untuk melihat isi ulang tersimpannya.';

  @override
  String get resetsAllHistory => 'Semua riwayat';

  @override
  String get resetsAllWorkspaces => 'Semua ruang kerja';

  @override
  String get resetsNoEvents => 'Belum ada apa-apa di sini.';

  @override
  String get resetsEventGiven => 'Isi ulang tersimpan diberikan';

  @override
  String get resetsEventUsed => 'Isi ulang tersimpan dipakai';

  @override
  String get resetsEventRevoked => 'Diambil kembali';

  @override
  String get resetsEventUndone => 'Isi ulang diurungkan';

  @override
  String get resetsEventExpired => 'Kedaluwarsa tanpa dipakai';

  @override
  String get resetsEventCreated => 'Kampanye dibuat';

  @override
  String get resetsEventEdited => 'Kampanye diedit';

  @override
  String get resetsEventStarted => 'Kampanye dimulai';

  @override
  String get resetsEventEnded => 'Kampanye berakhir';

  @override
  String get resetsEventScheduled => 'Kampanye dijadwalkan';

  @override
  String get resetsEventPaused => 'Kampanye dijeda';

  @override
  String get resetsEventResumed => 'Kampanye dilanjutkan';

  @override
  String get resetsEventCancelled => 'Kampanye dibatalkan';

  @override
  String get resetsEventDeleted => 'Kampanye dihapus';

  @override
  String get resetsEventSettings => 'Pengaturan diubah';

  @override
  String get resetsRevokeConfirm => 'Tarik kembali isi ulang tersimpan ini?';

  @override
  String get resetsRevokeConfirmBody =>
      'Ruang kerja akan kehilangannya sebelum sempat memakainya.';

  @override
  String get resetsUndoConfirm => 'Urungkan isi ulang ini?';

  @override
  String get resetsUndoConfirmBody =>
      'Kredit yang ditambahkannya akan ditarik kembali.';

  @override
  String get resetsPerPeriod => 'Pemakaian per ruang kerja per periode';

  @override
  String get resetsMaxHeld => 'Maksimal isi ulang tersimpan';

  @override
  String get resetsNotifyOwners => 'Beri tahu pemilik instans';

  @override
  String get resetsNewCampaign => 'Kampanye baru';

  @override
  String get resetsName => 'Nama';

  @override
  String get resetsMessage => 'Pesan kepada pengguna';

  @override
  String get resetsPlans =>
      'Kode paket, dipisahkan koma (kosong berarti semua)';

  @override
  String get resetsWorkspaces =>
      'ID ruang kerja, dipisahkan koma (kosong berarti semua)';

  @override
  String get resetsBefore => 'Dibuat sebelum (tanggal dan waktu, opsional)';

  @override
  String get resetsLimitedDays =>
      'Mencapai batas dalam N hari terakhir (opsional)';

  @override
  String get resetsStart => 'Mulai (tanggal dan waktu)';

  @override
  String get resetsExpiry => 'Kedaluwarsa (tanggal dan waktu)';

  @override
  String get resetsPercent => 'Kredit bawaan yang diisi ulang (%)';

  @override
  String get resetsCap => 'Batas dolar per pemakaian (opsional)';

  @override
  String get resetsBudget => 'Total anggaran kredit dalam dolar (opsional)';

  @override
  String get resetsDaily => 'Hapus batas model hari ini';

  @override
  String get resetsComputer => 'Isi ulang jam komputer bulan ini';

  @override
  String get resetsArrival => 'Beri tahu saat tiba';

  @override
  String get resetsReminder => 'Ingatkan sebelum kedaluwarsa';

  @override
  String get resetsPreviewSave => 'Pratinjau dan simpan';

  @override
  String get resetsSchedule => 'Jadwalkan';

  @override
  String get resetsPause => 'Jeda';

  @override
  String get resetsResume => 'Lanjutkan';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count ruang kerja. Isi ulang maksimal: $credits. Perkiraan biaya: $cost.',
      one:
          '1 ruang kerja. Isi ulang maksimal: $credits. Perkiraan biaya: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace => 'ID ruang kerja (kosong untuk semua riwayat)';

  @override
  String get resetsHistory => 'Muat riwayat';

  @override
  String get resetsGive => 'Beri isi ulang tersimpan';

  @override
  String get resetsCopyCsv => 'Salin CSV';

  @override
  String get resetsRevoke => 'Tarik kembali';

  @override
  String get resetsUndo => 'Urungkan isi ulang yang belum dipakai';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention => 'Layanan vendor perlu perhatian';

  @override
  String get vendorNotSetUp => 'Belum disiapkan';

  @override
  String get vendorCheckNow => 'Periksa sekarang';

  @override
  String get vendorLimit => 'Batas atau jumlah prabayar';

  @override
  String get vendorWarnAt => 'Peringatkan pada';

  @override
  String get vendorExpiry => 'Kedaluwarsa';

  @override
  String get vendorHistory => 'Pembacaan terbaru';

  @override
  String get vendorSave => 'Simpan';

  @override
  String get vendorEnabled => 'Pemantauan aktif';

  @override
  String get vendorUnknown => 'Tidak diketahui';

  @override
  String get vendorLow => 'Rendah';

  @override
  String get vendorOut => 'Habis';

  @override
  String get vendorOk => 'OK';

  @override
  String get vendorNoReading => 'Belum ada pembacaan';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count perlu perhatian',
      one: '1 perlu perhatian',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count OK';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count belum disiapkan';
  }

  @override
  String get vendorNoVendors => 'Belum ada layanan untuk dipantau.';

  @override
  String get vendorCheckAll => 'Periksa semua';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Memeriksa $done dari $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count layanan diperiksa',
      one: '1 layanan diperiksa',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pemeriksaan gagal',
      one: '1 pemeriksaan gagal',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'Perlu perhatian';

  @override
  String get vendorGroupHealthy => 'Sehat';

  @override
  String get vendorGroupIdle => 'Belum disiapkan atau nonaktif';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tampilkan $count lagi',
      one: 'Tampilkan 1 lagi',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Tampilkan lebih sedikit';

  @override
  String get vendorOff => 'Nonaktif';

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
    return 'Tersisa $amount';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return 'Peringatkan di bawah $amount';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Direset $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Diperpanjang $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Kedaluwarsa $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count menit',
      one: 'dalam 1 menit',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count jam',
      one: 'dalam 1 jam',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count hari',
      one: 'dalam 1 hari',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Diperiksa $when';
  }

  @override
  String get vendorSourceApi => 'Dari layanan';

  @override
  String get vendorSourceOwnCount => 'Dihitung oleh Casama';

  @override
  String get vendorSourceManual => 'Dimasukkan manual';

  @override
  String vendorReadingError(String error) {
    return 'Pemeriksaan terakhir gagal: $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Tambahkan kuncinya di server untuk mulai memeriksa.';

  @override
  String get vendorOffHint => 'Pemantauan nonaktif.';

  @override
  String get vendorPickOne => 'Pilih layanan untuk melihat detailnya.';

  @override
  String get vendorSectionStatus => 'Status';

  @override
  String get vendorSectionActions => 'Tindakan';

  @override
  String get vendorSectionAlerts => 'Peringatan';

  @override
  String get vendorSectionPlan => 'Paket';

  @override
  String vendorWarnAtValue(int percent) {
    return 'Peringatkan saat $percent% terpakai';
  }

  @override
  String get vendorWarnAtHelp => 'Meter berubah kuning di sini.';

  @override
  String get vendorPeriod => 'Periode';

  @override
  String get vendorPeriodNone => 'Belum diatur';

  @override
  String get vendorPeriodDay => 'Harian';

  @override
  String get vendorPeriodMonth => 'Bulanan';

  @override
  String get vendorPeriodBilling => 'Setiap periode penagihan';

  @override
  String get vendorPeriodPrepaid => 'Prabayar';

  @override
  String get vendorDateNotSet => 'Belum diatur';

  @override
  String get vendorClearDate => 'Hapus tanggal';

  @override
  String get vendorLimitInvalid => 'Masukkan angka di atas 0.';

  @override
  String get vendorAmountInvalid => 'Masukkan 0 atau lebih.';

  @override
  String get vendorMonthsInvalid => 'Masukkan 1 hingga 120 bulan.';

  @override
  String get vendorWarnAtInvalid => 'Pilih titik antara 1% dan 100%.';

  @override
  String get vendorSaved => 'Pengaturan disimpan';

  @override
  String get vendorCheckDone => 'Diperiksa';

  @override
  String get vendorHistoryEmpty => 'Belum ada pembacaan.';

  @override
  String get vendorCheckFailed => 'Pemeriksaan gagal';

  @override
  String get vendorResets => 'Reset';

  @override
  String get vendorSource => 'Sumber';

  @override
  String get vendorBilling => 'Penagihan dan isi ulang';

  @override
  String get vendorBalanceWarning => 'Peringatkan di bawah saldo';

  @override
  String get vendorPeriodStart => 'Periode dimulai';

  @override
  String get vendorInvalidSettings =>
      'Masukkan batas positif, peringatan antara 0 dan 1, dan tanggal yang valid.';

  @override
  String get card24hRange => 'Rentang 24 jam';

  @override
  String get card52wRange => 'Rentang 52 minggu';

  @override
  String get cardAgain => 'Lagi';

  @override
  String get cardAgoSuffix => 'lalu';

  @override
  String get cardAirQuality => 'Kualitas udara';

  @override
  String get cardAqiAdviceBad =>
      'Semua orang sebaiknya mengurangi aktivitas berat atau lama di luar ruangan; tutup jendela.';

  @override
  String get cardAqiAdviceGood => 'Hari yang bagus untuk beraktivitas di luar.';

  @override
  String get cardAqiAdviceModerate =>
      'Aman bagi kebanyakan orang; kelompok yang sangat sensitif sebaiknya mengurangi aktivitas berat.';

  @override
  String get cardAqiAdviceSensitive =>
      'Anak-anak, lansia, dan penderita asma sebaiknya membatasi aktivitas lama di luar ruangan.';

  @override
  String get cardAqiGood => 'Baik';

  @override
  String get cardAqiHazardous => 'Berbahaya';

  @override
  String get cardAqiModerate => 'Sedang';

  @override
  String get cardAqiSensitive => 'Tidak sehat bagi kelompok sensitif';

  @override
  String get cardAqiUnhealthy => 'Tidak sehat';

  @override
  String get cardAqiVeryUnhealthy => 'Sangat tidak sehat';

  @override
  String get cardBaggage => 'Bagasi';

  @override
  String get cardCalcAmount => 'Jumlah';

  @override
  String get cardCalcBill => 'Tagihan';

  @override
  String get cardCalcDiscount => 'Diskon';

  @override
  String get cardCalcDiscountTitle => 'Diskon';

  @override
  String get cardCalcGross => 'Dengan pajak';

  @override
  String get cardCalcGrowth => 'Pertumbuhan';

  @override
  String get cardCalcInterest => 'Bunga';

  @override
  String get cardCalcLoan => 'Pinjaman';

  @override
  String get cardCalcMonthly => 'Setiap bulan';

  @override
  String get cardCalcMonthlyPayment => 'Cicilan bulanan';

  @override
  String get cardCalcNet => 'Sebelum pajak';

  @override
  String get cardCalcPeople => 'Orang';

  @override
  String get cardCalcPerPerson => 'Masing-masing membayar';

  @override
  String get cardCalcPrice => 'Harga';

  @override
  String get cardCalcPrincipal => 'Pokok';

  @override
  String get cardCalcRate => 'Bunga tahunan';

  @override
  String get cardCalcSavings => 'Tabungan';

  @override
  String get cardCalcStart => 'Mulai dengan';

  @override
  String get cardCalcTax => 'Pajak';

  @override
  String get cardCalcTaxIncluded => 'Termasuk pajak';

  @override
  String get cardCalcTaxRate => 'Tarif pajak';

  @override
  String get cardCalcTip => 'Tip';

  @override
  String get cardCalcTipAmount => 'Tip';

  @override
  String get cardCalcTipSplit => 'Tip dan bagi rata';

  @override
  String get cardCalcTotal => 'Total';

  @override
  String get cardCalcTotalInterest => 'Total bunga';

  @override
  String get cardCalcTotalPaid => 'Total dibayar';

  @override
  String get cardCalcUnits => 'Konversi satuan';

  @override
  String get cardCalcValue => 'Nilai';

  @override
  String get cardCalcVat => 'Pajak';

  @override
  String get cardCalcYears => 'Tahun';

  @override
  String get cardCalcYouPay => 'Kamu membayar';

  @override
  String get cardCalcYouPutIn => 'Yang kamu masukkan';

  @override
  String get cardCalcYouSave => 'Kamu hemat';

  @override
  String get cardCall => 'Telepon';

  @override
  String get cardCaloriesWord => 'Kalori';

  @override
  String get cardComparison => 'Perbandingan';

  @override
  String get cardCondClear => 'Cerah';

  @override
  String get cardCondCloudy => 'Berawan';

  @override
  String get cardCondDrizzle => 'Gerimis';

  @override
  String get cardCondFog => 'Kabut';

  @override
  String get cardCondHail => 'Hujan es';

  @override
  String get cardCondHeavyRain => 'Hujan lebat';

  @override
  String get cardCondHeavySnow => 'Salju lebat';

  @override
  String get cardCondLightRain => 'Hujan ringan';

  @override
  String get cardCondLightSnow => 'Salju ringan';

  @override
  String get cardCondMostlyClear => 'Sebagian besar cerah';

  @override
  String get cardCondPartlyCloudy => 'Cerah berawan';

  @override
  String get cardCondRain => 'Hujan';

  @override
  String get cardCondShowers => 'Hujan rintik';

  @override
  String get cardCondSleet => 'Hujan bercampur salju';

  @override
  String get cardCondSnow => 'Salju';

  @override
  String get cardCondThunder => 'Badai petir';

  @override
  String get cardCons => 'Kekurangan';

  @override
  String get cardCopied => 'Disalin';

  @override
  String get cardCopy => 'Salin sebagai teks';

  @override
  String get cardCouldntUpdate => 'Tidak bisa diperbarui';

  @override
  String get cardCurrency => 'Mata uang';

  @override
  String get cardDayLength => 'Lama siang';

  @override
  String get cardDayRange => 'Rentang harian';

  @override
  String get cardDays => 'hari';

  @override
  String get cardDelay => 'Tunda';

  @override
  String get cardDictionary => 'Kamus';

  @override
  String get cardEmail => 'Email';

  @override
  String get cardFlightCancelled => 'Dibatalkan';

  @override
  String get cardFlightDiverted => 'Dialihkan';

  @override
  String get cardFlightInAir => 'Di udara';

  @override
  String get cardFlightIncident => 'Insiden';

  @override
  String get cardFlightLanded => 'Mendarat';

  @override
  String get cardFlightScheduled => 'Sesuai jadwal';

  @override
  String cardStaysFromNight(String price) {
    return 'mulai $price per malam';
  }

  @override
  String get cardStaysANight => 'per malam';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n malam',
      one: '1 malam',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n tamu',
      one: '1 tamu',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n kamar',
      one: '1 kamar',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'Terbaik';

  @override
  String get cardStaysSortCheapest => 'Termurah';

  @override
  String get cardStaysSortTopRated => 'Nilai tertinggi';

  @override
  String get cardStaysSortClosest => 'Terdekat';

  @override
  String get cardStaysFilterFreeCancel => 'Pembatalan gratis';

  @override
  String get cardStaysFilterBreakfast => 'Sarapan';

  @override
  String get cardStaysFilterPayAtHotel => 'Bayar di hotel';

  @override
  String get cardStaysFilterStars => 'Bintang 4 ke atas';

  @override
  String get cardStaysFilterRated => 'Nilai 8+';

  @override
  String get cardStaysList => 'Daftar';

  @override
  String get cardStaysMap => 'Peta';

  @override
  String get cardStaysEdit => 'Edit';

  @override
  String cardStaysRating(String value, String max) {
    return '$value dari $max';
  }

  @override
  String cardStaysKm(String km) {
    return '$km km dari pusat kota';
  }

  @override
  String cardStaysStars(int n) {
    return 'Bintang $n';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$price untuk $n malam',
      one: '$price untuk 1 malam',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n situs lagi',
      one: '+1 situs lagi',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'Lihat penawaran';

  @override
  String get cardStaysView => 'Lihat';

  @override
  String cardStaysShowAll(int n) {
    return 'Tampilkan semua $n';
  }

  @override
  String get cardStaysShowFewer => 'Tampilkan lebih sedikit';

  @override
  String get cardStaysNone => 'Tidak ada yang cocok dengan filter ini.';

  @override
  String get cardStaysNoMap =>
      'Tidak ada tempat di sini yang memiliki titik di peta.';

  @override
  String get cardStaysNoDeals => 'Tidak ada harga untuk tanggal ini.';

  @override
  String get cardStaysCheck => 'Harga diperiksa di situs pemesanan.';

  @override
  String cardStaysCompare(int n) {
    return 'Bandingkan ($n)';
  }

  @override
  String get cardStaysCompareHint => 'Centang hingga 4 untuk dibandingkan';

  @override
  String get cardStaysComparePick => 'Pilih untuk dibandingkan';

  @override
  String get cardStaysCompareTitle => 'Bandingkan';

  @override
  String get cardStaysRowNight => 'Harga per malam';

  @override
  String get cardStaysRowTotal => 'Total';

  @override
  String get cardStaysRowRating => 'Peringkat';

  @override
  String get cardStaysRowStars => 'Bintang';

  @override
  String get cardStaysRowDistance => 'Jarak';

  @override
  String get cardStaysYes => 'Ya';

  @override
  String get cardStaysNo => 'Tidak';

  @override
  String get cardStaysTermFreeCancel => 'Pembatalan gratis';

  @override
  String get cardStaysTermBreakfast => 'Termasuk sarapan';

  @override
  String get cardStaysTermNoBreakfast => 'Tanpa sarapan';

  @override
  String get cardStaysTermPayAtHotel => 'Bayar di hotel';

  @override
  String get cardStaysTermNonRefundable => 'Tidak dapat dikembalikan';

  @override
  String get cardStaysDetailsTitle => 'Tempat menginap';

  @override
  String get cardStaysCheapest => 'Termurah';

  @override
  String get cardStaysAmenities => 'Fasilitas';

  @override
  String cardStaysCheckIn(String time) {
    return 'Check-in $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Check-out $time';
  }

  @override
  String get cardStaysNearby => 'Di sekitar';

  @override
  String get cardStaysHotelSite => 'Situs web hotel';

  @override
  String get cardStaysBook => 'Pesankan untuk saya';

  @override
  String cardStaysBookLabel(String name, String site) {
    return 'Pesan $name di $site';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Foto $n dari $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · harga per bulan';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'Termurah: $month, sekitar $price per malam';
  }

  @override
  String get cardStaysTrendNote => 'Perkiraan, bukan harga langsung.';

  @override
  String get cardStaysTrendPick => 'Pilih tanggal';

  @override
  String get cardStaysSearchTitle => 'Cari tempat menginap';

  @override
  String get cardStaysSearchWhere => 'Di mana';

  @override
  String get cardStaysSearchWhereHint => 'Kota, area, atau hotel';

  @override
  String get cardStaysSearchDates => 'Pilih tanggal';

  @override
  String get cardStaysSearchAdults => 'Dewasa';

  @override
  String get cardStaysSearchRooms => 'Kamar';

  @override
  String get cardStaysSearchBudget => 'Anggaran per malam (opsional)';

  @override
  String get cardStaysSearchNotNow => 'Tidak sekarang';

  @override
  String get cardStaysSearchGo => 'Cari penginapan';

  @override
  String get cardStaysSearchSent => 'Mencari';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return 'Penginapan di $where, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Kurangi: $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'Tambah: $label';
  }

  @override
  String get cardStaysAmenityPool => 'Kolam renang';

  @override
  String get cardStaysAmenityParking => 'Parkir';

  @override
  String get cardStaysAmenityPets => 'Hewan peliharaan diizinkan';

  @override
  String get cardStaysAmenityGym => 'Gym';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Dapur';

  @override
  String get cardStaysAmenityWifi => 'WiFi';

  @override
  String get cardStaysAmenityAirCon => 'AC';

  @override
  String get cardProductsTitle => 'Barang untuk dibeli';

  @override
  String cardProductsFrom(String price) {
    return 'mulai $price';
  }

  @override
  String cardProductsUnder(String price) {
    return 'di bawah $price';
  }

  @override
  String get cardProductsSortBest => 'Terbaik';

  @override
  String get cardProductsSortCheapest => 'Termurah';

  @override
  String get cardProductsSortTopRated => 'Nilai tertinggi';

  @override
  String get cardProductsOnSale => 'Diskon';

  @override
  String get cardProductsRated => 'Nilai 4+';

  @override
  String cardProductsOff(int pct) {
    return '−$pct%';
  }

  @override
  String get cardProductsOtherStores => 'dan toko lainnya';

  @override
  String cardProductsShowAll(int n) {
    return 'Tampilkan semua $n';
  }

  @override
  String get cardProductsShowFewer => 'Tampilkan lebih sedikit';

  @override
  String get cardProductsShowMore => 'Tampilkan lebih banyak';

  @override
  String get cardProductsNone => 'Tidak ada yang cocok dengan filter ini.';

  @override
  String get cardProductsCheck => 'Harga diperiksa di toko.';

  @override
  String get cardProductsBuy => 'Beli';

  @override
  String get cardProductsCompareStores => 'Bandingkan toko';

  @override
  String cardProductsCompareLabel(String title) {
    return 'Bandingkan toko untuk $title';
  }

  @override
  String get cardProductsBuyForMe => 'Belikan untuk saya';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return 'Beli $title di $store';
  }

  @override
  String get cardProductsRowPrice => 'Harga';

  @override
  String get cardProductsRowStore => 'Toko';

  @override
  String get cardProductsRowRating => 'Peringkat';

  @override
  String get cardProductsRowDelivery => 'Pengiriman';

  @override
  String cardProductsDelivery(String text) {
    return 'Pengiriman: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return 'oleh $brand';
  }

  @override
  String get cardProductsOffers => 'Toko';

  @override
  String get cardProductsLowest => 'Total terendah';

  @override
  String cardProductsTotal(String price) {
    return 'Total $price';
  }

  @override
  String get cardProductsOutOfStock => 'Stok habis';

  @override
  String get cardProductsFeatures => 'Tentang produk ini';

  @override
  String get cardProductsReviews => 'Kata pembeli';

  @override
  String get cardCheckoutTitle => 'Periksa sebelum saya membayar';

  @override
  String get cardCheckoutTotal => 'Total';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Buka halaman';

  @override
  String get cardCheckoutCancel => 'Batalkan';

  @override
  String get cardCheckoutChange => 'Ubah';

  @override
  String get cardCheckoutConfirm => 'Konfirmasi dan bayar';

  @override
  String get cardCheckoutCancelLabel => 'Batalkan ini';

  @override
  String get cardCheckoutChangeLabel => 'Ubah sesuatu';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return 'Konfirmasi $total di $seller';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return 'Konfirmasi $total';
  }

  @override
  String get cardCheckoutConfirmed => 'Dikonfirmasi';

  @override
  String get cardCheckoutChanging => 'Mengubah';

  @override
  String get cardCheckoutCancelled => 'Dibatalkan';

  @override
  String get cardBookingTitle => 'Pemesananmu';

  @override
  String cardBookingWith(String site) {
    return 'Dipesan lewat $site';
  }

  @override
  String get cardBookingCheckIn => 'Check-in';

  @override
  String get cardBookingCheckOut => 'Check-out';

  @override
  String get cardBookingConfirmation => 'Nomor konfirmasi';

  @override
  String get cardBookingCopy => 'Salin nomor konfirmasi';

  @override
  String get cardBookingPaid => 'Sudah dibayar';

  @override
  String get cardBookingPayAtHotel => 'Bayar di hotel';

  @override
  String cardBookingCancelBy(String date) {
    return 'Pembatalan gratis hingga $date';
  }

  @override
  String get cardBookingDirections => 'Petunjuk arah';

  @override
  String get cardBookingManage => 'Kelola pemesanan';

  @override
  String get cardBookingCalendar => 'Tambahkan ke kalender';

  @override
  String cardBookingCalendarLabel(String name) {
    return 'Tambahkan $name ke kalender saya';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Pesanan $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Dipesan $date';
  }

  @override
  String get cardOrderStepOrdered => 'Dipesan';

  @override
  String get cardOrderStepShipped => 'Dikirim';

  @override
  String get cardOrderStepOut => 'Sedang diantar';

  @override
  String get cardOrderStepDelivered => 'Terkirim';

  @override
  String get cardOrderCancelled => 'Dibatalkan';

  @override
  String get cardOrderReturned => 'Dikembalikan';

  @override
  String cardOrderArrives(String date) {
    return 'Tiba $date';
  }

  @override
  String get cardOrderTracking => 'Nomor resi';

  @override
  String get cardOrderCopy => 'Salin nomor resi';

  @override
  String get cardOrderTrack => 'Lacak';

  @override
  String cardOrderTrackLabel(String number) {
    return 'Lacak $number';
  }

  @override
  String get cardOrderPage => 'Halaman pesanan';

  @override
  String get cardFaresBest => 'Terbaik';

  @override
  String get cardFaresCheapest => 'Termurah';

  @override
  String get cardFaresFastest => 'Tercepat';

  @override
  String get cardFaresDirectOnly => 'Hanya langsung';

  @override
  String get cardFaresDirect => 'Langsung';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n transit',
      one: '1 transit',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Pesan';

  @override
  String cardFaresFromPrice(String price) {
    return 'mulai $price';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n penumpang',
      one: '1 penumpang',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n malam',
      one: '1 malam',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'Ekonomi';

  @override
  String get cardFaresPremium => 'Ekonomi premium';

  @override
  String get cardFaresBusiness => 'Bisnis';

  @override
  String get cardFaresFirst => 'Utama';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Biasanya $low–$high untuk perjalanan ini';
  }

  @override
  String get cardFaresLevelLow => 'Sedang rendah';

  @override
  String get cardFaresLevelTypical => 'Sedang normal';

  @override
  String get cardFaresLevelHigh => 'Sedang tinggi';

  @override
  String cardFaresShowAll(int n) {
    return 'Tampilkan semua $n';
  }

  @override
  String get cardFaresShowFewer => 'Tampilkan lebih sedikit';

  @override
  String get cardFaresNoDirect =>
      'Tidak ada penerbangan langsung di pencarian ini.';

  @override
  String get cardFaresOutboundOnly =>
      'Harga adalah untuk seluruh perjalanan; pilih penerbangan pulang di Google Flights.';

  @override
  String get cardFaresSeeAll => 'Lihat semua di Google Flights';

  @override
  String get cardFaresCheck =>
      'Harga adalah untuk semua penumpang dan diperiksa ulang di situs pemesanan.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin bagasi kabin, $checked bagasi terdaftar';
  }

  @override
  String get cardFaresAffiliate =>
      'Casama dapat memperoleh komisi saat kamu memesan lewat tautan ini. Itu tidak mengubah harga.';

  @override
  String cardFaresCompare(String site) {
    return 'Bandingkan di $site';
  }

  @override
  String get cardFaresWatch => 'Pantau harga';

  @override
  String cardFaresWatching(String date) {
    return 'Memantau · berakhir $date';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return 'Memantau harga $price atau kurang · berakhir $date';
  }

  @override
  String get cardFaresWatchStop => 'Hentikan';

  @override
  String get cardFaresWatchTitle => 'Pantau harga ini';

  @override
  String get cardFaresWatchBody =>
      'Casama memeriksa harga ini beberapa kali sehari dan mengirimimu notifikasi saat harganya turun. Pemantauan berhenti sendiri saat tanggal lewat, atau dalam 60 hari.';

  @override
  String get cardFaresWatchTarget => 'Beri tahu saat di bawah (opsional)';

  @override
  String get cardFaresWatchAnyDrop => 'Kosongkan untuk penurunan besar apa pun';

  @override
  String get cardFaresWatchStart => 'Pantau';

  @override
  String get cardFaresWatchStarted =>
      'Memantau harga ini. Kamu akan mendapat notifikasi saat harganya turun.';

  @override
  String get cardFaresWatchStopped => 'Berhenti memantau harga ini.';

  @override
  String get cardFaresWatchFull =>
      'Kamu sudah memantau 10 harga. Hentikan satu di Pengaturan → Kartu terlebih dahulu.';

  @override
  String get cardFaresWatchFailed =>
      'Tidak bisa mengubah pemantau harga. Coba lagi.';

  @override
  String get cardFaresFlagSeparate => 'Tiket terpisah';

  @override
  String get cardFaresFlagOvernight => 'Transit semalam';

  @override
  String get cardFaresFlagAirport => 'Pindah bandara';

  @override
  String get cardFaresFlagShort => 'Transit singkat';

  @override
  String get cardFaresFlagLong => 'Transit lama';

  @override
  String get cardFaresNoteSeparate =>
      'Maskapai berbeda pada satu arah, jadi ini mungkin tiket terpisah. Jika kamu tertinggal penerbangan sambungan, penerbangan berikutnya mungkin tidak ditanggung. Periksa di situs pemesanan.';

  @override
  String get cardFaresNoteOvernight => 'Transit berlangsung semalaman.';

  @override
  String get cardFaresNoteAirport =>
      'Penerbangan sambungan berangkat dari bandara berbeda.';

  @override
  String get cardFaresNoteShort => 'Transit kurang dari satu jam.';

  @override
  String get cardFaresNoteLong => 'Transit lebih dari 8 jam.';

  @override
  String get cardFaresOutbound => 'Berangkat';

  @override
  String get cardFaresReturn => 'Pulang';

  @override
  String cardFaresEmissions(int kg) {
    return 'Sekitar $kg kg CO₂ per penumpang';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return 'Transit $time di $place';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'penerbangan berikutnya berangkat dari $place';
  }

  @override
  String get cardFaresViewFailed => 'Tidak bisa memuat tarif ini.';

  @override
  String get cardFaresTryAgain => 'Coba lagi';

  @override
  String get cardFaresMorning => 'Pagi';

  @override
  String get cardFaresAfternoon => 'Siang';

  @override
  String get cardFaresEvening => 'Sore';

  @override
  String get cardFaresNight => 'Malam';

  @override
  String get cardFaresTime => 'Waktu';

  @override
  String get cardFaresAirlines => 'Maskapai';

  @override
  String get cardFaresBagIncluded => 'Termasuk bagasi';

  @override
  String get cardFaresNoMatch =>
      'Tidak ada penerbangan yang cocok dengan filter ini.';

  @override
  String get cardFaresOpenInChat => 'Buka di chat';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return 'Tampilkan penerbangan $route pada $date';
  }

  @override
  String get cardFaresEdit => 'Edit pencarian';

  @override
  String get cardFaresDetails => 'Detail';

  @override
  String get cardFaresSinceStart => 'sejak kamu mulai memantau';

  @override
  String get cardFareCalOneWay => 'Sekali jalan';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Pulang setelah $n malam',
      one: 'Pulang setelah 1 malam',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Rendah';

  @override
  String get cardFareCalUsual => 'Normal';

  @override
  String get cardFareCalHigh => 'Tinggi';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'Termurah: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'Lihat tarif';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: tidak ada harga';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return 'Dari $from · ke mana saja';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return 'Dari $from · ke luar negeri';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return 'Dari $from · dalam negeri';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return 'di bawah $price';
  }

  @override
  String get cardFlightSearchTitle => 'Cari penerbangan';

  @override
  String get cardFlightSearchReturn => 'Pulang pergi';

  @override
  String get cardFlightSearchOneWay => 'Sekali jalan';

  @override
  String get cardFlightSearchFrom => 'Dari';

  @override
  String get cardFlightSearchTo => 'Ke';

  @override
  String get cardFlightSearchPlaceHint => 'Kota atau bandara';

  @override
  String get cardFlightSearchAnywhere => 'Ke mana saja';

  @override
  String get cardFlightSearchSwap => 'Tukar tempat';

  @override
  String get cardFlightSearchPickDates => 'Pilih tanggal';

  @override
  String get cardFlightSearchPickDate => 'Pilih tanggal';

  @override
  String get cardFlightSearchWholeMonth => 'Sebulan penuh';

  @override
  String get cardFlightSearchNights => 'Lama menginap (malam)';

  @override
  String get cardFlightSearchAdults => 'Dewasa';

  @override
  String get cardFlightSearchChildren => 'Anak-anak (2 hingga 11)';

  @override
  String get cardFlightSearchInfants => 'Bayi (di bawah 2)';

  @override
  String get cardFlightSearchNotNow => 'Tidak sekarang';

  @override
  String get cardFlightSearchSent => 'Mencari…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return 'Penerbangan $route, $dates';
  }

  @override
  String get cardFareTrendNow => 'Termurah saat ini';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n hari terakhir',
      one: 'Hari terakhir',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return 'dari $low hingga $high';
  }

  @override
  String get cardFareTrendNote =>
      'Ini adalah riwayat harga sebelumnya, bukan perkiraan. Harga dapat berubah kapan saja.';

  @override
  String get cardFareWatchesTitle => 'Pemantau harga';

  @override
  String get cardFareWatchesNone =>
      'Kamu belum memantau tarif apa pun. Ketuk Pantau harga pada kartu tarif untuk memulai.';

  @override
  String get cardFareWatchesNoPrice => 'Belum ada harga';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Target $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Penurunan besar apa pun';

  @override
  String cardFareWatchesLow(String price) {
    return 'terendah $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'berakhir $date';
  }

  @override
  String get cardsFareWatches => 'Pemantau harga';

  @override
  String get cardsFareWatchesNone =>
      'Belum ada pemantau harga. Ketuk Pantau harga pada kartu tarif penerbangan untuk mendapat notifikasi saat harga turun.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Sekarang $price · berakhir $date';
  }

  @override
  String get cardFromBot => 'Ditulis oleh bot; mungkin keliru';

  @override
  String get cardFullRecipe => 'Resep lengkap';

  @override
  String get cardGate => 'Gerbang';

  @override
  String get cardGo => 'Mulai';

  @override
  String get cardHeads => 'Gambar';

  @override
  String get cardHolidays => 'Hari libur nasional';

  @override
  String get cardHoursShort => 'jam';

  @override
  String get cardHumidity => 'Kelembapan';

  @override
  String get cardItsTime => 'Waktunya tiba!';

  @override
  String get cardJustNow => 'baru saja';

  @override
  String get cardLast24h => '24 jam terakhir';

  @override
  String get cardLast30Days => '30 hari terakhir';

  @override
  String get cardListen => 'Dengarkan';

  @override
  String get cardLiveNow => 'Sekarang juga';

  @override
  String get cardLongWeekend => 'Akhir pekan panjang';

  @override
  String get cardLostShort => 'K';

  @override
  String get cardMarket24h => '24/7';

  @override
  String get cardMarketCap => 'Kapitalisasi pasar';

  @override
  String get cardMarketClosed => 'Tutup';

  @override
  String get cardMarketOpen => 'Buka';

  @override
  String get cardMarketPost => 'Setelah jam tutup';

  @override
  String get cardMarketPre => 'Pra-pasar';

  @override
  String get cardMessage => 'Pesan';

  @override
  String get cardMinutesShort => 'mnt';

  @override
  String get cardMoonFirstQuarter => 'Perbani awal';

  @override
  String get cardMoonFull => 'Bulan purnama';

  @override
  String get cardMoonLastQuarter => 'Perbani akhir';

  @override
  String get cardMoonNew => 'Bulan baru';

  @override
  String get cardMoonWaningCrescent => 'Sabit tua';

  @override
  String get cardMoonWaningGibbous => 'Bungkuk susut';

  @override
  String get cardMoonWaxingCrescent => 'Sabit muda';

  @override
  String get cardMoonWaxingGibbous => 'Bungkuk tumbuh';

  @override
  String get cardMore => 'Lainnya';

  @override
  String get cardNext24h => '24 jam ke depan';

  @override
  String get cardNoAlerts => 'Tidak ada peringatan';

  @override
  String get cardNoAlertsLong =>
      'Tidak ada peringatan cuaca yang berlaku di sini saat ini.';

  @override
  String get cardNoChart => 'Tidak ada grafik untuk rentang ini';

  @override
  String get cardNoGames => 'Tidak ada pertandingan';

  @override
  String get cardNoHolidays => 'Tidak ada lagi hari libur nasional tahun ini.';

  @override
  String get cardNoQuakes => 'Tidak ada gempa bumi sekuat itu akhir-akhir ini.';

  @override
  String get cardNoStorms => 'Tidak ada yang aktif';

  @override
  String get cardNoStormsLong => 'Tidak ada badai tropis yang aktif saat ini.';

  @override
  String get cardNotAdvice => 'Bukan saran keuangan';

  @override
  String get cardNow => 'Sekarang';

  @override
  String get cardNutritionFacts => 'Informasi nilai gizi';

  @override
  String get cardOpen => 'Buka';

  @override
  String get cardOpenSource => 'Buka sumbernya';

  @override
  String get cardParcel => 'Paket';

  @override
  String get cardParcelDelivered => 'Terkirim';

  @override
  String get cardParcelInTransit => 'Dalam perjalanan';

  @override
  String get cardParcelOrdered => 'Label dibuat';

  @override
  String get cardParcelOut => 'Sedang diantar';

  @override
  String get cardParcelProblem => 'Bermasalah';

  @override
  String get cardParcelNoLive =>
      'Belum ada status langsung untuk nomor ini di sini. Halaman kurir memiliki info terbaru.';

  @override
  String cardParcelTrackOn(String site) {
    return 'Lacak di $site';
  }

  @override
  String get cardPin => 'Sematkan ke widget';

  @override
  String get cardPinFailed => 'Tidak bisa menyematkan kartu ini';

  @override
  String get cardPinned => 'Disematkan ke widgetmu';

  @override
  String get cardPinnedWaiting =>
      'Disematkan. Izinkan bot ini di widgetmu untuk melihatnya di sana';

  @override
  String get cardPlayedShort => 'M';

  @override
  String get cardPointsShort => 'Poin';

  @override
  String get cardPrevClose => 'Tutup seb.';

  @override
  String get cardPros => 'Kelebihan';

  @override
  String get cardProsCons => 'Kelebihan dan kekurangan';

  @override
  String get cardQuiz => 'Kuis';

  @override
  String get cardRain => 'Hujan';

  @override
  String get cardRainChance => 'Peluang hujan';

  @override
  String get cardRandom => 'Acak';

  @override
  String get cardReadMore => 'Baca selengkapnya';

  @override
  String get cardReferenceRates =>
      'Kurs referensi bank sentral, diterbitkan harian';

  @override
  String get cardRefresh => 'Muat ulang';

  @override
  String get cardReport => 'Laporkan data salah';

  @override
  String get cardReported => 'Terima kasih, kami akan memeriksanya';

  @override
  String get cardSameTime => 'waktu yang sama';

  @override
  String get cardScores => 'Skor';

  @override
  String get cardSecondsShort => 'dtk';

  @override
  String get cardServings => 'Porsi';

  @override
  String get cardShareImage => 'Bagikan sebagai gambar';

  @override
  String get cardStandings => 'Klasemen';

  @override
  String get cardStorms => 'Badai tropis';

  @override
  String get cardSunMoon => 'Matahari dan bulan';

  @override
  String get cardSunrise => 'Matahari terbit';

  @override
  String get cardSunset => 'Matahari terbenam';

  @override
  String get cardSwap => 'Tukar';

  @override
  String get cardSynonyms => 'Serupa:';

  @override
  String get cardTails => 'Angka';

  @override
  String get cardTeam => 'Tim';

  @override
  String get cardTerminal => 'Terminal';

  @override
  String get cardTimeIn => 'Waktu di tiap tempat';

  @override
  String get cardTimeline => 'Linimasa';

  @override
  String get cardToday => 'Hari ini';

  @override
  String get cardTomorrow => 'Besok';

  @override
  String get cardTranslation => 'Terjemahan';

  @override
  String get cardTsunami => 'Tsunami';

  @override
  String get cardUnpin => 'Hapus dari widget';

  @override
  String get cardUnpinned => 'Dihapus dari widgetmu';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'ekstrem';

  @override
  String get cardUvHigh => 'tinggi';

  @override
  String get cardUvLow => 'rendah';

  @override
  String get cardUvModerate => 'sedang';

  @override
  String get cardUvVeryHigh => 'sangat tinggi';

  @override
  String get cardVolume => 'Volume';

  @override
  String get cardWatchlist => 'Daftar pantau';

  @override
  String get cardWeather => 'Cuaca';

  @override
  String get cardWeatherAlerts => 'Peringatan cuaca';

  @override
  String get cardWebsite => 'Situs web';

  @override
  String get cardWind => 'Angin';

  @override
  String get cardWonShort => 'M';

  @override
  String get cardWorldClock => 'Jam dunia';

  @override
  String get cardYesterday => 'Kemarin';

  @override
  String get cardQuakesWorld => 'Gempa bumi terkuat hari ini';

  @override
  String cardMinutesAgo(int n) {
    return '$n mnt lalu';
  }

  @override
  String cardHoursAgo(int n) {
    return '$n j lalu';
  }

  @override
  String cardStale(String ago) {
    return 'Tidak bisa memperbarui · dari $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Diperbarui $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return 'Tertunda $minutes mnt';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'T $high  R $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Terasa seperti $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n hari';
  }

  @override
  String cardUntil(String when) {
    return 'Hingga $when';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n peringatan berlaku',
      one: '1 peringatan berlaku',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return 'Sebagian besar $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'Serbuk sari alder',
      'birch': 'Serbuk sari birch',
      'grass': 'Serbuk sari rumput',
      'mugwort': 'Serbuk sari mugwort',
      'olive': 'Serbuk sari zaitun',
      'ragweed': 'Serbuk sari ragweed',
      'other': 'Serbuk sari',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '$h j $m mnt';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Golden hour mulai $time';
  }

  @override
  String cardMoonLit(int pct) {
    return '$pct% diterangi';
  }

  @override
  String cardMoonrise(String time) {
    return 'Terbit $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Terbenam $time';
  }

  @override
  String cardRangeChange(String range) {
    return 'Perubahan selama $range';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up naik · $down turun';
  }

  @override
  String cardRatesOf(String date) {
    return 'Kurs per $date';
  }

  @override
  String cardAtTime(String when) {
    return 'Pada $when';
  }

  @override
  String cardInDays(int n) {
    return 'dalam $n hari';
  }

  @override
  String cardPercentThere(int pct) {
    return '$pct% tercapai';
  }

  @override
  String cardQuakesNear(String place) {
    return 'Gempa bumi di dekat $place';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n gempa bumi',
      one: '1 gempa bumi',
      zero: 'Tidak ada',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return 'Kedalaman $depth';
  }

  @override
  String cardAway(String distance) {
    return 'berjarak $distance';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n aktif',
      one: '1 aktif',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return 'Peringatan $level';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n pertandingan',
      one: '1 pertandingan',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n berlangsung';
  }

  @override
  String cardMinutes(int n) {
    return '$n mnt';
  }

  @override
  String cardExpected(String date) {
    return 'Diperkirakan $date';
  }

  @override
  String cardCalories(int n) {
    return '$n kkal';
  }

  @override
  String cardStepsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n langkah',
      one: '1 langkah',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return 'Menang $n';
  }

  @override
  String cardServingSize(String size) {
    return 'Takaran saji: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return '$passed dari $total pemeriksaan lulus';
  }

  @override
  String cardTotal(int n) {
    return 'Total $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return 'Setelah $n tahun';
  }

  @override
  String get cardsSettingsTitle => 'Kartu';

  @override
  String get cardsSettingsRow => 'Kota asal, satuan, dan sumber data';

  @override
  String get cardsSettingsIntro =>
      'Bot menjawab cuaca, harga, kurs, waktu, dan lainnya dengan kartu data nyata yang tetap terbaru. Kota asalmu dipakai saat kamu bertanya tanpa menyebut tempat.';

  @override
  String get cardsSettingsSaveFailed => 'Tidak bisa menyimpan. Coba lagi.';

  @override
  String get cardsHomeCity => 'Kota asal';

  @override
  String get cardsHomeClear => 'Hapus';

  @override
  String get cardsHomeNone =>
      'Belum diatur. Bot memakai kota utama zona waktumu sampai kamu memilih satu.';

  @override
  String get cardsHomeSearch => 'Cari kotamu';

  @override
  String get cardsHomePrivacy =>
      'Hanya kota yang disimpan, bukan alamatmu; data ini dikirim ke layanan cuaca sebagai koordinat yang dibulatkan.';

  @override
  String get cardsUnits => 'Satuan';

  @override
  String get cardsTemperature => 'Suhu';

  @override
  String get cardsWind => 'Angin';

  @override
  String get cardsRain => 'Hujan';

  @override
  String get cardsDistance => 'Jarak';

  @override
  String get cardsPrices => 'Harga';

  @override
  String get cardsRedUp => 'Merah berarti naik';

  @override
  String get cardsRedUpHint =>
      'Tampilkan harga yang naik dengan warna merah dan yang turun dengan warna hijau, seperti pasar di Tiongkok, Jepang, dan Korea.';

  @override
  String get cardsSources => 'Sumber data';

  @override
  String get cardsSourcesIntro =>
      'Kartu menampilkan asal dan waktu datanya. Layanan berikut menyediakannya:';

  @override
  String get cardFewerServings => 'Porsi lebih sedikit';

  @override
  String get cardMoreServings => 'Porsi lebih banyak';

  @override
  String get cropTitle => 'Pindahkan dan skalakan';

  @override
  String get cropDone => 'Selesai';

  @override
  String get cropPosition => 'Posisi gambar';

  @override
  String get cropMoveUp => 'Geser ke atas';

  @override
  String get cropMoveDown => 'Geser ke bawah';

  @override
  String get cropMoveLeft => 'Geser ke kiri';

  @override
  String get cropMoveRight => 'Geser ke kanan';

  @override
  String get cropRotate => 'Putar';

  @override
  String get cropMirror => 'Balikkan';

  @override
  String get cropReset => 'Reset';

  @override
  String get cropZoom => 'Zoom';

  @override
  String get cropZoomIn => 'Perbesar';

  @override
  String get cropZoomOut => 'Perkecil';

  @override
  String get cropSoft => 'Terlalu diperbesar: gambar mungkin terlihat buram';

  @override
  String get cropAnimatedStill => 'Gambar animasi tetap diam';

  @override
  String get cropBackground => 'Latar belakang';

  @override
  String get cropBackgroundNone => 'Tidak ada';

  @override
  String cropBackgroundBot(String name) {
    return 'Warna $name';
  }

  @override
  String get cropBackgroundWhite => 'Putih';

  @override
  String get cropBackgroundBlack => 'Hitam';

  @override
  String get cropUnreadable =>
      'Gambar ini tidak bisa dibuka di sini. Coba file JPEG atau PNG.';

  @override
  String cropTooBig(String size) {
    return 'File ini berukuran $size, melebihi batas 40 MB.';
  }

  @override
  String get botPicture => 'Gambar';

  @override
  String botPictureTitle(String name) {
    return 'Gambar $name';
  }

  @override
  String botPictureChange(String name) {
    return 'Ubah gambar $name';
  }

  @override
  String get botPicturePaste => 'Tempel gambar';

  @override
  String get botPictureDraw => 'Buat dengan AI';

  @override
  String get botPictureDrawHelp => 'Casama membuatkan dua gambar untuk dipilih';

  @override
  String get botPictureRecrop => 'Potong ulang';

  @override
  String get botPictureMascot => 'Gunakan maskot saja';

  @override
  String get botPictureRemove => 'Hapus gambar';

  @override
  String get botPictureRecent => 'Terbaru';

  @override
  String get botPictureUpdated => 'Gambar diperbarui';

  @override
  String get botPictureRemoved => 'Gambar dihapus';

  @override
  String get botPictureFailed => 'Tidak dapat menyimpan gambar';

  @override
  String botPictureDrop(String name) {
    return 'Lepaskan untuk digunakan sebagai gambar $name';
  }

  @override
  String botPictureUseAs(String name) {
    return 'Gunakan sebagai gambar $name';
  }

  @override
  String get botPictureUseAsBot => 'Gunakan sebagai gambar bot';

  @override
  String get botPictureWhichBot => 'Bot mana yang mendapatkan gambar ini?';

  @override
  String botDrawTitle(String name) {
    return 'Gambar untuk $name';
  }

  @override
  String get botDrawIntro =>
      'Pilih gaya, tambahkan beberapa kata jika mau, lalu Casama akan membuatkan dua gambar untuk dipilih.';

  @override
  String get botDrawDescribe => 'Deskripsikan (opsional)';

  @override
  String get botDrawHint => 'Burung hantu ramah berkacamata baca';

  @override
  String get botDrawMake => 'Buat 2';

  @override
  String get botDrawMore => 'Buat 2 lagi';

  @override
  String get botDrawPick => 'Ketuk salah satu untuk menggunakannya';

  @override
  String get botDrawCost =>
      'Setiap gambar menggunakan kredit gambar, sama seperti gambar apa pun yang dibuat Casama.';

  @override
  String get botDrawWorking => 'Sedang menggambar…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => '3D lembut';

  @override
  String get botDrawStyleWatercolor => 'Cat air';

  @override
  String get botDrawStyleFlat => 'Ikon datar';

  @override
  String get botDrawStylePixel => 'Seni piksel';

  @override
  String get botDrawStyleLine => 'Seni garis';

  @override
  String get botDrawStylePhoto => 'Foto';

  @override
  String get sharePictureStays =>
      'Gambarnya tetap berada di ruang kerja ini: salinannya mendapatkan maskot sebelumnya, atau inisialnya.';

  @override
  String savedResetRefills(String amount) {
    return 'Mengisi ulang kredit sebesar $amount';
  }

  @override
  String get savedResetClearsDaily => 'Menghapus batas hari ini';

  @override
  String get savedResetGivesHours => 'Mengembalikan jam komputer';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tersisa $count hari',
      one: 'Tersisa 1 hari',
      zero: 'Berakhir hari ini',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Model';

  @override
  String get modelsRowHelp => 'Model Casama atau kuncimu sendiri';

  @override
  String get modelsIntro =>
      'Pilih apakah Casama yang menjalankan botmu atau hubungkan kunci modelmu sendiri. Kunci disimpan terenkripsi dan tidak pernah ditampilkan lagi.';

  @override
  String get whoRunsYourBots => 'Yang menjalankan botmu';

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
      'Termasuk dalam paketmu; menggunakan kredit ruang kerja';

  @override
  String get whoRunsCasamaOffHelp => 'Dijeda pada paketmu saat ini';

  @override
  String get whoRunsOwn => 'Penyediamu sendiri';

  @override
  String get whoRunsOwnHelp =>
      'Ditagih langsung oleh penyediamu; tidak menggunakan kredit Casama';

  @override
  String get whoRunsCasamaShort => 'Model Casama, termasuk dalam paketmu';

  @override
  String get whoRunsCasamaCost => 'Menggunakan kredit';

  @override
  String get whoRunsOwnShort => 'Kuncimu, ditagih oleh penyediamu';

  @override
  String get whoRunsOwnCost => 'Tanpa kredit Casama';

  @override
  String get whoRunsOwnNeedsKey =>
      'Untuk menggunakan penyediamu sendiri, tambahkan kunci chat darinya di bagian Tambahkan kunci di bawah terlebih dahulu.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Pilih model untuk kunci ini di bawah untuk beralih.';

  @override
  String get whoRunsAdminOnly =>
      'Hanya admin ruang kerja yang dapat mengubah pihak yang menjalankan botmu.';

  @override
  String get botModelSource => 'Sumber model';

  @override
  String get botModelSourceWorkspace => 'Default ruang kerja';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'Salah satu kuncimu';

  @override
  String get useCasamaFallback => 'Jika penyediaku gagal, gunakan model Casama';

  @override
  String get useCasamaFallbackHelp =>
      'Saat kuncimu mencapai batas kecepatan atau kuota, beralih ke model Casama menggunakan kredit ruang kerjamu.';

  @override
  String get keyCoversOpenRouter =>
      'Chat, gambar, video, baca lantang, pesan suara, dan dikte';

  @override
  String get keyCoversGoogle => 'Chat dan panggilan langsung';

  @override
  String get keyCoversOpenAi => 'Chat dan pencarian memori';

  @override
  String get keyCoversChat => 'Chat';

  @override
  String get ownProviderPrivacyNote =>
      'Pada penyediamu sendiri, ketentuan penyedia tersebut berlaku untuk apa yang dikirim botmu ke sana. Pengaturan tanpa pelatihan Casama hanya berlaku pada kunci Casama.';

  @override
  String get creditsOwnProviderNote =>
      'Model di penyediamu sendiri tidak menggunakan kredit.';

  @override
  String get routineWaitingForModel => 'Menunggu model';

  @override
  String get ownProviderRequiredTitle => 'Hubungkan model untuk terus chat';

  @override
  String get ownProviderRequiredBody =>
      'Model Casama sedang tidak tersedia di paket ini. Tambahkan kunci modelmu sendiri atau upgrade paketmu.';

  @override
  String get modelNoToolsWarning =>
      'Model ini tidak mendukung alat, sehingga bot hanya dapat membalas dengan teks.';

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
  String get appBrowserTitle => 'Browser di ponsel ini';

  @override
  String get appBrowserTitleMac => 'Browser di Mac ini';

  @override
  String get appBrowserTitleLinux => 'Browser di komputer ini';

  @override
  String get appBrowserTitleWindows => 'Browser di PC ini';

  @override
  String get appBrowserHelp =>
      'Browser kecil di dalam Casama yang dapat digunakan oleh bot yang kamu izinkan saat kamu mengawasi, hanya selama chatnya terbuka di ponsel ini. Sesi masukmu tetap berada di ponsel ini.';

  @override
  String get appBrowserHelpMac =>
      'Browser kecil di dalam Casama yang dapat digunakan oleh bot yang kamu izinkan saat kamu mengawasi, selama Casama terbuka di Mac ini. Sesi masukmu tetap berada di Mac ini.';

  @override
  String get appBrowserHelpLinux =>
      'Browser kecil di dalam Casama yang dapat digunakan oleh bot yang kamu izinkan saat kamu mengawasi, selama Casama terbuka di komputer ini. Sesi masukmu tetap berada di komputer ini.';

  @override
  String get appBrowserHelpWindows =>
      'Browser kecil di dalam Casama yang dapat digunakan oleh bot yang kamu izinkan saat kamu mengawasi, selama Casama terbuka di PC ini. Sesi masukmu tetap berada di PC ini.';

  @override
  String get appBrowserSwitchHelp =>
      'Bot yang kamu izinkan dapat membuka halaman di sini saat chatnya terbuka di ponsel ini.';

  @override
  String get appBrowserSwitchHelpMac =>
      'Bot yang kamu izinkan dapat membuka halaman di sini saat Casama terbuka di Mac ini.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'Bot yang kamu izinkan dapat membuka halaman di sini saat Casama terbuka di komputer ini.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'Bot yang kamu izinkan dapat membuka halaman di sini saat Casama terbuka di PC ini.';

  @override
  String get appBrowserOn => 'Aktif';

  @override
  String get appBrowserOff => 'Nonaktif';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Dinonaktifkan: $reason';
  }

  @override
  String get appBrowserReasonOff => 'belum tersedia.';

  @override
  String get appBrowserReasonNotTester => 'hanya untuk penguji untuk saat ini.';

  @override
  String get appBrowserReasonSystemOff => 'belum tersedia di perangkat ini.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'admin menonaktifkannya untuk ruang kerja ini.';

  @override
  String get appBrowserReasonUnavailable =>
      'server ini tidak memiliki koneksi perangkat.';

  @override
  String get appBrowserReasonUnsupported =>
      'browser perangkat ini tidak dapat menjalankannya.';

  @override
  String get appBrowserReasonNeedsMacos14 =>
      'memerlukan macOS 14 atau lebih baru.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Instal WebKitGTK untuk menggunakan browser di sini: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Instal atau perbarui Microsoft Edge WebView2 untuk menggunakan browser di sini.';

  @override
  String get appBrowserGetWebview2 => 'Dapatkan WebView2';

  @override
  String get appBrowserReasonNoToken =>
      'Dipasangkan pada instalasi sebelumnya. Aktifkan lagi untuk memasangkan perangkat ini.';

  @override
  String get appBrowserAllBots => 'Semua botmu';

  @override
  String get appBrowserAllBotsHelp =>
      'Setiap bot yang bisa kamu ajak chat boleh menggunakan browser ini. Nonaktifkan untuk memilih bot satu per satu.';

  @override
  String get appBrowserModeHeader => 'Saat bot membutuhkan browser';

  @override
  String get appBrowserModeAsk => 'Tanyakan saat membantu';

  @override
  String get appBrowserModeAskHelp =>
      'Tawarkan pilihan saat situs memerlukan login darimu atau memblokir komputer bot.';

  @override
  String get appBrowserModeComputer => 'Selalu komputer bot';

  @override
  String get appBrowserModeComputerHelp =>
      'Jangan pernah tawarkan browser perangkat ini kecuali kamu memintanya di chat.';

  @override
  String get appBrowserModeDevice => 'Utamakan perangkat ini';

  @override
  String get appBrowserModeDeviceHelp =>
      'Gunakan browser perangkat ini untuk login dan situs yang diblokir tanpa bertanya.';

  @override
  String get appBrowserNeverAsk => 'Komputer bot (jangan tanya)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Komputer Linux';

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
      'Menunggumu. Biarkan chat ini tetap terbuka untuk melanjutkan di browsermu.';

  @override
  String browserWaitingSite(String site) {
    return 'Menunggumu. Biarkan chat ini tetap terbuka untuk melanjutkan dengan $site di browsermu.';
  }

  @override
  String get browserWaitEnded => 'Berhenti menunggu browsermu.';

  @override
  String get browserHandBackWaiting =>
      'Giliranmu di browser. Lakukan langkah di halaman, lalu ketuk Kembalikan.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'Giliranmu di $site. Lakukan langkah di halaman, lalu ketuk Kembalikan.';
  }

  @override
  String get browserHandBackEnded =>
      'Berhenti menunggumu mengembalikan browser.';

  @override
  String get browserChoiceCardLabel => 'Pilihan browser';

  @override
  String browserChoiceTitle(String bot, String site) {
    return 'Di mana $bot sebaiknya membuka $site?';
  }

  @override
  String get browserChoiceSubtitleSignIn =>
      'Situs ini memerlukan login darimu.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'Situs ini memblokir komputer $bot.';
  }

  @override
  String get browserChoiceOnPhone => 'Di ponsel ini';

  @override
  String get browserChoiceOnMac => 'Di Mac ini';

  @override
  String get browserChoiceOnLinux => 'Di komputer ini';

  @override
  String get browserChoiceOnWindows => 'Di PC ini';

  @override
  String get browserChoiceOnDeviceHelp =>
      'Kamu mengawasi, dan bisa masuk sendiri. Apa yang dibacanya dikirim ke AI.';

  @override
  String get browserChoiceInChrome => 'Di Chrome-mu';

  @override
  String get browserChoiceInChromeHelp => 'Sudah masuk ke situs-situsmu.';

  @override
  String browserChoiceOnComputer(String bot) {
    return 'Di komputer $bot';
  }

  @override
  String get browserChoiceOnComputerHelp => 'Tetap berjalan meski kamu pergi.';

  @override
  String browserChoiceRemember(String site) {
    return 'Ingat untuk $site';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return '$site dibuka di ponsel ini';
  }

  @override
  String browserChoicePickedMac(String site) {
    return '$site dibuka di Mac ini';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return '$site dibuka di komputer ini';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return '$site dibuka di PC ini';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return '$site dibuka di Chrome-mu';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return '$site dibuka di komputer $bot';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'Tidak ada jawaban tepat waktu; tetap di komputer $bot';
  }

  @override
  String get appBrowserConsentTitle =>
      'Izinkan bot menggunakan browser di Casama?';

  @override
  String get appBrowserConsentPages =>
      'Halaman yang dibaca bot di sini dikirim ke Casama dan ke model AI bot, sama seperti halaman yang dibacanya di komputernya sendiri.';

  @override
  String get appBrowserConsentSignIns =>
      'Sesi masukmu tetap di perangkat ini. Bot tidak pernah melihat kata sandi, nomor kartu, atau kode; kamu mengetiknya sendiri.';

  @override
  String get appBrowserConsentWatch =>
      'Ini hanya berfungsi saat chat bot terbuka di sini. Kamu dapat mengawasi, mengambil alih, atau menghentikannya kapan saja.';

  @override
  String get appBrowserConsentYours =>
      'Apa yang kamu jelajahi sendiri tidak pernah dikirim ke mana pun.';

  @override
  String get appBrowserBots => 'Bot yang boleh menggunakannya';

  @override
  String get appBrowserBotsHelp =>
      'Hanya bot yang diaktifkan di sini yang dapat menggunakan browser di perangkat ini.';

  @override
  String get appBrowserNoBots => 'Belum ada bot.';

  @override
  String get appBrowserSites => 'Situs';

  @override
  String get appBrowserSitesHelp =>
      'Situs yang kamu jawab Selalu atau Jangan Pernah. Hapus salah satu agar ditanya lagi lain kali.';

  @override
  String get appBrowserNoSites =>
      'Belum ada situs. Bot akan bertanya saat pertama kali membuka suatu situs.';

  @override
  String appBrowserRemoveSite(String site) {
    return 'Hapus $site';
  }

  @override
  String get appBrowserKinds => 'Situs yang tetap nonaktif';

  @override
  String get appBrowserKindsHelp =>
      'Jenis situs ini tetap nonaktif kecuali kamu mengaktifkannya. Saat aktif, bot tetap akan bertanya setiap kali.';

  @override
  String get appBrowserKindBanking => 'Perbankan dan pembayaran';

  @override
  String get appBrowserKindHealth => 'Kesehatan';

  @override
  String get appBrowserKindPasswords => 'Pengelola kata sandi';

  @override
  String get appBrowserKindGovernment => 'Identitas pemerintah';

  @override
  String get appBrowserSignIn => 'Masuk ke situs';

  @override
  String get appBrowserSignInHelp =>
      'Buka situs, masuk sendiri, lalu izinkan botmu menggunakannya. Tidak ada yang kamu lakukan di sana yang dikirim ke mana pun.';

  @override
  String get appBrowserClearData => 'Hapus data penjelajahan';

  @override
  String get appBrowserClearDataHelp =>
      'Mengeluarkan browser ini dari setiap situs dan menghapus apa yang disimpan situs.';

  @override
  String get appBrowserClearDataConfirm =>
      'Hapus sesi masuk dan data situs browser ini?';

  @override
  String get appBrowserClearDataDone => 'Data penjelajahan dihapus';

  @override
  String get appBrowserUnpair => 'Putuskan pasangan perangkat ini';

  @override
  String get appBrowserUnpairConfirm =>
      'Putuskan pasangan browser perangkat ini? Bot tidak bisa menggunakannya sampai kamu mengaktifkannya lagi.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot sedang bekerja';
  }

  @override
  String get appBrowserTakeOver => 'Ambil alih';

  @override
  String get appBrowserHandBack => 'Kembalikan';

  @override
  String get appBrowserYourTurn => 'Giliranmu';

  @override
  String appBrowserPaused(String bot) {
    return '$bot dijeda saat kamu menggunakan halaman';
  }

  @override
  String get appBrowserAway => 'Dijeda: chat tidak terbuka';

  @override
  String get appBrowserAddress => 'Alamat situs';

  @override
  String get appBrowserBack => 'Kembali';

  @override
  String get appBrowserForward => 'Maju';

  @override
  String get appBrowserReload => 'Muat ulang';

  @override
  String get appBrowserAllowSite => 'Izinkan botku menggunakan situs ini';

  @override
  String appBrowserSiteAdded(String site) {
    return '$site ditambahkan. Botmu dapat menggunakannya di sini.';
  }

  @override
  String get appBrowserAddressRefused =>
      'Alamat itu tidak bisa dibuka di sini.';

  @override
  String get appBrowserSecure => 'Koneksi aman';

  @override
  String get appBrowserNotSecure => 'Tidak aman';

  @override
  String get appBrowserCardLabel => 'Browser dalam aplikasi';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot ingin membuka $site';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'Di Casama pada perangkat ini, dengan sesi masukmu. Selalu mengizinkannya membuka situs ini mulai sekarang.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'Di Mac ini, dengan sesi masukmu. Selalu mengizinkannya membuka situs ini mulai sekarang.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'Di komputer ini, dengan sesi masukmu. Selalu mengizinkannya membuka situs ini mulai sekarang.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'Di PC ini, dengan sesi masukmu. Selalu mengizinkannya membuka situs ini mulai sekarang.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': 'Situs Perbankan dan Pembayaran selalu bertanya setiap kali.',
      'health': 'Situs Kesehatan selalu bertanya setiap kali.',
      'passwords': 'Situs Pengelola Kata Sandi selalu bertanya setiap kali.',
      'government': 'Situs Identitas Pemerintah selalu bertanya setiap kali.',
      'other': 'Situs ini selalu bertanya setiap kali.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Sekali';

  @override
  String get appBrowserAlways => 'Selalu';

  @override
  String get appBrowserNever => 'Jangan pernah';

  @override
  String appBrowserStepAskTitle(String bot) {
    return 'Izinkan $bot melakukan ini?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'Di Casama pada perangkat ini, dengan sesi masukmu.';

  @override
  String get appBrowserStepAskHelpMac => 'Di Mac ini, dengan sesi masukmu.';

  @override
  String get appBrowserStepAskHelpLinux =>
      'Di komputer ini, dengan sesi masukmu.';

  @override
  String get appBrowserStepAskHelpWindows => 'Di PC ini, dengan sesi masukmu.';

  @override
  String appBrowserStepClick(String name) {
    return 'Ketuk “$name”';
  }

  @override
  String appBrowserStepType(String name) {
    return 'Ketik ke “$name”';
  }

  @override
  String appBrowserStepPress(String name) {
    return 'Tekan tombol di “$name”';
  }

  @override
  String appBrowserStepUpload(String name) {
    return 'Unggah file ke “$name”';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: “$name”';
  }

  @override
  String get appBrowserDontAllow => 'Jangan izinkan';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Ponsel Android';

  @override
  String get toolOnThisPhone => 'di perangkat ini';

  @override
  String get appBrowserWorkspaceSwitch =>
      'Bot di browser dalam aplikasi anggota';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'Anggota dapat mengizinkan bot menggunakan browser di dalam Casama pada ponsel atau komputer mereka, sambil mengawasi.';

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
  String get vendorRenewalUsd => 'Biaya perpanjangan (USD)';

  @override
  String get vendorRenewalMonths => 'Jumlah bulan perpanjangan';

  @override
  String get vendorSeeSpend => 'Lihat pengeluaran';

  @override
  String get costSpent => 'Dibelanjakan';

  @override
  String get costCharged => 'Ditagih';

  @override
  String get costMargin => 'Margin';

  @override
  String get costMarginNone => 'Tidak ada yang ditagih';

  @override
  String get costNotRecorded => 'Tidak tercatat';

  @override
  String get costNotRecordedHint =>
      'Menunjukkan arti angka ini dan layanan mana yang terkait';

  @override
  String get costNotRecordedHelp =>
      'Beberapa layanan melaporkan totalnya sendiri. Jika angka mereka lebih tinggi dari yang dicatat server ini, selisihnya tampil di sini. Ini adalah pengeluaran nyata yang belum terkait dengan fitur, kunci, atau ruang kerja mana pun.';

  @override
  String get costNotRecordedWhy => 'Yang dilaporkan layanan di atas angka ini';

  @override
  String get costNotRecordedNone => 'Cocok dengan yang dilaporkan layanan';

  @override
  String get costNotRecordedAllMatch =>
      'Setiap layanan yang melaporkan total cocok dengan yang dicatat server ini.';

  @override
  String get costNotRecordedNoList =>
      'Daftar layanan sedang tidak tersedia sekarang. Coba lagi sebentar.';

  @override
  String get costNoVendorFigures => 'Tidak ada layanan yang melaporkan total';

  @override
  String get costNoVendorFiguresHelp =>
      'Tidak ada layanan yang melaporkan totalnya sendiri untuk periode ini, jadi tidak ada yang bisa dibandingkan.';

  @override
  String costNoFigureFrom(String names) {
    return 'Tidak ada total dari: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count layanan',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'Kata mereka $theirs · kami mencatat $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'Kata mereka $theirs · kami mencatat $ours · $gap tidak tercatat';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'Kata mereka $theirs · kami mencatat $ours · tidak ada yang kurang';
  }

  @override
  String get costNoVendorFigure =>
      'Layanan ini tidak memberikan totalnya sendiri untuk periode ini.';

  @override
  String get costNoVendorFigureKind =>
      'Layanan ini tidak melaporkan totalnya sendiri.';

  @override
  String costUpdated(String when) {
    return 'Diperbarui $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'dibanding $days hari sebelumnya',
      one: 'dibanding sehari sebelumnya',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown =>
      'tidak ada periode sebelumnya untuk dibandingkan';

  @override
  String get costChangeNew => 'Baru';

  @override
  String get costChangeNewSpoken => 'baru di periode ini';

  @override
  String get costChangeFlat => 'tidak berubah';

  @override
  String costChangeUp(String amount) {
    return 'naik $amount';
  }

  @override
  String costChangeDown(String amount) {
    return 'turun $amount';
  }

  @override
  String costPoints(String count) {
    return '$count poin';
  }

  @override
  String get costOther => 'Lainnya';

  @override
  String get costNotLabelled => 'Tanpa label';

  @override
  String get costNotLabelledHelp =>
      'Biaya ini dicatat tanpa label untuk pengelompokan ini, sehingga tidak dapat dipisah lebih lanjut. Biayanya tetap masuk dalam total.';

  @override
  String get costGroupService => 'Layanan';

  @override
  String get costGroupKey => 'Kunci';

  @override
  String get costGroupApp => 'Aplikasi & MCP';

  @override
  String get costGroupFeature => 'Fitur';

  @override
  String get costGroupModel => 'Model';

  @override
  String get costGroupWorkspace => 'Ruang kerja';

  @override
  String get costGroupBy => 'Kelompokkan menurut';

  @override
  String get costFilters => 'Filter';

  @override
  String get costNoFilters =>
      'Tidak ada. Buka baris dan pilih Tampilkan di tabel untuk mempersempit tampilan.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'Hapus filter $name';
  }

  @override
  String get costIncludeFixed => 'Sertakan tagihan tetap';

  @override
  String get costIncludeFixedHelp =>
      'Menambahkan langganan dan perpanjangan ke Dibelanjakan, dibagi rata sepanjang hari yang dicakupnya.';

  @override
  String get costOptions => 'Periode dan filter';

  @override
  String get costPeriod => 'Periode';

  @override
  String costPeriodDays(int days) {
    return '$days hari';
  }

  @override
  String get costPeriodCustom => 'Kustom';

  @override
  String costLastDays(int days) {
    return '$days hari terakhir';
  }

  @override
  String get costChangeDates => 'Ubah tanggal';

  @override
  String get costDone => 'Selesai';

  @override
  String get costDaysUtc => 'Hari menggunakan UTC.';

  @override
  String get costDailySpend => 'Pengeluaran harian';

  @override
  String costStackedBy(String group) {
    return 'Ditumpuk berdasarkan $group: yang terbesar, lalu Lainnya.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Grafik pengeluaran harian, $days hari, total $total. Hari tertinggi adalah $peakDay sebesar $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Grafik pengeluaran harian, $days hari, tidak ada pengeluaran.';
  }

  @override
  String get costSourceMetered => 'Terukur';

  @override
  String get costSourceCounted => 'Terhitung';

  @override
  String get costSourceFixed => 'Tetap';

  @override
  String get costSourceEstimated => 'Perkiraan';

  @override
  String get costSourceMeteredHelp =>
      'Biaya nyata yang dicatat untuk setiap panggilan.';

  @override
  String get costSourceCountedHelp =>
      'Hitungan server ini sendiri dikalikan harga satuan.';

  @override
  String get costSourceFixedHelp =>
      'Tagihan yang dibagi rata sepanjang hari yang dicakupnya.';

  @override
  String get costSourceEstimatedHelp =>
      'Dihitung dari panjang teks. Biaya sebenarnya minimal sebesar ini.';

  @override
  String get costEstimated => 'perkiraan';

  @override
  String get costColShare => 'Porsi';

  @override
  String get costColChange => 'Perubahan';

  @override
  String get costColCalls => 'Panggilan';

  @override
  String get costColSource => 'Sumber';

  @override
  String get costColFailed => 'Gagal';

  @override
  String get costColFees => 'Biaya vendor';

  @override
  String get costColTokens => 'Biaya token';

  @override
  String get costTokenCost => 'Biaya token';

  @override
  String get costFailureRate => 'Tingkat kegagalan';

  @override
  String costSortBy(String column) {
    return 'Urutkan menurut $column';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, diurutkan terendah ke tertinggi';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, diurutkan tertinggi ke terendah';
  }

  @override
  String get costOpenRowHint => 'Membuka detail';

  @override
  String costSpokenSpent(String amount) {
    return 'dibelanjakan $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return 'biaya vendor $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '$share dari total';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count panggilan';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate gagal';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'perkiraan biaya token $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return 'ditagih $amount';
  }

  @override
  String costCallsCount(String count) {
    return '$count panggilan';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate gagal';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount token, perkiraan';
  }

  @override
  String get costOpenBilling => 'Buka halaman penagihan';

  @override
  String get costByDay => 'Per hari';

  @override
  String get costSplitBy => 'Pisahkan menurut';

  @override
  String get costShowInTable => 'Tampilkan di tabel';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Mempersempit tabel ke $name dan mengelompokkannya menurut $group.';
  }

  @override
  String get costNothingRecorded =>
      'Tidak ada yang tercatat di sini pada periode ini.';

  @override
  String costLastUsed(String when) {
    return 'terakhir dipakai $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dan $count lagi. Tampilkan di tabel.',
      one: 'Dan 1 lagi. Tampilkan di tabel.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'Kegunaan';

  @override
  String get costKeyService => 'Layanan';

  @override
  String get costKeySetting => 'Pengaturan';

  @override
  String get costKeySetIn => 'Tempat diatur';

  @override
  String get costKeyVault => 'Item brankas';

  @override
  String get costKeyStatus => 'Status';

  @override
  String get costKeyConfigured => 'Diatur';

  @override
  String get costKeyNotConfigured => 'Belum diatur';

  @override
  String get costKeyLastUsed => 'Terakhir dipakai';

  @override
  String get costKeyNotUsed => 'Tidak dalam periode ini';

  @override
  String get costKeyCap => 'Batas pengeluaran';

  @override
  String costKeyCapLeft(String left, String cap) {
    return 'Tersisa $left dari $cap';
  }

  @override
  String costKeyCapUsed(String share) {
    return '$share dari batas terpakai';
  }

  @override
  String get costKeyNoCap => 'Tidak ada';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Tidak ada pengeluaran dalam $days hari ini',
      one: 'Tidak ada pengeluaran di hari ini',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'Tidak ada pengeluaran pada hari-hari ini';

  @override
  String get costEmptyFiltered =>
      'Tidak ada pengeluaran yang cocok dengan filter ini';

  @override
  String get costEmptyGroup =>
      'Tidak ada yang perlu ditampilkan untuk pengelompokan ini';

  @override
  String get costAppsNote =>
      'Aplikasi dan server MCP: Dibelanjakan adalah yang ditagih vendor. Biaya token adalah perkiraan biaya hasilnya dalam token model, dan sudah menjadi bagian dari pengeluaran model.';

  @override
  String costFixedLeftOut(String amount) {
    return '$amount dalam tagihan tetap untuk periode ini tidak disertakan. Aktifkan Sertakan tagihan tetap untuk menambahkannya.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Ruang kerja membayar $amount pada kuncinya sendiri. Itu bukan uang server ini, jadi tidak disertakan.';
  }

  @override
  String get costOlderServerTitle => 'Server ini perlu pembaruan';

  @override
  String get costOlderServer =>
      'Biaya menurut layanan, kunci, dan aplikasi tersedia di versi server yang lebih baru. Perbarui server, lalu periksa lagi.';

  @override
  String get costCheckAgain => 'Periksa lagi';

  @override
  String get costSpendCardTitle => 'Pengeluaran, 30 hari terakhir';

  @override
  String get costSpendCardOpen => 'Biaya';

  @override
  String get costSpendCardHint => 'Membuka tab biaya';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Pengeluaran dalam 30 hari terakhir: $spent dibelanjakan, $charged ditagih, margin $margin';
  }

  @override
  String get costSort => 'Urutkan menurut';

  @override
  String get costSortName => 'Nama';

  @override
  String get costByWorkspace => 'Menurut ruang kerja';

  @override
  String get costTopTools => 'Alat teratas';

  @override
  String get costToolList => 'Daftar alat yang dikirim ke model';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Dan $count alat lagi.',
      one: 'Dan 1 alat lagi.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Gunakan bot Telegram Casama';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Bicara dengan $bot di Telegram. Sekali ketuk, tanpa perlu diatur.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Telegram-mu terhubung di ruang kerja lain. Menghubungkan di sini akan memindahkannya.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'Pesanmu di sana dikirim ke $bot.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'Pesanmu di sana dikirim ke $other. Ketuk untuk mengirimkannya ke $bot.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Pesan Telegram sekarang dikirim ke $bot.';
  }

  @override
  String get telegramFinish => 'Selesaikan di Telegram';

  @override
  String get telegramFinishHelp =>
      'Tekan Mulai di Telegram. Lakukan ini hanya di akun Telegram-mu sendiri. Ini akan diperbarui setelah kamu terhubung.';

  @override
  String get telegramOpenAgain => 'Buka Telegram lagi';

  @override
  String get telegramConnected => 'Telegram terhubung';

  @override
  String telegramConnectedHelp(String name) {
    return 'Terhubung sebagai $name. Kirim pesan ke bot di Telegram kapan saja; chatnya juga tampil di sini pada Umum.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Kirim pesan ke bot di Telegram kapan saja; chatnya juga tampil di sini pada Umum.';

  @override
  String get telegramConnect => 'Hubungkan Telegram';

  @override
  String get telegramDisconnect => 'Putuskan Telegram';

  @override
  String get telegramDisconnectConfirm => 'Putuskan Telegram?';

  @override
  String get telegramDisconnectHelp =>
      'Botmu berhenti membalas di Telegram. Riwayat chatmu tetap di sini.';

  @override
  String get telegramPickBot => 'Pesan Telegram dikirim ke';

  @override
  String get telegramNeedsBot => 'Buat bot dulu, lalu hubungkan Telegram.';

  @override
  String get telegramNotOffered =>
      'Server ini tidak memiliki bot Telegram sendiri. Kamu bisa menghubungkan botmu sendiri dari Aplikasi chat milik bot.';

  @override
  String get chatAppsSettingsHelp =>
      'Bicara dengan botmu dari aplikasi chat yang sudah kamu gunakan. Pesan masuk ke chat Umum, jadi kamu bisa melanjutkannya di sini.';

  @override
  String get chatAppsPerBot =>
      'Email dan botmu sendiri diatur per bot: buka bot, lalu Aplikasi chat.';

  @override
  String get chatAppsRowHelp => 'Telegram, Discord, Slack, dan lainnya';

  @override
  String get chatAppsSlackHelp =>
      'Slack ditambahkan per ruang kerja Slack, untuk satu bot. Pilih bot, lalu Tambahkan ke Slack.';

  @override
  String get chatAppsSlackPickBot => 'Tambahkan Slack untuk';

  @override
  String get slackAnyoneInWorkspace => 'Siapa pun di ruang kerja Slack ini';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Semua orang di ruang kerja bisa berbicara dengan bot, tidak hanya orang-orang dalam daftar. Persetujuan tetap membutuhkan seseorang di daftar.';

  @override
  String get discordUseCasama => 'Gunakan bot Discord Casama';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Bicara dengan $bot di Discord. Masuk dengan Discord sekali, lalu kirim pesan ke bot atau gunakan /ask di mana saja.';
  }

  @override
  String get discordOtherWorkspace =>
      'Discord-mu terhubung di ruang kerja lain. Menghubungkan di sini akan memindahkannya.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Pesan Discord sekarang dikirim ke $bot.';
  }

  @override
  String get discordFinish => 'Selesaikan di Discord';

  @override
  String get discordFinishHelp =>
      'Masuk dengan Discord di browsermu dan izinkan Casama. Lakukan ini hanya dengan akun Discord-mu sendiri. Ini akan diperbarui setelah kamu terhubung.';

  @override
  String get discordOpenAgain => 'Buka login Discord lagi';

  @override
  String get discordConnected => 'Discord terhubung';

  @override
  String discordConnectedHelp(String name) {
    return 'Terhubung sebagai $name. Kirim pesan ke bot Casama di Discord atau gunakan /ask di mana saja; chatnya juga tampil di sini pada Umum.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Kirim pesan ke bot Casama di Discord atau gunakan /ask di mana saja; chatnya juga tampil di sini pada Umum.';

  @override
  String get discordConnect => 'Hubungkan Discord';

  @override
  String get discordDisconnect => 'Putuskan Discord';

  @override
  String get discordDisconnectConfirm => 'Putuskan Discord?';

  @override
  String get discordDisconnectHelp =>
      'Botmu berhenti membalas di Discord. Riwayat chatmu tetap di sini.';

  @override
  String get discordPickBot => 'Pesan Discord dikirim ke';

  @override
  String get discordNeedsBot => 'Buat bot dulu, lalu hubungkan Discord.';

  @override
  String get discordNotOffered =>
      'Server ini tidak memiliki aplikasi Discord sendiri. Kamu bisa menghubungkan aplikasi Discord-mu sendiri dari Aplikasi chat milik bot.';

  @override
  String get inactiveAccountsNote =>
      'Jika kamu berhenti menggunakan Casama: setelah 30 hari, rutinitas dan pemantaumu dijeda sampai kamu kembali. Setelah 6 bulan, file tersimpan di komputermu dihapus, dan setelah 12 bulan (24 jika kamu pernah membayar) akunmu juga dihapus. Kami mengirimimu email sebelum apa pun dihapus. Akun dengan paket berbayar tidak pernah terpengaruh.';

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
  String get inactivityModeOff => 'Nonaktif';

  @override
  String get inactivityModeReport => 'Laporan';

  @override
  String get inactivityModeOn => 'Aktif';

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
    return 'aktif $when';
  }

  @override
  String get inactivityStateResting => 'Beristirahat';

  @override
  String get inactivityStateFilesSoon => 'File segera dihapus';

  @override
  String get inactivityStateRemovalSoon => 'Penghapusan segera';

  @override
  String get inactivityStateRemoving => 'Sedang dihapus';

  @override
  String get inactivityKept => 'Dipertahankan';

  @override
  String get keepAccount => 'Pertahankan akun ini';

  @override
  String get keepAccountHelp =>
      'Tidak pernah diistirahatkan atau dihapus karena tidak digunakan';

  @override
  String get computerFilesRemoved => 'File tersimpan dihapus';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'Komputer ini tidak digunakan selama 6 bulan, sehingga file tersimpannya dihapus pada $date. Komputer dimulai dari awal.';
  }

  @override
  String get downloadSavedFiles => 'Unduh file tersimpan';

  @override
  String get downloadSavedFilesHelp =>
      'File .tar.gz dari folder berandanya, tanpa membangunkannya';

  @override
  String get liveActivity => 'Aktivitas langsung';

  @override
  String get liveRowHelp =>
      'Daftar tunggu, pendaftaran, dan unduhan secara real-time';

  @override
  String get liveRefresh => 'Segarkan';

  @override
  String get liveTabActivity => 'Aktivitas';

  @override
  String get liveTabAlerts => 'Peringatan';

  @override
  String get liveGroupAll => 'Semua';

  @override
  String get liveGroupWaitlist => 'Daftar tunggu';

  @override
  String get liveGroupAccounts => 'Akun';

  @override
  String get liveGroupMoney => 'Uang';

  @override
  String get liveGroupWebsite => 'Situs web';

  @override
  String get liveGroupGrowth => 'Pertumbuhan';

  @override
  String get liveGroupSupport => 'Dukungan';

  @override
  String get liveKindWaitlistJoined => 'Masuk daftar tunggu';

  @override
  String get liveKindWaitlistAdmitted => 'Diizinkan masuk dari daftar tunggu';

  @override
  String get liveKindSignup => 'Akun baru';

  @override
  String get liveKindSignupRefused => 'Pendaftaran ditolak';

  @override
  String get liveKindFirstChat => 'Chat pertama';

  @override
  String get liveKindMilestone =>
      'Pertama kali lainnya (bot, komputer, panggilan, rutinitas)';

  @override
  String get liveKindSubscription => 'Langganan baru';

  @override
  String get liveKindSubscriptionEnded => 'Langganan berakhir';

  @override
  String get liveKindPurchase => 'Kredit dibeli';

  @override
  String get liveKindSupportTicket => 'Tiket dukungan';

  @override
  String get liveKindFeedback => 'Masukan';

  @override
  String get liveKindAccountDeleted => 'Akun dihapus';

  @override
  String get liveKindDownloadClick => 'Klik unduh';

  @override
  String get liveKindQrOpen => 'Kode QR unduhan dibuka';

  @override
  String get liveKindStartClick => 'Mulai gratis diklik';

  @override
  String get liveKindInviteOpen => 'Tautan undangan dibuka';

  @override
  String get liveNow => 'baru saja';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes mnt';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours jam';
  }

  @override
  String get liveTestSent => 'Peringatan uji dikirim ke perangkatmu';

  @override
  String get liveTodayWaitlist => 'Bergabung hari ini';

  @override
  String get liveTodaySignups => 'Akun hari ini';

  @override
  String get liveTodayDownloads => 'Unduhan hari ini';

  @override
  String get liveTodayMoney => 'Uang hari ini';

  @override
  String get liveRetry => 'Coba lagi';

  @override
  String get liveEmpty =>
      'Belum ada apa-apa. Aktivitas baru muncul di sini dalam hitungan detik.';

  @override
  String get liveOlder => 'Tampilkan yang lebih lama';

  @override
  String get liveAlertsHelp =>
      'Pilih apa yang dikirim ke ponsel, Mac, dan browsermu. Saat banyak hal terjadi bersamaan, kamu mendapat satu ringkasan alih-alih notifikasi untuk tiap hal.';

  @override
  String get livePauseAll => 'Jeda semua peringatan';

  @override
  String get livePauseAllHelp => 'Aktivitas tetap tampil di sini';

  @override
  String get liveSendTest => 'Kirim peringatan uji';

  @override
  String get liveSendTestHelp =>
      'Periksa apakah peringatan mencapai perangkat ini';

  @override
  String get liveAlertsFooter =>
      'Peringatan menunggu selama jam tenangmu (Pengaturan → Notifikasi) dan tiba sebagai satu ringkasan setelahnya. Di browser, izinkan notifikasi untuk situs ini agar menerimanya di sana.';

  @override
  String get liveStatusOn => 'Langsung: diperbarui setiap beberapa detik';

  @override
  String get liveStatusPaused => 'Langsung. Peringatan dijeda';

  @override
  String get liveGroupApp => 'Aplikasi';

  @override
  String get liveKindAppFirstOpen => 'Aplikasi dibuka untuk pertama kalinya';

  @override
  String get liveKindAppReinstall => 'Aplikasi diinstal ulang';

  @override
  String get liveKindSigninStarted => 'Mulai masuk';

  @override
  String get liveKindTrialStarted => 'Uji coba dimulai';

  @override
  String get liveKindRenewal => 'Langganan diperpanjang';

  @override
  String get liveKindRefund => 'Pengembalian dana';

  @override
  String get liveKindDisputeOpened => 'Sengketa dibuka';

  @override
  String get liveKindPlanCancelFailed => 'Paket tidak dibatalkan';

  @override
  String get liveKindStoreReview => 'Ulasan toko';

  @override
  String get liveKindStoreCrashes => 'Laporan crash toko';

  @override
  String get liveKindDay2Return => 'Kembali pada hari ke-2';

  @override
  String get liveKindWeek1Return => 'Kembali pada minggu ke-1';

  @override
  String get liveKindDeviceGone => 'Aplikasi kemungkinan dihapus';

  @override
  String get liveKindPartnerInterest => 'Kreator tertarik pada Partners';

  @override
  String get liveKindCreatorOpen => 'Tautan kreator dibuka';

  @override
  String get liveKindPartnerClaimed => 'Kode kreator digunakan';

  @override
  String get liveKindGiftOpen => 'Tautan hadiah dibuka';

  @override
  String get liveKindCompRedeemed => 'Paket hadiah ditukarkan';

  @override
  String get liveKindReferralRewarded => 'Undangan membuahkan hasil';

  @override
  String get liveKindNewsletterConfirmed => 'Pendaftaran buletin';

  @override
  String get liveKindTestimonialSubmitted => 'Testimoni untuk ditinjau';

  @override
  String get liveDailyDigest => 'Ringkasan pagi';

  @override
  String get liveDailyDigestHelp =>
      'Corong dan unduhan kemarin, pukul 9 sesuai zona waktumu';

  @override
  String get liveFunnelClicks => 'Klik';

  @override
  String get liveFunnelOpens => 'Pembukaan pertama';

  @override
  String get liveFunnelSignups => 'Akun';

  @override
  String get liveFunnelChats => 'Chat pertama';

  @override
  String get liveFunnelPaying => 'Berbayar';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent%';
  }

  @override
  String get liveByPerson => 'Per orang';

  @override
  String get liveSearch => 'Cari email, negara, sumber';

  @override
  String get liveNoMatches => 'Tidak ada yang cocok dengan pencarian itu';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count langkah',
      one: '1 langkah',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'kemungkinan';

  @override
  String get liveStepClick => 'Unduh diklik';

  @override
  String get liveStepOpen => 'Aplikasi dibuka';

  @override
  String get liveStepSignup => 'Akun dibuat';

  @override
  String get liveStepChat => 'Chat pertama';

  @override
  String get liveStepPaying => 'Membayar';

  @override
  String get liveJourneyTitle => 'Yang terjadi';

  @override
  String get liveJourneyVisitor => 'Pengunjung';

  @override
  String get liveJourneyWho => 'Siapa';

  @override
  String get liveJourneyFrom => 'Dari mana';

  @override
  String get liveJourneyDevice => 'Perangkat';

  @override
  String get liveJourneyTimeline => 'Linimasa';

  @override
  String get liveJourneyNow => 'Sekarang';

  @override
  String get liveJourneySource => 'Sumber';

  @override
  String get liveJourneyCampaign => 'Kampanye';

  @override
  String get liveJourneyLanding => 'Halaman pertama';

  @override
  String get liveJourneyClickedFrom => 'Diklik pada';

  @override
  String get liveJourneyPlatform => 'Platform';

  @override
  String get liveJourneyStore => 'Dari';

  @override
  String get liveJourneyVersion => 'Versi';

  @override
  String get liveJourneyCountry => 'Negara';

  @override
  String get liveJourneyLikelyHelp =>
      'Dicocokkan dengan klik situs web berdasarkan perangkat, negara, dan waktu, bukan tautan. Anggap sebagai tebakan yang cukup akurat.';

  @override
  String get liveJourneyPlan => 'Paket';

  @override
  String get liveJourneyMessages => 'Pesan terkirim';

  @override
  String get liveJourneyBots => 'Bot';

  @override
  String get liveJourneyDevices => 'Masuk di';

  @override
  String get liveJourneyLastActive => 'Terakhir aktif';

  @override
  String get liveJourneyJoined => 'Akun dibuat';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap kemudian';
  }

  @override
  String get liveJourneyNone => 'Belum ada detail lebih lanjut tentang ini.';

  @override
  String get liveJourneyCopyEmail => 'Salin email';

  @override
  String get liveJourneyCopied => 'Email disalin';

  @override
  String get liveJourneyOpenAdmin => 'Buka di Admin';

  @override
  String get liveJourneyGone =>
      'Data ini lebih lama dari 30 hari, sehingga detailnya sudah hilang.';

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
  String get planChangeTitle => 'Konfirmasi perubahan paket';

  @override
  String planChangeSwitchTo(String plan) {
    return 'Beralih ke $plan';
  }

  @override
  String get planChangeChargedNow => 'Ditagih sekarang';

  @override
  String planChangeTaxIncluded(String tax) {
    return 'Termasuk pajak $tax';
  }

  @override
  String get planChangeCredit => 'Potongan sisa waktu';

  @override
  String planChangeThen(String amount, String period) {
    return 'Lalu $amount / $period (sebelum pajak)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Penagihan berikutnya pada $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Konfirmasi dan bayar';

  @override
  String get planChangeHaveCode => 'Punya kode?';

  @override
  String get planChangeCodeLabel => 'Kode diskon';

  @override
  String get planChangeCodeHint => 'Masukkan kode';

  @override
  String get planChangeApply => 'Terapkan';

  @override
  String get planChangeRemove => 'Hapus';

  @override
  String get planChangeDiscountApplied => 'Diskon diterapkan';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return 'Diskon $percent%, setiap perpanjangan';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Diskon $percent%, untuk $count perpanjangan',
      one: 'Diskon $percent%, untuk 1 perpanjangan',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return 'Potongan $amount, setiap perpanjangan';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Potongan $amount, untuk $count perpanjangan',
      one: 'Potongan $amount, untuk 1 perpanjangan',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return 'Diskon $percent% tiap perpanjangan; berakhir jika kamu mengganti paket lagi';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return 'Potongan $amount tiap perpanjangan; berakhir jika kamu mengganti paket lagi';
  }

  @override
  String get planChangeInvalidCode =>
      'Kode itu tidak dapat digunakan di paket ini.';

  @override
  String get planChangeCodeCostsMore =>
      'Kode ini akan menggantikan diskonmu saat ini dan berbiaya lebih mahal.';

  @override
  String get planChangeCodeEndsLasting =>
      'Kode ini akan mengakhiri diskon tetapmu saat ini.';

  @override
  String get planChangeCodeNotBetter =>
      'Kamu sudah memiliki diskon yang sama atau lebih besar.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Menggantikan diskon $percent%-mu saat ini';
  }

  @override
  String get planChangeReplacesDiscount => 'Menggantikan diskonmu saat ini';

  @override
  String get planChangePriceMoved =>
      'Totalnya berubah sejak kamu membuka halaman ini. Tinjau jumlah yang diperbarui lalu konfirmasi lagi.';

  @override
  String get planChangePeriodWeek => 'minggu';

  @override
  String get planChangePeriodMonth => 'bulan';

  @override
  String get planChangePeriodYear => 'tahun';

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
  String get partnerProgramTitle => 'Buat video, postingan, atau buletin?';

  @override
  String get partnerProgramSubtitle =>
      'Dapatkan 30% dari apa yang dibayar orang-orang yang kamu ajak, selama setahun';

  @override
  String get partnerYourCode => 'Kode kreatormu';

  @override
  String get partnerPaused => 'Dijeda';

  @override
  String get partnerPortal => 'Penghasilan dan pembayaran';

  @override
  String partnerShareText(String link, String code) {
    return 'Coba Casama, rekan tim AI yang bekerja untukmu. Pakai kode saya $code saat mendaftar: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name mengirimmu ke Casama.';
  }

  @override
  String get partnerClaimed =>
      'Kode kreator ditambahkan. Selamat datang di Casama!';

  @override
  String partnerClaimedFrom(String name) {
    return 'Terima kasih sudah mendukung $name. Selamat datang di Casama!';
  }

  @override
  String get partnerErrNotFound =>
      'Kode kreator itu tidak ada. Periksa dan coba lagi.';

  @override
  String get partnerErrOwnCode =>
      'Itu kodemu sendiri. Bagikan ke audiensmu saja.';

  @override
  String get partnerErrWindowClosed =>
      'Kode kreator hanya bisa dimasukkan pada hari-hari pertama setelah mendaftar.';

  @override
  String get partnerErrAlreadyPaying =>
      'Kode kreator hanya untuk akun baru, sebelum pembayaran pertama.';

  @override
  String get partnerErrAlready => 'Kamu sudah pernah memasukkan kode kreator.';

  @override
  String get partnerErrReferred =>
      'Kamu bergabung dengan undangan teman, jadi kode kreator tidak bisa ditambahkan.';

  @override
  String get partnerErrOff => 'Kode kreator tidak tersedia di server ini.';

  @override
  String get referralHaveCodeAny => 'Punya kode?';

  @override
  String get referralCodeHintAny => 'Kode teman atau kreator';

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
  String get testimonialStateLive => 'Aktif';

  @override
  String get testimonialStateDraft => 'Draf';

  @override
  String get testimonialStateHidden => 'Tersembunyi';

  @override
  String get testimonialStateWithdrawn => 'Ditarik kembali';

  @override
  String get testimonialPlaceSiteHome => 'beranda casama.ai';

  @override
  String get testimonialPlaceSitePricing => 'harga casama.ai';

  @override
  String get testimonialPlaceAppPaywall => 'Paket aplikasi';

  @override
  String get testimonialPlaceAppSignin => 'Masuk aplikasi';

  @override
  String get testimonialSourceEmail => 'Email';

  @override
  String get testimonialSourceInApp => 'Di aplikasi';

  @override
  String get testimonialSourceOther => 'Lainnya';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bintang',
      one: '1 bintang',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'Kata orang tentang Casama';

  @override
  String get testimonialAskTitle => 'Menikmati Casama?';

  @override
  String get testimonialAskSubtitle => 'Ceritakan dalam satu kalimat.';

  @override
  String get testimonialAskHint => 'Apa yang kamu sukai?';

  @override
  String testimonialAskConsent(String name) {
    return 'Casama boleh mengutip ini dari saya di casama.ai dan di aplikasi sebagai $name';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'Casama boleh mengutip ini dari saya di casama.ai dan di aplikasi sebagai pengguna Casama';

  @override
  String get testimonialAskSend => 'Kirim';

  @override
  String get testimonialAskNotNow => 'Tidak sekarang';

  @override
  String get testimonialAskThanks => 'Terima kasih! Kami membaca semuanya.';

  @override
  String get communityTitle => 'Komunitas';

  @override
  String get communitySentence =>
      'Casama bersifat open source. Jika bermanfaat untukmu, bintang di GitHub membantu orang lain menemukannya.';

  @override
  String get communityStarOnGitHub => 'Beri bintang di GitHub';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Ngobrol dengan tim dan pengguna Casama lainnya';

  @override
  String get starAskTitle => 'Casama di GitHub';

  @override
  String get starAskNotNow => 'Tidak sekarang';

  @override
  String get cloudSignInTitle => 'Masuk dengan akun Casama-mu';

  @override
  String get cloudSignInBody =>
      'Lisensi pribadi gratis berasal dari akun Casama-mu. Hanya lisensi yang dikirim ke server ini; chatmu tetap tersimpan di sana.';

  @override
  String get cloudSignInEmail => 'Email';

  @override
  String get cloudSignInSendCode => 'Kirim kode';

  @override
  String get cloudSignInCode => 'Kode dari email';

  @override
  String get cloudSignInVerify => 'Masuk';

  @override
  String cloudSignInCodeSent(String email) {
    return 'Kami mengirim kode ke $email. Masukkan di sini.';
  }

  @override
  String get licenseSetupTitle => 'Dapatkan lisensi pribadi gratis';

  @override
  String get licenseSetupBody =>
      'Server ini memerlukan lisensi sebelum bot bisa berjalan. Penggunaan pribadi gratis untuk satu orang: masuk dengan akun Casama-mu dan lisensi diperpanjang otomatis secara online setiap 30 hari.';

  @override
  String get licensePersonalButton => 'Dapatkan lisensi pribadi gratis';

  @override
  String get licensePersonalNote =>
      'Pribadi: satu orang, untuk penggunaan pribadi, di komputer atau servermu sendiri.';

  @override
  String get licenseBusinessTitle => 'Atau masukkan kunci bisnis';

  @override
  String get licenseBusinessHint => 'Tempel kunci lisensimu';

  @override
  String get licenseBusinessSave => 'Gunakan kunci ini';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return 'Memakai Casama untuk kerja atau bersama tim? Business seharga $monthlyPrice per pengguna aktif per bulan ($yearlyMonthlyPrice jika ditagih tahunan). Tulis ke $email.';
  }

  @override
  String get licenseActivated => 'Lisensi aktif. Botmu bisa berjalan.';

  @override
  String get licenseOtherServer => 'Gunakan server lain';

  @override
  String get licenseRenew => 'Perpanjang';

  @override
  String get licenseRenewTitle => 'Perpanjang lisensi server ini';

  @override
  String licenseGraceBanner(String date) {
    return 'Lisensi server ini sudah habis. Bot tetap berjalan hingga $date; perpanjang sebelum itu.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'Lisensi server ini sudah habis. Segera perpanjang agar bot tetap berjalan.';

  @override
  String get licenseExpiredBanner =>
      'Lisensi server ini sudah kedaluwarsa, jadi eksekusi bot baru dijeda. Datamu aman: kamu tetap bisa masuk, membaca, dan mengekspor. Perpanjang untuk menjalankan bot lagi.';

  @override
  String get licenseErrorRequired =>
      'Server ini memerlukan lisensi terlebih dahulu. Dapatkan lisensi pribadi gratis atau masukkan kunci bisnis.';

  @override
  String licenseErrorSeats(String email) {
    return 'Setiap slot di lisensi server ini sudah terisi. Tambahan orang memerlukan lisensi Business: tulis ke $email.';
  }

  @override
  String get licenseErrorExpired =>
      'Lisensi server ini sudah kedaluwarsa, jadi eksekusi bot baru dijeda. Datamu aman. Perpanjang lisensi untuk menjalankan bot lagi.';

  @override
  String get licenseEditionPersonal => 'Personal';

  @override
  String get licenseEditionTrial => 'Uji coba';

  @override
  String get licenseEditionBusiness => 'Business';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Ekspor audit';

  @override
  String get licenseFeatureAuditForwarding => 'Penerusan audit';

  @override
  String get licenseFeatureRoles => 'Peran lanjutan';

  @override
  String get setupLicenseTitle => 'Lisensi pribadi gratis';

  @override
  String get setupLicenseBody =>
      'Masuk dengan akun Casama-mu untuk mendapatkan lisensi pribadi gratis bagi server ini: satu orang, penggunaan pribadi. Kamu juga bisa melakukannya nanti.';

  @override
  String get setupLicenseSignIn => 'Masuk dengan Casama';

  @override
  String get setupLicenseReady =>
      'Lisensi pribadi gratis disertakan bersama servermu.';

  @override
  String setupLicenseReadyFor(String email) {
    return 'Masuk sebagai $email. Lisensi pribadi gratis disertakan bersama servermu.';
  }

  @override
  String get setupLicenseSkipped =>
      'Belum ada lisensi. Servermu akan memintanya saat mulai berjalan.';

  @override
  String setupLicenseFailed(String error) {
    return 'Lisensi pribadi tidak bisa dibuat ($error). Servermu akan memintanya saat mulai berjalan.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'Server Casama berjalan di dalam Docker Desktop, aplikasi gratis yang memakai WSL 2 untuk memisahkannya dari bagian lain PC-mu.';

  @override
  String get setupDockerStep1Windows =>
      'Jalankan penginstal yang diunduh dan biarkan opsi \"Use WSL 2\" tetap aktif.';

  @override
  String localUpdateAvailable(String version) {
    return 'Pembaruan server siap: $version';
  }

  @override
  String get localUpdateButton => 'Perbarui';

  @override
  String get localUpdateLater => 'Nanti';

  @override
  String localUpdateTitle(String version) {
    return 'Perbarui servermu ke $version';
  }

  @override
  String get localUpdateBody =>
      'Basis data dicadangkan terlebih dahulu. Jika versi baru tidak mau menyala, servermu kembali ke versi yang sekarang.';

  @override
  String localUpdateDone(String version) {
    return 'Diperbarui ke $version.';
  }

  @override
  String get localUpdateRolledBack =>
      'Versi baru tidak mau menyala, jadi servermu kembali ke versi sebelumnya. Tidak ada yang hilang, dan cadangan basis data telah disimpan.';

  @override
  String localUpdateFailed(String detail) {
    return 'Pembaruan gagal: $detail';
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
  String get shCloudScreenTitle => 'Model Casama Cloud';

  @override
  String get shCloudPitch =>
      'Model milik Casama, tanpa kunci untuk dikelola. Dibayar dengan paket Casama Cloud.';

  @override
  String get shCloudTurnOn => 'Nyalakan';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'Aktif · dibayar oleh $workspace';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, dibayar oleh $workspace';
  }

  @override
  String get shCloudMemberOff =>
      'Tidak aktif. Hanya admin server ini yang bisa menyalakannya.';

  @override
  String get shCloudManage => 'Kelola';

  @override
  String get shCloudSignInBody =>
      'Masuk dengan akun Casama-mu untuk memilih siapa yang membayar model Casama Cloud. Bot, chat, dan memorimu tetap di server ini.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Masuk ke Casama Cloud sebagai $email';
  }

  @override
  String get shCloudOtherAccount => 'Gunakan akun lain';

  @override
  String get shCloudContinue => 'Lanjutkan';

  @override
  String get shCloudPayerTitle => 'Siapa yang membayar?';

  @override
  String get shCloudPayerBody =>
      'Model Casama Cloud dibayar oleh ruang kerja Casama Cloud yang kamu miliki atau kelola. Paket, kuota bawaan, dan batas hariannya juga dipakai untuk semua hal lain di ruang kerja itu.';

  @override
  String get shCloudPayerNone =>
      'Kamu belum mengelola ruang kerja Casama Cloud. Buat satu untuk melakukan pembayaran; awalnya kosong.';

  @override
  String get shCloudCreateWorkspace => 'Buat satu';

  @override
  String shCloudWorkspaceNamed(String name) {
    return 'Ruang kerja $name';
  }

  @override
  String get shCloudNoPlan => 'Belum ada paket';

  @override
  String shCloudCovered(String plan) {
    return 'Paket $plan milikmu menanggung ini.';
  }

  @override
  String get shCloudPlanTitle => 'Pilih paket';

  @override
  String get shCloudPlanBody =>
      'Model Casama Cloud hadir di setiap paket Casama Cloud: kuota bawaan, batas harian, dan top-up yang sama seperti di Cloud. Tidak ada harga terpisah untuk host mandiri.';

  @override
  String get shCloudTryFirst => 'Coba dulu';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Kuota gratis untuk dicoba: pesan senilai sekitar $amount, sekali per akun Casama. Tidak perlu membeli apa pun.';
  }

  @override
  String get shCloudTrialUsed =>
      'Kuota gratis untuk dicoba sudah habis terpakai di akun Casama ini. Pilih paket untuk melanjutkan.';

  @override
  String get shCloudIntervalWeek => 'Mingguan';

  @override
  String get shCloudIntervalMonth => 'Bulanan';

  @override
  String get shCloudIntervalYear => 'Tahunan';

  @override
  String get shCloudWaitingForPlan =>
      'Selesaikan pembayaran di browsermu. Layar ini berlanjut sendiri saat paketnya masuk.';

  @override
  String get shCloudWaitingTimedOut =>
      'Paketnya belum masuk. Pembayaran bisa memakan waktu beberapa menit untuk muncul.';

  @override
  String get shCloudCheckAgain => 'Periksa lagi';

  @override
  String get shCloudGiftCode => 'Punya kode hadiah?';

  @override
  String get shCloudGiftCodeLabel => 'Kode hadiah';

  @override
  String get shCloudRedeem => 'Tukarkan';

  @override
  String get shCloudNoWayToBuy =>
      'Paket tidak dapat dibeli di aplikasi ini. Beli di casama.ai dengan akun yang sama, lalu periksa lagi di sini.';

  @override
  String get shCloudPurchasePending =>
      'Pembelianmu sedang menunggu persetujuan. Proses berlanjut setelah disetujui.';

  @override
  String get shCloudPurchaseFailed =>
      'Pembelian tidak berhasil. Tidak ada biaya yang ditagih.';

  @override
  String get shCloudConnecting => 'Menghubungkan server ini ke Casama Cloud…';

  @override
  String get shCloudLoading => 'Memuat…';

  @override
  String get shCloudReviewTitle => 'Periksa sebelum menyalakan';

  @override
  String get shCloudReviewPays => 'Yang membayar';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$plan di $workspace ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return 'Kuota gratis untuk dicoba di $workspace ($email)';
  }

  @override
  String get shCloudReviewBots => 'Bot mana yang beralih';

  @override
  String get shCloudReviewAll => 'Semua bot';

  @override
  String get shCloudReviewNoKey => 'Hanya bot tanpa kunci yang berfungsi';

  @override
  String get shCloudReviewPick => 'Pilih bot';

  @override
  String get shCloudReviewNoBots =>
      'Server ini belum memiliki bot. Bot baru bisa memakai Casama Cloud.';

  @override
  String get shCloudReviewDefault => 'Bot baru memakai Casama Cloud juga';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Model Casama Cloud';

  @override
  String get shCloudNoKeyYet => 'Belum ada kunci yang berfungsi';

  @override
  String shCloudStepDown(String from) {
    return 'Balasan mungkin lebih singkat atau kurang teliti daripada dengan $from. Coba satu bot dulu.';
  }

  @override
  String get shCloudReviewJobs => 'Memori, gambar, dan suara';

  @override
  String get shCloudJobMemory => 'Pencarian memori';

  @override
  String get shCloudJobImages => 'Gambar';

  @override
  String get shCloudJobTts => 'Bacakan lantang';

  @override
  String get shCloudJobStt => 'Dikte';

  @override
  String get shCloudJobOwnKey => 'Kuncimu sendiri';

  @override
  String get shCloudJobMemoryOptIn => 'Pakai Casama Cloud untuk memori juga';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'Memori diindeks ulang di latar belakang; pencarian tetap bekerja sementara itu.';

  @override
  String get shCloudJobLiveNote =>
      'Suara langsung, panggilan telepon, dan video tetap memakai kuncimu sendiri.';

  @override
  String get shCloudWhatGoes => 'Apa yang dikirim ke Casama Cloud';

  @override
  String get shCloudReviewPrivacy =>
      'Pesan ke model melewati Casama Cloud dan tidak disimpan. Penggunaan (model, token, biaya) tampil di tagihan Cloud-mu. Bot, chat, memori, file, dan komputer tetap ada di server ini.';

  @override
  String get shCloudWhatGoesLink => 'Apa yang dikirim server ini';

  @override
  String get shCloudFallback =>
      'Jika Casama Cloud habis atau tidak dapat dijangkau, gunakan kunci saya sendiri';

  @override
  String get shCloudFallbackHelp =>
      'Setiap jawaban dari kuncimu sendiri mencantumkannya.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '$usedString orang memakai server ini sedangkan paket $plan menanggung $seatsString. Setiap orang tambahan ditagih sesuai harga orang tambahan Casama Cloud.';
  }

  @override
  String get shCloudApply => 'Nyalakan Casama Cloud';

  @override
  String get shCloudPickOne =>
      'Pilih minimal satu bot, atau biarkan bot baru memakainya.';

  @override
  String get shCloudPolicyTitle => 'Siapa yang boleh memakainya';

  @override
  String get shCloudPolicyEveryone => 'Semua orang di server ini';

  @override
  String get shCloudPolicyChosen => 'Hanya orang terpilih';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString orang dipilih',
      one: '1 orang dipilih',
      zero: 'Belum ada yang dipilih',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Batas harian per orang';

  @override
  String get shCloudNoLimit => 'Tanpa batas';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '$amount per hari';
  }

  @override
  String get shCloudPolicySaved => 'Disimpan';

  @override
  String get shCloudDoneTitle => 'Casama Cloud aktif';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bot sekarang menggunakan Casama Cloud.',
      one: '1 bot sekarang menggunakan Casama Cloud.',
      zero: 'Bot baru menggunakan Casama Cloud.',
    );
    return '$_temp0 Penggunaan tampil di layar Penggunaan server ini dan di tagihan Cloud-mu.';
  }

  @override
  String shCloudSayHi(String bot) {
    return 'Sapa $bot';
  }

  @override
  String get shCloudDone => 'Selesai';

  @override
  String get shCloudUsageTitle => 'Penggunaan';

  @override
  String shCloudIncludedLeft(String amount) {
    return 'Sisa kuota bawaan bulan ini: $amount';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Hari ini: $spend dari $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Hari ini: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount dalam kredit';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return 'Tersisa $amount kuota gratis untuk dicoba';
  }

  @override
  String get shCloudPriceNote =>
      'Sesuai harga yang dikenakan Casama Cloud. Permintaan yang sama tampil di tagihan Cloud-mu di bawah nama server ini.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'Pemakaianmu hari ini: $spend dari $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'Casama Cloud sudah memakai 80% kuota bawaan bulan ini.';

  @override
  String get shCloudWarnDaily =>
      'Casama Cloud sudah memakai 80% batas hari ini.';

  @override
  String get shCloudTopUp => 'Top-up';

  @override
  String get shCloudUseOwnKey => 'Gunakan kunci saya sendiri';

  @override
  String get shCloudStopOutOfCredits =>
      'Penggunaan Casama Cloud untuk bulan ini sudah habis.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'Batas Casama Cloud hari ini sudah terpakai habis. Direset pukul $time.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'Batas Casama Cloud hari ini sudah terpakai habis. Direset besok.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud memerlukan paket di $workspace.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return 'Paket Casama Cloud di $workspace sudah berakhir.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return 'Paket di $workspace tidak mencakup semua pengguna Casama Cloud di sini.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'Kamu sudah mencapai batas harian Casama Cloud di server ini.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Adminmu belum menyalakan Casama Cloud untukmu.';

  @override
  String get shCloudStopDisconnected =>
      'Casama Cloud terputus dari server ini.';

  @override
  String get shCloudStopUnreachable =>
      'Casama Cloud tidak dapat dijangkau saat ini. Mencoba lagi.';

  @override
  String get shCloudSeePlans => 'Lihat paket';

  @override
  String get shCloudRenew => 'Perpanjang';

  @override
  String get shCloudAskAdmin => 'Tanya Admin';

  @override
  String get shCloudAskAdminBody =>
      'Hanya admin server ini yang bisa mengubah Casama Cloud. Minta salah satu dari mereka; bot dan rutinitas berlanjut sendiri setelah diperbaiki.';

  @override
  String get shCloudReconnect => 'Hubungkan kembali';

  @override
  String get shCloudFallbackActive =>
      'Kuncimu sendiri yang menjawab sementara ini, dan setiap jawaban mencantumkannya.';

  @override
  String get shCloudUseOwnKeyTitle => 'Pakai kuncimu sendiri sementara ini?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Saat Casama Cloud tidak bisa menjawab, bot menjawab dengan kuncimu sendiri, dan setiap jawaban tersebut mencantumkannya. Matikan kapan saja di layar ini.';

  @override
  String get shCloudAddKeyFirst =>
      'Tambahkan kunci milikmu sendiri di layar Model terlebih dahulu.';

  @override
  String get shCloudRoutinesWait =>
      'Rutinitas menunggu dan berlanjut sendiri saat sudah diperbaiki.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Memori sedang menyusul: $doneString dari $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'Pencarian memakai pencocokan kata untuk memori yang belum diindeks ulang.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'Pesan ke model sekarang melewati Casama Cloud, dibayar oleh $workspace.';
  }

  @override
  String get shCloudGotIt => 'Mengerti';

  @override
  String shCloudChipPaidBy(String workspace) {
    return 'Dibayar oleh $workspace';
  }

  @override
  String get shCloudPaidBy => 'Dibayar oleh';

  @override
  String get shCloudChangePayer => 'Ubah';

  @override
  String get shCloudChangeBots => 'Ubah bot';

  @override
  String get shCloudFallbackSection => 'Saat Casama Cloud tidak bisa menjawab';

  @override
  String get shCloudTurnOff => 'Matikan';

  @override
  String get shCloudOffTitle => 'Matikan Casama Cloud?';

  @override
  String get shCloudOffBody =>
      'Bot ini kembali ke kunci sebelumnya jika masih berfungsi, atau kunci bawaan ruang kerja. Tidak ada lagi yang berubah, dan kamu bisa menyalakannya lagi kapan saja.';

  @override
  String get shCloudOffBotsNone =>
      'Belum ada bot yang memakai Casama Cloud saat ini.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud nonaktif';

  @override
  String shCloudOffBackTo(String key) {
    return 'Kembali ke $key';
  }

  @override
  String get shCloudOffNeedsKey => 'Perlu kunci';

  @override
  String get shCloudAddKey => 'Tambah kunci';

  @override
  String get shCloudSignInAgain =>
      'Sesi masuk Casama Cloud kamu berakhir. Masuk lagi untuk melanjutkan.';

  @override
  String get cloudAccountSection => 'Akun Casama Cloud';

  @override
  String cloudAccountRow(String email) {
    return 'Masuk sebagai $email';
  }

  @override
  String get cloudAccountRowHelp =>
      'Dipakai untuk lisensi server ini dan model Casama Cloud';

  @override
  String get cloudAccountSignOut => 'Keluar dari Casama Cloud';

  @override
  String get cloudAccountSignOutBody =>
      'Perangkat ini melupakan sesi masuk Casama Cloud-mu. Server ini, lisensinya, dan model Casama Cloud tetap bekerja.';

  @override
  String get cloudAccountDelete => 'Hapus akun Casama Cloud';

  @override
  String get cloudAccountDeleteHelp =>
      'Menghapus akunmu di Casama Cloud. Server ini dan datanya tetap ada.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Ketik $email untuk menghapus akun Casama Cloud-mu. Ruang kerja cloud yang hanya kamu miliki ikut terhapus, dan model Casama Cloud berhenti di server yang dibayarnya. Paket yang kamu beli di web dibatalkan otomatis. Paket yang dibeli di App Store atau Google Play tidak dibatalkan: batalkan di toko tersebut.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Akun Casama Cloud-mu dihapus. Datanya dihapus permanen pada $date.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Pindahkan ke Casama Cloud';

  @override
  String get wsMoveSettingsToServer => 'Pindahkan ke server saya sendiri';

  @override
  String get wsMoveSettingsHelp =>
      'Bawa bot, chat, memori, dan file ruang kerja ini ke server lain';

  @override
  String get wsMoveTitle => 'Pindahkan ruang kerja ini';

  @override
  String get wsMoveIntro =>
      'Semuanya ikut terbawa: bot, chat, memori, rutinitas, file, dan komputer. Setelah berada di sana, salinan ini tetap dapat dibaca tapi berhenti bekerja.';

  @override
  String get wsMoveCloudOption => 'Pindahkan ke Casama Cloud';

  @override
  String get wsMoveCloudOptionHelp =>
      'Masuk dengan akun Casama-mu dan pilih tujuannya.';

  @override
  String get wsMoveServerOption => 'Pindahkan ke server saya sendiri';

  @override
  String get wsMoveServerOptionHelp =>
      'Di server itu, buka Pengaturan › Bawa Ruang Kerja ke Sini dan salin kode pindahnya.';

  @override
  String get wsMoveInstallServer => 'Instal server Casama';

  @override
  String get wsMoveInstallServerHelp =>
      'Belum ada server? Jalankan satu di komputer ini dulu.';

  @override
  String get wsMoveReceiveOption => 'Bawa ruang kerja ke sini';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Dapatkan kode pindah untuk ruang kerja ini, untuk digunakan di server tempat ruang kerja lain berada sekarang.';

  @override
  String get wsMoveOwnerOnly =>
      'Hanya pemilik ruang kerja yang dapat memindahkannya.';

  @override
  String get wsMoveCloudPickTitle => 'Ke mana harus dipindahkan?';

  @override
  String get wsMoveCloudNew => 'Ruang kerja baru';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Mulai kosong di Casama Cloud, bernama $name.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Item yang dipindahkan diletakkan di samping yang sudah ada. Nama yang bentrok diberi tambahan “(moved)”.';

  @override
  String get wsMoveServerTitle => 'Pindahkan ke servermu sendiri';

  @override
  String get wsMoveServerAddress => 'Alamat server';

  @override
  String get wsMoveServerCode => 'Kode pindah';

  @override
  String get wsMoveCheckButton => 'Periksa';

  @override
  String get wsMoveReceiveTitle => 'Bawa ruang kerja ke sini';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'Di server tempat ruang kerja berada sekarang, buka Pengaturan › Pindahkan ke Server Saya Sendiri lalu masukkan alamat dan kode ini. Kode berlaku sekali, hingga $time, dan membawa semuanya ke $name.';
  }

  @override
  String get wsMoveReceiveAddress => 'Alamat server ini';

  @override
  String get wsMoveReceiveCode => 'Kode pindah';

  @override
  String get wsMoveCopy => 'Salin';

  @override
  String get wsMoveCopied => 'Disalin';

  @override
  String get wsMoveCheckTitle => 'Siap dipindahkan';

  @override
  String wsMoveCheckTo(String name) {
    return 'Ke $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString menit',
      one: '1 menit',
    );
    return '$size untuk disalin, sekitar $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString menit',
      one: '1 menit',
    );
    return 'Menjelang akhir, bot berhenti sebentar selama sekitar $_temp0, lalu berlanjut di sana.';
  }

  @override
  String get wsMoveCheckLongPause =>
      'Itu jeda yang cukup lama. Pilih waktu yang sepi.';

  @override
  String get wsMoveCheckComes => 'Yang ikut dibawa';

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
      other: '$nString memori',
      one: '1 memori',
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
      other: '$nString rutinitas',
      one: '1 rutinitas',
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
      other: '$nString komputer',
      one: '1 komputer',
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
      other: '$nString orang',
      one: '1 orang',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => 'Yang perlu kamu lakukan setelahnya';

  @override
  String wsMoveReconnect(String names) {
    return 'Masuk lagi ke aplikasi ini di sana: $names';
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
      other: '$nString orang mendapat',
      one: '1 orang mendapat',
    );
    return '$_temp0 undangan email';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (diundang)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'Paket ChatGPT tetap tinggal. Masuk lagi ke ChatGPT di sana.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString komputer mulai',
      one: '1 komputer mulai',
    );
    return '$_temp0 baru di sana, dengan folder berandanya dipulihkan.';
  }

  @override
  String get wsMoveResetNote =>
      'Persetujuan, akses penuh, dan akses perangkat dimulai dari default server baru.';

  @override
  String get wsMoveBringKeys => 'Bawa kunciku';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString kunci ikut',
      one: '1 kunci ikut',
    );
    String _temp1 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'membacanya',
      one: 'membacanya',
    );
    return '$_temp0 dibawa, disegel sehingga hanya server baru yang bisa $_temp1.';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'Kamu akan menambahkan lagi kunci model dan aplikasi chat di sana.';

  @override
  String get wsMoveDoesntFit => 'Ruang kerja ini tidak muat di paket sana';

  @override
  String wsMoveNeedsPlan(String plan) {
    return '$plan cocok untuk ini. Pilih di Casama Cloud, lalu periksa lagi.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have dari $limit';
  }

  @override
  String get wsMoveOverPeople => 'Orang';

  @override
  String get wsMoveOverBots => 'Bot';

  @override
  String get wsMoveOverComputers => 'Komputer';

  @override
  String get wsMoveOverStorage => 'Penyimpanan';

  @override
  String get wsMoveUpdateSource =>
      'Perbarui server ini dulu. Versinya lebih lama daripada tujuan pemindahan.';

  @override
  String get wsMoveUpdateTarget =>
      'Server tujuan pemindahan perlu diperbarui dulu.';

  @override
  String get wsMoveStart => 'Mulai pindahkan';

  @override
  String get wsMoveCheckAgain => 'Periksa lagi';

  @override
  String get wsMoveProgressTitle => 'Memindahkan';

  @override
  String get wsMoveStepStarting => 'Bersiap-siap';

  @override
  String get wsMoveStepCopying =>
      'Menyalin file sementara semuanya tetap berjalan';

  @override
  String get wsMoveStepPausing =>
      'Menjeda bot untuk menyalin perubahan terakhir';

  @override
  String get wsMoveStepFinishing => 'Mengirim chat, memori, dan pengaturan';

  @override
  String get wsMoveStepImporting => 'Server baru sedang memasukkannya';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done dari $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'Kamu bisa menutup aplikasi. Pemindahan tetap berjalan, dan kamu akan mendapat notifikasi setelah selesai.';

  @override
  String get wsMoveFailedTitle => 'Pemindahan berhenti';

  @override
  String get wsMoveFailedBody =>
      'Tidak ada yang berubah di sini: ruang kerja ini tetap berjalan.';

  @override
  String get wsMoveTryAgain => 'Coba lagi';

  @override
  String get wsMoveNewCodeNeeded =>
      'Untuk mencoba lagi, dapatkan kode pindah baru.';

  @override
  String get wsMoveDoneTitle => 'Dipindahkan';

  @override
  String wsMoveDoneBody(String server) {
    return 'Semuanya sudah tiba di $server.';
  }

  @override
  String get wsMoveDoneNeeds => 'Beberapa hal memerlukkanmu di sana:';

  @override
  String get wsMoveOpenThere => 'Buka di sana';

  @override
  String wsMoveAfterReconnect(String name) {
    return 'Masuk lagi ke $name';
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
      other: '$nString orang',
      one: '1 orang',
    );
    return '$_temp0 diundang melalui email';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return 'Hubungkan ulang $name';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return 'Berikan pengirim $name alamat webhook yang baru';
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
      other: '$nString hari',
      one: '1 hari',
    );
    return 'Webhook yang masih dikirim ke sini diteruskan selama $_temp0.';
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
    return 'Periksa persetujuan untuk $_temp0';
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
    return 'Hubungkan model Casama Cloud di Pengaturan, atau pilih model lain, untuk $_temp0';
  }

  @override
  String get wsMoveAfterKeys => 'Tambahkan kunci modelmu di sana';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString item',
      one: '1 item',
    );
    return '$_temp0 diberi tambahan “(moved)” pada namanya';
  }

  @override
  String get wsMoveAfterReindex =>
      'Pencarian memori akan mengejar dalam beberapa menit.';

  @override
  String get wsMoveAfterNothing => 'Tidak ada lagi yang perlu dilakukan.';

  @override
  String get wsMoveSubTitle => 'Langgananmu';

  @override
  String get wsMoveSubToCloud =>
      'Bot di Casama Cloud berjalan pada paket Cloud-mu. Jika kamu membayar lisensi bisnis untuk server ini, batalkan setelah tidak lagi dibutuhkan.';

  @override
  String get wsMoveSubFromCloud =>
      'Paket Casama Cloud-mu tetap diperpanjang. Batalkan setelah kamu mantap di servermu sendiri.';

  @override
  String get wsMoveSubManage => 'Kelola paket';

  @override
  String get wsMovedTitle => 'Ruang kerja ini sudah dipindahkan';

  @override
  String get wsMovedBodyCloud =>
      'Sekarang ada di Casama Cloud. Masuk di sana untuk melanjutkan. Salinan ini hanya-baca.';

  @override
  String wsMovedBodyServer(String host) {
    return 'Sekarang ada di $host. Masuk di sana untuk melanjutkan. Salinan ini hanya-baca.';
  }

  @override
  String get wsMovedSignInCloud => 'Masuk ke Casama Cloud';

  @override
  String wsMovedOpenServer(String host) {
    return 'Buka $host';
  }

  @override
  String get wsMovedViewOld => 'Lihat salinan lama';

  @override
  String get languageDevice => 'Bahasa perangkat';

  @override
  String get shortcutQuickAsk => 'Tanya cepat';

  @override
  String shortcutAskBot(String name) {
    return 'Tanya $name';
  }

  @override
  String shortcutRunRoutine(String name) {
    return 'Jalankan $name';
  }

  @override
  String get settingsWordsWorkspace =>
      'ruang kerja beralih ganti tim organisasi peran workspace';

  @override
  String get settingsWordsAboutYou =>
      'profil nama foto gambar avatar kata ganti tentang saya gaya balasan fakta memori';

  @override
  String get settingsWordsPeople =>
      'anggota undang tim pengguna admin peran tautan undangan kode undangan bergabung hapus';

  @override
  String get settingsWordsWorkspaceSettings =>
      'ruang kerja nama ikon logo enkripsi memori pembayaran stripe kartu pengelola kata sandi bot ke bot ekstensi chrome galeri akses penuh izin persetujuan tanya lewati';

  @override
  String get settingsWordsSettingsDomains =>
      'domain situs web dns khusus beli hubungkan situs';

  @override
  String get settingsWordsUsage =>
      'biaya pengeluaran belanja uang kredit token batas';

  @override
  String get settingsWordsBilling =>
      'paket langganan upgrade pro plus max pembayaran tagihan kartu harga';

  @override
  String get settingsWordsInviteFriends =>
      'undangan ajak teman bonus kredit hadiah bagikan';

  @override
  String get settingsWordsAdminConsole => 'konsol admin admin console';

  @override
  String get settingsWordsAppearance =>
      'tema mode gelap mode terang malam warna font teks ukuran latar belakang wallpaper tampilan gaya efek animasi gerakan haptik getar getaran umpan balik trackpad';

  @override
  String get settingsWordsQuietHours =>
      'jangan ganggu dnd tidur bisu senyap notifikasi jadwal';

  @override
  String get settingsWordsPushPrefsTitle =>
      'notifikasi push peringatan balasan suara';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'panggilan telepon dering layar kunci layar penuh masuk jawab';

  @override
  String get settingsWordsEmailTips =>
      'email buletin tips berita berhenti berlangganan';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'email galeri rangkuman bulanan pilihan';

  @override
  String get settingsWordsNewsletterTitle =>
      'email buletin berita bulanan pembaruan berlangganan berhenti berlangganan';

  @override
  String get settingsWordsWakeWord =>
      'suara hai bebas genggam mikrofon mic dengar';

  @override
  String get settingsWordsShowBotSteps =>
      'langkah alat detail kemajuan progres';

  @override
  String get settingsWordsShowReplyUsage =>
      'biaya token harga penggunaan per balasan';

  @override
  String get settingsWordsCheckForUpdates =>
      'pembaruan update versi upgrade unduh otomatis';

  @override
  String get settingsWordsOpenAtLogin =>
      'mulai saat masuk login boot mulai otomatis';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'aktivitas langsung dynamic island layar kunci perangkat lain';

  @override
  String get settingsWordsShowBotsInNotch => 'notch bilah menu dynamic island';

  @override
  String get settingsWordsNotchOnHover => 'notch arahkan kursor mouse';

  @override
  String get settingsWordsLanguage =>
      'bahasa lokal indonesia inggris terjemahan';

  @override
  String get settingsWordsIntegrations =>
      'aplikasi hubungkan koneksi gmail google slack kalender plugin alat mcp';

  @override
  String get settingsWordsSkills => 'keahlian daftar kemampuan instruksi';

  @override
  String get settingsWordsCasamaLink =>
      'akses jarak jauh alamat terowongan self host ponsel';

  @override
  String get settingsWordsServiceKeys =>
      'kunci api pencarian peta data kuncimu sendiri';

  @override
  String get settingsWordsModelsTitle =>
      'kunci api openai anthropic openrouter gemini model penyedia ollama model lokal kuncimu sendiri';

  @override
  String get settingsWordsModelKeys =>
      'kunci api openai anthropic openrouter gemini model penyedia ollama model lokal kuncimu sendiri';

  @override
  String get settingsWordsAccount =>
      'email ubah email kata sandi keluar semua perangkat masuk';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa dua faktor autentikator totp otp kode keamanan';

  @override
  String get settingsWordsPairDevice =>
      'kode qr pindai masuk pasangkan ponsel perangkat lain';

  @override
  String get settingsWordsPasskeys =>
      'kunci sandi face id touch id sidik jari biometrik';

  @override
  String get settingsWordsWidgetsTitle =>
      'widget layar utama layar kunci kontrol pusat kontrol sekilas sematkan pintasan';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'kartu cuaca satuan celsius fahrenheit kota rumah tempat mata uang saham merah hijau sumber data';

  @override
  String get settingsWordsAppLock =>
      'kunci aplikasi pin kode sandi face id touch id sidik jari biometrik windows hello tangkapan layar privasi layar kunci';

  @override
  String get settingsWordsPrivacy =>
      'data ekspor unduh hapus akun analitik pelacakan riwayat retensi orang diblokir blokir';

  @override
  String get settingsWordsSecrets =>
      'rahasia kata sandi kredensial brankas variabel lingkungan';

  @override
  String get settingsWordsComputers => 'komputer docker sandbox desktop';

  @override
  String get settingsWordsDeviceConnections =>
      'perangkat tempat kesehatan folder diawasi aplikasi browser ekstensi chrome ponsel izin';

  @override
  String get settingsWordsUseThisComputer =>
      'pendamping komputer ini mac file lokal komputermu sendiri';

  @override
  String get settingsWordsHelpAndSupport =>
      'bantuan dukungan kontak tiket laporan bug masukan dokumentasi komunitas github bintang sumber terbuka discord papan ide status';

  @override
  String get settingsWordsSignOut => 'keluar logout tutup sesi';

  @override
  String get notifDoIt => 'Lakukan';

  @override
  String get notifNotNow => 'Nanti';

  @override
  String get notifAllow => 'Izinkan';

  @override
  String get notifDeny => 'Tolak';

  @override
  String get notifApprove => 'Setujui';

  @override
  String get notifReview => 'Tinjau';

  @override
  String get notifReply => 'Balas';

  @override
  String get notifSend => 'Kirim';

  @override
  String get notifReplyPlaceholder => 'Balas…';

  @override
  String get notifChannelReplies => 'Balasan';

  @override
  String get notifChannelRepliesDescription =>
      'Bot menjawab sesuatu yang kamu tanyakan';

  @override
  String get notifChannelNeedsYou => 'Perlu kamu';

  @override
  String get notifChannelNeedsYouDescription =>
      'Persetujuan, kata sandi, dan ambil alih yang ditunggu botmu';

  @override
  String get notifChannelRoutines => 'Rutinitas dan ringkasan';

  @override
  String get notifChannelRoutinesDescription =>
      'Hasil rutinitas dan ringkasan pagi';

  @override
  String get notifChannelSuggestions => 'Saran';

  @override
  String get notifChannelSuggestionsDescription =>
      'Hal yang ditawarkan botmu untuk dilakukan';

  @override
  String get notifChannelAccount => 'Akun';

  @override
  String get notifChannelAccountDescription => 'Kredit, proyek, dan servermu';

  @override
  String get notifCallChannel => 'Panggilan';

  @override
  String get notifCallLive => 'Dalam panggilan';

  @override
  String get notifCallMuted => 'Dibisukan';

  @override
  String get notifCallReconnecting => 'Menyambung ulang';

  @override
  String get notifCallMute => 'Bisukan';

  @override
  String get notifCallUnmute => 'Bunyikan';

  @override
  String get notifCallEnd => 'Akhiri panggilan';

  @override
  String get notifFromYourWatch => 'Dari jam tanganmu';

  @override
  String get notifLiveOpen => 'Buka';

  @override
  String get notifLiveStop => 'Hentikan';

  @override
  String get notifLiveReview => 'Tinjau';

  @override
  String get notifLiveAllow => 'Izinkan';

  @override
  String get notifLiveDeny => 'Tolak';

  @override
  String get notifLiveNeedsOk => 'Perlu OK-mu';

  @override
  String get notifLiveNeedsYou => 'Perlu kamu';

  @override
  String get notifLiveWorking => 'Bekerja';

  @override
  String get notifLiveTakeOver => 'Ingin kamu ambil alih';

  @override
  String get notifLiveFinished => 'Selesai';

  @override
  String get notifLiveProblem => 'Berhenti karena masalah';

  @override
  String get notifLiveBotWorking => 'Bot sedang bekerja';

  @override
  String get notifLiveBotsAtWork => 'Bot bekerja';

  @override
  String get notifLiveStepOne => '1 langkah';

  @override
  String notifLiveSteps(int count) {
    return '$count langkah';
  }

  @override
  String get notifAlarmTitle => 'Alarm Casama';

  @override
  String get notifAlarmStop => 'Hentikan';

  @override
  String get widgetIosNeedsYouDescription =>
      'Lihat bot mana yang menunggumu, dan jawab yang sederhana.';

  @override
  String get widgetIosBotDescription =>
      'Pantau terus apa yang sedang dilakukan salah satu botmu.';

  @override
  String get widgetIosAskDescription =>
      'Tanya bot atau mulai panggilan dengan satu ketukan, beserta ide untuk dicoba.';

  @override
  String get widgetIosRoutinesDescription =>
      'Lihat apa yang berjalan berikutnya, dan jalankan rutinitas sekarang.';

  @override
  String get widgetIosTodayDescription =>
      'Lihat harimu di satu tempat: yang perlu kamu tangani, yang berjalan berikutnya, dan kreditmu.';

  @override
  String get widgetIosBriefDescription =>
      'Baca apa yang disampaikan botmu pagi ini.';

  @override
  String get widgetIosLibraryDescription => 'Buka hal yang baru dibuat botmu.';

  @override
  String get widgetIosTasksDescription =>
      'Lihat posisi papan tugas, dengan yang menunggumu di urutan pertama.';

  @override
  String get widgetIosCreditsDescription =>
      'Periksa seberapa banyak kreditmu yang sudah terpakai.';

  @override
  String get widgetIosInlineDescription =>
      'Lihat satu hal paling penting, tepat di atas jam.';

  @override
  String get widgetIosCanvasDescription =>
      'Tampilkan apa yang dipasang botmu di sini: kutipan ayat, hitung mundur, rekor beruntun, daftar, atau gambar.';

  @override
  String get widgetMacNeedsYouDescription => 'Lihat bot mana yang menunggumu.';

  @override
  String get widgetMacRoutinesDescription =>
      'Lihat apa yang berjalan berikutnya.';

  @override
  String get widgetAskCasama => 'Tanya Casama';

  @override
  String get widgetControlAskDescription =>
      'Buka tanya cepat dengan keyboard siap.';

  @override
  String get widgetTalkToBot => 'Bicara dengan bot';

  @override
  String widgetTalkToName(String name) {
    return 'Bicara dengan $name';
  }

  @override
  String get widgetControlTalkDescription =>
      'Mulai panggilan dengan bot yang kamu pilih.';

  @override
  String get widgetRunRoutine => 'Jalankan rutinitas';

  @override
  String get widgetControlRunDescription =>
      'Jalankan rutinitas yang kamu pilih, tanpa membuka Casama.';

  @override
  String widgetFallbackAskBot(String bot) {
    return 'Tanya apa saja pada $bot';
  }

  @override
  String get widgetFallbackBrief => 'Ringkasan pagi';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot menyelesaikan $title';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return 'Per $time';
  }

  @override
  String get widgetFallbackNothingNext => 'Belum ada yang berikutnya';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot ingin kamu ambil alih';
  }

  @override
  String get widgetFallbackDay => 'hari';

  @override
  String get widgetFallbackDays => 'hari';

  @override
  String get widgetSampleVerse => 'Diamlah dan ketahuilah, bahwa Akulah Allah.';

  @override
  String get widgetSampleVerseRef => 'Mzm 46:11';

  @override
  String get widgetSampleVerseShort =>
      'Diamlah dan ketahuilah, bahwa Akulah Allah. · Mzm 46:11';

  @override
  String get widgetSampleVerseTiny => 'Diamlah dan ketahuilah…';

  @override
  String get widgetSampleCanvasName => 'Ayat harian';

  @override
  String get widgetSampleNeedFlights => 'Cari penerbangan ke Lisbon';

  @override
  String get widgetSampleNeedDentist =>
      'Pindahkan jadwal dokter gigi ke Jumat?';

  @override
  String get widgetSampleBotText =>
      'Tiga email perlu dibalas, dan faktur Acme sudah lewat dua hari.';

  @override
  String get widgetSampleStep => 'Membaca kotak masukmu';

  @override
  String get widgetSampleRoutineInbox => 'Rapikan kotak masuk';

  @override
  String get widgetSampleRoutineBrief => 'Ringkasan pagi';

  @override
  String get widgetSampleRoutineWeekly => 'Laporan mingguan';

  @override
  String get widgetSampleWeekdays => 'Hari kerja';

  @override
  String get widgetSampleEveryDay => 'Setiap hari';

  @override
  String get widgetSampleFridays => 'Jumat pukul 16.00';

  @override
  String get widgetSampleBrief =>
      'Tiga email perlu dibalas, dan faktur Acme sudah lewat dua hari. Hujan mulai pukul 15.00, jadi berangkat lebih awal untuk jemputan pukul 16.30. Rapat pertamamu pukul 10.00 dengan Dana.';

  @override
  String get widgetSamplePricing => 'Halaman harga Q4';

  @override
  String get widgetSampleLogoIdeas => 'Ide logo';

  @override
  String get widgetSampleTripPlan => 'Rencana perjalanan';

  @override
  String get widgetSampleLaunchPost => 'Buat draf postingan peluncuran';

  @override
  String get widgetSampleStarterInbox => 'Rangkum kotak masukku';

  @override
  String get widgetSampleStarterFriday => 'Rencanakan hari Jumatku';

  @override
  String get widgetSampleWorking => 'Bekerja · 2:14';

  @override
  String get widgetSampleCreditsLeft => 'Tersisa US\$5,70';

  @override
  String get widgetSampleSpentToday => 'US\$0,80 hari ini';

  @override
  String get widgetSampleMorning =>
      'Selamat pagi. Dua rapat hari ini, yang pertama pukul 10.00 dengan tim desain. Hujan setelah pukul 15.00, jadi bawa jas hujan. Penerbanganmu ke Lisbon sudah dikonfirmasi untuk hari Jumat.';

  @override
  String get widgetSampleLisbonPlan => 'Rencana perjalanan Lisbon';

  @override
  String get widgetSampleAgo => 'Milo · 2 jam lalu';

  @override
  String get widgetSampleLaunchEmail => 'Buat draf email peluncuran';

  @override
  String get widgetSampleInReviewBy => 'Ditinjau · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo ingin mencari harga penerbangan ke Lisbon';

  @override
  String get widgetSampleUpNextAt => 'Berikutnya · 9:00';

  @override
  String get widgetSampleInMinutes => 'Ada · dalam 18 mnt';

  @override
  String get widgetSampleDate => 'Rabu, 18 November';

  @override
  String get widgetSampleNeedsCount => 'Perlu kamu · 1';

  @override
  String get widgetSampleSearchFlights => 'Cari harga penerbangan ke Lisbon';

  @override
  String get widgetSampleAskAda => 'Tanya Ada';

  @override
  String get widgetSampleAskMilo => 'Tanya Milo';

  @override
  String get widgetSamplePlanDay => '☀️ Rencanakan hariku';

  @override
  String get widgetSampleWhatsNew => '✉️ Ada apa di kotak masukku?';

  @override
  String get widgetAndroidBotDescription =>
      'Ikuti apa yang sedang dilakukan bot';

  @override
  String get widgetAndroidTodayDescription =>
      'Simpan seluruh harimu bersama botmu di satu tempat';

  @override
  String get widgetAndroidBriefDescription => 'Baca ringkasan pagimu sekilas';

  @override
  String get widgetAndroidLibraryDescription =>
      'Buka hal yang baru dibuat botmu';

  @override
  String get widgetAndroidTasksDescription => 'Pantau posisi papan tugasmu';

  @override
  String get widgetAndroidCreditsDescription =>
      'Periksa seberapa banyak yang sudah kamu pakai';

  @override
  String get widgetAndroidCanvasDescription =>
      'Tampilkan apa yang dipasang botmu di sini, dari kutipan ayat hingga hitung mundur';

  @override
  String get widgetConfigBotTitle => 'Pilih bot';

  @override
  String get widgetConfigRoutinesTitle => 'Pilih rutinitas';

  @override
  String get widgetConfigRoutinesHint =>
      'Pilih hingga empat, untuk yang kamu mulai sendiri';

  @override
  String get widgetConfigAutomatic => 'Otomatis';

  @override
  String get widgetConfigAutomaticHint => 'Jadwal berikutnya, dari semua botmu';

  @override
  String get widgetConfigDone => 'Selesai';

  @override
  String get widgetConfigSignedOutTitle => 'Belum ada yang bisa dipilih';

  @override
  String get widgetConfigSignedOut =>
      'Buka Casama dan masuk, lalu pilih di sini.';

  @override
  String get widgetConfigCanvasTitle => 'Pilih kanvas';

  @override
  String get widgetConfigCanvasAutomaticHint =>
      'Yang terakhir dipasang oleh bot';

  @override
  String get widgetConfigCanvasNone =>
      'Belum ada kanvas. Minta bot untuk menaruh sesuatu di sini.';

  @override
  String get iosUsageTracking =>
      'Jika kamu mengizinkannya, Casama memberi tahu Meta saat kamu menginstal, bergabung, atau berlangganan setelah melihat iklan Casama di Facebook atau Instagram, agar kami bisa mengukur iklan mana yang berhasil. Casama tidak pernah menampilkan iklan dan tidak pernah membagikan chat atau filemu.';

  @override
  String get iosUsageContacts =>
      'Botmu dapat mencari orang yang kamu kenal, hanya saat kamu mengaktifkan Kontak di Koneksi perangkat.';

  @override
  String get iosUsagePhotoLibrary =>
      'Casama membuka galeri fotomu saat kamu memilih foto untuk dikirim ke bot atau untuk profilmu.';

  @override
  String get iosUsageLocationAlways =>
      'Beri tahu botmu saat kamu tiba di atau meninggalkan tempat yang kamu beri nama, bahkan saat Casama ditutup. Hanya nama tempat dan waktunya yang dibagikan, tidak pernah rutemu.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Simpan tempat yang kamu beri nama, seperti Rumah atau Kantor, dan biarkan botmu mengingatkan kapan harus berangkat ke janji berikutnya. Hanya digunakan jika kamu menyalakan Tempat di Koneksi perangkat.';

  @override
  String get iosUsageCamera =>
      'Casama menggunakan kamera saat kamu mengambil foto untuk dikirim ke bot atau untuk profilmu.';

  @override
  String get iosUsageCalendars =>
      'Botmu dapat menjawab pertanyaan tentang jadwalmu dan menambahkan acara, hanya saat kamu mengaktifkan Kalender di Koneksi perangkat.';

  @override
  String get iosUsageSpeech =>
      'Saat layanan dikte Casama tidak dapat dijangkau, pengenalan suara bawaan perangkatmu mengubah ucapanmu menjadi teks.';

  @override
  String get iosUsageAlarmKit =>
      'Botmu dapat menyetel alarm dan timer yang berbunyi meski dalam mode hening, hanya saat kamu mengizinkan Alarm di Koneksi perangkat.';

  @override
  String get iosUsageHomeKit =>
      'Botmu dapat memeriksa dan mengontrol rumah HomeKit milikmu saat kamu mengizinkan Rumah di Koneksi perangkat; perubahan selalu meminta persetujuan lebih dulu.';

  @override
  String get iosUsageMicrophone =>
      'Casama menggunakan mikrofon untuk dikte dan panggilan langsung dengan botmu. Hanya setelah kamu setuju, suaramu dikirim ke penyedia AI untuk menjawabmu: Google Gemini untuk panggilan, OpenAI untuk mengubah dikte menjadi teks.';

  @override
  String get iosUsageHealthUpdate =>
      'Casama hanya membaca data Apple Health; tidak pernah menulis ke dalamnya.';

  @override
  String get iosUsageFaceId =>
      'Casama menggunakan Face ID untuk membuka kunci aplikasi saat kamu mengaktifkan kunci aplikasi, dan untuk mengonfirmasi tindakan berisiko.';

  @override
  String get iosUsageHealthShare =>
      'Botmu dapat melihat ringkasan harian tidur, aktivitas, olahraga, dan jantungmu dari Apple Health, hanya saat kamu mengaktifkan Apple Health di Koneksi perangkat. Casama tidak pernah menulis ke Apple Health dan tidak pernah menggunakannya untuk iklan.';

  @override
  String get iosUsageWatchMicrophone =>
      'Casama merekam suaramu saat kamu menanyakan sesuatu ke bot dan mengirimkannya ke server Casama-mu, tempat penyedia AI (OpenAI, di Casama Cloud) mengubahnya menjadi teks untuk botmu.';

  @override
  String get macUsageContacts =>
      'Botmu dapat mencari orang yang kamu kenal, hanya saat kamu mengaktifkan Kontak di Koneksi perangkat.';

  @override
  String get macUsageSpeech =>
      'Saat layanan dikte Casama tidak dapat dijangkau, pengenalan suara bawaan perangkatmu mengubah ucapanmu menjadi teks.';

  @override
  String get macUsageMicrophone =>
      'Casama menggunakan mikrofon untuk dikte dan panggilan langsung dengan botmu. Hanya setelah kamu setuju, suaramu dikirim ke penyedia AI untuk menjawabmu: Google Gemini untuk panggilan, OpenAI untuk mengubah dikte menjadi teks.';

  @override
  String get macUsageAppleEvents =>
      'Tanya cepat membaca judul jendela terdepan dan tab browsermu saat ini, hanya saat kamu menekan pintasannya.';

  @override
  String get nativeNameFileProvider => 'Komputer Casama';

  @override
  String get nativeNameNotifications => 'Notifikasi Casama';

  @override
  String get nativeNameSafari => 'Casama untuk Safari';

  @override
  String get nativeNameAskCasama => 'Tanya Casama';

  @override
  String get nativeComputer => 'Komputer';

  @override
  String get nativeSafariSignInIos =>
      'Buka Casama di perangkat ini -> Pengaturan -> Masuk di Perangkat Lain, atau tempel tautan masuk di bawah.';

  @override
  String get nativeSafariSignInMac =>
      'Buka Casama di Mac ini -> Pengaturan -> Masuk di Perangkat Lain, atau tempel tautan masuk di bawah.';

  @override
  String get linuxDesktopComment =>
      'Bot yang menyelesaikan pekerjaan, di setiap layar milikmu';

  @override
  String get linuxDesktopKeywords => 'AI;asisten;agen;bot;chat;';

  @override
  String macMenuAbout(String appName) {
    return 'Mengenai $appName';
  }

  @override
  String get macMenuPreferences => 'Preferensi…';

  @override
  String get macMenuServices => 'Layanan';

  @override
  String macMenuHide(String appName) {
    return 'Sembunyikan $appName';
  }

  @override
  String get macMenuHideOthers => 'Sembunyikan Lainnya';

  @override
  String get macMenuShowAll => 'Tampilkan Semua';

  @override
  String macMenuQuit(String appName) {
    return 'Tutup $appName';
  }

  @override
  String get macMenuEdit => 'Edit';

  @override
  String get macMenuUndo => 'Urung';

  @override
  String get macMenuRedo => 'Ulang';

  @override
  String get macMenuCut => 'Potong';

  @override
  String get macMenuCopy => 'Salin';

  @override
  String get macMenuPaste => 'Tempel';

  @override
  String get macMenuPasteAndMatchStyle => 'Tempel dan Cocokkan Gaya';

  @override
  String get macMenuDelete => 'Hapus';

  @override
  String get macMenuSelectAll => 'Pilih Semua';

  @override
  String get macMenuFind => 'Temukan';

  @override
  String get macMenuFindEllipsis => 'Temukan…';

  @override
  String get macMenuFindAndReplace => 'Temukan dan Ganti…';

  @override
  String get macMenuFindNext => 'Temukan Berikutnya';

  @override
  String get macMenuFindPrevious => 'Temukan Sebelumnya';

  @override
  String get macMenuUseSelectionForFind => 'Gunakan Pilihan untuk Temukan';

  @override
  String get macMenuJumpToSelection => 'Lompat ke Pilihan';

  @override
  String get macMenuSpellingAndGrammar => 'Ejaan dan Tata Bahasa';

  @override
  String get macMenuSpelling => 'Ejaan';

  @override
  String get macMenuShowSpelling => 'Tampilkan Ejaan dan Tata Bahasa';

  @override
  String get macMenuCheckDocumentNow => 'Periksa Dokumen Sekarang';

  @override
  String get macMenuCheckSpellingWhileTyping => 'Periksa Ejaan Ketika Mengetik';

  @override
  String get macMenuCheckGrammar => 'Periksa Tata Bahasa Dengan Ejaan';

  @override
  String get macMenuCorrectSpelling => 'Betulkan Ejaan Secara Otomatis';

  @override
  String get macMenuSubstitutions => 'Substitusi';

  @override
  String get macMenuShowSubstitutions => 'Tampilkan Substitusi';

  @override
  String get macMenuSmartCopyPaste => 'Salin/Tempel Cerdas';

  @override
  String get macMenuSmartQuotes => 'Kutipan Cerdas';

  @override
  String get macMenuSmartDashes => 'Tanda Hubung Cerdas';

  @override
  String get macMenuSmartLinks => 'Tautan Cerdas';

  @override
  String get macMenuDataDetectors => 'Pendeteksi Data';

  @override
  String get macMenuTextReplacement => 'Penggantian Teks';

  @override
  String get macMenuTransformations => 'Transformasi';

  @override
  String get macMenuMakeUpperCase => 'Jadikan Huruf Besar';

  @override
  String get macMenuMakeLowerCase => 'Jadikan Huruf Kecil';

  @override
  String get macMenuCapitalize => 'Kapitalkan';

  @override
  String get macMenuSpeech => 'Ucapan';

  @override
  String get macMenuStartSpeaking => 'Mulai Bicara';

  @override
  String get macMenuStopSpeaking => 'Berhenti Bicara';

  @override
  String get macMenuView => 'Lihat';

  @override
  String get macMenuEnterFullScreen => 'Masuk ke Layar Penuh';

  @override
  String get macMenuWindow => 'Jendela';

  @override
  String get macMenuMinimize => 'Minikan';

  @override
  String get macMenuZoom => 'Zoom';

  @override
  String get macMenuBringAllToFront => 'Pindahkan Semua ke Depan';

  @override
  String get macMenuHelp => 'Bantuan';

  @override
  String get macMenuCheckForUpdates => 'Periksa Pembaruan…';

  @override
  String get macMenuSettings => 'Pengaturan…';

  @override
  String get macMenuFile => 'File';

  @override
  String get macMenuNewChat => 'Chat Baru';

  @override
  String get macMenuNewBot => 'Bot Baru…';

  @override
  String get macMenuQuickAsk => 'Tanya Cepat';

  @override
  String get macMenuSearch => 'Cari…';

  @override
  String get macMenuCloseWindow => 'Tutup Jendela';

  @override
  String get macMenuGo => 'Buka';

  @override
  String get macMenuBots => 'Bot';

  @override
  String get macMenuInbox => 'Kotak Masuk';

  @override
  String get macMenuBoard => 'Papan';

  @override
  String get macMenuComputer => 'Komputer';

  @override
  String get macMenuPages => 'Halaman';

  @override
  String get macMenuCasamaHelp => 'Bantuan Casama';

  @override
  String get macMenuSendFeedback => 'Kirim Masukan…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Rutinitas';

  @override
  String get siriRoutines => 'Rutinitas';

  @override
  String get siriCanvas => 'Kanvas';

  @override
  String get siriAutomatic => 'Otomatis';

  @override
  String get siriAutomaticSubtitle => 'Yang terakhir dipasang oleh bot';

  @override
  String get siriChooseCanvas => 'Pilih kanvas';

  @override
  String get siriChooseCanvasDescription =>
      'Tampilkan yang terakhir dipasang bot, atau satu kanvas.';

  @override
  String get siriChooseBot => 'Pilih bot';

  @override
  String get siriChooseBotDescription =>
      'Pilih bot yang ditampilkan widget ini.';

  @override
  String get siriChooseRoutines => 'Pilih rutinitas';

  @override
  String get siriChooseRoutinesDescription =>
      'Tampilkan jadwal berikutnya, atau hingga empat rutinitas yang kamu pilih.';

  @override
  String get siriOpenCasama => 'Buka Casama';

  @override
  String get siriWhere => 'Tempat';

  @override
  String get siriTalkToBot => 'Bicara dengan bot';

  @override
  String get siriTalkToBotDescription =>
      'Memulai panggilan dengan bot yang kamu pilih.';

  @override
  String get siriRunRoutine => 'Jalankan rutinitas';

  @override
  String get siriRunRoutineControlDescription =>
      'Menjalankan rutinitas yang kamu pilih, tanpa membuka Casama.';

  @override
  String get siriCallAction => 'Tindakan panggilan';

  @override
  String get siriAction => 'Tindakan';

  @override
  String get siriStopBot => 'Hentikan bot';

  @override
  String get siriRun => 'Jalankan';

  @override
  String get siriAnswerRequest => 'Jawab permintaan bot';

  @override
  String get siriRequest => 'Permintaan';

  @override
  String get siriAllow => 'Izinkan';

  @override
  String get siriFromWidget => 'Dari widget';

  @override
  String get siriRunRoutineNow => 'Jalankan rutinitas sekarang';

  @override
  String get siriAcceptSuggestion => 'Lakukan saran bot';

  @override
  String get siriSuggestion => 'Saran';

  @override
  String get siriBotStatusDescription =>
      'Status bot dan apa yang sedang dilakukannya';

  @override
  String get siriNextRoutineDescription =>
      'Rutinitas berikutnya dan waktu berjalannya';

  @override
  String get siriAskCasama => 'Tanya Casama';

  @override
  String get siriAskVoiceDescription => 'Tanyakan sesuatu ke bot lewat suara';

  @override
  String get siriWhatWaiting => 'Apa yang menunggu OK-mu';

  @override
  String get siriAsk => 'Tanya';

  @override
  String get siriShortNeedsYou => 'Perlu kamu';

  @override
  String get siriOpeningToFinish => 'Membuka Casama untuk menyelesaikan.';

  @override
  String get siriName => 'Nama';

  @override
  String get siriTitle => 'Judul';

  @override
  String get siriChat => 'Chat';

  @override
  String get siriBotSubtitle =>
      'Bot di Casama, asisten AI yang bisa diajak chat';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Rutinitas yang dijalankan $bot di Casama';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Chat dengan $bot di Casama';
  }

  @override
  String get siriBotInCasama => 'Bot di Casama';

  @override
  String siriRoutineDot(String bot) {
    return 'Rutinitas · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return 'Chat dengan $bot';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'rutinitas';

  @override
  String get siriKeywordChat => 'chat';

  @override
  String get siriAskBot => 'Tanya bot';

  @override
  String get siriAskBotDescription =>
      'Mengirim pertanyaan ke salah satu bot Casama-mu (asisten AI) di chat baru dan membacakan balasannya. Jika bot tidak disebutkan, bot yang terakhir kamu ajak bicara yang menjawab.';

  @override
  String get siriCategoryBots => 'Bot';

  @override
  String get siriAskBotParamDescription =>
      'Bot mana yang ditanya. Kosongkan untuk bot yang terakhir kamu ajak bicara.';

  @override
  String get siriQuestion => 'Pertanyaan';

  @override
  String get siriQuestionDescription =>
      'Apa yang ingin ditanyakan ke bot, dengan bahasamu sendiri.';

  @override
  String get siriWhatShouldIAsk => 'Apa yang harus saya tanyakan?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return 'Tanya $bot $question';
  }

  @override
  String get siriRestOnScreen => 'Sisanya ada di layar.';

  @override
  String get siriRestOnScreenEllipsis => '… Sisanya ada di layar.';

  @override
  String get siriRunRoutineDescription =>
      'Menjalankan salah satu rutinitas bot Casama-mu sekarang. Hasilnya tiba di aplikasi dan sebagai notifikasi, seperti saat rutinitas berjalan sendiri.';

  @override
  String get siriRoutineParamDescription =>
      'Rutinitas mana yang dijalankan sekarang.';

  @override
  String siriSummaryRun(String routine) {
    return 'Jalankan $routine';
  }

  @override
  String get siriWhatNeedsMe => 'Apa yang perlu saya tangani';

  @override
  String get siriWhatNeedsMeDescription =>
      'Memberi tahu berapa banyak hal di Casama yang menunggumu: permintaan bot untuk OK-mu, ambil alih, saran. Jawab di aplikasi.';

  @override
  String get siriOpenBot => 'Buka bot';

  @override
  String get siriOpenBotDescription =>
      'Membuka chatmu dengan salah satu bot Casama-mu.';

  @override
  String get siriOpenBotPersonDescription => 'Membuka chat bot Casama.';

  @override
  String get siriOpenChat => 'Buka chat';

  @override
  String get siriOpenChatDescription =>
      'Membuka salah satu chatmu dengan bot Casama.';

  @override
  String get siriOpenRoutine => 'Buka bot milik rutinitas';

  @override
  String get siriOpenRoutineDescription =>
      'Membuka bot yang menjalankan salah satu rutinitas Casama-mu.';

  @override
  String get siriTalkDescription =>
      'Membuka mode suara dengan salah satu bot Casama-mu. Tersedia di tombol Tindakan.';

  @override
  String get siriAskGetReply => 'Tanya bot dan dapatkan balasannya';

  @override
  String get siriAskGetReplyDescription =>
      'Mengirim pertanyaan ke bot Casama dan mengembalikan teks balasannya untuk dirangkai di Pintasan.';

  @override
  String get siriGetLastReply => 'Dapatkan balasan terakhir';

  @override
  String get siriGetLastReplyDescription =>
      'Mengembalikan teks balasan terbaru dari chat bot Casama.';

  @override
  String get siriStartComputer => 'Mulai komputer';

  @override
  String get siriStartComputerDescription =>
      'Membangunkan komputer Casama setelah konfirmasi.';

  @override
  String get siriComputerName => 'Nama komputer';

  @override
  String get siriYourComputer => 'komputer Casama-mu';

  @override
  String siriStartConfirm(String computer) {
    return 'Mulai $computer?';
  }

  @override
  String get siriOpenToStartComputer => 'Buka Casama untuk memulai komputermu.';

  @override
  String get siriFocusTitle => 'Atur Filter Fokus Casama';

  @override
  String get siriFocusDescription =>
      'Hanya tampilkan bot yang dipilih dan opsional tahan sapaan proaktif saat Fokus ini aktif.';

  @override
  String get siriFocusBots => 'Bot yang ditampilkan';

  @override
  String get siriFocusHold => 'Tahan sapaan proaktif';

  @override
  String get siriFocusShowOne => 'Tampilkan 1 bot';

  @override
  String siriFocusShowMany(int count) {
    return 'Tampilkan $count bot';
  }

  @override
  String get siriFocusHoldCheckIns => 'Tahan sapaan';

  @override
  String get siriFocusAllowCheckIns => 'Izinkan sapaan';

  @override
  String get siriFocusAllBots => 'Semua bot';

  @override
  String get siriFocusAllVisible => 'Semua bot terlihat';

  @override
  String get siriToolAsk => 'Tanya bot Casama';

  @override
  String get siriToolAskDescription =>
      'Ajukan pertanyaan ke salah satu bot Casama pengguna dan kembalikan balasannya.';

  @override
  String get siriCategoryAssistants => 'Asisten';

  @override
  String get siriToolBotDescription => 'Bot Casama mana yang ditanya.';

  @override
  String get siriToolQuestionDescription => 'Apa yang ditanyakan ke bot.';

  @override
  String get siriToolRun => 'Jalankan rutinitas Casama';

  @override
  String get siriToolRunDescription =>
      'Jalankan rutinitas Casama tersimpan setelah konfirmasi dengan pengguna.';

  @override
  String get siriCategoryAutomation => 'Otomasi';

  @override
  String get siriToolRoutineDescription => 'Rutinitas yang dijalankan.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return 'Jalankan $routine dengan $bot?';
  }

  @override
  String get siriToolNeeds => 'Apa yang perlu perhatian di Casama';

  @override
  String get siriToolNeedsDescription =>
      'Periksa berapa banyak persetujuan, ambil alih, atau saran yang menunggu di Casama.';

  @override
  String get siriOpenToCheck =>
      'Buka Casama untuk memeriksa apa yang perlu kamu tangani.';

  @override
  String get siriToolStop => 'Hentikan bot Casama';

  @override
  String get siriToolStopDescription =>
      'Hentikan bot yang sedang menjalankan tugas di Casama.';

  @override
  String get siriToolStopBotDescription => 'Bot yang akan dihentikan.';

  @override
  String siriStoppedBot(String bot) {
    return '$bot dihentikan.';
  }

  @override
  String get siriToolCall => 'Hubungi bot Casama';

  @override
  String get siriToolCallDescription =>
      'Buka Casama dan mulai panggilan langsung dengan bot yang dipilih.';

  @override
  String get siriCategoryCommunication => 'Komunikasi';

  @override
  String get siriToolCallBotDescription => 'Bot yang akan dihubungi.';

  @override
  String siriCalling(String bot) {
    return 'Memanggil $bot.';
  }

  @override
  String siriBotIn(String app) {
    return 'Bot di $app';
  }

  @override
  String get siriMe => 'Saya';

  @override
  String get siriABot => 'sebuah bot';

  @override
  String get siriFavorited => 'Difavoritkan';

  @override
  String siriSentTo(String bot) {
    return 'Dikirim ke $bot';
  }

  @override
  String get siriMessage => 'Pesan';

  @override
  String get siriNone => 'Tidak ada';

  @override
  String get siriErrorOneBot =>
      'Casama mengirim ke satu bot sekaligus. Bot mana?';

  @override
  String get siriErrorTextOnly =>
      'Siri bisa mengirim teks ke bot. Tambahkan file, gambar, dan tempat di Casama.';

  @override
  String get siriErrorNoBot => 'Bot itu tidak ditemukan di Casama.';

  @override
  String get siriWhatShouldISend => 'Apa yang harus saya kirim?';

  @override
  String get siriAskCasamaBot => 'Tanya bot Casama';

  @override
  String siriAskName(String bot) {
    return 'Tanya $bot';
  }

  @override
  String get siriAskAboutThis => 'Tanya Casama tentang ini';

  @override
  String siriPhraseAsk(String app) {
    return 'Tanya $app';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return 'Tanya bot di $app';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return 'Tanya $bot di $app';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return 'Bicara dengan bot di $app';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return 'Bicara dengan $bot di $app';
  }

  @override
  String siriPhraseRunIn(String app) {
    return 'Jalankan rutinitas di $app';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return 'Jalankan $routine di $app';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return 'Apa yang perlu saya tangani di $app';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return 'Apa yang menunggu di $app';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return 'Tanyakan sesuatu ke $app';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return 'Jalankan rutinitas $routine milikku di $app';
  }

  @override
  String get siriABotSubject => 'Sebuah bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot perlu OK-mu.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot memintamu mengambil alih.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot punya saran.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot memerlukanmu.';
  }

  @override
  String get siriOneThingNeedsYou => 'Satu hal perlu kamu tangani.';

  @override
  String siriCountThingsNeedYou(int count) {
    return '$count hal perlu kamu tangani.';
  }

  @override
  String get siriUnlockPhone => 'Buka kunci ponselmu lalu coba lagi.';

  @override
  String get siriGeminiOff =>
      'Gemini dinonaktifkan untuk Casama di ponsel ini (Casama → Pengaturan → Privasi).';

  @override
  String get suggestionActionTurnOn => 'Nyalakan';

  @override
  String suggestionActionRemindMe(String date) {
    return 'Ingatkan $date';
  }

  @override
  String get suggestionActionPickTime => 'Pilih waktu';

  @override
  String get suggestionActionPutAwayAll => 'Simpan semua';

  @override
  String suggestionActionPutAwayAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Simpan semua $count ide',
      one: 'Simpan 1 ide',
    );
    return '$_temp0';
  }

  @override
  String get suggestionActionOpen => 'Buka';

  @override
  String get suggestionActionGotIt => 'Mengerti';

  @override
  String get suggestionActionLater => 'Nanti';

  @override
  String get suggestionActionSomethingElse => 'Hal lainnya';

  @override
  String get suggestionTurnedOn => 'Dinyalakan';

  @override
  String suggestionReminderSet(String date) {
    return 'Pengingat diatur untuk $date';
  }

  @override
  String get suggestionSnoozed => 'Disimpan untuk nanti';

  @override
  String get suggestionSnoozedExpired => 'Disimpan — ditunda dua kali';

  @override
  String suggestionPutAwayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ide disimpan',
      one: '1 ide disimpan',
    );
    return '$_temp0';
  }

  @override
  String get suggestionUndo => 'Urung';

  @override
  String get suggestionLaterTomorrow => 'Besok pagi';

  @override
  String get suggestionLaterEvening => 'Sore ini';

  @override
  String get suggestionLaterNextWeek => 'Minggu depan';

  @override
  String suggestionMoreWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ide lagi menunggu',
      one: '1 ide lagi menunggu',
    );
    return '$_temp0';
  }

  @override
  String botIdeasGrouped(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count ide',
      one: '$name · 1 ide',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutine(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count hasil rutinitas hari ini',
      one: '$name · 1 hasil rutinitas hari ini',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNotice(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count pembaruan hari ini',
      one: '$name · 1 pembaruan hari ini',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutinePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hasil rutinitas hari ini',
      one: '1 hasil rutinitas hari ini',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNoticePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pembaruan hari ini',
      one: '1 pembaruan hari ini',
    );
    return '$_temp0';
  }

  @override
  String briefSinceYesterday(String summary) {
    return 'Sejak kemarin: $summary';
  }

  @override
  String briefSincePages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count halaman',
      one: '1 halaman',
    );
    return '$_temp0';
  }

  @override
  String briefSinceRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hasil rutinitas',
      one: '1 hasil rutinitas',
    );
    return '$_temp0';
  }

  @override
  String briefSinceUpdates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pembaruan',
      one: '1 pembaruan',
    );
    return '$_temp0';
  }

  @override
  String get notifTurnOn => 'Nyalakan';

  @override
  String get notifOpen => 'Buka';

  @override
  String get notifGotIt => 'Mengerti';

  @override
  String get notifRemindMe => 'Ingatkan saya';

  @override
  String get notifLater => 'Nanti';

  @override
  String get watchTurnOn => 'Nyalakan';

  @override
  String get watchGotIt => 'Mengerti';

  @override
  String get watchRemindMe => 'Ingatkan';

  @override
  String get watchLater => 'Nanti';

  @override
  String get watchOpen => 'Buka';
}
