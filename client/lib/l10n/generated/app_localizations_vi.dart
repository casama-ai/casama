// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

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
  String get tabTitleCall => 'Cuộc gọi';

  @override
  String get tabTitleProject => 'Dự án';

  @override
  String get tabTitleGroupChat => 'Chat nhóm';

  @override
  String get loading => 'Đang tải…';

  @override
  String get retry => 'Thử lại';

  @override
  String get keepGoing => 'Tiếp tục';

  @override
  String get keepGoingMessage => 'Làm tiếp từ chỗ đã dừng.';

  @override
  String get startOver => 'Làm lại từ đầu';

  @override
  String get continueRunHint =>
      'Làm tiếp từ chỗ đã dừng với ngân sách mới, thay vì làm lại yêu cầu từ đầu.';

  @override
  String get cancel => 'Hủy';

  @override
  String get save => 'Lưu';

  @override
  String get delete => 'Xóa';

  @override
  String get edit => 'Sửa';

  @override
  String get close => 'Đóng';

  @override
  String get create => 'Tạo';

  @override
  String get continueLabel => 'Tiếp tục';

  @override
  String get somethingWentWrong => 'Đã xảy ra lỗi';

  @override
  String get errorViewHint =>
      'Khởi động lại ứng dụng có thể sẽ khắc phục được.';

  @override
  String get signInTitle => 'Đăng nhập Casama';

  @override
  String get signUpTitle => 'Tạo tài khoản';

  @override
  String get email => 'Email';

  @override
  String get password => 'Mật khẩu';

  @override
  String get signIn => 'Đăng nhập';

  @override
  String get signUp => 'Tạo tài khoản';

  @override
  String get haveAccount => 'Đã có tài khoản? Đăng nhập';

  @override
  String get needAccount => 'Người mới? Tạo tài khoản';

  @override
  String get magicLink => 'Gửi liên kết đăng nhập qua email';

  @override
  String get magicLinkSent => 'Kiểm tra email để lấy liên kết đăng nhập.';

  @override
  String get continueWithGoogle => 'Tiếp tục với Google';

  @override
  String get continueWithApple => 'Tiếp tục với Apple';

  @override
  String get continueWithEmail => 'Tiếp tục với Email';

  @override
  String get moreSignInOptions => 'Tùy chọn khác';

  @override
  String get usePasswordInstead => 'Dùng mật khẩu';

  @override
  String get checkInboxTitle => 'Kiểm tra Hộp thư đến';

  @override
  String checkInboxBody(String email) {
    return 'Chúng tôi đã gửi liên kết đăng nhập và mã 6 chữ số tới $email. Nhấn vào liên kết hoặc nhập mã tại đây.';
  }

  @override
  String get emailCodeLabel => 'Mã 6 chữ số';

  @override
  String get resendLink => 'Gửi lại';

  @override
  String resendLinkIn(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Gửi lại sau $secondsString giây';
  }

  @override
  String get useDifferentEmail => 'Dùng email khác';

  @override
  String get authWrongPassword =>
      'Email và mật khẩu không khớp. Thử lại hoặc đăng nhập bằng liên kết email.';

  @override
  String get authEmailNotConfirmed =>
      'Hãy xác nhận email trước: mở liên kết chúng tôi đã gửi cho bạn.';

  @override
  String get authCodeInvalid =>
      'Mã không đúng hoặc đã hết hạn. Kiểm tra email mới nhất hoặc gửi mã mới.';

  @override
  String get authTooManyTries => 'Thử quá nhiều lần. Đợi một phút rồi thử lại.';

  @override
  String tooManyRequestsWait(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '$seconds giây',
      one: '1 giây',
    );
    return 'Quá nhiều yêu cầu cùng lúc. Thử lại sau $_temp0.';
  }

  @override
  String get tooManyRequestsReady => 'Bạn có thể thử lại ngay bây giờ.';

  @override
  String computerInUseBy(String name) {
    return '$name đang dùng máy tính này';
  }

  @override
  String get authAccountExists => 'Email này đã có tài khoản. Hãy đăng nhập.';

  @override
  String get authSignupDisabled => 'Máy chủ này hiện không nhận đăng ký mới.';

  @override
  String get useMagicLinkInstead => 'Gửi liên kết qua email';

  @override
  String get invalidEmail => 'Nhập địa chỉ email hợp lệ';

  @override
  String get passwordTooShort => 'Dùng ít nhất 6 ký tự';

  @override
  String get signOut => 'Đăng xuất';

  @override
  String get onboardingTitle => 'Thiết lập không gian làm việc';

  @override
  String get createWorkspace => 'Tạo không gian làm việc';

  @override
  String get workspaceName => 'Tên không gian làm việc';

  @override
  String get joinWorkspace => 'Tham gia bằng mã mời';

  @override
  String get inviteCode => 'Mã mời';

  @override
  String get join => 'Tham gia';

  @override
  String get addModelKeyTitle => 'Thêm khóa mô hình';

  @override
  String get addModelKeyBody =>
      'Bot dùng khóa nhà cung cấp mô hình của riêng bạn. Khóa được lưu mã hóa và không bao giờ hiển thị lại.';

  @override
  String get provider => 'Nhà cung cấp';

  @override
  String get label => 'Nhãn';

  @override
  String get apiKey => 'Khóa API';

  @override
  String get baseUrl => 'URL cơ sở';

  @override
  String get testKey => 'Kiểm tra khóa';

  @override
  String keyOk(String model, int ms) {
    final intl.NumberFormat msNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String msString = msNumberFormat.format(ms);

    return 'Khóa hoạt động ($model, $msString ms)';
  }

  @override
  String keyFailed(String error) {
    return 'Kiểm tra khóa thất bại: $error';
  }

  @override
  String get createFirstBot => 'Tạo bot đầu tiên';

  @override
  String get botName => 'Tên bot';

  @override
  String get model => 'Mô hình';

  @override
  String get persona => 'Hướng dẫn';

  @override
  String get personaHint =>
      'Bot này làm gì và hoạt động ra sao. Hình mẫu sẽ điền sẵn phần này; bạn có thể sửa thoải mái.';

  @override
  String get modelKey => 'Khóa mô hình';

  @override
  String get navComputer => 'Máy tính';

  @override
  String get navChats => 'Chat';

  @override
  String get navTasks => 'Tác vụ';

  @override
  String get settingsConnectionsSection => 'Kết nối';

  @override
  String get advanced => 'Nâng cao';

  @override
  String get settingsAdvancedSummary => 'Bí mật, máy tính, thiết bị';

  @override
  String get bots => 'Bot';

  @override
  String get newBot => 'Bot mới';

  @override
  String get noBots => 'Chưa có bot nào';

  @override
  String get botStatusIdle => 'Đang nghỉ';

  @override
  String get botStatusWorking => 'Đang làm';

  @override
  String get botStatusWaiting => 'Đang chờ bạn';

  @override
  String sidebarMoreWorking(int count) {
    return '$count bot khác đang làm';
  }

  @override
  String get botStatusDisabled => 'Đã tắt';

  @override
  String costToday(String cost) {
    return '$cost hôm nay';
  }

  @override
  String get newChat => 'Chat mới';

  @override
  String get conversations => 'Cuộc trò chuyện';

  @override
  String messageHint(String bot) {
    return 'Nhắn cho $bot';
  }

  @override
  String messageHintWithApps(String bot) {
    return 'Nhắn cho $bot · gõ @ để nhắc ứng dụng';
  }

  @override
  String get mentionSectionBots => 'Bot';

  @override
  String get mentionSectionApps => 'Ứng dụng';

  @override
  String get mentionSectionAddToBot => 'Thêm vào bot này';

  @override
  String get mentionSectionConnect => 'Kết nối';

  @override
  String get mentionSectionStartGroup => 'Bắt đầu chat nhóm';

  @override
  String get mentionBadgeBot => 'Bot';

  @override
  String get mentionBadgeApp => 'Ứng dụng';

  @override
  String get mentionAddAction => 'Thêm';

  @override
  String get mentionConnectAction => 'Kết nối';

  @override
  String get mentionMaxApps =>
      'Bạn có thể nhắc tối đa 3 ứng dụng mỗi tin nhắn.';

  @override
  String get mentionRemovedApp => 'Ứng dụng đã bị gỡ';

  @override
  String get send => 'Gửi';

  @override
  String get stop => 'Dừng';

  @override
  String get thinking => 'Đang nghĩ…';

  @override
  String get checkingItsWork => 'Đang kiểm tra lại…';

  @override
  String get mapFullScreen => 'Toàn màn hình';

  @override
  String get mapTitle => 'Bản đồ';

  @override
  String runFailed(String message) {
    return '$message';
  }

  @override
  String get runCancelled => 'Đã dừng.';

  @override
  String emptyChat(String bot) {
    return 'Hãy chào $bot.';
  }

  @override
  String get toolRunning => 'Đang chạy';

  @override
  String get toolFailedLabel => 'Thất bại';

  @override
  String get toolOutput => 'Đầu ra';

  @override
  String get remembered => 'Đã nhớ một thông tin';

  @override
  String skillLoaded(String name) {
    return 'Đã tải kỹ năng $name';
  }

  @override
  String checkpointSaved(String label) {
    return 'Đã lưu điểm khôi phục: $label';
  }

  @override
  String computerState(String state) {
    return 'Máy tính $state';
  }

  @override
  String get activity => 'Hoạt động';

  @override
  String get timelineTitle => 'Dòng thời gian lượt chạy';

  @override
  String get allEvents => 'Tất cả';

  @override
  String get filterTools => 'Công cụ';

  @override
  String get filterMessages => 'Tin nhắn';

  @override
  String get filterSystem => 'Hệ thống';

  @override
  String get restore => 'Khôi phục';

  @override
  String get restoreConfirm =>
      'Quay về điểm khôi phục này? Các tệp đã thay đổi từ lúc đó sẽ bị ghi đè.';

  @override
  String get restored => 'Đã khôi phục từ điểm khôi phục.';

  @override
  String get noRuns => 'Chưa có lượt chạy nào.';

  @override
  String get computerTitle => 'Máy tính';

  @override
  String get computerStart => 'Khởi động';

  @override
  String get computerSleep => 'Ngủ';

  @override
  String get screen => 'Màn hình';

  @override
  String get terminal => 'Terminal';

  @override
  String get files => 'Tệp';

  @override
  String get noScreen =>
      'Chưa có gì trên màn hình. Trang trình duyệt của bot sẽ hiện ở đây.';

  @override
  String get refresh => 'Làm mới';

  @override
  String get upload => 'Tải lên';

  @override
  String get download => 'Tải xuống';

  @override
  String get emptyFolder => 'Thư mục này trống';

  @override
  String get noCheckpoints =>
      'Các điểm này được lưu tự động trước khi thay đổi rủi ro để bạn có thể hoàn tác.';

  @override
  String get computerAsleep =>
      'Máy tính đang ngủ. Tệp vẫn được lưu và máy sẽ tự thức khi cần.';

  @override
  String get connectTerminal => 'Kết nối';

  @override
  String get terminalDisconnected => 'Đã ngắt kết nối.';

  @override
  String get terminalReconnecting =>
      'Máy chủ đang khởi động lại, đang kết nối lại…';

  @override
  String get memory => 'Trí nhớ';

  @override
  String get noMemories => 'Chưa nhớ gì.';

  @override
  String get noMemoriesMatch => 'Không có mục ghi nhớ nào khớp.';

  @override
  String get clearSearch => 'Xóa';

  @override
  String get addMemory => 'Thêm ghi nhớ';

  @override
  String get addMemoryHelp =>
      'Điều bot luôn cần biết về bạn hoặc công việc của bạn.';

  @override
  String get addMemoryFactHint =>
      'Ví dụ: Năm tài chính của chúng tôi bắt đầu vào tháng 4.';

  @override
  String get addMemoryPreferenceHint =>
      'Ví dụ: Tóm tắt ngắn gọn dưới 5 gạch đầu dòng.';

  @override
  String get memoryAdded => 'Đã thêm vào trí nhớ';

  @override
  String get pin => 'Ghim';

  @override
  String get unpin => 'Bỏ ghim';

  @override
  String get deleteMemoryConfirm =>
      'Quên điều này? Thao tác này không thể hoàn tác.';

  @override
  String get skills => 'Kỹ năng';

  @override
  String get noSkills =>
      'Chưa có kỹ năng nào. Kỹ năng là hướng dẫn mà bot tải khi phù hợp.';

  @override
  String get newSkill => 'Kỹ năng mới';

  @override
  String get skillName => 'Tên (chữ thường, dấu gạch ngang)';

  @override
  String get skillDescription => 'Mô tả một dòng';

  @override
  String get skillBody => 'Hướng dẫn (Markdown)';

  @override
  String get enabled => 'Đã bật';

  @override
  String get settings => 'Cài đặt';

  @override
  String get workspace => 'Không gian làm việc';

  @override
  String get switchWorkspace => 'Đổi không gian làm việc';

  @override
  String get modelKeys => 'Khóa mô hình';

  @override
  String get moreProviders => 'Thêm nhà cung cấp';

  @override
  String get integrationsAdvancedSummary =>
      'Composio, Pipedream, máy chủ tùy chỉnh';

  @override
  String get toolPermissions => 'Quyền công cụ';

  @override
  String get devicesAdvancedSummary =>
      'Thời gian lưu, mô hình riêng, bot có quyền truy cập';

  @override
  String get companionAdvancedSummary =>
      'Lệnh, công cụ cục bộ (MCP), coding agent';

  @override
  String get noKeys => 'Chưa có khóa mô hình nào.';

  @override
  String get addKey => 'Thêm khóa';

  @override
  String get usage => 'Mức sử dụng';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String inviteSent(String email) {
    return 'Đã gửi lời mời tới $email.';
  }

  @override
  String get botProfile => 'Hồ sơ bot';

  @override
  String get groupMembers => 'Bot trong cuộc trò chuyện này';

  @override
  String get groupMembersHelp =>
      'Mỗi bot giữ trí nhớ và cài đặt riêng. Chạm vào một bot để mở hồ sơ.';

  @override
  String get botAdvancedSummary =>
      'Ứng dụng chat, liên kết, quy tắc, trình theo dõi, plugin, hoạt động';

  @override
  String get botActivityRow => 'Mỗi lượt chạy, từng bước một';

  @override
  String get createBotAdvancedSummary => 'Khóa mô hình và mô hình';

  @override
  String get botProfileSection => 'Hồ sơ';

  @override
  String get botBrain => 'Bộ não';

  @override
  String get botAbilities => 'Năng lực';

  @override
  String get botSchedule => 'Lịch trình';

  @override
  String get chatComputerLive => 'Đang làm trên máy tính của bot';

  @override
  String get autonomy => 'Mức tự chủ';

  @override
  String get autonomyAskAlways => 'Hỏi trước khi làm';

  @override
  String get autonomyAskRisky => 'Hỏi với thao tác rủi ro';

  @override
  String get autonomyAutonomous => 'Tự hành động';

  @override
  String get saved => 'Đã lưu.';

  @override
  String get justNow => 'vừa xong';

  @override
  String minutesAgo(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString phút trước',
      one: '1 phút trước',
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
      other: '$nString giờ trước',
      one: '1 giờ trước',
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
      other: '$nString ngày trước',
      one: 'hôm qua',
    );
    return '$_temp0';
  }

  @override
  String get aBot => 'Một bot';

  @override
  String get addIntegration => 'Thêm tích hợp';

  @override
  String get addSecret => 'Thêm bí mật';

  @override
  String get allowedHosts => 'Máy chủ được phép';

  @override
  String get allowedHostsHelp =>
      'Cách nhau bằng dấu phẩy, ví dụ api.github.com';

  @override
  String get alwaysAllow => 'Luôn cho phép';

  @override
  String get approval => 'Phê duyệt';

  @override
  String get approvalAlreadyDecided =>
      'Yêu cầu này đã được xử lý hoặc đã hết hạn.';

  @override
  String get approvals => 'Phê duyệt';

  @override
  String get approve => 'Phê duyệt';

  @override
  String get approved => 'Đã phê duyệt';

  @override
  String get authHeaderOptional => 'Tiêu đề ủy quyền (tùy chọn)';

  @override
  String get authSecretName => 'Tên bí mật xác thực (tùy chọn)';

  @override
  String get authSecretNameHelp =>
      'Tên một bí mật từ Cài đặt › Bí mật, được gửi dưới dạng bearer token';

  @override
  String get baseUrlOptional => 'URL cơ sở (tùy chọn)';

  @override
  String get blankBot => 'Trống';

  @override
  String get defaultBotName => 'Chief';

  @override
  String get chooseModel => 'Chọn mô hình';

  @override
  String get createBotNeedsModel => 'Chọn mô hình ở trên để tạo bot này.';

  @override
  String get createBotKeyRejected =>
      'Nhà cung cấp đã từ chối khóa này. Kiểm tra trong Cài đặt → Khóa mô hình hoặc chọn khóa khác.';

  @override
  String get createBotDiscardTitle => 'Hủy bot này?';

  @override
  String get createBotDiscardBody => 'Thông tin bạn đã nhập ở đây sẽ bị mất.';

  @override
  String get searchModels => 'Tìm mô hình hoặc nhập ID mô hình';

  @override
  String get recommendedModels => 'Đề xuất';

  @override
  String get allModels => 'Tất cả mô hình';

  @override
  String useCustomModel(String id) {
    return 'Dùng “$id”';
  }

  @override
  String modelListFallback(String reason) {
    return 'Đang hiển thị các mô hình gợi ý. $reason Bạn vẫn có thể nhập bất kỳ ID mô hình nào.';
  }

  @override
  String get noModelsFound => 'Không có mô hình nào khớp.';

  @override
  String get addModelKeyFirst =>
      'Hãy thêm khóa mô hình trước. Bot của bạn dùng khóa này để suy nghĩ; khóa được lưu mã hóa và không bao giờ hiển thị lại.';

  @override
  String get composioToolkits =>
      'Bộ công cụ (cách nhau bằng dấu phẩy, ví dụ github, gmail)';

  @override
  String get copySecret => 'Sao chép bí mật';

  @override
  String get cronExpression => 'Biểu thức cron';

  @override
  String get cronHelp => 'phút giờ ngày tháng thứ';

  @override
  String get denied => 'Đã từ chối';

  @override
  String get deny => 'Từ chối';

  @override
  String get everyHour => 'Mỗi giờ';

  @override
  String get expired => 'Đã hết hạn';

  @override
  String get inbox => 'Hộp thư đến';

  @override
  String get integrationName => 'Tên';

  @override
  String get integrationNameHelp => 'Chữ thường, số và dấu gạch dưới';

  @override
  String get integrationType => 'Loại';

  @override
  String get integrations => 'Tích hợp';

  @override
  String get kindMcp => 'Máy chủ MCP';

  @override
  String get kindOpenapi => 'OpenAPI';

  @override
  String get markAllRead => 'Đánh dấu tất cả đã đọc';

  @override
  String get newRoutine => 'Quy trình mới';

  @override
  String get noIntegrationsForBot =>
      'Hãy thêm tích hợp trong Cài đặt trước, sau đó bật cho bot này tại đây.';

  @override
  String get noRoutines => 'Chưa có quy trình nào';

  @override
  String get noSecrets => 'Chưa có bí mật nào';

  @override
  String get notifications => 'Thông báo';

  @override
  String get openInbox => 'Mở Hộp thư đến';

  @override
  String get pipedreamApps => 'Ứng dụng (cách nhau bằng dấu phẩy)';

  @override
  String get pipedreamClientId => 'Client ID';

  @override
  String get pipedreamClientSecret => 'Client secret';

  @override
  String get pipedreamProject => 'ID dự án';

  @override
  String get riskHigh => 'Rủi ro cao';

  @override
  String get riskLow => 'Rủi ro thấp';

  @override
  String get riskMedium => 'Rủi ro vừa';

  @override
  String get routineGithub => 'Khi có sự kiện GitHub';

  @override
  String get routineInstructions => 'Hướng dẫn';

  @override
  String get routineInstructionsHint => 'Bot nên làm gì mỗi lần chạy?';

  @override
  String get routineName => 'Tên';

  @override
  String get routineEditTitle => 'Sửa quy trình';

  @override
  String get routineEditSubtitle => 'Thay đổi việc cần làm và thời điểm chạy.';

  @override
  String get routineRecentRuns => 'Các lượt chạy gần đây';

  @override
  String get routineNoRuns => 'Chưa chạy lần nào.';

  @override
  String get routineSaved => 'Đã lưu quy trình';

  @override
  String get routineStarted => 'Đã bắt đầu quy trình';

  @override
  String get routineWebhook => 'Khi có webhook';

  @override
  String get routines => 'Quy trình';

  @override
  String get routineAdvancedSummary =>
      'Trình kích hoạt GitHub và webhook, cron, múi giờ';

  @override
  String get routineRepeatDaily => 'Hằng ngày';

  @override
  String get routineRepeatWeekdays => 'Ngày trong tuần';

  @override
  String get routineRepeatWeekly => 'Hằng tuần';

  @override
  String get routineDay => 'Ngày';

  @override
  String get routineTimeLabel => 'Giờ';

  @override
  String get routineRunsAt => 'Chạy lúc';

  @override
  String routineTimesIn(String timezone) {
    return 'Giờ theo múi giờ $timezone';
  }

  @override
  String routineCustomSchedule(String schedule) {
    return 'Tùy chỉnh: $schedule';
  }

  @override
  String get routineOtherTriggers => 'Trình kích hoạt khác';

  @override
  String cronEveryMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Mỗi $nString phút',
      one: 'Mỗi phút',
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
      other: 'Mỗi $nString giờ',
      one: 'Mỗi giờ',
    );
    return '$_temp0';
  }

  @override
  String cronHourlyAt(String minute) {
    return 'Mỗi giờ vào phút :$minute';
  }

  @override
  String cronDailyAt(String time) {
    return 'Hằng ngày lúc $time';
  }

  @override
  String cronWeekdaysAt(String time) {
    return 'Thứ hai – Thứ sáu lúc $time';
  }

  @override
  String cronWeekendsAt(String time) {
    return 'Cuối tuần lúc $time';
  }

  @override
  String cronDaysAt(String days, String time) {
    return '$days lúc $time';
  }

  @override
  String cronMonthlyAt(int day, String time) {
    return 'Ngày $day hằng tháng lúc $time';
  }

  @override
  String cronAnd(String items, String last) {
    return '$items và $last';
  }

  @override
  String cronDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'mỗi Chủ nhật',
      'mon': 'mỗi Thứ hai',
      'tue': 'mỗi Thứ ba',
      'wed': 'mỗi Thứ tư',
      'thu': 'mỗi Thứ năm',
      'fri': 'mỗi Thứ sáu',
      'sat': 'mỗi Thứ bảy',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String cronDay(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      'sun': 'Chủ nhật',
      'mon': 'Thứ hai',
      'tue': 'Thứ ba',
      'wed': 'Thứ tư',
      'thu': 'Thứ năm',
      'fri': 'Thứ sáu',
      'sat': 'Thứ bảy',
      'other': '$day',
    });
    return '$_temp0';
  }

  @override
  String get headlessScreenTitle => 'Xem trực tiếp bot làm việc';

  @override
  String get headlessScreenEmpty =>
      'Máy tính này chạy chế độ chỉ trình duyệt để giữ nhẹ. Bạn sẽ thấy các trang web của bot ở đây khi bot mở trang. Chuyển sang màn hình nền để xem và điều khiển cả ứng dụng.';

  @override
  String get headlessScreenChecking =>
      'Đang kiểm tra trang mới sau mỗi vài giây';

  @override
  String get headlessBrowserOnly => 'Chỉ trình duyệt';

  @override
  String get switchedToDesktopHere =>
      'Đã chuyển sang Màn hình nền. Màn hình máy sẽ hiện ở đây khi khởi động xong.';

  @override
  String get desktopBarLabel => 'Màn hình nền · dùng nhiều bộ nhớ hơn';

  @override
  String get switchToBrowserOnly => 'Chuyển sang chỉ trình duyệt';

  @override
  String get switchingToBrowserOnly => 'Đang chuyển sang chỉ trình duyệt…';

  @override
  String get switchedToBrowserOnly =>
      'Đã chuyển sang chỉ trình duyệt. Hiện máy tốn ít bộ nhớ hơn.';

  @override
  String get runNow => 'Chạy ngay';

  @override
  String get secretName => 'Tên';

  @override
  String get secretNameHelp => 'Chữ hoa, ví dụ GITHUB_TOKEN';

  @override
  String get secretValue => 'Giá trị';

  @override
  String get secrets => 'Bí mật';

  @override
  String get serverUrl => 'URL máy chủ';

  @override
  String get specUrl => 'URL đặc tả OpenAPI';

  @override
  String get startFrom => 'Hình mẫu';

  @override
  String get storedEncrypted => 'Lưu mã hóa; không bao giờ hiển thị lại';

  @override
  String get taskBlocked => 'Bị chặn';

  @override
  String get taskDoing => 'Đang làm';

  @override
  String get taskDone => 'Xong';

  @override
  String get taskTodo => 'Cần làm';

  @override
  String get test => 'Kiểm tra';

  @override
  String get timezone => 'Múi giờ';

  @override
  String get triggerGithub => 'GitHub';

  @override
  String get triggerSchedule => 'Lặp lại';

  @override
  String get triggerWebhook => 'Webhook';

  @override
  String get viewRun => 'Xem lượt chạy';

  @override
  String get webhookCreated => 'Đã tạo Webhook';

  @override
  String get webhookSecret => 'Mã bí mật ký';

  @override
  String get webhookShownOnce =>
      'Sao chép mã bí mật ký ngay. Mã này chỉ hiển thị một lần.';

  @override
  String get webhookUrl => 'URL';

  @override
  String botWantsTo(String bot, String summary) {
    return '$bot: $summary';
  }

  @override
  String integrationFailed(String error) {
    return 'Kết nối thất bại: $error';
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
      other: 'Đã kết nối, $nString công cụ',
      one: 'Đã kết nối, 1 công cụ',
    );
    return '$_temp0';
  }

  @override
  String nextRun(String when) {
    return 'Tiếp theo: $when';
  }

  @override
  String onlySentTo(String hosts) {
    return 'Chỉ gửi tới $hosts';
  }

  @override
  String requestedAgo(String when) {
    return 'đã yêu cầu $when';
  }

  @override
  String routineSchedule(String cron, String timezone) {
    return '$cron ($timezone)';
  }

  @override
  String templateIncludesRoutines(String names) {
    return 'Bao gồm quy trình: $names.';
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
      other: '$nString công cụ',
      one: '1 công cụ',
    );
    return '$_temp0';
  }

  @override
  String get botBackInControl => 'Bot đã điều khiển trở lại';

  @override
  String get botComputer => 'Máy tính';

  @override
  String get botComputerDefault =>
      'Máy tính riêng nếu bot có, nếu không thì dùng máy tính chung của nhóm';

  @override
  String get botInControl => 'Bot đang điều khiển';

  @override
  String get computerName => 'Tên';

  @override
  String get computers => 'Máy tính';

  @override
  String get connectingLive => 'Đang kết nối…';

  @override
  String get dismiss => 'Bỏ qua';

  @override
  String get renameTopic => 'Đổi tên';

  @override
  String get library => 'Thư viện';

  @override
  String get navLibrary => 'Thư viện';

  @override
  String get librarySearchHint => 'Tìm trong Thư viện';

  @override
  String get libraryFilterAll => 'Tất cả';

  @override
  String get libraryFilterPages => 'Trang web & trò chơi';

  @override
  String get libraryFilterImages => 'Hình ảnh';

  @override
  String get libraryFilterVideos => 'Video';

  @override
  String get libraryFilterAudio => 'Âm thanh';

  @override
  String get libraryFilterDocuments => 'Tài liệu';

  @override
  String get libraryFilterFiles => 'Tệp';

  @override
  String get creationKindPage => 'Trang';

  @override
  String get creationKindImage => 'Hình ảnh';

  @override
  String get creationKindVideo => 'Video';

  @override
  String get creationKindAudio => 'Âm thanh';

  @override
  String get creationKindDocument => 'Tài liệu';

  @override
  String get creationKindFile => 'Tệp';

  @override
  String get libraryPinned => 'Đã ghim';

  @override
  String get libraryToday => 'Hôm nay';

  @override
  String get libraryYesterday => 'Hôm qua';

  @override
  String get libraryThisWeek => 'Tuần này';

  @override
  String get libraryEarlier => 'Trước đó';

  @override
  String get videoCantPlay => 'Video này không phát được trên thiết bị này.';

  @override
  String get libraryEmptyTitle => 'Chúng ta nên tạo gì trước tiên?';

  @override
  String get libraryEmptyBody =>
      'Chọn một gợi ý để bot bắt đầu ngay. Mọi thứ bot tạo ra sẽ tự động lưu tại đây.';

  @override
  String get libraryNoMatch => 'Không có mục nào khớp.';

  @override
  String get libraryStarterGame => 'Một trò chơi nhỏ';

  @override
  String get libraryStarterGamePrompt =>
      'Tạo cho tôi một trò chơi nhỏ chơi được trên trình duyệt.';

  @override
  String get libraryStarterLogo => 'Một logo';

  @override
  String get libraryStarterLogoPrompt => 'Thiết kế logo cho dự án của tôi.';

  @override
  String get libraryStarterSite => 'Một trang web đơn';

  @override
  String get libraryStarterSitePrompt =>
      'Tạo trang web một trang cho doanh nghiệp của tôi.';

  @override
  String get libraryStarterVideo => 'Một video ngắn';

  @override
  String get libraryStarterVideoPrompt => 'Tạo một video ngắn về ';

  @override
  String get libraryStarterCard => 'Một thiệp sinh nhật';

  @override
  String get libraryStarterCardPrompt => 'Tạo một thiệp sinh nhật cho ';

  @override
  String get libraryStarterReport => 'Một báo cáo';

  @override
  String get libraryStarterReportPrompt => 'Nghiên cứu và viết báo cáo về ';

  @override
  String get libraryStarterElse => 'Thứ khác…';

  @override
  String get creationOpen => 'Mở';

  @override
  String get creationPlay => 'Phát';

  @override
  String get creationView => 'Xem';

  @override
  String get creationChangeIt => 'Sửa lại';

  @override
  String creationChangeDraft(String title) {
    return 'Về “$title”: ';
  }

  @override
  String creationMadeBy(String bot) {
    return 'Tạo bởi $bot';
  }

  @override
  String creationVersion(int n) {
    return 'phiên bản $n';
  }

  @override
  String creationFromChat(String bot) {
    return 'Từ cuộc trò chuyện với $bot';
  }

  @override
  String creationFromBot(String bot) {
    return 'Tạo bởi $bot';
  }

  @override
  String get creationFromHelp => 'Đi tới cuộc trò chuyện';

  @override
  String get creationDetails => 'Chi tiết';

  @override
  String get creationAlongside => 'Tạo cùng lúc';

  @override
  String creationDeleted(String title) {
    return 'Đã xóa “$title”';
  }

  @override
  String get showInLibrary => 'Hiện trong Thư viện';

  @override
  String get pinInLibrary => 'Ghim trong Thư viện';

  @override
  String get libraryItemNotFound =>
      'Mục này chưa có trong Thư viện. Thử lại sau giây lát.';

  @override
  String creationPinned(String title) {
    return 'Đã ghim “$title”';
  }

  @override
  String creationUnpinned(String title) {
    return 'Đã bỏ ghim “$title”';
  }

  @override
  String pageCardUpdated(int version) {
    return 'Đã cập nhật · phiên bản $version';
  }

  @override
  String get madeHere => 'Tạo tại đây';

  @override
  String madeHereEmpty(String bot) {
    return '$bot chưa tạo gì cả.';
  }

  @override
  String get madeHereThisChat => 'Trong cuộc trò chuyện này';

  @override
  String madeHereByBot(String bot) {
    return 'Tạo bởi $bot';
  }

  @override
  String madeHereElsewhere(String bot) {
    return 'Những thứ khác $bot đã tạo';
  }

  @override
  String madeHereCount(String count) {
    return 'Tạo tại đây ($count)';
  }

  @override
  String get sidePanelComputer => 'Máy tính';

  @override
  String get madeForTicket => 'Tạo cho phiếu việc này';

  @override
  String get libraryCantChangePicked =>
      'Chỉ người được tạo cho hoặc quản lý của bot mới sửa được các mục này.';

  @override
  String libraryDeletedSeveral(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã xóa $count mục',
      one: 'Đã xóa 1 mục',
    );
    return '$_temp0';
  }

  @override
  String librarySelected(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã chọn $count',
      one: 'Đã chọn 1',
    );
    return '$_temp0';
  }

  @override
  String get librarySortNewest => 'Mới nhất';

  @override
  String get librarySortOpened => 'Mở gần đây';

  @override
  String get librarySortName => 'Tên';

  @override
  String get libraryScopeMine => 'Tạo cho tôi';

  @override
  String get libraryScopeWorkspace => 'Toàn không gian làm việc';

  @override
  String get libraryFilterSort => 'Sắp xếp và lọc';

  @override
  String get creationWhoCanSee => 'Ai có thể xem';

  @override
  String get libraryTile => 'Thư viện';

  @override
  String get libraryTileHelp => 'Nội dung đã tạo';

  @override
  String get regenerateReply => 'Tạo lại';

  @override
  String get deleteMessage => 'Xóa tin nhắn';

  @override
  String get deleteMessageTitle => 'Xóa tin nhắn này?';

  @override
  String get deleteMessageBody =>
      'Tin nhắn bị xóa khỏi tất cả mọi người trong cuộc trò chuyện này. Các tin xung quanh vẫn còn.';

  @override
  String get messageDeleted => 'Đã xóa tin nhắn';

  @override
  String get findInChat => 'Tìm trong cuộc trò chuyện';

  @override
  String get findInChatHint => 'Tìm trong cuộc trò chuyện này';

  @override
  String findInChatCount(int index, int count) {
    return '$index/$count';
  }

  @override
  String get findInChatNone => 'Không có kết quả';

  @override
  String get findPrevious => 'Kết quả trước';

  @override
  String get findNext => 'Kết quả sau';

  @override
  String get closeFind => 'Đóng tìm kiếm';

  @override
  String get pinTopic => 'Ghim';

  @override
  String get unpinTopic => 'Bỏ ghim';

  @override
  String get inAppAlertReview => 'Xem xét';

  @override
  String get forBot => 'Cho bot';

  @override
  String get handBack => 'Trả lại';

  @override
  String get handBackNote => 'Ghi chú cho bot (tùy chọn)';

  @override
  String get handBackNoteHint => 'Ví dụ: Tôi đã đăng nhập rồi, làm tiếp nhé';

  @override
  String get live => 'Trực tiếp';

  @override
  String get liveView => 'Xem trực tiếp';

  @override
  String get liveViewHelp =>
      'Xem trực tiếp máy tính này và tiếp quản điều khiển khi cần.';

  @override
  String get newComputer => 'Máy tính mới';

  @override
  String get newComputerHelp =>
      'Máy tính riêng thuộc về một bot. Tệp của nó tách biệt khỏi máy tính chung của nhóm.';

  @override
  String get openLiveView => 'Mở chế độ xem trực tiếp';

  @override
  String get liveExpand => 'Toàn màn hình';

  @override
  String get liveCopy => 'Sao chép';

  @override
  String get liveScreenshot => 'Ảnh chụp màn hình';

  @override
  String get liveScreenshots => 'Ảnh chụp màn hình';

  @override
  String get liveScreenshotsHelp =>
      'Video trực tiếp không truyền qua được mạng này, nên màn hình sẽ cập nhật khoảng mỗi giây một lần.';

  @override
  String get liveReconnecting => 'Đang kết nối lại…';

  @override
  String get liveReconnectingHelp =>
      'Video trực tiếp bị ngắt (có thể máy chủ đang khởi động lại). Đang thử lại; trong lúc đó sẽ hiện ảnh chụp màn hình.';

  @override
  String get liveTryAgain => 'Thử lại';

  @override
  String get liveDroppedHelp =>
      'Video trực tiếp không kết nối lại được, nên màn hình cập nhật khoảng mỗi giây một lần. Nhấn Thử lại.';

  @override
  String get liveMore => 'Thêm';

  @override
  String get liveSaveScreenshot => 'Lưu ảnh chụp màn hình';

  @override
  String get liveCopyFromComputer => 'Sao chép từ máy tính';

  @override
  String get livePasteToComputer => 'Dán vào máy tính';

  @override
  String get liveRotateHint => 'Xoay ngang điện thoại để xem màn hình lớn hơn';

  @override
  String get liveWatching => 'Đang xem';

  @override
  String get liveCopied => 'Đã sao chép từ máy tính.';

  @override
  String get liveNothingCopied =>
      'Chưa sao chép gì. Hãy chọn nội dung trên máy tính trước.';

  @override
  String get livePasteEmpty => 'Bảng nhớ tạm đang trống.';

  @override
  String get liveMinimize => 'Thu về bảng bên';

  @override
  String get liveShownFullScreen =>
      'Chế độ xem trực tiếp đang mở toàn màn hình.';

  @override
  String get liveStillWatching => 'Bạn vẫn đang xem chứ?';

  @override
  String get liveStillWatchingHelp =>
      'Máy tính sẽ ngủ khi không ai xem để tiết kiệm điện.';

  @override
  String get liveKeepWatching => 'Tiếp tục xem';

  @override
  String get livePausedToSavePower => 'Đã tạm dừng để tiết kiệm điện';

  @override
  String get livePausedToSavePowerHelp =>
      'Không có ai xem nên máy tính tạm nghỉ. Nhấn Tiếp tục để đánh thức lại.';

  @override
  String get liveResume => 'Tiếp tục';

  @override
  String get paused => 'Đã tạm dừng';

  @override
  String get pausedUserInControl =>
      'Đã tạm dừng: có người đang điều khiển màn hình';

  @override
  String get letBotUseTerminal => 'Cho phép bot dùng terminal & tệp';

  @override
  String get screenHandedBack => 'Đã trả lại màn hình';

  @override
  String get privateComputer => 'Máy tính riêng';

  @override
  String get profileDesktop => 'Màn hình nền';

  @override
  String get profileHeadless => 'Không giao diện';

  @override
  String get rename => 'Đổi tên';

  @override
  String get rightClickNextTap => 'Chạm lần tới sẽ nhấp chuột phải';

  @override
  String get screenshotMode =>
      'Ảnh chụp màn hình (video trực tiếp không khả dụng trên mạng này)';

  @override
  String get showKeyboard => 'Bàn phím';

  @override
  String get someoneElseInControl => 'Có người khác đang điều khiển';

  @override
  String get switchToDesktop => 'Chuyển sang Màn hình nền';

  @override
  String get switchToHeadless => 'Chuyển sang Không giao diện';

  @override
  String get switchProfileConfirm =>
      'Máy tính sẽ khởi động lại để chuyển chế độ. Tệp của bạn vẫn được giữ, nhưng mọi thứ đang chạy trên máy sẽ dừng.';

  @override
  String get switchProfileButton => 'Chuyển';

  @override
  String get switchingToDesktop => 'Đang chuyển sang Màn hình nền…';

  @override
  String get switchingToHeadless => 'Đang chuyển sang Không giao diện…';

  @override
  String get switchedToDesktop =>
      'Đã chuyển sang Màn hình nền. Mở Xem trực tiếp để xem màn hình.';

  @override
  String get switchedToHeadless =>
      'Đã chuyển sang Không giao diện. Hiện máy dùng ít bộ nhớ hơn.';

  @override
  String get takeControl => 'Tiếp quản';

  @override
  String get takeoverCompleted => 'Đã trả lại';

  @override
  String get takeoverDismissed => 'Đã từ chối';

  @override
  String get takeoverPrivacy =>
      'Trong lúc bạn điều khiển, bot được tạm dừng và mọi thứ bạn gõ hay xem đều không gửi cho bot.';

  @override
  String get liveShellOnTooltip =>
      'Cho phép bot tiếp tục dùng terminal và tệp trong lúc bạn điều khiển';

  @override
  String get liveShellOffTooltip =>
      'Tạm dừng cả terminal và tệp của bot trong lúc bạn điều khiển';

  @override
  String get liveShellOnNote =>
      'Bot vẫn dùng được terminal và tệp, nhưng chưa thể xem hay dùng màn hình cho đến khi bạn trả lại.';

  @override
  String get liveShellOffNote =>
      'Bot tạm dừng hoàn toàn cho đến khi bạn trả lại.';

  @override
  String get teamComputer => 'Máy tính nhóm';

  @override
  String get withDesktop => 'Có màn hình nền';

  @override
  String get withDesktopHelp =>
      'Thêm màn hình để bạn xem trực tiếp; dùng nhiều bộ nhớ hơn';

  @override
  String get youAreInControl => 'Bạn đang điều khiển';

  @override
  String botAsksForHelp(String reason) {
    return 'Bot hỏi: $reason';
  }

  @override
  String botNeedsHelp(String bot) {
    return '$bot cần bạn giúp';
  }

  @override
  String deleteComputerConfirm(String name) {
    return 'Xóa $name? Các tệp, ảnh chụp nhanh và điểm khôi phục cũng sẽ bị xóa.';
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
    return 'Máy tính của $bot';
  }

  @override
  String get micPermissionNeeded => 'Cho phép quyền micro để đọc chính tả.';

  @override
  String get dictationEmpty => 'Không nhận được giọng nói. Thử lại.';

  @override
  String get startCall => 'Bắt đầu cuộc gọi thoại';

  @override
  String get stopDictation => 'Dừng và chép lời';

  @override
  String get dictate => 'Đọc chính tả';

  @override
  String get dictateOnDevice => 'Đọc chính tả bằng thiết bị này';

  @override
  String get stopListening => 'Dừng nghe';

  @override
  String get dictationRetry => 'Thử lại';

  @override
  String get dictationSayAgain => 'Nói lại lần nữa';

  @override
  String get dictationFailed => 'Không thể chuyển thành văn bản.';

  @override
  String get dictationFailedUseDevice =>
      'Không thể chuyển thành văn bản. Hãy nói lại và thiết bị sẽ lắng nghe.';

  @override
  String get dictationNoServiceUseDevice =>
      'Đọc chính tả chưa được thiết lập cho không gian làm việc này. Thiết bị của bạn có thể nghe thay.';

  @override
  String get dictationDeviceFailed =>
      'Tính năng đọc chính tả của thiết bị đã ngừng hoạt động, nên micro đã chuyển lại sang Casama.';

  @override
  String get dictationDevicePermission =>
      'Cho phép nhận dạng giọng nói để đọc chính tả bằng thiết bị này.';

  @override
  String get readAloud => 'Đọc to';

  @override
  String get callConnecting => 'Đang kết nối…';

  @override
  String get callLive => 'Trực tiếp';

  @override
  String get callEnded => 'Cuộc gọi đã kết thúc';

  @override
  String get callEndedIdle => 'Đã kết thúc cuộc gọi sau 2 phút im lặng.';

  @override
  String get callFailed => 'Không thể kết nối cuộc gọi.';

  @override
  String get callListening => 'Đang nghe';

  @override
  String get callSpeaking => 'Đang nói';

  @override
  String get callWorking => 'Đang xử lý';

  @override
  String get callMutedState => 'Đã tắt tiếng';

  @override
  String get callCaptions => 'Phụ đề';

  @override
  String get callSpeaker => 'Loa ngoài';

  @override
  String get callEarpiece => 'Điện thoại';

  @override
  String get callBluetooth => 'Bluetooth';

  @override
  String get callHeadphones => 'Tai nghe';

  @override
  String get callAudioOutput => 'Phát cuộc gọi qua';

  @override
  String toolDoing(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Đang đổi ảnh đại diện',
      'memory_search': 'Đang tìm trong ký ức',
      'memory_write': 'Đang lưu vào trí nhớ',
      'memory': 'Đang cập nhật trí nhớ',
      'knowledge_search': 'Đang tìm trong kiến thức',
      'web_search': 'Đang tìm trên web',
      'web': 'Đang đọc trang web',
      'browser_open': 'Đang mở trang web',
      'browser_click': 'Đang nhấp trên trang',
      'browser_type': 'Đang nhập trên trang',
      'browser_press': 'Đang nhấn phím',
      'browser_scroll': 'Đang cuộn trang',
      'browser_look': 'Đang xem trang',
      'desktop_click': 'Đang nhấp trên màn hình',
      'desktop_type': 'Đang nhập',
      'desktop_press': 'Đang nhấn phím',
      'desktop_launch': 'Đang mở ứng dụng',
      'desktop_look': 'Đang xem màn hình',
      'shell': 'Đang làm việc trên máy tính của bot',
      'files_read': 'Đang đọc tệp',
      'files_write': 'Đang ghi tệp',
      'files_list': 'Đang xem danh sách tệp',
      'files_search': 'Đang tìm tệp',
      'files_from_chat': 'Đang lấy tệp từ chat',
      'http': 'Đang liên hệ dịch vụ',
      'data_search': 'Đang tìm dữ liệu',
      'data_call': 'Đang lấy dữ liệu',
      'skills_load': 'Đang chuẩn bị kỹ năng',
      'skills_create': 'Đang học kỹ năng mới',
      'skills_update': 'Đang cải thiện kỹ năng',
      'checkpoint': 'Đang lưu điểm khôi phục',
      'computer_restart': 'Đang khởi động lại máy tính của bot',
      'takeover': 'Đang nhờ bạn tiếp quản',
      'delegate': 'Đang nhờ trợ giúp',
      'routines_list': 'Đang kiểm tra quy trình',
      'routines_create': 'Đang thiết lập quy trình',
      'routines_update': 'Đang cập nhật quy trình',
      'routines_delete': 'Đang xóa quy trình',
      'watchers_create': 'Đang thiết lập trình theo dõi',
      'watchers_list': 'Đang kiểm tra trình theo dõi',
      'watchers_delete': 'Đang xóa trình theo dõi',
      'tasks_list': 'Đang kiểm tra tác vụ',
      'tasks_create': 'Đang thêm tác vụ',
      'tasks': 'Đang cập nhật tác vụ',
      'notify_user': 'Đang gửi ghi chú cho bạn',
      'usage_report': 'Đang kiểm tra mức sử dụng',
      'device_read': 'Đang đọc dữ liệu thiết bị',
      'device_access': 'Đang xin quyền truy cập thiết bị',
      'pages_publish': 'Đang xuất bản trang',
      'pages': 'Đang cập nhật trang',
      'media': 'Đang tạo hình ảnh',
      'media_video': 'Đang tạo video',
      'bots_create': 'Đang tạo bot mới',
      'bots_update': 'Đang cập nhật bot',
      'bots_list': 'Đang kiểm tra bot',
      'bots_archive': 'Đang lưu trữ bot',
      'channel_send': 'Đang gửi tin nhắn',
      'links_ask': 'Đang hỏi trợ lý của liên hệ',
      'logins_list': 'Đang kiểm tra đăng nhập đã lưu',
      'replay_run': 'Đang chạy lại bản phát lại',
      'replay_save': 'Đang lưu bản phát lại',
      'setup_apply': 'Đang gợi ý thiết lập',
      'sidebar_organize': 'Đang sắp xếp thanh bên',
      'suggestions_add': 'Đang thêm gợi ý',
      'teach_save_draft': 'Đang lưu bản nháp kỹ năng',
      'welcome_name': 'Đang chọn tên',
      'secrets_request': 'Đang nhờ bạn cung cấp bí mật',
      'pages_list': 'Đang kiểm tra trang',
      'pages_share': 'Đang đổi quyền xem trang',
      'projects_create': 'Đang bắt đầu dự án',
      'projects_status': 'Đang kiểm tra dự án',
      'projects_update': 'Đang cập nhật dự án',
      'projects': 'Đang lập kế hoạch dự án',
      'payments': 'Đang xin phép thanh toán',
      'voice_call': 'Đang gọi cho doanh nghiệp',
      'voice_call_user': 'Đang gọi cho bạn',
      'tools_load': 'Đang chuẩn bị công cụ',
      'ui_show': 'Đang hiển thị cho bạn',
      'start_task': 'Đang bắt đầu trong chat',
      'adult_sites_turn_on': 'Đang xin bật trang người lớn',
      'connections_attach': 'Đang bắt đầu kết nối ứng dụng',
      'other': 'Đang xử lý',
    });
    return '$_temp0';
  }

  @override
  String toolDid(String tool) {
    String _temp0 = intl.Intl.selectLogic(tool, {
      'profile_set_picture': 'Đã đổi ảnh đại diện',
      'memory_search': 'Đã tìm trong ký ức',
      'memory_write': 'Đã lưu vào trí nhớ',
      'memory': 'Đã cập nhật trí nhớ',
      'knowledge_search': 'Đã tìm trong kiến thức',
      'web_search': 'Đã tìm trên web',
      'web': 'Đã đọc trang web',
      'browser_open': 'Đã mở trang web',
      'browser_click': 'Đã nhấp trên trang',
      'browser_type': 'Đã nhập trên trang',
      'browser_press': 'Đã nhấn phím',
      'browser_scroll': 'Đã cuộn trang',
      'browser_look': 'Đã xem trang',
      'desktop_click': 'Đã nhấp trên màn hình',
      'desktop_type': 'Đã nhập',
      'desktop_press': 'Đã nhấn phím',
      'desktop_launch': 'Đã mở ứng dụng',
      'desktop_look': 'Đã xem màn hình',
      'shell': 'Đã làm việc trên máy tính của bot',
      'files_read': 'Đã đọc tệp',
      'files_write': 'Đã ghi tệp',
      'files_list': 'Đã xem danh sách tệp',
      'files_search': 'Đã tìm tệp',
      'files_from_chat': 'Đã lấy tệp từ chat',
      'http': 'Đã liên hệ dịch vụ',
      'data_search': 'Đã tìm dữ liệu',
      'data_call': 'Đã lấy dữ liệu',
      'skills_load': 'Đã dùng kỹ năng',
      'skills_create': 'Đã học kỹ năng mới',
      'skills_update': 'Đã cải thiện kỹ năng',
      'checkpoint': 'Đã lưu điểm khôi phục',
      'computer_restart': 'Đã khởi động lại máy tính của bot',
      'takeover': 'Đã nhờ bạn tiếp quản',
      'delegate': 'Đã nhờ trợ giúp',
      'routines_list': 'Đã kiểm tra quy trình',
      'routines_create': 'Đã thiết lập quy trình',
      'routines_update': 'Đã cập nhật quy trình',
      'routines_delete': 'Đã xóa quy trình',
      'watchers_create': 'Đã thiết lập trình theo dõi',
      'watchers_list': 'Đã kiểm tra trình theo dõi',
      'watchers_delete': 'Đã xóa trình theo dõi',
      'tasks_list': 'Đã kiểm tra tác vụ',
      'tasks_create': 'Đã thêm tác vụ',
      'tasks': 'Đã cập nhật tác vụ',
      'notify_user': 'Đã gửi ghi chú cho bạn',
      'usage_report': 'Đã kiểm tra mức sử dụng',
      'device_read': 'Đã đọc dữ liệu thiết bị',
      'device_access': 'Đã xin quyền truy cập thiết bị',
      'pages_publish': 'Đã xuất bản trang',
      'pages': 'Đã cập nhật trang',
      'media': 'Đã tạo hình ảnh',
      'media_video': 'Đã tạo video',
      'bots_create': 'Đã tạo bot mới',
      'bots_update': 'Đã cập nhật bot',
      'bots_list': 'Đã kiểm tra bot',
      'bots_archive': 'Đã lưu trữ bot',
      'channel_send': 'Đã gửi tin nhắn',
      'links_ask': 'Đã hỏi trợ lý của liên hệ',
      'logins_list': 'Đã kiểm tra đăng nhập đã lưu',
      'replay_run': 'Đã chạy lại bản phát lại',
      'replay_save': 'Đã lưu bản phát lại',
      'setup_apply': 'Đã gợi ý thiết lập',
      'sidebar_organize': 'Đã sắp xếp thanh bên',
      'suggestions_add': 'Đã thêm gợi ý',
      'teach_save_draft': 'Đã lưu bản nháp kỹ năng',
      'welcome_name': 'Đã chọn tên',
      'secrets_request': 'Đã nhờ bạn cung cấp bí mật',
      'pages_list': 'Đã kiểm tra trang',
      'pages_share': 'Đã đổi quyền xem trang',
      'projects_create': 'Đã bắt đầu dự án',
      'projects_status': 'Đã kiểm tra dự án',
      'projects_update': 'Đã cập nhật dự án',
      'projects': 'Đã lập kế hoạch dự án',
      'payments': 'Đã xin phép thanh toán',
      'voice_call': 'Đã gọi cho doanh nghiệp',
      'voice_call_user': 'Đã gọi cho bạn',
      'tools_load': 'Đã chuẩn bị xong',
      'ui_show': 'Đã hiển thị cho bạn',
      'start_task': 'Đã bắt đầu trong chat',
      'adult_sites_turn_on': 'Đã xin bật trang người lớn',
      'connections_attach': 'Đã bắt đầu kết nối ứng dụng',
      'other': 'Xong',
    });
    return '$_temp0';
  }

  @override
  String toolUsingApp(String app) {
    return 'Đang dùng $app';
  }

  @override
  String toolUsedApp(String app) {
    return 'Đã dùng $app';
  }

  @override
  String get toolDetails => 'Chi tiết';

  @override
  String approvalAsking(String bot) {
    return '$bot đang hỏi trước';
  }

  @override
  String get approvalLookClosely => 'Xem kỹ trước khi cho phép thao tác này';

  @override
  String approvalAttachConnection(String app) {
    return 'Bắt đầu dùng $app, đã kết nối trong không gian làm việc này';
  }

  @override
  String approvalDontAskAgain(String bot) {
    return 'Cho phép $bot làm việc này mà không cần hỏi';
  }

  @override
  String get pageShareToPublic => 'Bất kỳ ai có liên kết đều mở được';

  @override
  String get pageShareToWorkspace =>
      'Mọi người trong không gian làm việc này đều mở được';

  @override
  String get pageShareToPrivate => 'Chỉ bạn mở được';

  @override
  String approvalAllowedLine(String what) {
    return 'Đã cho phép: $what';
  }

  @override
  String approvalDeclinedLine(String what) {
    return 'Đã từ chối: $what';
  }

  @override
  String approvalExpiredLine(String what) {
    return 'Hết giờ trả lời: $what';
  }

  @override
  String get callToolFailed => 'Thao tác không thành công';

  @override
  String get callToolNeedsOk => 'Cần bạn đồng ý để tiếp tục';

  @override
  String get callToolAllow => 'Cho phép';

  @override
  String get callToolNotNow => 'Để sau';

  @override
  String get callToolAllowed => 'Đã cho phép. Kết quả sẽ hiện trong chat';

  @override
  String get callToolDeclined => 'Bạn đã chọn để sau';

  @override
  String get callToolBackground => 'Vẫn đang xử lý. Kết quả sẽ hiện trong chat';

  @override
  String get callToolInChat => 'Kết quả sẽ hiện trong chat';

  @override
  String callToolSeconds(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return '$secondsString giây';
  }

  @override
  String get callNeedsKeyTitle => 'Cuộc gọi cần khóa Google AI';

  @override
  String get callNeedsKeyBody =>
      'Cuộc gọi trực tiếp chạy trên Google Gemini Live nên không gian làm việc này cần một khóa Google AI. Khóa chỉ dùng cho cuộc gọi; đọc to, đọc chính tả, hình ảnh và video chạy trên OpenRouter. Google cấp miễn phí trong AI Studio: tạo tại đó rồi thêm vào mục Khóa mô hình để gọi ngay. Chỉ chủ sở hữu và quản trị viên không gian làm việc mới thêm được khóa.';

  @override
  String get callAddKey => 'Thêm khóa Google AI';

  @override
  String get callGetFreeKey => 'Lấy khóa miễn phí từ Google';

  @override
  String get callMicUnmute => 'Bật mic';

  @override
  String get videoUnmute => 'Bật tiếng';

  @override
  String get callMicMute => 'Tắt mic';

  @override
  String get videoMute => 'Tắt tiếng';

  @override
  String get hangUp => 'Cúp máy';

  @override
  String callWith(String bot) {
    return 'Cuộc gọi với $bot';
  }

  @override
  String callSwitchTitle(String from, String to) {
    return 'Kết thúc cuộc gọi với $from và gọi $to?';
  }

  @override
  String get callSwitchBody =>
      'Bạn chỉ có thể tham gia một cuộc gọi mỗi lần. Cuộc gọi hiện tại sẽ được lưu vào chat trước.';

  @override
  String get callSwitchConfirm => 'Kết thúc và gọi';

  @override
  String get callVoiceConsentTitle => 'Giọng nói của bạn được gửi tới Google';

  @override
  String get callVoiceConsentBody =>
      'Trong cuộc gọi, Casama gửi giọng nói và nội dung bạn nói tới Google Gemini; Gemini nghe bạn nói và đọc to câu trả lời của bot. Lời thoại cuộc gọi cũng được gửi tới mô hình AI mà bot dùng qua OpenRouter. Không có gì được gửi đi cho đến khi bạn đồng ý. Bạn có thể dừng việc này bất cứ lúc nào trong Cài đặt › Quyền riêng tư.';

  @override
  String get callVoiceConsentAgree => 'Đồng ý và gọi';

  @override
  String get callVoiceConsentNotNow => 'Để sau';

  @override
  String get callEndedLost => 'Cuộc gọi kết thúc vì mất kết nối quá lâu.';

  @override
  String get callMinimize => 'Thu nhỏ';

  @override
  String get callEndCall => 'Kết thúc cuộc gọi';

  @override
  String get callEndAndAnswer => 'Kết thúc và trả lời';

  @override
  String get callReconnecting => 'Đang kết nối lại…';

  @override
  String callMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count phút',
      one: '1 phút',
      zero: 'dưới một phút',
    );
    return '$_temp0';
  }

  @override
  String callBubbleLabel(String bot, String time) {
    return 'Cuộc gọi với $bot, $time, chạm để quay lại';
  }

  @override
  String callReturnBar(String bot) {
    return 'Đang trong cuộc gọi với $bot, chạm để quay lại';
  }

  @override
  String get callOpen => 'Mở cuộc gọi';

  @override
  String get callOnHold => 'Đang giữ máy';

  @override
  String get callNotificationLive => 'Đang gọi';

  @override
  String get callNotificationMuted => 'Đã tắt tiếng';

  @override
  String get callNotificationChannel => 'Cuộc gọi';

  @override
  String callTabTitle(String time) {
    return 'Đang gọi · $time';
  }

  @override
  String get callMenuShow => 'Hiện cuộc gọi';

  @override
  String get callJobWorking => 'Đang xử lý';

  @override
  String callJobStrip(String task) {
    return 'Đang làm: $task';
  }

  @override
  String callJobNeedsYou(String task) {
    return 'Cần bạn: $task';
  }

  @override
  String get callTileWatching => 'Xem trực tiếp';

  @override
  String get callTileDone => 'Xong';

  @override
  String get callTileNeedsYou => 'Cần bạn';

  @override
  String callTileLabel(String state) {
    return 'Màn hình của bot, $state. Chạm để xem toàn màn hình';
  }

  @override
  String get callTileHide => 'Ẩn màn hình';

  @override
  String get screenCardLive => 'trực tiếp';

  @override
  String screenCardLabel(String bot, String state) {
    return 'Màn hình của $bot, $state';
  }

  @override
  String get screenCardOpen => 'Mở toàn màn hình';

  @override
  String get screenCardYouHave => 'Bạn đang điều khiển màn hình';

  @override
  String screenCardHeldBy(String name) {
    return '$name đang giữ màn hình';
  }

  @override
  String get screenCardMore => 'Tùy chọn khác';

  @override
  String screenCardIntro(String bot) {
    return 'Màn hình của $bot. Chạm để xem, kéo để di chuyển.';
  }

  @override
  String get screenCardHideForNow => 'Ẩn tạm thời';

  @override
  String get screenCardDontShow => 'Không tự động hiện';

  @override
  String get screenCardTurnedOff =>
      'Thẻ trực tiếp đang tắt. Bạn có thể bật lại trong Cài đặt.';

  @override
  String get screenCardOfferOff =>
      'Thường xuyên ẩn thẻ trực tiếp? Bạn có thể tắt đi.';

  @override
  String get screenCardTurnOff => 'Tắt';

  @override
  String screenCardNeedsYou(String bot) {
    return '$bot cần bạn trên màn hình';
  }

  @override
  String callRecapTitle(String length) {
    return 'Cuộc gọi · $length';
  }

  @override
  String get callRecapStarted => 'Đã bắt đầu trong cuộc gọi';

  @override
  String get callRecapTaskDone => 'Xong';

  @override
  String get callRecapTaskFailed => 'Chưa hoàn tất';

  @override
  String get callRecapTaskStopped => 'Đã dừng';

  @override
  String get callRecapTaskRunning => 'Vẫn đang làm';

  @override
  String get callRecapOpenRun => 'Xem bot đã làm gì';

  @override
  String get summarizeCalls => 'Tóm tắt cuộc gọi';

  @override
  String get summarizeCallsHelp =>
      'Sau mỗi cuộc gọi, thẻ sẽ tóm tắt nội dung và việc tiếp theo. Tốn một ít từ mô hình nhỏ của bot.';

  @override
  String callCardVoice(String length) {
    return 'Cuộc gọi thoại · $length';
  }

  @override
  String callCardPhone(String length) {
    return 'Cuộc gọi điện thoại · $length';
  }

  @override
  String callCardDropped(String length) {
    return 'Cuộc gọi bị ngắt · $length';
  }

  @override
  String callCardMissed(String name) {
    return 'Cuộc gọi nhỡ từ $name';
  }

  @override
  String callCardLive(String name) {
    return 'Đang trong cuộc gọi với $name';
  }

  @override
  String get callCardLiveElsewhere => 'Đang trong cuộc gọi trên thiết bị khác';

  @override
  String get callCardReturn => 'Quay lại cuộc gọi';

  @override
  String callCardBotHungUp(String name) {
    return '$name đã gác máy';
  }

  @override
  String get callCardEndedQuiet => 'Đã kết thúc sau khoảng im lặng';

  @override
  String get callCardEndedLimit => 'Đã kết thúc do hết giới hạn cuộc gọi';

  @override
  String get callCardWritingSummary => 'Đang viết tóm tắt…';

  @override
  String callCardSummaryBy(String name) {
    return 'Tóm tắt bởi $name';
  }

  @override
  String get callCardNextSteps => 'Bước tiếp theo';

  @override
  String get callCardDoIt => 'Làm ngay';

  @override
  String get callCardDismissStep => 'Bỏ qua';

  @override
  String get callCardStepStarted => 'Đã bắt đầu';

  @override
  String get callCardStepFailed => 'Không thể bắt đầu. Thử lại.';

  @override
  String get callCardDoneOnCall => 'Đã xong trong cuộc gọi';

  @override
  String callCardMore(int count) {
    return 'thêm $count';
  }

  @override
  String callCardTranscript(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bản ghi · $count lượt',
      one: 'Bản ghi · 1 lượt',
    );
    return '$_temp0';
  }

  @override
  String get callCardTranscriptTitle => 'Bản ghi lời thoại';

  @override
  String get callCardSearchTranscript => 'Tìm trong bản ghi';

  @override
  String get callCardNoMatches => 'Không có kết quả';

  @override
  String get callCardYou => 'Bạn';

  @override
  String get callCardCallBack => 'Gọi lại';

  @override
  String get callCardCopy => 'Sao chép';

  @override
  String get callCardCopied => 'Đã sao chép';

  @override
  String get callCardShare => 'Chia sẻ';

  @override
  String get callCardMoreActions => 'Thêm';

  @override
  String get callCardDelete => 'Xóa cuộc gọi';

  @override
  String get callCardDeleteTitle => 'Xóa cuộc gọi này?';

  @override
  String get callCardDeleteBody =>
      'Thẻ và bản ghi lời thoại sẽ bị xóa khỏi cuộc trò chuyện này. Kết quả từ các việc đã bắt đầu vẫn giữ nguyên.';

  @override
  String get callCardDeleted => 'Đã xóa cuộc gọi';

  @override
  String get callCardDeleteFailed => 'Không thể xóa cuộc gọi';

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

    return 'Bắt đầu trả lời sau $msString ms';
  }

  @override
  String get voiceSettings => 'Giọng nói';

  @override
  String get voiceSettingsHelp =>
      'Giọng đọc to và các công cụ bot dùng trong cuộc gọi';

  @override
  String get callTools => 'Công cụ khi gọi';

  @override
  String get callToolsHelp =>
      'Cuộc gọi đã có sẵn trí nhớ, tìm kiếm web, ghi chú cho bạn, quy trình và phiếu việc, đồng thời chuyển việc lớn sang chat. Thêm công cụ từ ứng dụng đã kết nối để bot dùng trực tiếp; mỗi công cụ tăng nhẹ chi phí mỗi cuộc gọi.';

  @override
  String get callToolsNone =>
      'Bot này chưa bật ứng dụng đã kết nối nào. Hãy bật trong mục Tích hợp, rồi chọn công cụ tại đây.';

  @override
  String get openIntegrations => 'Mở Tích hợp';

  @override
  String callToolsCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã thêm $countString công cụ ứng dụng',
      one: 'Đã thêm 1 công cụ ứng dụng',
      zero: 'Chỉ có công cụ thoại có sẵn',
    );
    return '$_temp0';
  }

  @override
  String get voiceId => 'ID giọng nói (tùy chọn)';

  @override
  String get voiceIdHelp =>
      'Tên giọng Gemini, như Kore hoặc Puck; để trống sẽ dùng Kore';

  @override
  String get useThisComputer => 'Dùng máy tính này cho bot';

  @override
  String get companionDesktopOnly =>
      'Chỉ ứng dụng máy tính (macOS, Windows, Linux) mới làm máy tính cho bot được.';

  @override
  String get companionIntro =>
      'Cho phép bot bạn chọn làm việc trên máy tính này: chạy lệnh, sửa tệp trong thư mục bạn chọn, duyệt web và dùng ứng dụng. Mọi thao tác đều hiện trên màn hình và có thể dừng lại. Tắt cho đến khi bạn phê duyệt từng quyền.';

  @override
  String get thisComputer => 'Máy tính này';

  @override
  String get companionOnline =>
      'Đang bật: bot bạn cho phép có thể dùng máy tính này';

  @override
  String get companionError => 'Không kết nối được Casama; đang thử lại';

  @override
  String get companionOff => 'Đang tắt';

  @override
  String get companionCapabilities => 'Những việc bot được làm';

  @override
  String get companionCapabilitiesHelp =>
      'Phê duyệt từng quyền. Thao tác rủi ro cao luôn hỏi trước, bất kể mức tự chủ của bot.';

  @override
  String get capShell => 'Chạy lệnh (trong thư mục chia sẻ)';

  @override
  String get capFiles => 'Đọc và sửa tệp trong thư mục chia sẻ';

  @override
  String get capBrowser =>
      'Dùng trình duyệt (riêng biệt với trình duyệt của bạn)';

  @override
  String get capDesktop => 'Dùng ứng dụng máy tính';

  @override
  String get sharedFolders => 'Thư mục chia sẻ';

  @override
  String get sharedFoldersHelp => 'Bot chỉ truy cập được các thư mục này.';

  @override
  String get addFolder => 'Thêm thư mục';

  @override
  String get botsAllowed => 'Bot được phép';

  @override
  String get botsAllowedHelp =>
      'Bot được phép cũng có thể làm việc trên máy tính này. Mỗi bot vẫn giữ máy tính riêng và dùng máy đó trừ khi tác vụ cần máy này.';

  @override
  String get worksOnTitle => 'Làm việc trên';

  @override
  String worksOnSubtitle(String bot) {
    return 'Nơi $bot chạy lệnh, dùng tệp và duyệt web giúp bạn.';
  }

  @override
  String get worksOnAuto => 'Tự động';

  @override
  String worksOnAutoHelp(String bot) {
    return '$bot tự chọn cho từng bước: dùng máy tính riêng, trừ khi tác vụ cần máy của bạn.';
  }

  @override
  String get worksOnBot => 'Chỉ máy tính của bot';

  @override
  String get worksOnBotHelp => 'Hoàn toàn không dùng máy tính của bạn.';

  @override
  String get worksOnMine => 'Chỉ máy tính của tôi';

  @override
  String get worksOnMineHelp =>
      'Mọi thứ diễn ra trên máy tính của bạn, nên máy phải đang bật.';

  @override
  String worksOnMineHelpNamed(String computer) {
    return 'Mọi thứ diễn ra trên $computer, nên máy phải đang bật.';
  }

  @override
  String worksOnLine(String mode) {
    return 'Làm việc trên: $mode';
  }

  @override
  String placesTitle(String bot) {
    return 'Nơi $bot làm việc';
  }

  @override
  String get placesSubtitle =>
      'Chọn máy tính để xem tại đây. Mục Làm việc trên quyết định nơi bot thực hiện tác vụ.';

  @override
  String placesBarLabel(String computer, String mode) {
    return 'Đang hiện $computer. Làm việc trên: $mode. Đổi';
  }

  @override
  String get placeYoursOnline => 'Máy tính của bạn · Trực tuyến';

  @override
  String get placeYoursOffline => 'Máy tính của bạn · Ngoại tuyến';

  @override
  String get placeTeamComputer => 'Máy tính nhóm';

  @override
  String placeBotsOwn(String bot) {
    return 'Máy tính riêng của $bot';
  }

  @override
  String actionOnComputer(String action, String computer) {
    return '$action trên $computer';
  }

  @override
  String get botYourComputer => 'Máy tính của bạn';

  @override
  String botYourComputerLine(String computer, String mode) {
    return '$computer · $mode';
  }

  @override
  String get botYourComputerNone => 'Chưa được phép trên máy tính nào của bạn';

  @override
  String botYourComputerHow(String bot) {
    return 'Để cho phép $bot làm việc trên máy tính của bạn, hãy mở Casama trên máy đó và bật tại Cài đặt → Dùng máy tính này cho bot → Bot được phép. Dù sao bot vẫn giữ máy tính riêng của mình.';
  }

  @override
  String get routineWhere => 'Nơi làm việc';

  @override
  String get routineWhereHelp => 'Nơi quy trình này chạy lệnh và dùng tệp.';

  @override
  String get routineWhereBot => 'Máy tính của bot';

  @override
  String get routineWhereBotHelp =>
      'Chạy bất kể máy tính của bạn có bật hay không.';

  @override
  String get routineWhereMine => 'Máy tính của tôi khi đang bật';

  @override
  String get routineWhereMineHelp =>
      'Dùng cho việc trên tệp và ứng dụng của bạn. Lượt chạy sẽ báo lại nếu máy tính đang tắt.';

  @override
  String get routineUsesComputer => 'Dùng máy tính';

  @override
  String get routineUsesComputerOn =>
      'Có thể lưu tệp, chạy lệnh và duyệt trang.';

  @override
  String get routineUsesComputerOff =>
      'Chỉ đọc ứng dụng của bạn, web và trí nhớ. Nhanh hơn và không bao giờ đánh thức máy tính.';

  @override
  String get computerBotsAllowed => 'Bot được phép';

  @override
  String get unpairComputer => 'Ngừng dùng máy tính này và hủy ghép nối';

  @override
  String botActingHere(String bot, String action) {
    return '$bot đang làm việc trên máy tính này: $action';
  }

  @override
  String get quickAsk => 'Hỏi nhanh';

  @override
  String get quickAskHint => 'Hỏi bot bất cứ điều gì…';

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
  String get cloudModelsTitle => 'Mô hình Cloud';

  @override
  String get cloudModelsHelp => 'Áp dụng cho mọi máy chủ Cloud trong vài giây.';

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
  String get connectionsTitle => 'Kết nối ứng dụng';

  @override
  String get connectionsServerComposio => 'Tài khoản Composio của Casama';

  @override
  String get connectionsServerComposioHelp =>
      'Ứng dụng không có mục đăng nhập riêng sẽ kết nối chỉ với một chạm qua tài khoản Composio của máy chủ này.';

  @override
  String get connectionsOwnAccounts => 'Tài khoản riêng của người dùng';

  @override
  String get connectionsOwnAccountsHelp =>
      'Mỗi người dùng Composio, Pipedream hoặc Zapier của riêng mình.';

  @override
  String get connectionsNoComposioKey =>
      'Thêm COMPOSIO_API_KEY vào máy chủ này để dùng tài khoản của Casama.';

  @override
  String get connectionsGoogleTitle => 'Ứng dụng Google';

  @override
  String get connectionsGoogleComposio => 'Qua Composio';

  @override
  String get connectionsGoogleComposioHelp =>
      'Gmail, Lịch, Drive và nhiều ứng dụng khác hoạt động ngay.';

  @override
  String get connectionsGoogleDirect => 'Máy chủ riêng của Google';

  @override
  String get connectionsGoogleDirectHelp =>
      'Cần đăng ký Google Workspace Developer Preview.';

  @override
  String get notInstanceOwner =>
      'Chỉ chủ sở hữu hệ thống mới mở được bảng quản trị.';

  @override
  String get runs24h => 'Lượt chạy (24 giờ)';

  @override
  String get failedRuns24h => 'Lượt chạy lỗi (24 giờ)';

  @override
  String get cost24h => 'Chi phí (24 giờ)';

  @override
  String get computersRunning => 'Máy tính đang chạy';

  @override
  String get devicesOnline => 'Máy tính cá nhân trực tuyến';

  @override
  String get editQuotas => 'Sửa hạn mức';

  @override
  String get maxBots => 'Giới hạn bot';

  @override
  String get monthlyUsd => 'Giới hạn chi tiêu tháng (USD)';

  @override
  String updateAvailable(String latest, String current) {
    return 'Đã có Casama $latest (bạn đang chạy $current)';
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
      other: '$nString không gian làm việc',
    );
    return '$_temp0';
  }

  @override
  String lastSignIn(String when) {
    return 'đăng nhập $when';
  }

  @override
  String quotasFor(String name) {
    return 'Hạn mức cho $name';
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
      other: '$nString thành viên',
      one: '1 thành viên',
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
    return '$usd trong 30 ngày';
  }

  @override
  String get connectingToServer => 'Đang kết nối với Casama…';

  @override
  String get cannotReachServer => 'Không kết nối được máy chủ Casama';

  @override
  String get connectionFailed =>
      'Không kết nối được máy chủ Casama. Kiểm tra kết nối mạng rồi thử lại.';

  @override
  String get serverNotResponding =>
      'Máy chủ Casama hiện không phản hồi. Thử lại sau giây lát.';

  @override
  String cannotReachServerHelp(String url) {
    return 'Kiểm tra kết nối mạng hoặc xem máy chủ tại $url có đang chạy không.';
  }

  @override
  String get serverUnreachableBody =>
      'Kiểm tra xem bạn có trực tuyến không. Nếu có, máy chủ có thể đang khởi động lại, chúng tôi sẽ tiếp tục thử.';

  @override
  String retryingIn(int seconds) {
    return 'Thử lại sau $seconds giây';
  }

  @override
  String get retryingNow => 'Đang thử…';

  @override
  String get upgradeTitle => 'Nâng cấp gói';

  @override
  String get notNow => 'Để sau';

  @override
  String get seePlans => 'Xem các gói';

  @override
  String get billing => 'Thanh toán';

  @override
  String get billingOffSelfHosted =>
      'Thanh toán đang tắt trên máy chủ này. Máy chủ chạy bằng giấy phép riêng: dùng cá nhân miễn phí cho một người, nhóm dùng giấy phép Business.';

  @override
  String get restorePurchases => 'Khôi phục giao dịch mua';

  @override
  String get restoreStarted => 'Đang kiểm tra giao dịch mua…';

  @override
  String get plans => 'Các gói';

  @override
  String get currentPlan => 'Gói hiện tại';

  @override
  String subscribeFor(String price) {
    return 'Đăng ký trả phí ($price)';
  }

  @override
  String get subscribeOnWeb => 'Đăng ký trả phí trên web';

  @override
  String get credits => 'Tín dụng';

  @override
  String get creditHistory => 'Lịch sử tín dụng';

  @override
  String get creditReasonPurchase => 'Đã mua tín dụng';

  @override
  String get creditReasonGrant => 'Đã cộng tín dụng';

  @override
  String get creditReasonRefund => 'Hoàn tiền';

  @override
  String get creditReasonAdjustment => 'Điều chỉnh';

  @override
  String get creditReasonExpire => 'Tín dụng hết hạn';

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
  String get limitBotsUnlimited => 'Không giới hạn bot';

  @override
  String get unlimitedValue => 'Không giới hạn';

  @override
  String trialDaysFree(int n) {
    return '$n ngày miễn phí';
  }

  @override
  String get extraPeople => 'Thêm người';

  @override
  String extraPeopleHelp(String price, int seats) {
    return '$price/người mỗi tháng, ngoài $seats suất đã có trong gói.';
  }

  @override
  String get extraPeopleSaved => 'Đã cập nhật số người thêm';

  @override
  String limitComputerHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString giờ máy tính mỗi tháng';
  }

  @override
  String limitCredits(String amount) {
    return '$amount tín dụng mỗi tháng';
  }

  @override
  String get viaWeb => 'Thanh toán trên web';

  @override
  String get viaAppStore => 'Thanh toán qua App Store';

  @override
  String get viaGooglePlay => 'Thanh toán qua Google Play';

  @override
  String get yourPlan => 'Gói của bạn';

  @override
  String planEndsOn(String date) {
    return 'Kết thúc vào $date';
  }

  @override
  String planRenewsOn(String date) {
    return 'Gia hạn vào $date';
  }

  @override
  String creditsBalance(String amount) {
    return 'Tín dụng: $amount';
  }

  @override
  String get manageSubscription => 'Quản lý gói đăng ký';

  @override
  String get compViaCasama => 'Miễn phí từ Casama';

  @override
  String compFreeUntil(String date) {
    return 'Miễn phí đến $date';
  }

  @override
  String testPurchaseLimits(String credits, String daily) {
    return 'Giao dịch thử nghiệm. Áp dụng giới hạn thử nghiệm: $credits tín dụng mỗi tháng và $daily mỗi ngày.';
  }

  @override
  String compKeepPlan(String plan) {
    return 'Giữ gói $plan';
  }

  @override
  String get haveGiftCode => 'Có mã quà tặng?';

  @override
  String get redeemCodeTitle => 'Đổi mã quà tặng';

  @override
  String get redeemCodeIntro =>
      'Nhập mã bạn được tặng. Gói sẽ áp dụng cho không gian làm việc bạn chọn mà không phải trả tiền.';

  @override
  String get redeemCodeLabel => 'Mã quà tặng';

  @override
  String get redeemCodeChecking => 'Đang kiểm tra…';

  @override
  String redeemCodeGives(String plan, int months) {
    String _temp0 = intl.Intl.pluralLogic(
      months,
      locale: localeName,
      other: '$months tháng dùng $plan miễn phí',
      one: '1 tháng dùng $plan miễn phí',
    );
    return '$_temp0';
  }

  @override
  String get redeemCodeInvalid => 'Mã không tồn tại hoặc không còn dùng được.';

  @override
  String get redeemCodeWorkspace => 'Không gian làm việc';

  @override
  String get redeemCodeSubmit => 'Đổi mã';

  @override
  String get redeemCodeFinePrint =>
      'Mỗi người một mã quà tặng. Khi hết hạn, không gian làm việc chuyển về gói Miễn phí trừ khi bạn chọn gói khác.';

  @override
  String redeemCodeDoneTitle(String plan) {
    return 'Gói $plan đã là của bạn';
  }

  @override
  String redeemCodeDoneBody(String plan, String date) {
    return 'Không gian làm việc của bạn có $plan miễn phí đến $date. Mở Casama trên bất kỳ thiết bị nào để sử dụng.';
  }

  @override
  String get redeemCodeOpenBilling => 'Mở Thanh toán';

  @override
  String get redeemCodeNoWorkspace =>
      'Mã quà tặng áp dụng cho không gian làm việc bạn sở hữu. Tạo một không gian trước rồi mở lại liên kết.';

  @override
  String get redeemCodeUnavailable =>
      'Tính năng này chưa có trong phiên bản ứng dụng này.';

  @override
  String usageComputerHours(String hours) {
    return 'Máy tính đám mây: $hours giờ';
  }

  @override
  String usageLiveViewMinutes(String minutes) {
    return 'Xem trực tiếp: $minutes phút';
  }

  @override
  String get thisMonth => 'Tháng này';

  @override
  String get noBillableUsage => 'Chưa có mức sử dụng tính phí.';

  @override
  String get linkCloud => 'Casama Link';

  @override
  String get linkCloudHelp =>
      'Kết nối Casama tự lưu trữ với không gian làm việc này. Địa chỉ công khai và thông báo được miễn phí; máy tính đám mây và tín dụng mô hình được tính phí tại đây.';

  @override
  String get linkCloudNewKey => 'Khóa Casama Link mới';

  @override
  String get linkCloudKeyCreated => 'Đã tạo khóa';

  @override
  String get linkCloudKeyOnce =>
      'Sao chép ngay; khóa chỉ hiển thị một lần. Đặt khóa trên máy chủ với CASAMA_CLOUD_URL.';

  @override
  String get copy => 'Sao chép';

  @override
  String get revoke => 'Thu hồi';

  @override
  String get instanceName => 'Tên máy chủ';

  @override
  String get server => 'Máy chủ';

  @override
  String get serverAddress => 'Địa chỉ máy chủ';

  @override
  String get serverAddressInvalid =>
      'Nhập địa chỉ máy chủ như https://casama.example.com hoặc http://192.168.1.20:8080.';

  @override
  String get connect => 'Kết nối';

  @override
  String get changeServer => 'Dùng máy chủ khác';

  @override
  String serverIs(String host) {
    return 'Máy chủ: $host';
  }

  @override
  String get continueWithSso => 'Tiếp tục với SSO';

  @override
  String get workEmail => 'Email công việc';

  @override
  String get privacy => 'Quyền riêng tư';

  @override
  String get exportMyData => 'Xuất dữ liệu của tôi';

  @override
  String get exportMyDataHelp =>
      'Bot, chat, lượt chạy, trí nhớ và cài đặt. Không gồm bí mật.';

  @override
  String exportReady(String kb) {
    return 'Bản xuất đã sẵn sàng ($kb KB)';
  }

  @override
  String get runHistoryRetention => 'Giữ lịch sử lượt chạy trong';

  @override
  String get runHistoryRetentionHelp =>
      'Các sự kiện lượt chạy cũ hơn sẽ tự động bị xóa.';

  @override
  String days(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ngày',
      one: '1 ngày',
    );
    return '$_temp0';
  }

  @override
  String get deleteAccount => 'Xóa tài khoản của tôi';

  @override
  String get deleteAccountHelp =>
      'Xóa dữ liệu của bạn sau một khoảng thời gian gia hạn ngắn.';

  @override
  String get deleteAccountQuestion => 'Xóa tài khoản?';

  @override
  String deleteAccountConfirm(String email) {
    return 'Các không gian làm việc chỉ có bạn làm chủ sở hữu sẽ bị xóa cùng tài khoản, bao gồm bot và máy tính. Gói bạn mua trên web sẽ tự động hủy. Gói mua trên App Store hoặc Google Play không tự hủy: hãy hủy tại cửa hàng đó. Nhập $email để xác nhận.';
  }

  @override
  String get accountDeleted => 'Đã lên lịch xóa tài khoản';

  @override
  String accountDeletedBody(String date) {
    return 'Bạn đã đăng xuất. Dữ liệu sẽ bị xóa vào $date.';
  }

  @override
  String toolSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bước',
      one: '1 bước',
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
      other: 'Hiện $countString bước trước đó',
      one: 'Hiện 1 bước trước đó',
    );
    return '$_temp0';
  }

  @override
  String get copied => 'Đã sao chép';

  @override
  String get jumpToLatest => 'Nhảy tới mới nhất';

  @override
  String get chatViewFullTable => 'Xem toàn bộ bảng';

  @override
  String get chatShowMore => 'Xem thêm';

  @override
  String get chatShowLess => 'Thu gọn';

  @override
  String get chatTableTitle => 'Bảng';

  @override
  String chatEmptySubtitle(String bot) {
    return 'Hỏi $bot bất cứ điều gì, hoặc chạm một gợi ý bên dưới để bắt đầu.';
  }

  @override
  String get suggestPlanDay => 'Giúp tôi lập kế hoạch hôm nay';

  @override
  String get suggestWriteMessage => 'Giúp tôi viết tin nhắn';

  @override
  String get suggestExplain => 'Tra cứu một chủ đề và giải thích đơn giản';

  @override
  String get suggestCapabilities => 'Bạn giúp tôi được những gì?';

  @override
  String connectedAppSummary(String app) {
    return 'Đã kết nối $app';
  }

  @override
  String serverNotChecked(String host) {
    return 'Casama chưa kiểm tra máy chủ này. Chỉ kết nối nếu bạn tin tưởng $host.';
  }

  @override
  String get serverNotCheckedShort =>
      'Casama chưa kiểm tra máy chủ này. Chỉ kết nối nếu bạn tin tưởng người vận hành.';

  @override
  String get serverAddressLabel => 'Địa chỉ máy chủ';

  @override
  String get serverAddressHelp =>
      'Dán địa chỉ máy chủ. Nếu có khóa kèm theo, khóa sẽ được lưu mã hóa và không hiện trong chat.';

  @override
  String get serverChecking => 'Đang kiểm tra máy chủ…';

  @override
  String serverSignInOn(String host) {
    return 'Bạn sẽ đăng nhập trên $host.';
  }

  @override
  String get serverUseKey => 'Dùng khóa';

  @override
  String get serverUseSignIn => 'Đăng nhập';

  @override
  String serverSignInUnavailable(String name) {
    return '$name không hỗ trợ đăng nhập qua trình duyệt từ máy chủ Casama này. Hãy dùng khóa.';
  }

  @override
  String get serverNoSignIn => 'Máy chủ này hoạt động không cần đăng nhập.';

  @override
  String get serverHeaderLabel => 'Tên tiêu đề (tùy chọn)';

  @override
  String get serverToolsTitle => 'Công cụ có thể dùng';

  @override
  String get serverToolsHelp =>
      'Tắt bất kỳ công cụ nào bạn không muốn. Bot vẫn hỏi trước các bước rủi ro.';

  @override
  String addedInChatBy(String bot) {
    return 'Được $bot thêm trong chat';
  }

  @override
  String serverNeedsThisComputer(String name) {
    return '$name chạy trên máy tính của bạn. Mở Casama trên máy đó và bật Dùng máy tính này để thêm.';
  }

  @override
  String get connectAppsTitle => 'Kết nối ứng dụng';

  @override
  String get moreApps => 'Thêm';

  @override
  String addAppTile(String app) {
    return 'Thêm $app vào bot này';
  }

  @override
  String appAddedToBot(String app, String bot) {
    return 'Đã thêm $app vào $bot';
  }

  @override
  String get connectAppsHint =>
      'Cho phép mình đọc và thao tác trong các công cụ bạn đang dùng.';

  @override
  String connectAppTile(String app) {
    return 'Kết nối $app';
  }

  @override
  String get showComputer => 'Hiện máy tính';

  @override
  String get hideComputer => 'Ẩn máy tính';

  @override
  String get moreActions => 'Thêm';

  @override
  String get noConversations => 'Chưa có cuộc trò chuyện nào';

  @override
  String get untitledChat => 'Cuộc trò chuyện mới';

  @override
  String get listening => 'Đang nghe…';

  @override
  String get orLabel => 'hoặc';

  @override
  String get notificationsPrimerBubble => 'Đừng bỏ lỡ điều gì!';

  @override
  String get notificationsPrimerTitle => 'Bật thông báo';

  @override
  String get notificationsPrimerBody =>
      'Bot sẽ báo khi cần bạn quyết định hoặc khi việc đã xong.';

  @override
  String get notificationsPrimerBlockedBody =>
      'Chrome đang chặn thông báo cho trang web này. Hãy cho phép ở biểu tượng ổ khóa trên thanh địa chỉ, rồi chạm Bật lại.';

  @override
  String get notificationsTurnOn => 'Bật';

  @override
  String get autoUpdates => 'Tự động cập nhật';

  @override
  String get autoUpdatesHelp => 'Cài đặt phiên bản mới khi bạn thoát ứng dụng.';

  @override
  String get upToDate => 'Casama đã ở bản mới nhất';

  @override
  String get noReleasesToCheck =>
      'Chưa có bản phát hành nào cho máy tính này, nên chưa có gì để so sánh với phiên bản này.';

  @override
  String updateReady(String version) {
    return 'Đã có Casama $version';
  }

  @override
  String appVersion(String version) {
    return 'Phiên bản $version';
  }

  @override
  String whatsNewTitle(String version) {
    return 'Điểm mới trong Casama $version';
  }

  @override
  String get whatsNewGotIt => 'Đã hiểu';

  @override
  String get whatsNewSubtitle => 'Những thay đổi từ lần cập nhật trước.';

  @override
  String get whatsNew010Calls =>
      'Gọi cho bot và trao đổi trực tiếp. Bot trả lời bằng giọng nói kèm phụ đề.';

  @override
  String get whatsNew010Looks =>
      'Tùy biến Casama theo ý bạn: diện mạo, bảng màu, phông chữ và hình nền trong Cài đặt → Giao diện, cùng nhiều lựa chọn từ Kho mẫu.';

  @override
  String get whatsNew010AboutYou =>
      'Giới thiệu về bạn một lần cho các bot trong Cài đặt → Giới thiệu về bạn: tên gọi và cách bạn thích được trả lời.';

  @override
  String get whatsNew010SignIn =>
      'Đăng nhập bằng khóa truy cập, Apple, Google hoặc mã qua email.';

  @override
  String get openAtLogin => 'Mở khi đăng nhập';

  @override
  String get openAtLoginHelp => 'Sẵn sàng cho phím tắt Hỏi nhanh.';

  @override
  String get signInTagline =>
      'Những đồng đội vẫn làm việc sau khi bạn đóng ứng dụng.';

  @override
  String get signInTagline2 => 'Gặp gỡ đội ngũ AI của bạn.';

  @override
  String get signInTagline3 => 'AI không chỉ nói chuyện, mà còn làm xong việc.';

  @override
  String get signInTagline4 =>
      'Đồng đội giỏi việc, luôn hỏi trước khi hành động.';

  @override
  String get signInTagline5 => 'Giao việc đi, quay lại là đã xong.';

  @override
  String get noBotsHelp =>
      'Bot là đồng đội có máy tính riêng. Hãy tạo một bot để bắt đầu trò chuyện.';

  @override
  String get newBotSubtitle => 'Đồng đội có máy tính và trí nhớ riêng.';

  @override
  String get appearance => 'Giao diện';

  @override
  String get modelKeysHelp =>
      'OpenRouter, OpenAI, Anthropic, Google, xAI hoặc nhà cung cấp tương thích khác';

  @override
  String get signOutConfirm =>
      'Bạn có thể đăng nhập lại bất cứ lúc nào; các bot vẫn tiếp tục làm việc.';

  @override
  String get roleOwner => 'Chủ sở hữu';

  @override
  String get roleAdmin => 'Quản trị viên';

  @override
  String get roleMember => 'Thành viên';

  @override
  String get themeLight => 'Sáng';

  @override
  String get themeSystem => 'Hệ thống';

  @override
  String get themeDark => 'Tối';

  @override
  String get createWorkspaceBody =>
      'Không gian làm việc chứa các bot, máy tính của chúng và những người làm việc cùng bạn.';

  @override
  String get workspaceNameHint => 'Nhóm của tôi';

  @override
  String get orJoinWithCode => 'hoặc tham gia bằng mã mời';

  @override
  String get getOpenRouterKey => 'Lấy khóa OpenRouter';

  @override
  String get createFirstBotBody =>
      'Đặt tên và chọn mô hình cho bot. Bạn có thể đổi cả hai sau.';

  @override
  String stepOf(int step, int total) {
    return 'Bước $step/$total';
  }

  @override
  String get providerHintOpenRouter =>
      'khuyên dùng: chat, hình ảnh, video, giọng nói';

  @override
  String get providerHintGoogle => 'chỉ cuộc gọi trực tiếp';

  @override
  String get providerHintCompatible => 'Mọi API tương thích OpenAI';

  @override
  String get providerHintSearch => 'tìm kiếm web';

  @override
  String get noRoutinesHelp =>
      'Quy trình là việc bot tự làm sau: một lần vào giờ bạn chọn, theo lịch định kỳ hoặc khi có webhook.';

  @override
  String get routineOnce => 'Một lần';

  @override
  String lastRun(String when) {
    return 'Lần cuối: $when';
  }

  @override
  String get routineOff => 'Tắt';

  @override
  String get routineEnds => 'Kết thúc';

  @override
  String get routineEndsNever => 'Không bao giờ';

  @override
  String get routineEndsOnDate => 'Vào ngày';

  @override
  String get routineEndsAfterRuns => 'Sau số lượt chạy';

  @override
  String get routineEndDate => 'Ngày cuối';

  @override
  String get routineRunCountLabel => 'Số lượt chạy';

  @override
  String routineRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n lượt chạy',
      one: '1 lượt chạy',
    );
    return '$_temp0';
  }

  @override
  String routineEndsAt(String when) {
    return 'Kết thúc $when';
  }

  @override
  String routineRunsLeft(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Còn $n lượt chạy',
      one: 'Còn 1 lượt chạy',
      zero: 'Không còn lượt chạy nào',
    );
    return '$_temp0';
  }

  @override
  String get routineChangeEnd => 'Khi kết thúc';

  @override
  String get routineEndTitle => 'Khi kết thúc';

  @override
  String get routineEndSubtitle =>
      'Khi đó quy trình sẽ tự tắt. Số lượt chạy mới sẽ đếm từ bây giờ.';

  @override
  String deleteRoutineTitle(String name) {
    return 'Xóa “$name”?';
  }

  @override
  String get deleteRoutineBody =>
      'Quy trình sẽ không chạy nữa. Kết quả đã đăng vẫn giữ lại trong cuộc trò chuyện.';

  @override
  String get triggerOnce => 'Một lần';

  @override
  String inMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Sau $nString phút';
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
      other: 'Sau $nString giờ',
      one: 'Sau 1 giờ',
    );
    return '$_temp0';
  }

  @override
  String routineTomorrowAt(String time) {
    return 'Ngày mai lúc $time';
  }

  @override
  String get integrationNeedsName => 'Đặt tên có ít nhất một chữ cái.';

  @override
  String integrationNeedsField(String field) {
    return 'Điền $field để lưu.';
  }

  @override
  String integrationSavedAs(String name) {
    return 'Đã lưu với tên $name';
  }

  @override
  String get integrationUrlInvalid =>
      'Dùng địa chỉ đầy đủ bắt đầu bằng https://';

  @override
  String get openFile => 'Mở';

  @override
  String get saveFile => 'Lưu';

  @override
  String get shareFile => 'Chia sẻ';

  @override
  String savedFile(String name) {
    return 'Đã lưu $name';
  }

  @override
  String noAppToOpen(String name) {
    return 'Không có ứng dụng nào trên thiết bị này mở được $name. Hãy lưu lại.';
  }

  @override
  String get previewUnavailable =>
      'Không xem trước được loại tệp này. Mở hoặc lưu để xem.';

  @override
  String get openInSystemPlayer => 'Mở trong trình phát video';

  @override
  String get playMedia => 'Phát';

  @override
  String get fullScreen => 'Toàn màn hình';

  @override
  String get exitFullScreen => 'Thoát toàn màn hình';

  @override
  String pdfPageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trang',
      one: '1 trang',
    );
    return '$_temp0';
  }

  @override
  String get openInBrowser => 'Mở trong trình duyệt';

  @override
  String get convertingToPdf => 'Đang tạo bản xem trước…';

  @override
  String tableFirstRows(int count) {
    return 'Đang hiện $count hàng đầu tiên';
  }

  @override
  String get imageCouldNotLoad => 'Không tải được hình ảnh này';

  @override
  String get mediaKindImage => 'Hình ảnh';

  @override
  String get mediaKindVideo => 'Video';

  @override
  String get mediaKindAudio => 'Âm thanh';

  @override
  String get mediaKindPdf => 'PDF';

  @override
  String get openFileInChat => 'Mở tệp';

  @override
  String get attach => 'Đính kèm';

  @override
  String get attachFiles => 'Tệp';

  @override
  String get attachPhotos => 'Thư viện ảnh';

  @override
  String get attachCamera => 'Chụp ảnh';

  @override
  String get attachScan => 'Quét tài liệu';

  @override
  String get scanFailed => 'Không thể quét tài liệu. Thử lại.';

  @override
  String get dropToAttach => 'Thả tệp để đính kèm';

  @override
  String uploadFailed(String name) {
    return 'Không thể tải lên $name';
  }

  @override
  String attachFailed(String name, String reason) {
    return 'Không thể đính kèm $name: $reason';
  }

  @override
  String attachFailedTitle(String name) {
    return 'Không thể đính kèm $name';
  }

  @override
  String get sendWithoutIt => 'Gửi không kèm tệp này';

  @override
  String get sendWithoutThem => 'Gửi không kèm các tệp này';

  @override
  String get removeAttachment => 'Gỡ';

  @override
  String get editPhoto => 'Sửa ảnh';

  @override
  String get retryUpload => 'Thử lại';

  @override
  String get uploadingAttachments => 'Đang tải lên…';

  @override
  String get notSent => 'Chưa gửi';

  @override
  String get deleteChat => 'Xóa cuộc trò chuyện';

  @override
  String get deleteChatTitle => 'Xóa cuộc trò chuyện này?';

  @override
  String deleteChatBody(String bot) {
    return 'Tin nhắn sẽ bị xóa với mọi người xem được cuộc trò chuyện. Những gì $bot đã tạo trong đó vẫn ở trong Thư viện, bản ghi sử dụng vẫn giữ nguyên và những gì bot nhớ được từ đó vẫn ở trong trí nhớ của bot.';
  }

  @override
  String deleteChatAlsoCreations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Xóa cả $count mục đã tạo tại đây',
      one: 'Xóa cả 1 mục đã tạo tại đây',
    );
    return '$_temp0';
  }

  @override
  String get deleteChatAlsoCreationsHelp =>
      'Tắt: các mục vẫn ở trong Thư viện.';

  @override
  String get chatDeleted => 'Đã xóa cuộc trò chuyện';

  @override
  String get deleteAllChats => 'Xóa tất cả cuộc trò chuyện';

  @override
  String get deleteAllChatsRow =>
      'Bắt đầu lại với lịch sử trống. Trí nhớ vẫn được giữ.';

  @override
  String deleteAllChatsTitle(String bot) {
    return 'Xóa tất cả cuộc trò chuyện với $bot?';
  }

  @override
  String deleteAllChatsBody(String bot) {
    return 'Mọi cuộc trò chuyện với $bot mà bạn xóa được sẽ bị xóa cùng tin nhắn, ảnh và tệp. Chat nhóm vẫn giữ nguyên. Bản ghi sử dụng vẫn giữ nguyên và những gì $bot đã nhớ vẫn ở trong trí nhớ.';
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
      other: 'Đã xóa $nString cuộc trò chuyện.',
      one: 'Đã xóa 1 cuộc trò chuyện.',
      zero: 'Không có cuộc trò chuyện nào để xóa.',
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
          'Đã giữ lại $nString cuộc trò chuyện vì bot vẫn đang làm việc trong đó.',
      one: 'Đã giữ lại 1 cuộc trò chuyện vì bot vẫn đang làm việc trong đó.',
    );
    return '$_temp0';
  }

  @override
  String groupEmptySubtitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other:
          'Có $n bot trong cuộc trò chuyện này. Mỗi bot giữ trí nhớ và cài đặt riêng.',
    );
    return '$_temp0';
  }

  @override
  String get groupTipMention => 'Gõ @ kèm tên để hỏi trực tiếp một bot.';

  @override
  String groupTipEveryone(String lead) {
    return '@everyone: $lead trả lời trước và chia việc khi có việc cần chia; nếu không, từng bot lần lượt trả lời và bot cuối cùng tổng kết.';
  }

  @override
  String groupTipNoMention(String lead) {
    return 'Nếu không nhắc tên, bot vừa trả lời gần nhất sẽ đáp ($lead ở lượt đầu).';
  }

  @override
  String get messageNotSent =>
      'Tệp chưa tải lên được nên tin nhắn chưa gửi. Tin đã được đưa lại vào ô nhập.';

  @override
  String get chatSendsWhenDone => 'Gửi khi câu trả lời này xong';

  @override
  String get noComputerForFiles => 'Bot này không có máy tính để lưu tệp.';

  @override
  String fileTooLarge(String name) {
    return '$name vượt quá 25 MB, quá lớn để đính kèm. Thay vào đó, hãy gửi liên kết từ Google Drive, Dropbox, iCloud hoặc bất kỳ dịch vụ lưu trữ đám mây nào.';
  }

  @override
  String get secretsHelp =>
      'Bot đưa bí mật vào yêu cầu bằng tên bí mật. Bí mật chỉ được gửi tới máy chủ bạn cho phép và mô hình không bao giờ nhìn thấy.';

  @override
  String deleteSecretTitle(String name) {
    return 'Xóa $name?';
  }

  @override
  String get deleteSecretBody =>
      'Các bot dùng bí mật này sẽ không thể truy cập dịch vụ đó nữa.';

  @override
  String get hide => 'Ẩn';

  @override
  String get show => 'Hiện';

  @override
  String get deleteMemoryTitle => 'Xóa mục ghi nhớ này?';

  @override
  String get noMemoriesHelp =>
      'Khi bạn trò chuyện, bot lưu lại những điều quan trọng: thông tin, sở thích và tóm tắt công việc trước đó.';

  @override
  String get memoryHelp =>
      'Ký ức đã ghim luôn nằm trong ngữ cảnh của bot. Hãy sửa nếu có gì sai; ký ức đã xóa sẽ mất vĩnh viễn.';

  @override
  String get memoryFact => 'Thông tin';

  @override
  String get memoryPreference => 'Sở thích';

  @override
  String get memorySummary => 'Tóm tắt';

  @override
  String get memoryEpisode => 'Sự kiện';

  @override
  String get pinned => 'Đã ghim';

  @override
  String get editMemory => 'Sửa ghi nhớ';

  @override
  String get editMemoryHelp => 'Bot sẽ dùng thông tin này khi phù hợp.';

  @override
  String get modelKeysIntro =>
      'Bot suy nghĩ bằng khóa nhà cung cấp mô hình của riêng bạn. Khóa được lưu mã hóa và không bao giờ hiển thị lại.';

  @override
  String get casamaCloudKeyHint => 'Trả bằng tín dụng của bạn';

  @override
  String get casamaCloudIncluded => 'Đi kèm gói';

  @override
  String get casamaCloudModelLocked => 'Casama chọn mô hình này.';

  @override
  String get serverVoiceSetUp =>
      'Máy chủ này cung cấp giọng nói nên không cần thêm khóa. Khóa riêng của không gian làm việc luôn được ưu tiên dùng trước.';

  @override
  String modelKeysFor(String workspace) {
    return 'Khóa thuộc về một không gian làm việc. Các khóa này dành cho $workspace.';
  }

  @override
  String get yourKeys => 'Khóa của bạn';

  @override
  String get keyWorking => 'Hoạt động';

  @override
  String get keyFailing => 'Đang lỗi';

  @override
  String get keyUntested => 'Chưa kiểm tra';

  @override
  String get skillsHelp =>
      'Kỹ năng là bộ hướng dẫn mà bot tải khi công việc cần tới, chẳng hạn phong cách viết báo cáo của bạn.';

  @override
  String get skillsForAllBots => 'Tất cả bot';

  @override
  String skillsOnlyForBot(String bot) {
    return 'Chỉ cho $bot';
  }

  @override
  String get skillsRemovedBot => 'Bot đã gỡ';

  @override
  String deleteSkillTitle(String name) {
    return 'Xóa kỹ năng “$name”?';
  }

  @override
  String get editSkill => 'Sửa kỹ năng';

  @override
  String get deleteSkill => 'Xóa kỹ năng';

  @override
  String get skillDescriptionHelp =>
      'Bot đọc dòng này để quyết định khi nào áp dụng kỹ năng.';

  @override
  String get skillBodyHint => '# Các bước\n1. …';

  @override
  String get computersHelp =>
      'Mỗi bot làm việc trên một máy tính: máy tính chung của nhóm hoặc máy riêng. Tệp được giữ lại giữa các cuộc trò chuyện.';

  @override
  String get computersEmptyTitle => 'Chưa có máy tính nào';

  @override
  String get thisDevice => 'Thiết bị này';

  @override
  String get personalComputerConnected => 'Đã kết nối';

  @override
  String get personalComputerOffline => 'Ngoại tuyến';

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
    return 'Ổ đĩa $size';
  }

  @override
  String computerLastUsed(Object when) {
    return 'Dùng gần nhất $when';
  }

  @override
  String computerLastSeen(Object when) {
    return 'Thấy gần nhất $when';
  }

  @override
  String get computerSaved => 'Đã lưu';

  @override
  String get computerSavedHelp => 'Tệp vẫn được giữ khi máy dừng';

  @override
  String computerCanUse(Object list) {
    return 'Bot có thể dùng: $list';
  }

  @override
  String get computerCanUseNothing => 'Bot chưa dùng được';

  @override
  String get computerCapShell => 'Terminal';

  @override
  String get computerCapFiles => 'Tệp';

  @override
  String get computerCapBrowser => 'Trình duyệt';

  @override
  String get computerCapDesktop => 'Màn hình';

  @override
  String get computerCapMcp => 'Công cụ cục bộ';

  @override
  String get computerCapMessages => 'Tin nhắn';

  @override
  String personalComputerOfflineNamed(String name) {
    return '$name đang ngoại tuyến. Hãy mở Casama trên máy đó và bật “Dùng máy tính này cho bot”. Máy tính của bạn không bao giờ tốn giờ máy tính trong gói.';
  }

  @override
  String get yourComputerOffline => 'Máy tính của bạn đang ngoại tuyến';

  @override
  String get howToFix => 'Cách khắc phục';

  @override
  String get computerHoursUsedTitle => 'Đã hết giờ máy tính';

  @override
  String get personalScreenNote =>
      'Đây là máy tính của bạn nên bạn sẽ thấy ảnh chụp màn hình mới sau vài giây thay vì video trực tiếp.';

  @override
  String get renameComputer => 'Đổi tên máy tính';

  @override
  String deleteComputerTitle(String name) {
    return 'Xóa $name?';
  }

  @override
  String get privacyIntro =>
      'Các cuộc trò chuyện, ký ức và tệp thuộc về bạn. Bạn có thể xuất ra bất cứ lúc nào hoặc xóa tài khoản.';

  @override
  String get yourData => 'Dữ liệu của bạn';

  @override
  String get shareAnalytics => 'Chia sẻ dữ liệu sử dụng';

  @override
  String get shareAnalyticsHelp =>
      'Báo cáo mức sử dụng và sự cố. Không bao giờ gửi tin nhắn hay tệp của bạn.';

  @override
  String get measureAds => 'Giúp đo lường quảng cáo';

  @override
  String get measureAdsHelp =>
      'Cho phép Casama báo cho Meta biết khi người đã xem quảng cáo của chúng tôi tham gia hoặc đăng ký trả phí. Casama không bao giờ hiển thị quảng cáo.';

  @override
  String get measureAdsNeedsUsageData =>
      'Bật Chia sẻ dữ liệu sử dụng để dùng tính năng này.';

  @override
  String get trackingTile => 'Cho phép theo dõi';

  @override
  String get trackingAllowed =>
      'Được phép. SDK của Meta chạy trên thiết bị này và Casama có thể báo cho Meta biết khi bạn tham gia hoặc đăng ký trả phí sau khi xem quảng cáo của chúng tôi. Bạn có thể thay đổi trong ứng dụng Cài đặt.';

  @override
  String get trackingNotAllowed =>
      'Không được phép. Không có dữ liệu nào từ thiết bị này được gửi tới Meta. Bạn có thể thay đổi trong ứng dụng Cài đặt.';

  @override
  String get trackingNotAsked =>
      'Casama chưa hỏi. Cho đến khi bạn cho phép, không có dữ liệu nào từ thiết bị này được gửi tới Meta.';

  @override
  String get trackingOpenSettings => 'Mở Cài đặt';

  @override
  String get workspaceAnalytics =>
      'Dữ liệu sử dụng cho không gian làm việc này';

  @override
  String get workspaceAnalyticsHelp =>
      'Dữ liệu sử dụng cho không gian làm việc này. Báo cáo sự cố luôn bật.';

  @override
  String get dangerZone => 'Vùng nguy hiểm';

  @override
  String get quotasHelp => 'Để trống nếu không giới hạn.';

  @override
  String get serviceOff => 'Tắt';

  @override
  String get serviceDown => 'Ngừng hoạt động';

  @override
  String get serviceOk => 'Bình thường';

  @override
  String get sendInvite => 'Gửi lời mời';

  @override
  String get thinking0 => 'Mô hình';

  @override
  String get saveChanges => 'Lưu thay đổi';

  @override
  String get autonomyAskAlwaysHelp =>
      'Hỏi ý kiến bạn trước mọi thao tác có thay đổi dữ liệu.';

  @override
  String get autonomyAskRiskyHelp =>
      'Tự làm việc nhưng hỏi trước mọi thao tác rủi ro như xóa tệp hay tiêu tiền.';

  @override
  String get autonomyAutonomousHelp =>
      'Tự hành động không cần hỏi. Phù hợp nhất cho quy trình bạn tin tưởng.';

  @override
  String get usageSubtitle => 'Chi tiêu mô hình tháng này';

  @override
  String get skillsRowHelp => 'Hướng dẫn bot tải khi công việc cần tới';

  @override
  String get integrationsRowHelp => 'Máy chủ MCP và ứng dụng đã kết nối';

  @override
  String get secretsRowHelp =>
      'Token và mật khẩu, chỉ gửi đến nơi bạn cho phép';

  @override
  String get computersRowHelp => 'Máy tính chung của nhóm và máy riêng';

  @override
  String get companionRowHelp =>
      'Cho phép bot dùng ứng dụng và tệp của thiết bị này';

  @override
  String get privacyRowHelp => 'Xuất dữ liệu hoặc xóa tài khoản';

  @override
  String get adminRowHelp => 'Users, workspaces, quotas and services';

  @override
  String get noIntegrationsTitle => 'Chưa có tích hợp nào';

  @override
  String get integrationsHelp =>
      'Tích hợp cấp thêm công cụ cho bot: máy chủ MCP, nguồn OpenAPI, Composio hoặc Pipedream. Mỗi công cụ được đặt tên theo tích hợp của nó.';

  @override
  String get botIntegrationsHelp =>
      'Bật các tích hợp mà bot này được phép dùng. Công cụ sẽ xuất hiện ở lượt chạy tiếp theo.';

  @override
  String get openSettings => 'Mở Cài đặt';

  @override
  String get noRunsHelp =>
      'Mỗi lần bot làm việc từ chat, quy trình hay webhook, lượt chạy sẽ hiện ở đây kèm việc đã làm và chi phí.';

  @override
  String get runCompleted => 'Xong';

  @override
  String get runWaiting => 'Đang chờ';

  @override
  String get runWorking => 'Đang làm';

  @override
  String get triggerChat => 'Chat';

  @override
  String get triggerRoutine => 'Quy trình';

  @override
  String get noEventsForFilter =>
      'Không có sự kiện loại này trong lượt chạy này.';

  @override
  String get runStatusFailed => 'Thất bại';

  @override
  String get runStatusStopped => 'Đã dừng';

  @override
  String get quickAskIntro =>
      'Gửi yêu cầu nhanh. Thao tác này mở một cuộc trò chuyện mới với bot bạn chọn.';

  @override
  String quickAskIntroBot(String name) {
    return 'Gửi yêu cầu nhanh. Thao tác này mở một cuộc trò chuyện mới với $name.';
  }

  @override
  String quickAskHintBot(String bot) {
    return '$bot nên làm gì?';
  }

  @override
  String get stateProvisioning => 'Đang thiết lập';

  @override
  String get stateStarting => 'Đang khởi động';

  @override
  String get computerRestoringFiles => 'Đang khôi phục tệp…';

  @override
  String get stateRunning => 'Đang chạy';

  @override
  String get stateIdle => 'Đang nghỉ';

  @override
  String get stateSleeping => 'Đang ngủ';

  @override
  String get stateStopped => 'Đã dừng';

  @override
  String get stateError => 'Lỗi';

  @override
  String get terminalHelp =>
      'Cửa sổ lệnh trên máy tính này. Bot dùng cùng cửa sổ này nên bạn có thể xem và sửa những gì bot đã làm.';

  @override
  String get up => 'Lên một cấp';

  @override
  String get emptyFolderHelp =>
      'Tệp do bot tạo và tệp bạn tải lên sẽ hiện ở đây.';

  @override
  String deleteFileTitle(String name) {
    return 'Xóa $name?';
  }

  @override
  String get botComputerAuto => 'Tự động';

  @override
  String get botComputerHelp =>
      'Máy tính riêng của bot: nơi bot chạy lệnh, duyệt web và giữ tệp.';

  @override
  String get billingOffTitle => 'Không có thanh toán tại đây';

  @override
  String revokeKeyTitle(String name) {
    return 'Thu hồi khóa cho $name?';
  }

  @override
  String get revokeKeyBody =>
      'Máy chủ đó sẽ ngừng dùng máy tính đám mây và tín dụng ngay lập tức.';

  @override
  String get handBackHelp =>
      'Bot sẽ tiếp tục từ chỗ bạn dừng lại. Hãy cho bot biết bạn đã làm gì nếu cần.';

  @override
  String get serverHelp =>
      'Dùng máy chủ Casama của riêng bạn. Nhập địa chỉ bạn hoặc quản trị viên đã thiết lập.';

  @override
  String get ssoHelp =>
      'Nhập email công việc và chúng tôi sẽ chuyển bạn tới trang đăng nhập của công ty.';

  @override
  String get colorScheme => 'Bảng màu';

  @override
  String get searchThemes => 'Tìm bảng màu';

  @override
  String get noThemesFound => 'Không có bảng màu nào khớp.';

  @override
  String get noAppsMatch =>
      'Không có ứng dụng nào khớp. Bạn có thể thêm máy chủ riêng trong mục Nâng cao.';

  @override
  String appsFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ứng dụng',
      one: '1 ứng dụng',
    );
    return '$_temp0';
  }

  @override
  String get familyAll => 'Tất cả';

  @override
  String get familyPurple => 'Tím';

  @override
  String get familyBlue => 'Xanh dương';

  @override
  String get familyTeal => 'Xanh ngọc';

  @override
  String get familyGreen => 'Xanh lá';

  @override
  String get familyWarm => 'Tông ấm';

  @override
  String get familyRed => 'Đỏ & hồng';

  @override
  String get familyNeutral => 'Trung tính';

  @override
  String get background => 'Hình nền';

  @override
  String get backgroundPattern => 'Họa tiết';

  @override
  String get backgroundColors => 'Màu sắc';

  @override
  String get backgroundThemeColors => 'Diện mạo';

  @override
  String get patternStrength => 'Độ rõ họa tiết';

  @override
  String get wallpaperEverywhere => 'Hiện trên mọi màn hình';

  @override
  String get wallpaperEverywhereHelp =>
      'Tắt để chỉ hiện sau các cuộc trò chuyện.';

  @override
  String get resetBackground => 'Đặt lại về mặc định';

  @override
  String get copyMessage => 'Sao chép';

  @override
  String get selectText => 'Chọn văn bản';

  @override
  String get shareMessage => 'Chia sẻ';

  @override
  String get messageCopied => 'Đã sao chép';

  @override
  String get botUiBroken => 'Không hiển thị được phần này của câu trả lời.';

  @override
  String get botUiSent => 'Đã gửi';

  @override
  String get botUiConnected => 'Đã kết nối';

  @override
  String get draftNewEmail => 'Email mới';

  @override
  String get draftNewMessage => 'Tin nhắn mới';

  @override
  String get draftNewPost => 'Bài đăng mới';

  @override
  String get draftReadyToSend => 'Sẵn sàng gửi';

  @override
  String get draftReadyToPost => 'Sẵn sàng đăng';

  @override
  String get draftEdited => 'Đã sửa';

  @override
  String get draftSendEmail => 'Gửi email';

  @override
  String get draftSend => 'Gửi';

  @override
  String get draftPost => 'Đăng';

  @override
  String get draftDiscard => 'Hủy bỏ';

  @override
  String get draftEdit => 'Sửa';

  @override
  String get draftDoneEditing => 'Xong';

  @override
  String get draftFrom => 'Từ';

  @override
  String get draftTo => 'Đến';

  @override
  String get draftCc => 'Cc';

  @override
  String get draftBcc => 'Bcc';

  @override
  String get draftSubject => 'Tiêu đề';

  @override
  String get botCardNewEvent => 'Sự kiện mới';

  @override
  String get botCardEvent => 'Sự kiện';

  @override
  String get botCardReadyToAdd => 'Sẵn sàng thêm';

  @override
  String get botCardAddToCalendar => 'Thêm vào lịch';

  @override
  String get botCardChange => 'Đổi';

  @override
  String get botCardSkip => 'Bỏ qua';

  @override
  String get botCardAllDay => 'Cả ngày';

  @override
  String botCardMore(int count) {
    return '+$count nữa';
  }

  @override
  String get botCardAgenda => 'Lịch trình';

  @override
  String get botCardMessages => 'Tin nhắn';

  @override
  String botCardUnread(int count) {
    return '$count chưa đọc';
  }

  @override
  String get botCardReply => 'Trả lời';

  @override
  String botCardReplyTo(String name) {
    return 'Trả lời $name';
  }

  @override
  String get botCardTasks => 'Tác vụ';

  @override
  String botCardDoneOf(int done, int total) {
    return 'Đã xong $done/$total';
  }

  @override
  String get botCardSaveChanges => 'Lưu thay đổi';

  @override
  String get botCardChoose => 'Chọn';

  @override
  String botCardChose(String title) {
    return '$title';
  }

  @override
  String get botCardWhichPerson => 'Bạn muốn nhắc đến ai?';

  @override
  String get botCardNoneOfThese => 'Không có ai ở đây';

  @override
  String get botCardReminder => 'Nhắc nhở';

  @override
  String get botCardRoutine => 'Quy trình';

  @override
  String get botCardWatcher => 'Đang theo dõi';

  @override
  String get botCardScheduled => 'Đã đặt';

  @override
  String botCardNext(String when) {
    return 'Tiếp theo: $when';
  }

  @override
  String get botCardCancelIt => 'Hủy mục này';

  @override
  String get botIcon => 'Biểu tượng';

  @override
  String get botIconInitials => 'Chữ cái đầu';

  @override
  String get errorDetailsTitle => 'Sự cố đã xảy ra';

  @override
  String get exportLabel => 'Xuất';

  @override
  String get openTimeline => 'Mở dòng thời gian lượt chạy';

  @override
  String get details => 'Chi tiết';

  @override
  String get themes => 'Diện mạo';

  @override
  String get myThemes => 'Diện mạo của bạn';

  @override
  String get saveTheme => 'Lưu diện mạo hiện tại';

  @override
  String get themeName => 'Tên diện mạo';

  @override
  String get importTheme => 'Nhập diện mạo';

  @override
  String get themeCode => 'Mã diện mạo';

  @override
  String get themeCodeHelp =>
      'Dán mã ai đó đã chia sẻ với bạn. Mã bắt đầu bằng casama-theme:';

  @override
  String get invalidThemeCode => 'Đây không phải mã diện mạo Casama.';

  @override
  String themeImported(String name) {
    return 'Đã thêm $name vào diện mạo của bạn';
  }

  @override
  String get themeCodeCopied =>
      'Đã sao chép mã diện mạo. Ai cũng có thể dán vào Giao diện → Nhập diện mạo.';

  @override
  String get shareTheme => 'Chia sẻ mã';

  @override
  String deleteThemeTitle(String name) {
    return 'Xóa $name?';
  }

  @override
  String get fonts => 'Phông chữ';

  @override
  String get headingFont => 'Tiêu đề';

  @override
  String get bodyFont => 'Văn bản';

  @override
  String get fontsHelp =>
      'Google Sans và Noto Serif có sẵn trong ứng dụng và hoạt động ngoại tuyến. Các Google Fonts khác sẽ tải xuống ở lần đầu bạn chọn.';

  @override
  String get searchFonts => 'Tìm tất cả Google Fonts';

  @override
  String get suggestedFonts => 'Gợi ý';

  @override
  String get allFonts => 'Tất cả Google Fonts';

  @override
  String get noFontsFound => 'Không có phông chữ nào tên đó';

  @override
  String get resetFonts => 'Dùng mặc định';

  @override
  String get fontSample => 'Các bot của bạn, làm việc cùng bạn.';

  @override
  String get backgroundPhoto => 'Ảnh';

  @override
  String get yourPhoto => 'Ảnh của bạn';

  @override
  String get browsePhotos => 'Chọn ảnh';

  @override
  String get removePhoto => 'Gỡ ảnh';

  @override
  String get photoBlur => 'Làm mờ';

  @override
  String get photoDim => 'Làm tối';

  @override
  String photoBy(String name) {
    return 'Ảnh của $name trên Unsplash';
  }

  @override
  String get searchPhotos => 'Tìm ảnh';

  @override
  String get photosUnavailable => 'Không tải được ảnh.';

  @override
  String get noPhotos => 'Không tìm thấy ảnh nào';

  @override
  String get photoHelp =>
      'Ảnh nằm dưới các hình vẽ trang trí. Làm mờ và làm tối giúp chữ bên trên dễ đọc.';

  @override
  String get periodToday => 'Hôm nay';

  @override
  String get periodWeek => 'Tuần này';

  @override
  String get periodYear => 'Năm nay';

  @override
  String get totalSpend => 'Chi tiêu';

  @override
  String get tokensIn => 'Token đầu vào';

  @override
  String get tokensOut => 'Token đầu ra';

  @override
  String get runsLabel => 'Lượt chạy';

  @override
  String get spendByDay => 'Chi tiêu theo ngày';

  @override
  String get byBot => 'Theo bot';

  @override
  String get byModel => 'Theo mô hình';

  @override
  String get everythingMetered => 'Mọi thứ đều được đo lường';

  @override
  String get bySource => 'Theo nguồn';

  @override
  String get byPerson => 'Theo người';

  @override
  String get usageAllBots => 'Tất cả bot';

  @override
  String get usageAllModels => 'Tất cả mô hình';

  @override
  String get usageAllSources => 'Tất cả nguồn';

  @override
  String get usageEveryone => 'Mọi người';

  @override
  String get usageJustMe => 'Chỉ mình tôi';

  @override
  String get usageClearFilters => 'Xóa';

  @override
  String get usageFilterBot => 'Lọc theo bot';

  @override
  String get usageFilterModel => 'Lọc theo mô hình';

  @override
  String get usageFilterSource => 'Lọc theo nguồn';

  @override
  String get usageFilterPerson => 'Lọc theo người';

  @override
  String get usageSourceChat => 'Chat';

  @override
  String get usageSourceChatApp => 'Ứng dụng chat';

  @override
  String get usageSourceRoutine => 'Quy trình';

  @override
  String get usageSourceApi => 'API và các agent khác';

  @override
  String get usageSourceOther => 'Khác';

  @override
  String get usageNoPerson => 'Tự động';

  @override
  String get usageUnnamedPerson => 'Thành viên chưa đặt tên';

  @override
  String usageRunsCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n lượt chạy',
      one: '1 lượt chạy',
    );
    return '$_temp0';
  }

  @override
  String get exportCsv => 'Xuất CSV';

  @override
  String get exportJson => 'Xuất JSON';

  @override
  String get askBotAboutUsage => 'Hỏi bot về điều này';

  @override
  String get noUsageYet => 'Chưa có mức sử dụng trong giai đoạn này.';

  @override
  String get otherModel => 'Máy tính và mục khác';

  @override
  String get deletedBot => 'Không gắn với bot nào';

  @override
  String get usageHelp =>
      'Chi phí là ước tính từ số token và bảng giá công bố. Hóa đơn từ nhà cung cấp mô hình mới là số chính thức.';

  @override
  String usageAskPrompt(String period, String summary) {
    return 'Đây là mức sử dụng Casama của tôi trong $period. Hãy giúp tôi hiểu tiền đã chi vào đâu và cách tiết kiệm hơn. Bạn cũng có thể kiểm tra số liệu trực tiếp bằng công cụ mức sử dụng.\n\n$summary';
  }

  @override
  String get kindTokensIn => 'Đầu vào mô hình';

  @override
  String get kindTokensOut => 'Đầu ra mô hình';

  @override
  String get kindComputer => 'Thời gian máy tính đám mây';

  @override
  String get kindModels => 'Mô hình AI';

  @override
  String get creditsThisMonth => 'Tín dụng tháng này';

  @override
  String creditsUsedPercent(int percent) {
    return 'Đã dùng $percent%';
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
      other: 'Khoảng $nString lượt chạy nữa ở mức chi phí thường lệ',
      one: 'Khoảng 1 lượt chạy nữa ở mức chi phí thường lệ',
      zero: 'Không đủ cho thêm một lượt chạy ở mức chi phí thường lệ',
    );
    return '$_temp0';
  }

  @override
  String get creditsOut =>
      'Bạn đã hết tín dụng. Nạp thêm để các bot tiếp tục chạy.';

  @override
  String creditsExplainerPlan(String price, String amount) {
    return '1 tín dụng = $price. Gói của bạn cộng thêm $amount mỗi tháng; phần chưa dùng được chuyển sang thêm một tháng.';
  }

  @override
  String creditsExplainerPacks(String price) {
    return '1 tín dụng = $price. Gói tín dụng mua từ App Store hoặc Google Play không bao giờ hết hạn; gói tín dụng mua trên web có thời hạn 12 tháng.';
  }

  @override
  String get creditsDailyLabel => 'Giới hạn hôm nay';

  @override
  String creditsDailyOf(String used, String cap) {
    return '$used/$cap';
  }

  @override
  String get creditsDailyExplainer =>
      'Mức mà gói của bạn có thể chi mỗi ngày cho các mô hình, giọng nói và ứng dụng của Casama, bất kể còn bao nhiêu tín dụng.';

  @override
  String get creditsDailyReached =>
      'Đã đạt giới hạn hôm nay nên các bot tạm dừng. Nâng cấp để có giới hạn ngày cao hơn.';

  @override
  String creditsDailyResetsHours(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Đặt lại sau khoảng $n giờ.',
      one: 'Đặt lại sau khoảng 1 giờ.',
    );
    return '$_temp0';
  }

  @override
  String get creditsDailyResetsSoon => 'Đặt lại trong chưa đầy một giờ.';

  @override
  String get creditsHoursLabel => 'Giờ máy tính';

  @override
  String creditsHoursOf(String used, String limit) {
    return '$used/$limit giờ';
  }

  @override
  String creditsHoursExplainer(String date) {
    return 'Thời gian máy tính của các bot chạy trong tháng này. Khi dùng hết, chat vẫn hoạt động; chỉ máy tính dừng lại. Đặt lại vào $date.';
  }

  @override
  String creditsHoursReached(String date) {
    return 'Đã dùng hết giờ máy tính tháng này nên máy tính không thể khởi động. Chat vẫn hoạt động. Đặt lại vào $date. Nâng cấp để có thêm giờ.';
  }

  @override
  String get kindStream => 'Xem trực tiếp';

  @override
  String get kindTts => 'Đọc to';

  @override
  String get computerMissingTitle => 'Không tìm thấy máy tính';

  @override
  String get computerMissingHelp =>
      'Có thể máy đã bị gỡ hoặc danh sách đã cũ. Làm mới để kiểm tra lại.';

  @override
  String get computerMissingBotHelp =>
      'Máy tính của bot này có thể đã bị gỡ hoặc danh sách đã cũ. Hãy làm mới hoặc chọn máy tính khác cho bot.';

  @override
  String get computerChoose => 'Chọn máy tính';

  @override
  String get personaWork => 'Công việc';

  @override
  String get personaResearch => 'Nghiên cứu';

  @override
  String get personaBuild => 'Xây dựng';

  @override
  String get personaCreate => 'Sáng tạo';

  @override
  String get personaLife => 'Đời sống';

  @override
  String get personaOther => 'Khác';

  @override
  String get blankBotHelp =>
      'Bắt đầu từ đầu và tự viết hướng dẫn của riêng bạn.';

  @override
  String get browse => 'Duyệt';

  @override
  String get browseAllPersonas => 'Xem tất cả';

  @override
  String get botIdentity => 'Tên và biểu tượng';

  @override
  String get serviceKeys => 'Khóa dịch vụ';

  @override
  String get noServiceKeys => 'Chưa có khóa dịch vụ nào.';

  @override
  String get serviceKeysHelp =>
      'Khóa tìm kiếm, bản đồ hoặc dữ liệu của riêng bạn';

  @override
  String get serviceKeysIntro =>
      'Casama vận hành sẵn mô hình, giọng nói và hình ảnh cho bạn. Chỉ thêm khóa ở đây nếu muốn dùng dịch vụ tìm kiếm, bản đồ hoặc dữ liệu riêng. Khóa được lưu mã hóa và không bao giờ hiển thị lại.';

  @override
  String get choosePersona => 'Chọn hình mẫu';

  @override
  String get choosePersonaHelp =>
      'Mỗi hình mẫu đi kèm hướng dẫn, một diện mạo, và đôi khi có sẵn kỹ năng cùng quy trình. Bạn có thể thay đổi mọi thứ sau đó.';

  @override
  String get searchPersonas => 'Tìm hình mẫu';

  @override
  String get noPersonasFound => 'Không có hình mẫu nào khớp';

  @override
  String get previewPersona => 'Xem trước';

  @override
  String get personaInstructions => 'Hướng dẫn';

  @override
  String get personaTryAsking => 'Thử hỏi';

  @override
  String usePersona(String name) {
    return 'Dùng $name';
  }

  @override
  String get loadPersona => 'Tải hình mẫu';

  @override
  String get replaceInstructionsTitle => 'Thay thế hướng dẫn?';

  @override
  String replaceInstructionsBody(String name) {
    return 'Hướng dẫn hiện tại của bot sẽ được thay bằng hướng dẫn của $name. Kỹ năng và quy trình vẫn giữ nguyên.';
  }

  @override
  String get replace => 'Thay thế';

  @override
  String get appsTitle => 'Ứng dụng';

  @override
  String get appsSubtitle =>
      'Cung cấp cho bot những công cụ mà nhóm bạn đang dùng.';

  @override
  String get connectedTab => 'Đã kết nối';

  @override
  String get browseTab => 'Khám phá';

  @override
  String get searchApps => 'Tìm ứng dụng';

  @override
  String get popularApps => 'Phổ biến';

  @override
  String get allApps => 'Tất cả ứng dụng';

  @override
  String get appCatDeveloper => 'Lập trình';

  @override
  String get appCatProductivity => 'Năng suất';

  @override
  String get appCatGoogle => 'Google';

  @override
  String get appCatPayments => 'Thanh toán';

  @override
  String get appCatDesign => 'Thiết kế';

  @override
  String get appCatSales => 'Bán hàng & hỗ trợ';

  @override
  String get appCatData => 'Dữ liệu & tìm kiếm';

  @override
  String get appCatAutomation => 'Tự động hóa';

  @override
  String get authOneClick => 'Một chạm';

  @override
  String get authApiKey => 'Khóa API';

  @override
  String get authNone => 'Không cần đăng nhập';

  @override
  String get authAdminSetup => 'Cần thiết lập';

  @override
  String get connectedBadge => 'Đã kết nối';

  @override
  String get whatBotsCanDo => 'Những việc bot làm được';

  @override
  String continueWith(String app) {
    return 'Tiếp tục với $app';
  }

  @override
  String get signInTab => 'Đăng nhập';

  @override
  String get connectNoSignIn => 'Ứng dụng này hoạt động không cần đăng nhập.';

  @override
  String finishSignIn(String app) {
    return 'Hoàn tất đăng nhập $app';
  }

  @override
  String finishSignInHelp(String app) {
    return '$app đã mở trong trình duyệt. Hãy phê duyệt quyền truy cập ở đó và màn hình này sẽ tự cập nhật.';
  }

  @override
  String get reopenSignIn => 'Mở lại trang đăng nhập';

  @override
  String appConnected(String app) {
    return 'Đã kết nối $app';
  }

  @override
  String appAlreadyConnected(String app) {
    return '$app đã được kết nối trong không gian làm việc này. Dùng kết nối đó hoặc thêm tài khoản khác.';
  }

  @override
  String get useConnection => 'Dùng kết nối này';

  @override
  String get addAnotherAccount => 'Thêm tài khoản khác';

  @override
  String appToolsReady(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString công cụ đã sẵn sàng cho bot.',
      one: '1 công cụ đã sẵn sàng cho bot.',
      zero: 'Sẵn sàng sử dụng.',
    );
    return '$_temp0';
  }

  @override
  String get whichBots => 'Bot nào được dùng?';

  @override
  String get whichBotsHelp => 'Bot vẫn hỏi bạn trước mọi thao tác rủi ro.';

  @override
  String get doneLabel => 'Xong';

  @override
  String openApp(String app) {
    return 'Mở $app';
  }

  @override
  String get pasteLabel => 'Dán';

  @override
  String get connectingLabel => 'Đang kết nối…';

  @override
  String get connectFailedTitle => 'Không kết nối được';

  @override
  String adminSetupNeeded(String app) {
    return 'One-click sign-in for $app needs a one-time setup by whoever runs this Casama server.';
  }

  @override
  String connectThroughHub(String app) {
    return 'Hoặc kết nối $app qua một trong các dịch vụ sau. Đăng nhập một lần rồi bảo bot dùng $app.';
  }

  @override
  String adminSetupRedirect(String uri) {
    return 'Register this redirect address with the app: $uri';
  }

  @override
  String get privacyNote =>
      'Thông tin đăng nhập được lưu mã hóa và không bao giờ hiển thị lại. Ngắt kết nối bất cứ lúc nào.';

  @override
  String get composioHelp =>
      'Hàng trăm ứng dụng, đăng nhập được lo sẵn cho bạn.';

  @override
  String get pipedreamHelp => 'Hàng nghìn ứng dụng qua Pipedream Connect.';

  @override
  String get customServer => 'Máy chủ tùy chỉnh';

  @override
  String get customServerHelp =>
      'Mọi máy chủ MCP hoặc đặc tả OpenAPI. Dành cho lập trình viên.';

  @override
  String usedByBots(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Được $countString bot sử dụng',
      one: 'Được 1 bot sử dụng',
      zero: 'Chưa cấp cho bot nào',
    );
    return '$_temp0';
  }

  @override
  String get statusReady => 'Sẵn sàng';

  @override
  String get statusNeedsAttention => 'Cần chú ý';

  @override
  String get statusChecking => 'Đang kiểm tra';

  @override
  String get toolsHelp =>
      'Công cụ chỉ đọc chạy tự động. Công cụ có thay đổi dữ liệu sẽ hỏi trước khi bot đọc nội dung chưa tin cậy, và công cụ đặt “Luôn hỏi” luôn chờ bạn xác nhận.';

  @override
  String get botsWithAccess => 'Bot có quyền truy cập';

  @override
  String get reconnect => 'Kết nối lại';

  @override
  String get disconnect => 'Ngắt kết nối';

  @override
  String disconnectTitle(String app) {
    return 'Ngắt kết nối $app?';
  }

  @override
  String get disconnectBody =>
      'Bot sẽ mất công cụ của ứng dụng này ngay lập tức và thông tin đăng nhập đã lưu sẽ bị xóa.';

  @override
  String get testConnection => 'Kiểm tra kết nối';

  @override
  String get signedInOAuth => 'Đã đăng nhập bằng tài khoản của bạn';

  @override
  String get signedInKey => 'Đã kết nối bằng khóa API';

  @override
  String get signedInNone => 'Không cần đăng nhập';

  @override
  String get noConnectionsTitle => 'Kết nối ứng dụng đầu tiên';

  @override
  String get noConnections =>
      'Stripe, Linear, Notion, Gmail và nhiều ứng dụng khác. Hầu hết chỉ mất một chạm.';

  @override
  String get browseApps => 'Duyệt ứng dụng';

  @override
  String providerSetupTitle(String provider) {
    return 'Kết nối $provider';
  }

  @override
  String providerSetupHelp(String provider) {
    return '$provider đăng nhập sẵn vào các ứng dụng giúp bạn nên bạn không phải xử lý khóa.';
  }

  @override
  String get getFreeKey => 'Lấy khóa miễn phí';

  @override
  String connectedThroughHub(String provider) {
    return 'Qua $provider';
  }

  @override
  String providerAppsTitle(String provider) {
    return 'Ứng dụng qua $provider';
  }

  @override
  String get addAnApp => 'Thêm ứng dụng';

  @override
  String searchProviderApps(String provider) {
    return 'Tìm ứng dụng $provider';
  }

  @override
  String get accountConnected => 'Đã đăng nhập';

  @override
  String get accountPending => 'Đang chờ đăng nhập';

  @override
  String get accountError => 'Lỗi đăng nhập';

  @override
  String get providerReconnectHint =>
      'Đăng nhập trực tiếp với Casama để giảm chi phí gọi ứng dụng';

  @override
  String get noProviderAccounts =>
      'Chưa có ứng dụng nào. Hãy thêm một ứng dụng và đăng nhập.';

  @override
  String get projectId => 'ID dự án';

  @override
  String get toolRiskLow => 'Chỉ đọc';

  @override
  String get toolRiskMedium => 'Có thay đổi';

  @override
  String get toolRiskHigh => 'Luôn hỏi';

  @override
  String get askWhichBot => 'Bot nào nên xem mục này?';

  @override
  String get computerWake => 'Đánh thức';

  @override
  String get computerAsleepTitle => 'Máy tính đang ngủ';

  @override
  String get computerAsleepFilesHelp => 'Đánh thức máy để xem và tải lên tệp.';

  @override
  String get computerFilesTimedOut =>
      'Tải tệp quá lâu. Kiểm tra xem máy tính có đang bật rồi thử lại.';

  @override
  String get computerGoingToSleep => 'Đang chuyển sang ngủ';

  @override
  String get liveViewWakesHelp =>
      'Máy tính này đang ngủ. Mở chế độ xem trực tiếp sẽ đánh thức máy; máy sẽ tự ngủ lại sau một thời gian không dùng.';

  @override
  String get wakeAndWatch => 'Đánh thức và xem trực tiếp';

  @override
  String get chatGptPlan => 'Gói ChatGPT';

  @override
  String get continueWithChatGpt => 'Tiếp tục với ChatGPT';

  @override
  String get chatGptConnectHelp =>
      'Chạy bot trên gói ChatGPT thay cho khóa API. Lượt gọi mô hình tính vào giới hạn gói của bạn và chỉ mình bạn dùng được.';

  @override
  String get chatGptDesktopOnly =>
      'Để kết nối gói ChatGPT, hãy mở ứng dụng máy tính hoặc chạy “casama credential chatgpt” trong CLI.';

  @override
  String get chatGptWaiting => 'Hoàn tất đăng nhập ChatGPT trong trình duyệt…';

  @override
  String chatGptConnected(String account) {
    return 'Đã kết nối gói ChatGPT ($account).';
  }

  @override
  String get chatGptPlanUsageOff =>
      'Bạn đã đăng nhập nhưng mức sử dụng gói chưa được cho phép. Hãy kết nối lại và cho phép, hoặc thêm khóa API.';

  @override
  String get orAddApiKey => 'Hoặc thêm khóa API';

  @override
  String get planOnlyYou => 'Chỉ bạn dùng được';

  @override
  String get planOtherMember => 'Gói của thành viên khác';

  @override
  String get planConnected => 'Đã kết nối';

  @override
  String get planUsageOff => 'Đang tắt dùng gói';

  @override
  String get planNeedsReconnect => 'Đăng nhập lại';

  @override
  String get useNextModelAtLimit =>
      'Dùng mô hình tiếp theo của bot khi chạm giới hạn gói';

  @override
  String get useNextModelAtLimitHelp =>
      'Tắt: lượt chạy dừng khi chạm giới hạn ChatGPT. Bật: tiếp tục trên mô hình tiếp theo của bot, có thể tốn phí.';

  @override
  String get manageUsage => 'Quản lý mức sử dụng';

  @override
  String get removeKey => 'Gỡ';

  @override
  String removeKeyConfirm(String label) {
    return 'Gỡ $label? Các bot dùng khóa này sẽ ngừng chạy cho đến khi bạn thêm khóa khác.';
  }

  @override
  String get removeKeyChatGptNote =>
      'Đăng nhập ChatGPT của bạn cũng bị thu hồi.';

  @override
  String modelFallbackNotice(String message) {
    return 'Đã chuyển sang mô hình tiếp theo: $message';
  }

  @override
  String get twoStepSignIn => 'Đăng nhập hai bước';

  @override
  String get twoStepHelp =>
      'Yêu cầu mã từ ứng dụng xác thực mỗi lần bạn đăng nhập.';

  @override
  String get signInWithPasskey => 'Đăng nhập bằng khóa truy cập';

  @override
  String get account => 'Tài khoản';

  @override
  String get accountRow => 'Email, mật khẩu và đăng xuất mọi nơi';

  @override
  String get forgotPassword => 'Quên mật khẩu?';

  @override
  String get newPassword => 'Mật khẩu mới';

  @override
  String get newPasswordAgain => 'Nhập lại mật khẩu mới';

  @override
  String get passwordsDontMatch => 'Mật khẩu không khớp';

  @override
  String get newPasswordTitle => 'Chọn mật khẩu mới';

  @override
  String get newPasswordBody =>
      'Bạn đã đăng nhập. Chọn mật khẩu mới để đăng nhập bằng email.';

  @override
  String get savePassword => 'Lưu mật khẩu';

  @override
  String get passwordSaved => 'Đã lưu mật khẩu.';

  @override
  String get passwordTitle => 'Mật khẩu';

  @override
  String get passwordRow => 'Đặt hoặc đổi mật khẩu đăng nhập bằng email';

  @override
  String get passwordHelp =>
      'Dùng ít nhất 6 ký tự. Bạn vẫn đăng nhập được bằng Google, Apple, khóa truy cập hoặc liên kết email.';

  @override
  String passwordCodeSent(String email) {
    return 'Để bảo vệ tài khoản, hãy nhập mã chúng tôi vừa gửi tới $email.';
  }

  @override
  String get changeEmailTitle => 'Đổi email';

  @override
  String get changeEmailHelp =>
      'Chúng tôi sẽ gửi liên kết xác nhận tới địa chỉ hiện tại và địa chỉ mới. Thay đổi có hiệu lực sau khi xác nhận cả hai.';

  @override
  String get newEmail => 'Email mới';

  @override
  String get changeEmailSend => 'Gửi xác nhận';

  @override
  String get changeEmailRow => 'Đổi email dùng để đăng nhập';

  @override
  String changeEmailSent(String email) {
    return 'Kiểm tra cả hai hộp thư đến. $email sẽ thành email của bạn sau khi xác nhận cả hai liên kết.';
  }

  @override
  String changeEmailPending(String email) {
    return 'Đang chờ xác nhận: $email';
  }

  @override
  String get signOutEverywhere => 'Đăng xuất ở mọi nơi';

  @override
  String get signOutEverywhereHelp =>
      'Mọi điện thoại, máy tính và trình duyệt, kể cả thiết bị này';

  @override
  String get signOutEverywhereConfirm =>
      'Đăng xuất trên mọi thiết bị, kể cả thiết bị này? Dùng tùy chọn này nếu bạn mất thiết bị hoặc nghi có người khác đã đăng nhập.';

  @override
  String get passkeySuggestTitle => 'Đăng nhập nhanh hơn lần sau?';

  @override
  String get passkeySuggestBody =>
      'Thêm khóa truy cập để đăng nhập bằng Face ID, vân tay hoặc khóa màn hình. Không cần mật khẩu hay email.';

  @override
  String get passkeys => 'Khóa truy cập';

  @override
  String get passkeysRow =>
      'Đăng nhập bằng Face ID, vân tay hoặc khóa màn hình';

  @override
  String get passkeysHelp =>
      'Khóa truy cập giúp bạn đăng nhập bằng Face ID, vân tay hoặc khóa màn hình mà không cần mật khẩu hay email. Mỗi điện thoại, máy tính hoặc trình quản lý mật khẩu giữ một khóa riêng.';

  @override
  String get passkeyAdd => 'Thêm khóa truy cập';

  @override
  String get passkeyAddAnother => 'Thêm khóa truy cập khác';

  @override
  String get passkeyAdded =>
      'Đã thêm khóa truy cập. Lần sau bạn có thể đăng nhập bằng khóa này.';

  @override
  String get passkeyRename => 'Đổi tên';

  @override
  String get passkeyRenameTitle => 'Đổi tên khóa truy cập';

  @override
  String get passkeyNameLabel => 'Tên';

  @override
  String get passkeyRemove => 'Gỡ';

  @override
  String passkeyRemoveConfirm(String name) {
    return 'Gỡ “$name”? Bạn sẽ không thể đăng nhập bằng khóa này nữa.';
  }

  @override
  String passkeyAddedWhen(String when) {
    return 'Đã thêm: $when';
  }

  @override
  String passkeyLastUsed(String when) {
    return 'Dùng gần nhất $when';
  }

  @override
  String get twoStepSetUp => 'Thiết lập ứng dụng xác thực';

  @override
  String get twoStepAddAnother => 'Thêm ứng dụng xác thực khác';

  @override
  String get twoStepScan =>
      'Quét mã này bằng ứng dụng xác thực (như 1Password, Google Authenticator hoặc Authy), hoặc nhập khóa thiết lập, rồi nhập mã 6 chữ số hiển thị.';

  @override
  String get twoStepKey => 'Khóa thiết lập';

  @override
  String get twoStepCode => 'Mã 6 chữ số';

  @override
  String get twoStepVerify => 'Xác minh';

  @override
  String get twoStepNowOn => 'Đã bật đăng nhập hai bước.';

  @override
  String get twoStepAuthenticators => 'Ứng dụng xác thực';

  @override
  String get twoStepRename => 'Đổi tên';

  @override
  String get twoStepRenameTitle => 'Đổi tên trình xác thực';

  @override
  String get twoStepNameLabel => 'Tên';

  @override
  String get twoStepNameHint => 'Ví dụ: Điện thoại công việc';

  @override
  String get twoStepRemove => 'Gỡ';

  @override
  String get twoStepRemoveConfirm =>
      'Gỡ ứng dụng xác thực này? Nếu đây là ứng dụng duy nhất, bạn sẽ đăng nhập chỉ bằng mật khẩu.';

  @override
  String get twoStepPromptTitle => 'Nhập mã';

  @override
  String get twoStepPromptBody =>
      'Mở ứng dụng xác thực và nhập mã 6 chữ số để hoàn tất đăng nhập.';

  @override
  String get twoStepPromptAccount => 'Đang đăng nhập với';

  @override
  String get casamaCloudName => 'Casama Cloud';

  @override
  String get newPasswordFor => 'Mật khẩu mới cho';

  @override
  String get connectAiAppAccount => 'Ứng dụng được quyền truy cập';

  @override
  String joinAsAccount(String email, String server) {
    return 'Bạn sẽ tham gia với tài khoản $email trên $server.';
  }

  @override
  String get requireTwoStep =>
      'Bắt buộc đăng nhập hai bước cho chủ sở hữu và quản trị viên';

  @override
  String get requireTwoStepHelp =>
      'Chủ sở hữu và quản trị viên phải bật tính năng này. Hãy bật của bạn trước.';

  @override
  String get twoStepNeededForAdmin =>
      'Không gian làm việc này yêu cầu đăng nhập hai bước đối với chủ sở hữu và quản trị viên. Hãy thiết lập hoặc đăng nhập lại bằng mã để dùng cài đặt quản trị.';

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
  String get suspendWorkspace => 'Đình chỉ';

  @override
  String get unsuspendWorkspace => 'Bỏ đình chỉ';

  @override
  String get suspendReason => 'Lý do';

  @override
  String get suspendWorkspaceHelp =>
      'Các máy tính và bot sẽ ngừng chạy. Không có gì bị xóa và bạn có thể bỏ đình chỉ bất cứ lúc nào.';

  @override
  String workspaceSuspended(String reason) {
    return 'Đã đình chỉ: $reason';
  }

  @override
  String get workspaceSuspendedBanner =>
      'Không gian làm việc này đang bị đình chỉ nên bot không thể chạy và máy tính không thể khởi động. Hãy liên hệ người vận hành máy chủ này.';

  @override
  String get abuseKind_mining_pool => 'Đã chặn đào tiền mã hóa';

  @override
  String get abuseKind_blocked_port => 'Đã chặn cổng gửi thư';

  @override
  String get abuseKind_egress_flood => 'Lưu lượng tăng đột biến';

  @override
  String get abuseKind_signup_blocked => 'Đã từ chối đăng ký';

  @override
  String get abuseKind_suspended => 'Không gian làm việc bị đình chỉ';

  @override
  String get abuseKind_unsuspended => 'Đã bỏ đình chỉ';

  @override
  String get kindLocalMcp => 'Trên máy tính';

  @override
  String get capMcp => 'Công cụ cục bộ (MCP)';

  @override
  String get localMcpServers => 'Công cụ cục bộ (MCP)';

  @override
  String get localMcpHelp =>
      'Các máy chủ MCP trên máy tính này hoặc trong mạng của bạn mà bot dùng được, như T3 Code, Claude Code, Codex hay ứng dụng thiết kế. Token và đăng nhập của chúng chỉ nằm trên máy tính này.';

  @override
  String get localMcpAdd => 'Thêm máy chủ MCP cục bộ';

  @override
  String get localMcpEmpty => 'Chưa có máy chủ MCP cục bộ nào.';

  @override
  String get localMcpName => 'Tên';

  @override
  String get localMcpStdio => 'Một câu lệnh';

  @override
  String get localMcpLoopback => 'Một địa chỉ';

  @override
  String get localMcpCommand => 'Câu lệnh';

  @override
  String get localMcpCommandHint => 'npx -y @example/mcp-server';

  @override
  String get localMcpUrl => 'Địa chỉ';

  @override
  String get localMcpFolder => 'Thư mục làm việc (tùy chọn)';

  @override
  String get localMcpEnv =>
      'Biến môi trường (mỗi dòng một KEY=value, lưu trên máy tính này)';

  @override
  String get localMcpNeedsCapability =>
      'Bật Công cụ cục bộ (MCP) ở trên để bot dùng được các máy chủ này.';

  @override
  String get localMcpBadUrl =>
      'Dùng địa chỉ http:// trên máy tính này hoặc mạng của bạn, như http://127.0.0.1:3845/mcp, hoặc địa chỉ https://.';

  @override
  String get localMcpBadFolder =>
      'Chọn thư mục nằm trong một trong các thư mục chia sẻ.';

  @override
  String get codingAgents => 'Coding agent';

  @override
  String get codingAgentsHelp =>
      'Bot có thể giao tác vụ lập trình cho các agent này trên máy tính này. Chúng dùng đăng nhập của bạn và làm việc trong thư mục bạn chia sẻ.';

  @override
  String codingAgentsFound(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Tìm thấy $nString coding agent',
      one: 'Tìm thấy 1 coding agent',
      zero: 'Không tìm thấy coding agent nào',
    );
    return '$_temp0';
  }

  @override
  String get localMcpNotSaved =>
      'Máy chủ này chưa được lưu vào không gian làm việc. Hãy gỡ đi và thêm lại.';

  @override
  String get localMcpSignInKind => 'Đăng nhập';

  @override
  String get localMcpAuthNone => 'Không';

  @override
  String get localMcpAuthToken => 'Token';

  @override
  String get localMcpAuthHeader => 'Tiêu đề (Header)';

  @override
  String get localMcpAuthOAuth => 'Trình duyệt';

  @override
  String get localMcpToken => 'Token (lưu trên máy tính này)';

  @override
  String get localMcpHeaderName => 'Tên tiêu đề';

  @override
  String get localMcpHeaderValue => 'Giá trị tiêu đề (lưu trên máy tính này)';

  @override
  String get localMcpOAuthHelp =>
      'Casama mở trình duyệt để bạn đăng nhập vào máy chủ này. Phiên đăng nhập chỉ lưu trên máy tính này.';

  @override
  String get localMcpNetworkWarning =>
      'Máy chủ này không nằm trên máy tính này. Bot dùng được máy tính này đều truy cập được máy chủ đó.';

  @override
  String get localMcpSignIn => 'Đăng nhập';

  @override
  String get localMcpNeedsSignIn => 'Cần đăng nhập';

  @override
  String get localMcpEdit => 'Sửa máy chủ MCP cục bộ';

  @override
  String get localMcpImport => 'Thêm từ ứng dụng khác';

  @override
  String get localMcpImportHelp =>
      'Các máy chủ MCP đã thiết lập trong T3 Code, Claude Code, Claude Desktop, Cursor, VS Code, Codex hoặc Windsurf trên máy tính này.';

  @override
  String get localMcpImportNone =>
      'Không tìm thấy máy chủ MCP nào trong các ứng dụng khác trên máy tính này.';

  @override
  String get localMcpImportAdded => 'Đã thêm';

  @override
  String get localMcpImportRemote =>
      'Trên internet, nên thường thêm trong Kết nối. Chỉ thêm ở đây nếu chỉ máy tính này truy cập được.';

  @override
  String get mcpQuestionDecline => 'Từ chối';

  @override
  String get mcpQuestionSend => 'Gửi';

  @override
  String get cardMcpQuestion => 'Câu hỏi';

  @override
  String get cardMcpSignIn => 'Đăng nhập';

  @override
  String get mcpSignInHereHelp => 'Đăng nhập để bot dùng lại được.';

  @override
  String localMcpSignedIn(String name) {
    return 'Đã đăng nhập $name';
  }

  @override
  String localMcpImportFrom(String source) {
    return 'Từ $source';
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
      other: 'Thêm $nString máy chủ',
      one: 'Thêm 1 máy chủ',
      zero: 'Thêm',
    );
    return '$_temp0';
  }

  @override
  String localMcpMissingValue(String name) {
    return '$name (lưu trên máy tính này)';
  }

  @override
  String mcpSignInTitle(String name) {
    return '$name cần bạn đăng nhập';
  }

  @override
  String mcpSignInElsewhereHelp(String device) {
    return 'Mở Casama trên $device và đăng nhập tại đó.';
  }

  @override
  String get mcpSignInElsewhereUnknownHelp =>
      'Mở Casama trên máy tính chạy công cụ này rồi đăng nhập tại đó.';

  @override
  String mcpQuestionTitle(String connection) {
    return '$connection hỏi';
  }

  @override
  String mcpQuestionAnswered(String connection) {
    return 'Đã trả lời $connection';
  }

  @override
  String mcpQuestionDeclined(String connection) {
    return 'Đã từ chối câu hỏi của $connection';
  }

  @override
  String mcpQuestionClosed(String connection) {
    return 'Câu hỏi của $connection đã đóng';
  }

  @override
  String get codingAgentsNone =>
      'Không tìm thấy coding agent nào. Cài agent dòng lệnh của Claude Code, Codex hoặc Cursor để giao tác vụ lập trình cho chúng.';

  @override
  String get codingAgentsNeedShell =>
      'Coding agent chạy dưới dạng câu lệnh nên cần bật Chạy lệnh.';

  @override
  String get allowCommands => 'Bật';

  @override
  String get codingAgentAllow => 'Cho phép';

  @override
  String get codingAgentAllowed => 'Đã cho phép';

  @override
  String get codingAgentsAllowHelp =>
      'Agent có nút Cho phép bên cạnh chưa từng chạy trên máy tính này. Cho phép một lần và bot có thể giao tác vụ cho nó.';

  @override
  String get ownAgentsAdd => 'Thêm tùy chỉnh';

  @override
  String get ownAgentYours => 'Của bạn';

  @override
  String get ownAgentNotFound => 'Không tìm thấy trên máy tính này';

  @override
  String get ownAgentsHelp =>
      'Agent tùy chỉnh của bạn chỉ chạy trên máy tính này, trong các cuộc trò chuyện đại diện cho bạn. Không ai khác trong không gian làm việc thấy hoặc sửa được.';

  @override
  String get ownAgentFormTitle => 'Thêm agent tùy chỉnh';

  @override
  String get ownAgentEditTitle => 'Sửa agent của bạn';

  @override
  String get ownAgentName => 'Tên';

  @override
  String get ownAgentBin => 'Tên câu lệnh';

  @override
  String get ownAgentCommand => 'Câu lệnh';

  @override
  String ownAgentCommandHelp(String task, String folder, String result_file) {
    return 'Đặt $task vào vị trí tác vụ; Casama sẽ trích dẫn nó. Mọi câu lệnh trong đó phải bắt đầu bằng tên câu lệnh. Bạn cũng có thể dùng $folder, và $result_file khi agent ghi câu trả lời ra tệp.';
  }

  @override
  String get ownAgentResult => 'Đọc câu trả lời';

  @override
  String get ownAgentResultTail => 'Phần cuối đầu ra';

  @override
  String get ownAgentResultJson => 'Một dòng JSON có trường result';

  @override
  String get ownAgentResultStream => 'Một luồng các dòng JSON';

  @override
  String get ownAgentResultField => 'Một trường JSON';

  @override
  String get ownAgentResultFile => 'Ghi ra một tệp';

  @override
  String get ownAgentResultFieldName => 'Tên trường';

  @override
  String get ownAgentTimeLimit => 'Giới hạn thời gian (phút)';

  @override
  String get ownAgentTest => 'Kiểm tra';

  @override
  String get ownAgentTestHelp =>
      'Kiểm tra sẽ yêu cầu nó trả lời chỉ bằng từ pong trên máy tính này và hiển thị kết quả in ra.';

  @override
  String ownAgentTestPassed(String reply) {
    return 'Đã trả lời: $reply';
  }

  @override
  String ownAgentTestFailed(int code) {
    return 'Không trả lời như mong đợi (mã thoát $code).';
  }

  @override
  String get ownAgentTestTimedOut => 'Không hoàn thành kịp thời gian.';

  @override
  String ownAgentBadCommand(String task) {
    return 'Điền tên, tên câu lệnh và câu lệnh có $task.';
  }

  @override
  String get board => 'Bảng việc';

  @override
  String get newTicket => 'Phiếu việc mới';

  @override
  String get newTicketSubtitle =>
      'Một tác vụ cho bot của bạn, theo dõi trên bảng việc.';

  @override
  String get allProjects => 'Tất cả dự án';

  @override
  String get manageProjects => 'Quản lý dự án';

  @override
  String get filterByProject => 'Lọc theo dự án';

  @override
  String get moveTo => 'Chuyển tới';

  @override
  String get noMatchingTickets => 'Không có phiếu việc nào khớp';

  @override
  String get noMatchingTicketsHelp =>
      'Không có phiếu việc nào khớp với bộ lọc này.';

  @override
  String get clearFilters => 'Xóa bộ lọc';

  @override
  String get ticketTitle => 'Tiêu đề';

  @override
  String get ticketDetails => 'Chi tiết';

  @override
  String get taskInReview => 'Đang xem xét';

  @override
  String get priority => 'Mức ưu tiên';

  @override
  String get priorityUrgent => 'Khẩn cấp';

  @override
  String get priorityHigh => 'Cao';

  @override
  String get priorityMedium => 'Trung bình';

  @override
  String get priorityLow => 'Thấp';

  @override
  String get priorityNone => 'Không ưu tiên';

  @override
  String get filterAll => 'Tất cả';

  @override
  String get filterMine => 'Của tôi';

  @override
  String get filterBots => 'Bot';

  @override
  String get assignee => 'Giao cho';

  @override
  String get unassigned => 'Chưa giao';

  @override
  String get assignToMe => 'Tôi';

  @override
  String get reviewRequired => 'Cần xem xét';

  @override
  String get reviewRequiredHelp =>
      'Bot hoàn tất ở trạng thái cần xem xét thay vì xong.';

  @override
  String get comments => 'Bình luận';

  @override
  String get addComment => 'Thêm bình luận';

  @override
  String get sendComment => 'Gửi';

  @override
  String get openThread => 'Mở luồng của bot';

  @override
  String get deleteTicket => 'Xóa phiếu việc';

  @override
  String get ticketResult => 'Kết quả';

  @override
  String get noCommentsYet =>
      'Chưa có bình luận. Để lại ghi chú cho bot hoặc nhóm.';

  @override
  String get noTickets => 'Giao việc cho các bot';

  @override
  String get noTicketsHelp =>
      'Giao một đầu việc hoặc cả một mục tiêu. Bạn có thể theo dõi tiến độ ngay tại đây.';

  @override
  String get tasksStartTicket => 'Thêm phiếu việc';

  @override
  String get tasksStartTicketHelp =>
      'Một đầu việc. Giao cho một bot và bot sẽ bắt đầu.';

  @override
  String get tasksStartProject => 'Bắt đầu dự án';

  @override
  String get tasksStartProjectHelp =>
      'Mục tiêu lớn hơn. Bot sẽ lập kế hoạch thành các phiếu việc và chờ bạn đồng ý.';

  @override
  String get tasksExamples => 'Hoặc bắt đầu từ một gợi ý sau';

  @override
  String get tasksExampleResearch => 'Nghiên cứu ba đối thủ hàng đầu của tôi';

  @override
  String get tasksExampleDraft => 'Soạn thông báo ra mắt';

  @override
  String get tasksExampleTidy => 'Sắp xếp lại tệp của tôi';

  @override
  String get ticketStatus => 'Trạng thái';

  @override
  String get spaces => 'Không gian làm việc';

  @override
  String get newWorkspace => 'Không gian làm việc mới';

  @override
  String get newWorkspaceSubtitle =>
      'Không gian riêng cho một nhóm, có bot, cuộc trò chuyện và thành viên riêng.';

  @override
  String get joinWorkspaceHelp => 'Dán liên kết mời ai đó đã gửi cho bạn.';

  @override
  String get inviteLinkField => 'Liên kết mời';

  @override
  String get workspaceIcon => 'Biểu tượng';

  @override
  String get workspaceColor => 'Màu sắc';

  @override
  String get workspaceSettings => 'Cài đặt không gian làm việc';

  @override
  String get workspaceSettingsHelp =>
      'Tên, biểu tượng, màu sắc và liên kết mời';

  @override
  String get inviteLinks => 'Liên kết mời';

  @override
  String get inviteLinksHelp =>
      'Bất kỳ ai có liên kết đều có thể tham gia sau khi đăng nhập, cho đến khi hết hạn, hết lượt hoặc bạn thu hồi.';

  @override
  String get createInviteLink => 'Tạo liên kết';

  @override
  String get linkExpires => 'Hết hạn';

  @override
  String get linkNever => 'Không bao giờ';

  @override
  String linkDays(int days) {
    final intl.NumberFormat daysNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String daysString = daysNumberFormat.format(days);

    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Sau $daysString ngày',
      one: 'Sau 1 ngày',
    );
    return '$_temp0';
  }

  @override
  String get linkMaxUses => 'Lượt dùng';

  @override
  String get linkUnlimited => 'Không giới hạn';

  @override
  String linkUses(String uses) {
    return 'Đã dùng $uses';
  }

  @override
  String get linkRevoked => 'Đã thu hồi';

  @override
  String get revokeLink => 'Thu hồi';

  @override
  String get linkCopied => 'Đã sao chép liên kết mời.';

  @override
  String get inviteRole => 'Vai trò';

  @override
  String get shareLinkLabel => 'Chia sẻ';

  @override
  String get botFolder => 'Thư mục';

  @override
  String get noFolder => 'Không có thư mục';

  @override
  String get newFolder => 'Thư mục mới…';

  @override
  String get folderName => 'Tên thư mục';

  @override
  String get archiveBot => 'Lưu trữ bot';

  @override
  String archiveBotTitle(String name) {
    return 'Lưu trữ $name?';
  }

  @override
  String get archiveBotBody =>
      'Bot sẽ rời khỏi thanh bên và ngừng chạy. Các cuộc trò chuyện và lịch sử vẫn giữ lại; bạn có thể khôi phục từ mục Bot đã lưu trữ.';

  @override
  String get archive => 'Lưu trữ';

  @override
  String get archivedBots => 'Bot đã lưu trữ';

  @override
  String get unarchive => 'Khôi phục';

  @override
  String botArchived(String name) {
    return 'Đã lưu trữ $name.';
  }

  @override
  String get deleteBot => 'Xóa bot';

  @override
  String deleteBotTitle(String name) {
    return 'Xóa $name?';
  }

  @override
  String deleteBotBody(String name) {
    return 'Mọi cuộc trò chuyện với $name sẽ bị xóa vĩnh viễn cùng tin nhắn, ảnh và tệp, và $name ngừng chạy, rời khỏi thanh bên. Trò chuyện nhóm và bản ghi sử dụng vẫn giữ lại. Cài đặt và trí nhớ của bot chuyển sang mục Bot đã lưu trữ.';
  }

  @override
  String botDeleted(String name) {
    return 'Đã xóa $name.';
  }

  @override
  String get settingsHistory => 'Lịch sử cài đặt';

  @override
  String get settingsHistoryHelp =>
      'Mọi thay đổi cài đặt của bot này và người đã sửa';

  @override
  String get noHistory => 'Chưa có thay đổi nào.';

  @override
  String get restoreSettings => 'Khôi phục các cài đặt này';

  @override
  String restoreSettingsBody(String fields) {
    return 'Đưa $fields về trạng thái trước thay đổi này? Cài đặt hiện tại vẫn giữ trong lịch sử.';
  }

  @override
  String changedByBot(String name) {
    return 'Thay đổi bởi $name';
  }

  @override
  String get changedByPerson => 'Thay đổi bởi người dùng';

  @override
  String get changedBySystem => 'Thay đổi bởi Casama';

  @override
  String get fieldName => 'tên';

  @override
  String get fieldInstructions => 'hướng dẫn';

  @override
  String get fieldModel => 'mô hình';

  @override
  String get fieldAutonomy => 'mức tự chủ';

  @override
  String get fieldBudget => 'ngân sách';

  @override
  String get fieldComputer => 'máy tính';

  @override
  String get fieldArchived => 'đã lưu trữ';

  @override
  String secretRequestTitle(String bot, String service) {
    return '$bot cần khóa $service';
  }

  @override
  String secretRequestHosts(String hosts) {
    return 'Chỉ dùng cho $hosts';
  }

  @override
  String get secretRequestHelp =>
      'Lưu thẳng vào két bảo mật. Bot không bao giờ nhìn thấy.';

  @override
  String secretSaved(String name) {
    return 'Đã lưu $name';
  }

  @override
  String get secretDeclined => 'Đã từ chối';

  @override
  String secretWhat(String service) {
    return 'Khóa $service';
  }

  @override
  String totpWhat(String service) {
    return 'Mã đăng nhập $service';
  }

  @override
  String takeoverHandedBackLine(String what) {
    return 'Đã trả lại: $what';
  }

  @override
  String takeoverLoginSharedLine(String host) {
    return 'Đã chia sẻ đăng nhập cho $host';
  }

  @override
  String get shareLogin => 'Chia sẻ đăng nhập';

  @override
  String get shareLoginUsername => 'Email hoặc tên đăng nhập';

  @override
  String get shareLoginPassword => 'Mật khẩu';

  @override
  String get shareLoginRemember => 'Ghi nhớ cho lần sau';

  @override
  String shareLoginHelp(String host, String bot) {
    return 'Chỉ dùng trên $host. $bot không bao giờ thấy mật khẩu của bạn.';
  }

  @override
  String get shareLoginSave => 'Lưu và đăng nhập';

  @override
  String loginRequestTitle(String bot, String host) {
    return '$bot cần bạn đăng nhập vào $host';
  }

  @override
  String get signInOnPage => 'Đăng nhập trên trang';

  @override
  String loginOnPageLine(String host) {
    return 'Đang đăng nhập $host trên trang';
  }

  @override
  String get loginOnPageHelp => 'Đăng nhập trên trang rồi chạm Trả lại.';

  @override
  String get back => 'Quay lại';

  @override
  String deviceAccessNotShared(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Chưa chia sẻ: lịch của bạn',
      'reminders': 'Chưa chia sẻ: lời nhắc của bạn',
      'contacts': 'Chưa chia sẻ: danh bạ của bạn',
      'places': 'Chưa chia sẻ: địa điểm của bạn',
      'photos': 'Chưa chia sẻ: ảnh của bạn',
      'health': 'Chưa chia sẻ: dữ liệu sức khỏe của bạn',
      'notifications': 'Chưa chia sẻ: thông báo của bạn',
      'activity': 'Chưa chia sẻ: hoạt động máy tính của bạn',
      'browserTab': 'Chưa chia sẻ: thẻ trình duyệt hiện tại',
      'browserHistory': 'Chưa chia sẻ: lịch sử và dấu trang trình duyệt',
      'alarm': 'Chưa chia sẻ: báo thức của bạn',
      'home': 'Chưa chia sẻ: phụ kiện Nhà của bạn',
      'other': 'Chưa chia sẻ: dữ liệu thiết bị của bạn',
    });
    return '$_temp0';
  }

  @override
  String get decline => 'Từ chối';

  @override
  String get signInCode => 'Mã đăng nhập';

  @override
  String get secretKindValue => 'Khóa hoặc mật khẩu';

  @override
  String get totpSeedLabel =>
      'Khóa thiết lập, liên kết otpauth:// hoặc mã hiện tại';

  @override
  String get totpSeedHelp =>
      'Khóa thiết lập từ phần cài đặt hai bước của trang web giúp bot tự tạo các mã sau (bot không bao giờ thấy khóa). Hoặc nhập mã bạn đang thấy: mã sẽ gửi thẳng cho bot.';

  @override
  String get scanQrCode => 'Quét mã QR';

  @override
  String totpRequestTitle(String bot, String service) {
    return '$bot cần mã đăng nhập $service';
  }

  @override
  String get search => 'Tìm kiếm';

  @override
  String get searchHint =>
      'Tìm cuộc trò chuyện, ký ức, kỹ năng, phiếu việc và tệp';

  @override
  String get searchEmptyPrompt => 'Nhập ít nhất 2 ký tự.';

  @override
  String searchNoResults(String query) {
    return 'Không tìm thấy kết quả cho “$query”.';
  }

  @override
  String get searchMessages => 'Tin nhắn';

  @override
  String get searchChats => 'Cuộc trò chuyện';

  @override
  String get searchTickets => 'Phiếu việc';

  @override
  String get searchFiles => 'Tệp';

  @override
  String get searchFilesAsleep =>
      'Không tìm trong tệp của máy tính đang ngủ. Khởi động máy tính để tìm các tệp đó.';

  @override
  String get searchSearching => 'Đang tìm…';

  @override
  String get searchJumpHint => 'Tìm hoặc chuyển tới…';

  @override
  String get searchRecent => 'Gần đây';

  @override
  String get searchClearRecent => 'Xóa';

  @override
  String get searchRemoveRecent => 'Xóa khỏi tìm kiếm gần đây';

  @override
  String get searchJumpBackIn => 'Quay lại ngay';

  @override
  String get searchNeedsYou => 'Cần bạn';

  @override
  String searchWaiting(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Có $n việc đang chờ bạn',
      one: 'Có 1 việc đang chờ bạn',
    );
    return '$_temp0';
  }

  @override
  String get searchGoTo => 'Đi tới';

  @override
  String get searchTopHits => 'Kết quả hàng đầu';

  @override
  String get searchScopeAll => 'Tất cả';

  @override
  String get searchMemories => 'Ký ức';

  @override
  String get searchKeepTyping => 'Gõ tiếp để tìm tin nhắn, ký ức và tệp.';

  @override
  String searchAskBot(String bot, String query) {
    return 'Hỏi $bot về “$query”';
  }

  @override
  String get searchAskBotHelp => 'Mở cuộc trò chuyện mới với câu hỏi này';

  @override
  String get searchKeysHint => '↑ ↓ để di chuyển   ↵ để mở   esc để đóng';

  @override
  String get searchClear => 'Xóa tìm kiếm';

  @override
  String get installFor => 'Cài đặt cho';

  @override
  String get wholeWorkspace => 'Toàn không gian làm việc';

  @override
  String get skillCatalog => 'Danh mục kỹ năng';

  @override
  String get searchSkills => 'Tìm kỹ năng';

  @override
  String get all => 'Tất cả';

  @override
  String skillFiles(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString tệp',
      one: '1 tệp',
    );
    return '$_temp0';
  }

  @override
  String get install => 'Cài đặt';

  @override
  String skillInstalled(String name) {
    return 'Đã cài đặt $name.';
  }

  @override
  String get noResults => 'Không có kết quả.';

  @override
  String get importFromGitHub => 'Nhập từ GitHub';

  @override
  String get importFromGitHubHelp =>
      'Dán liên kết tới thư mục có tệp SKILL.md. Bạn sẽ xem từng tệp trước khi cài đặt. Kho riêng tư dùng bí mật GITHUB_TOKEN được phép cho api.github.com.';

  @override
  String get preview => 'Xem trước';

  @override
  String get skillScriptsNote =>
      'Tập lệnh trong kỹ năng chỉ chạy trên máy tính của bot, không bao giờ chạy trên máy chủ.';

  @override
  String get binaryFile => '(tệp nhị phân)';

  @override
  String skillUpdate(String name) {
    return 'Cập nhật $name';
  }

  @override
  String get checkingForUpdates => 'Đang kiểm tra bản cập nhật…';

  @override
  String get skillUpToDate => 'Đã ở bản mới nhất.';

  @override
  String get update => 'Cập nhật';

  @override
  String get filesAdded => 'Đã thêm';

  @override
  String get filesChanged => 'Đã đổi';

  @override
  String get filesRemoved => 'Đã gỡ';

  @override
  String get fromCatalog => 'Từ danh mục';

  @override
  String get savedByBot => 'Được bot lưu';

  @override
  String get checkForUpdates => 'Kiểm tra cập nhật';

  @override
  String get attachSkill => 'Gắn kỹ năng';

  @override
  String get rerunSetup => 'Chạy lại thiết lập';

  @override
  String get rerunSetupHelp =>
      'Trả lời lại câu hỏi thiết lập và xem đề xuất mới';

  @override
  String get trace => 'Nhật ký';

  @override
  String get openTrace => 'Mở nhật ký';

  @override
  String get editMessage => 'Sửa';

  @override
  String get editMessageHelp =>
      'Gửi sẽ chạy lại cuộc trò chuyện từ đây. Phiên bản gốc vẫn giữ; chuyển bằng các mũi tên.';

  @override
  String get previousVersion => 'Phiên bản trước';

  @override
  String get nextVersion => 'Phiên bản sau';

  @override
  String get quietHours => 'Giờ yên lặng';

  @override
  String get quietHoursHelp =>
      'Thông báo sẽ đợi đến khi hết giờ yên lặng; hộp thư đến vẫn cập nhật. Phê duyệt cho cuộc trò chuyện bạn đang mở vẫn gửi tới ngay.';

  @override
  String quietHoursRange(String start, String end) {
    return '$start đến $end';
  }

  @override
  String get off => 'Tắt';

  @override
  String get botNotifications => 'Thông báo từ bot này';

  @override
  String get botNotificationsHelp =>
      'Bot này có tuân theo giờ yên lặng của bạn hay không';

  @override
  String get botMayCall => 'Có thể gọi cho tôi';

  @override
  String get botMayCallHelp =>
      'Bot này có thể gọi điện cho bạn khi có việc đáng gọi. Tắt: chỉ gửi thông báo.';

  @override
  String get quietDefault => 'Theo giờ yên lặng của tôi';

  @override
  String get quietAlways => 'Luôn thông báo cho tôi';

  @override
  String get quietCustom => 'Giờ yên lặng riêng';

  @override
  String get from => 'Từ';

  @override
  String get until => 'Đến';

  @override
  String get shareAsTemplate => 'Chia sẻ làm mẫu';

  @override
  String get shareAsTemplateRow =>
      'Tệp hoặc liên kết chứa hướng dẫn, kỹ năng và quy trình';

  @override
  String get shareAsTemplateHelp =>
      'Gồm hướng dẫn, kỹ năng, quy trình và dịch vụ đang dùng. Không bao giờ gồm khóa hay bí mật.';

  @override
  String get copyLink => 'Sao chép liên kết';

  @override
  String get includeMemories => 'Bao gồm trí nhớ';

  @override
  String get includeMemoriesHelp =>
      'Những gì bot đã học về bạn. Hãy cân nhắc kỹ trước khi chia sẻ.';

  @override
  String get saveAsFile => 'Lưu thành tệp';

  @override
  String get notABotTemplate => 'Tệp này không phải mẫu bot Casama.';

  @override
  String get importBot => 'Nhập bot';

  @override
  String botImported(String name) {
    return '$name đã sẵn sàng.';
  }

  @override
  String botImportedConnect(String name, String services) {
    return '$name đã sẵn sàng. Hãy kết nối $services trong mục Tích hợp để bot sử dụng.';
  }

  @override
  String get whatComesWithIt => 'Thành phần đi kèm';

  @override
  String get connectAfterImport => 'Kết nối sau khi nhập';

  @override
  String get importRoutines => 'Lên lịch các quy trình';

  @override
  String importMemories(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Giữ $countString mục ghi nhớ',
      one: 'Giữ 1 mục ghi nhớ',
    );
    return '$_temp0';
  }

  @override
  String get startingRoutine => 'Đang bắt đầu quy trình…';

  @override
  String get offlineSaved => 'Ngoại tuyến. Đang hiển thị tin nhắn đã lưu.';

  @override
  String get loadEarlierMessages => 'Tin nhắn trước đó';

  @override
  String get chatLoadFailedTitle => 'Không tải được cuộc trò chuyện này';

  @override
  String get chatLoadFailedBody => 'Kiểm tra kết nối rồi thử lại.';

  @override
  String get projects => 'Dự án';

  @override
  String get newProject => 'Dự án mới';

  @override
  String get noProjects => 'Chưa có dự án nào';

  @override
  String get projectsHelp =>
      'Dự án gom chung một đầu việc vào một nơi: cuộc trò chuyện, kế hoạch, việc cần làm, tệp và mọi thứ được tạo ra. Làm cùng bot hoặc để bot tự lập kế hoạch và tự làm.';

  @override
  String get newProjectHelp =>
      'Gom chung một đầu việc vào một nơi: cuộc trò chuyện, kế hoạch, việc cần làm, tệp và mọi thứ được tạo ra.';

  @override
  String get startPlanning => 'Bắt đầu lập kế hoạch';

  @override
  String get projectTitle => 'Tiêu đề';

  @override
  String get projectGoal => 'Mục tiêu';

  @override
  String get projectDoneWhen => 'Hoàn thành khi';

  @override
  String get projectLead => 'Bot trưởng';

  @override
  String get projectBudget => 'Ngân sách';

  @override
  String get projectGoalHint =>
      'Kết quả cuối cùng sẽ là gì? Một trang đích chạy trên tên miền của tôi…';

  @override
  String get projectDoneHint => 'Tùy chọn. Dấu hiệu để bạn biết đã xong';

  @override
  String get projectBudgetHint => 'Tùy chọn. Công việc tạm dừng khi dùng hết';

  @override
  String get projectThread => 'Cuộc trò chuyện dự án';

  @override
  String get approvePlan => 'Phê duyệt kế hoạch';

  @override
  String get pause => 'Tạm dừng';

  @override
  String get resume => 'Tiếp tục';

  @override
  String get milestones => 'Cột mốc';

  @override
  String get needsSignoff => 'cần bạn xác nhận';

  @override
  String get signOff => 'Phê duyệt hoàn thành';

  @override
  String get projectPlan => 'Kế hoạch';

  @override
  String get tickets => 'Phiếu việc';

  @override
  String get projectTimeline => 'Dòng thời gian';

  @override
  String get projectPlanning => 'Đang lập kế hoạch';

  @override
  String get projectActive => 'Đang hoạt động';

  @override
  String get projectPaused => 'Đã tạm dừng';

  @override
  String get projectBlocked => 'Bị chặn';

  @override
  String get projectDone => 'Xong';

  @override
  String get projectCancelled => 'Đã hủy';

  @override
  String get projectName => 'Tên';

  @override
  String get projectNameHint => 'Space Dodger, Bản tin mùa xuân…';

  @override
  String get createProject => 'Tạo dự án';

  @override
  String projectWorksAlone(String bot) {
    return 'Để $bot tự làm việc này';
  }

  @override
  String get projectWorksAloneHelp =>
      'Bot sẽ soạn kế hoạch để bạn phê duyệt, rồi làm theo từng phiên cho tới khi đạt mục tiêu. Sẽ không bắt đầu trước khi bạn phê duyệt.';

  @override
  String get projectWorksAloneOn =>
      'Làm theo từng phiên cho tới khi đạt mục tiêu.';

  @override
  String get projectWorksAloneOff =>
      'Bạn và bot cùng làm trong cuộc trò chuyện.';

  @override
  String get projectMade => 'Được tạo trong dự án này';

  @override
  String projectMadeEmpty(String bot) {
    return 'Chưa có gì. Những gì $bot tạo trong cuộc trò chuyện của dự án này sẽ hiện ở đây.';
  }

  @override
  String get projectSeeAll => 'Xem tất cả';

  @override
  String get projectTodos => 'Việc cần làm';

  @override
  String get projectFiles => 'Tệp';

  @override
  String projectFilesHelp(String folder, String bot) {
    return '$folder trên máy tính của $bot';
  }

  @override
  String get projectMarkDone => 'Đánh dấu đã xong';

  @override
  String get projectReopen => 'Mở lại';

  @override
  String get projectCover => 'Ảnh bìa';

  @override
  String get projectCoverNone => 'Không có';

  @override
  String projectCoverName(String name) {
    String _temp0 = intl.Intl.selectLogic(name, {
      'sailboat': 'Thuyền buồm',
      'mountain': 'Ngọn núi',
      'seedling': 'Cây non',
      'compass': 'La bàn',
      'lantern': 'Đèn lồng',
      'telescope': 'Kính thiên văn',
      'map': 'Bản đồ',
      'chess': 'Cờ vua',
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
      other: '$countString mục',
      one: '1 mục',
      zero: 'Chưa có gì',
    );
    return '$_temp0';
  }

  @override
  String get creationProjectLabel => 'Dự án';

  @override
  String get creationMoveToProject => 'Chuyển vào dự án';

  @override
  String get creationNoProject => 'Không thuộc dự án nào';

  @override
  String get makeProject => 'Chuyển thành dự án';

  @override
  String get makeProjectTitle => 'Chuyển chủ đề này thành dự án';

  @override
  String makeProjectHelp(String bot) {
    return 'Những gì $bot đã tạo trong chủ đề này sẽ được lưu vào dự án, và các nội dung tạo tiếp ở đây cũng vậy.';
  }

  @override
  String get openProject => 'Mở dự án';

  @override
  String get theBot => 'bot';

  @override
  String get forYou => 'Dành cho bạn';

  @override
  String get inboxNeedsYou => 'Cần bạn';

  @override
  String inboxNeedsYouCount(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Cần bạn ($nString)';
  }

  @override
  String get inboxBriefs => 'Tóm tắt';

  @override
  String get inboxUpdates => 'Cập nhật';

  @override
  String get inboxEmptyHelp =>
      'Yêu cầu, tóm tắt sáng, thông báo và trang mới từ các bot của bạn sẽ hiện ở đây.';

  @override
  String get inboxNeedsYouEmpty => 'Hiện chưa có gì cần bạn';

  @override
  String get inboxNeedsYouEmptyHelp =>
      'Khi bot cần bạn quyết định, hỗ trợ hoặc có ý tưởng mới, mục đó sẽ hiện ở đây.';

  @override
  String get noBriefs => 'Chưa có tóm tắt sáng nào';

  @override
  String botPublishedPage(String bot, String title) {
    return '$bot đã xuất bản $title';
  }

  @override
  String get forYouEmpty => 'Hiện chưa có gì dành cho bạn';

  @override
  String get forYouEmptyHelp =>
      'Bật tin chủ động trong cài đặt của bot để nhận tóm tắt sáng và gợi ý trong ngày.';

  @override
  String morningBriefFrom(String name) {
    return 'Tóm tắt sáng từ $name';
  }

  @override
  String get suggestions => 'Gợi ý';

  @override
  String suggestedBy(String name) {
    return 'Gợi ý bởi $name';
  }

  @override
  String get dismissSuggestion => 'Bỏ qua gợi ý này?';

  @override
  String dismissSuggestionHelp(String bot) {
    return 'Chọn xem $bot có thể nhắc lại điều này không.';
  }

  @override
  String get justThisOnce => 'Chỉ lần này';

  @override
  String justThisOnceHelp(String bot) {
    return 'Ẩn tạm thời. Nếu sau này vẫn cần, $bot có thể gợi ý lại.';
  }

  @override
  String get dontSuggestAgain => 'Không gợi ý lại';

  @override
  String dontSuggestAgainHelp(String bot) {
    return 'Ẩn vĩnh viễn. $bot sẽ nhớ bạn không muốn nhận gợi ý này.';
  }

  @override
  String wontSuggestAgain(String bot) {
    return 'Đã hiểu. $bot sẽ không gợi ý việc đó nữa.';
  }

  @override
  String get doIt => 'Làm ngay';

  @override
  String get checkins => 'Tin chủ động';

  @override
  String get checkinsHelp =>
      'Tóm tắt sáng và rà soát vài giờ một lần những việc cần bạn. Mặc định tắt.';

  @override
  String get briefTime => 'Tóm tắt sáng lúc';

  @override
  String get scanEvery => 'Kiểm tra mỗi';

  @override
  String hours(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString giờ',
      one: '1 giờ',
    );
    return '$_temp0';
  }

  @override
  String get dailyCap => 'Giới hạn mỗi ngày';

  @override
  String get on => 'Đang bật';

  @override
  String get actionRules => 'Quy tắc hành động';

  @override
  String get actionRulesRow => 'Những việc bot được làm mà không cần hỏi';

  @override
  String get actionRulesHelp =>
      'Quy tắc quyết định theo từng hành động: cho phép, cho phép trong giới hạn, hỏi trước hoặc chuyển lại để bạn hoàn tất. Quy tắc cụ thể nhất sẽ được áp dụng; nếu không có quy tắc, mức tự chủ của bot sẽ quyết định. Bot không thể tự sửa quy tắc của mình.';

  @override
  String get addRule => 'Thêm quy tắc';

  @override
  String get addRuleHelp => 'Chọn việc bot đang làm và cách xử lý.';

  @override
  String get noRules =>
      'Chưa có quy tắc nào. Mức tự chủ của bot sẽ quyết định.';

  @override
  String get otherTools => 'Công cụ cụ thể';

  @override
  String get workspaceRule => 'Quy tắc không gian làm việc';

  @override
  String get catSend => 'Gửi tin nhắn';

  @override
  String get catPay => 'Thanh toán';

  @override
  String get catDelete => 'Xóa';

  @override
  String get catPublish => 'Xuất bản';

  @override
  String get catShare => 'Chia sẻ và mời';

  @override
  String get catSignIn => 'Đăng nhập';

  @override
  String get whenTheBot => 'Khi bot đang';

  @override
  String get itShould => 'Bot sẽ';

  @override
  String get ruleAllow => 'Cứ thực hiện';

  @override
  String get ruleAllowLimits => 'Thực hiện trong giới hạn';

  @override
  String get ruleAsk => 'Hỏi tôi trước';

  @override
  String get ruleHandOff => 'Chuyển lại để tôi hoàn tất';

  @override
  String get ruleDomains =>
      'Chỉ tới các tên miền này (cách nhau bằng dấu phẩy)';

  @override
  String get ruleMaxAmount => 'Tối đa số tiền này';

  @override
  String get ruleForWorkspace => 'Cho mọi bot trong không gian làm việc';

  @override
  String get watchers => 'Trình theo dõi';

  @override
  String get watchersRow => 'Những gì bot đang theo dõi';

  @override
  String get noWatchers => 'Chưa theo dõi gì';

  @override
  String get watchersHelp =>
      'Bảo bot “báo tôi khi…” để bot theo dõi một trang, câu trả lời, kết quả hay thời điểm. Kiểm tra không tốn phí cho đến khi có thay đổi.';

  @override
  String get watcherActive => 'Đang theo dõi';

  @override
  String get watcherPaused => 'Đã tạm dừng';

  @override
  String get watcherDone => 'Xong';

  @override
  String get watcherExpired => 'Đã hết hạn';

  @override
  String firedTimes(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'đã kích hoạt $countString lần',
      one: 'đã kích hoạt 1 lần',
      zero: 'chưa kích hoạt',
    );
    return '$_temp0';
  }

  @override
  String get connectAiApp => 'Kết nối ứng dụng AI';

  @override
  String connectAiAppAsk(String app) {
    return '$app muốn dùng Casama';
  }

  @override
  String get connectAiAppHelpShort =>
      'Ứng dụng có thể xem danh sách bot, giao việc và đọc kết quả trong không gian làm việc bạn chọn dưới danh nghĩa bạn. Phê duyệt và quy tắc của bot vẫn được áp dụng.';

  @override
  String get connectAiAppSendsTo => 'Sau khi cho phép, bạn sẽ quay lại';

  @override
  String get connectAiAppUnknown =>
      'Casama không nhận ra địa chỉ này. Bất kỳ ai cũng có thể đặt tên bất kỳ cho ứng dụng, nên chỉ cho phép nếu chính bạn đã bắt đầu kết nối này và tin tưởng trang web này.';

  @override
  String get connectAiAppDone => 'Xong. Bạn có thể quay lại ứng dụng AI.';

  @override
  String get refuse => 'Từ chối';

  @override
  String get allow => 'Cho phép';

  @override
  String get connectAiApps => 'Kết nối ứng dụng AI';

  @override
  String get connectAiAppsHelp =>
      'Các ứng dụng hỗ trợ MCP kết nối tới địa chỉ này và đăng nhập, hoặc dùng khóa API. Chúng hoạt động dưới quyền người đã kết nối.';

  @override
  String get connectedAiApps => 'Ứng dụng AI đã kết nối';

  @override
  String get connectedAiAppsHelp =>
      'Các ứng dụng bạn kết nối bằng cách đăng nhập. Ngắt kết nối sẽ thu hồi quyền truy cập không gian làm việc này ngay lập tức.';

  @override
  String get connectedAiAppsAdminHelp =>
      'Các ứng dụng mà thành viên trong không gian làm việc này đã kết nối. Ngắt kết nối sẽ thu hồi quyền truy cập ngay lập tức.';

  @override
  String get noConnectedAiApps => 'Chưa kết nối ứng dụng AI nào.';

  @override
  String mcpConnectionUsed(String when) {
    return 'Đã dùng $when';
  }

  @override
  String mcpConnectionConnected(String when) {
    return 'Đã kết nối $when';
  }

  @override
  String mcpConnectionBy(String person, String when) {
    return '$person · $when';
  }

  @override
  String get disconnectAiAppBody =>
      'Ứng dụng sẽ ngừng hoạt động trong không gian làm việc này ngay lập tức. Để dùng lại, hãy kết nối lại từ ứng dụng đó.';

  @override
  String get mcpApprovals => 'Cho phép phê duyệt từ ứng dụng AI';

  @override
  String get mcpApprovalsHelp =>
      'Ứng dụng đã kết nối có thể phê duyệt hành động của bot.';

  @override
  String get newApiKey => 'Khóa API mới';

  @override
  String get apiKeyName => 'Tên';

  @override
  String get newGroupChat => 'Chat nhóm mới';

  @override
  String get groupChats => 'Chat nhóm';

  @override
  String groupWhoAnswers(String names) {
    return '$names sẽ trả lời';
  }

  @override
  String get groupEveryoneAnswers => 'Mọi bot sẽ trả lời';

  @override
  String get groupMentionHint => '@nhắc một bot, hoặc @everyone';

  @override
  String routineRan(String name) {
    return 'Quy trình “$name” đã chạy';
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
      other: '$countString việc đang chờ bạn',
      one: '1 việc đang chờ bạn',
    );
    return '$_temp0';
  }

  @override
  String get newGroupChatHelp =>
      'Đưa 2 đến 10 bot vào chung một cuộc trò chuyện. @Tên hỏi riêng một bot; @everyone nhờ bot trưởng lập kế hoạch và chia việc.';

  @override
  String get groupCreate => 'Tạo chat nhóm';

  @override
  String get groupCrewEmpty => 'Chọn bot bên dưới để lập nhóm.';

  @override
  String get groupLeadShort => 'Trưởng nhóm';

  @override
  String get groupMakeLead => 'Đặt làm trưởng nhóm';

  @override
  String groupRemoveBot(String name) {
    return 'Gỡ $name';
  }

  @override
  String groupPickMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chọn thêm $count bot',
      one: 'Chọn thêm 1 bot',
    );
    return '$_temp0';
  }

  @override
  String get groupFull => 'Đã đủ 10 bot, mức tối đa của một nhóm.';

  @override
  String get groupLeadHint =>
      'Bot trưởng lập kế hoạch khi bạn dùng @everyone. Chạm vào bot khác ở trên cùng để đổi trưởng nhóm.';

  @override
  String groupLeadIs(String name) {
    return '$name là trưởng nhóm: bot lập kế hoạch khi bạn dùng @everyone. Chạm vào bot khác ở trên cùng để đổi trưởng nhóm.';
  }

  @override
  String groupPickOneMoreLead(String name) {
    return 'Chọn thêm 1 bot. $name là trưởng nhóm; chạm vào bot khác ở trên cùng để đổi trưởng nhóm.';
  }

  @override
  String get groupNeedTwoBots =>
      'Chat nhóm cần ít nhất hai bot. Hãy tạo thêm bot trước.';

  @override
  String get groupSearchBots => 'Tìm bot';

  @override
  String get groupNoMatch => 'Không có bot nào khớp tên đó.';

  @override
  String get groupTitle => 'Tên (tùy chọn)';

  @override
  String get groupPickBots => 'Bot';

  @override
  String get groupLead => 'Trưởng nhóm';

  @override
  String get mentionEveryone => 'everyone';

  @override
  String get pages => 'Trang';

  @override
  String get pagesRow => 'Báo cáo và bảng điều khiển đã xuất bản';

  @override
  String get noPages => 'Chưa có trang nào';

  @override
  String get pagesHelp =>
      'Nhờ bot tạo báo cáo, bảng điều khiển hay trình theo dõi để xuất bản thành trang. Trang mở trong trình duyệt và luôn ở chế độ riêng tư cho đến khi bạn chia sẻ.';

  @override
  String get pagePrivate => 'Chỉ mình tôi';

  @override
  String get pageWorkspace => 'Không gian làm việc';

  @override
  String get pagePublic => 'Bất kỳ ai có liên kết';

  @override
  String get pageRefreshes => 'Tự làm mới theo lịch';

  @override
  String get pageCardOpen => 'Trang · Chạm để mở';

  @override
  String get exportPdf => 'Xuất PDF';

  @override
  String get pageMakePublicTitle => 'Công khai trang này?';

  @override
  String get pageMakePublicBody =>
      'Bất kỳ ai có liên kết đều mở được trang cùng dữ liệu trên đó. Bạn có thể thu hồi bất cứ lúc nào; liên kết sẽ ngừng hoạt động.';

  @override
  String get pageMakePublic => 'Công khai';

  @override
  String get pagePublicLinkTitle => 'Liên kết công khai';

  @override
  String get pagePublicLinkBody =>
      'Đã sao chép. Liên kết không hiển thị trên công cụ tìm kiếm.';

  @override
  String deletePageTitle(String title) {
    return 'Xóa “$title”?';
  }

  @override
  String get openPages => 'Mở trong Trang';

  @override
  String get discard => 'Hủy bỏ';

  @override
  String get discardChangesTitle => 'Bỏ các thay đổi?';

  @override
  String get discardChangesBody => 'Các chỉnh sửa của bạn chưa được lưu.';

  @override
  String get keepEditing => 'Tiếp tục sửa';

  @override
  String get teachTask => 'Dạy một tác vụ';

  @override
  String get teachWhichBot => 'Bot nào nên học tác vụ này?';

  @override
  String get teachRecording => 'Đang ghi';

  @override
  String get teachRecordingPaused => 'Đã dừng ghi';

  @override
  String get teachRecordingHelp =>
      'Thực hiện tác vụ như bình thường. Từng bước sẽ được lưu kèm nội dung trên màn hình; ô mật khẩu không bao giờ được lưu.';

  @override
  String get teachStop => 'Dừng';

  @override
  String get teachMarkSecret => 'Đánh dấu là bí mật';

  @override
  String get teachMarkSecretHelp =>
      'Nội dung bạn vừa gõ bị xóa khỏi bản ghi và trở thành mục nhập bí mật để bot hỏi lại sau.';

  @override
  String get teachDraftTitle => 'Kỹ năng mới';

  @override
  String get teachDrafting => 'Đang viết kỹ năng từ bản ghi của bạn…';

  @override
  String teachSteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bước',
      one: '1 bước',
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
      other: '$countString bước',
      one: '1 bước',
    );
    return 'Những gì bạn đã làm mẫu ($_temp0)';
  }

  @override
  String get teachReviewHelp =>
      'Kiểm tra các bước, đầu vào và điều kiện hoàn tất rồi lưu. Bạn có thể thử ngay lập tức.';

  @override
  String get teachDraftFailed =>
      'Bot không thể viết bản nháp. Hãy tự viết các bước từ bản ghi bên dưới hoặc hủy bỏ.';

  @override
  String get teachAlreadySaved => 'Kỹ năng này đã được lưu';

  @override
  String get teachSaveAndTry => 'Lưu và thử';

  @override
  String teachSaved(String name) {
    return 'Đã lưu $name';
  }

  @override
  String get teachDiscardTitle => 'Hủy bản ghi này?';

  @override
  String get teachDiscardBody =>
      'Mọi bước, ảnh chụp nhanh và ảnh màn hình đã ghi đều bị xóa.';

  @override
  String teachStepClick(int x, int y) {
    return 'Nhấp tại $x, $y';
  }

  @override
  String teachStepType(String text) {
    return 'Gõ “$text”';
  }

  @override
  String teachStepSecret(String name) {
    return 'Nhập bí mật $name';
  }

  @override
  String teachStepKey(String key) {
    return 'Nhấn $key';
  }

  @override
  String get teachStepScroll => 'Cuộn';

  @override
  String get plugins => 'Plugin';

  @override
  String get pluginsRow => 'Kỹ năng và công cụ từ gói plugin';

  @override
  String get noPlugins => 'Chưa có plugin nào';

  @override
  String get pluginsHelp =>
      'Plugin là các gói Agent Plugins 1.0 trên GitHub. Chúng mang lại kỹ năng và công cụ MCP; máy chủ của chúng chạy trên máy tính của bot này, không bao giờ chạy trên máy chủ Casama.';

  @override
  String get addPlugin => 'Thêm plugin';

  @override
  String get addPluginHelp =>
      'Dán liên kết GitHub tới thư mục của plugin. Bạn sẽ xem những gì plugin thêm vào trước khi cài đặt.';

  @override
  String get pluginAdds => 'Plugin sẽ thêm';

  @override
  String pluginStdio(String command) {
    return 'Chạy trên máy tính của bot: $command';
  }

  @override
  String pluginRemote(String url) {
    return 'Kết nối tới $url';
  }

  @override
  String pluginTalksTo(String hosts) {
    return 'Giao tiếp với: $hosts';
  }

  @override
  String get pluginSkill => 'Kỹ năng';

  @override
  String get pluginHosts => 'Mạng';

  @override
  String get pluginServerError => 'Không khởi động được';

  @override
  String get pluginRunsOnComputer => 'Chạy trên máy tính của bot';

  @override
  String get pluginWhereToolsRun => 'Nơi công cụ chạy';

  @override
  String get pluginWhereToolsRunHelp =>
      'Trên máy tính của bạn, công cụ dùng được dữ liệu tại đó và chỉ bạn dùng được trong các cuộc trò chuyện riêng. Máy chủ trên internet không bị ảnh hưởng.';

  @override
  String get pluginPlaceBot => 'Máy tính của bot';

  @override
  String pluginPlaceMine(String name) {
    return 'Máy tính của tôi: $name';
  }

  @override
  String pluginRunsOnDevice(String name) {
    return 'Chạy trên $name';
  }

  @override
  String get pluginRunsOnDeviceHelp =>
      'Công cụ chỉ chạy trong cuộc trò chuyện với chủ sở hữu máy tính đó';

  @override
  String get pluginRunsOnDeviceOffline =>
      'Ngoại tuyến: công cụ sẽ chạy lại khi ứng dụng Casama được mở trên máy đó';

  @override
  String get pluginUpToDate => 'Đã ở bản mới nhất';

  @override
  String get checkForUpdate => 'Kiểm tra cập nhật';

  @override
  String get uninstall => 'Gỡ cài đặt';

  @override
  String uninstallPluginTitle(String name) {
    return 'Gỡ cài đặt $name?';
  }

  @override
  String get uninstallPluginBody =>
      'Kỹ năng, công cụ, tệp và bí mật đã lưu của plugin sẽ bị gỡ khỏi bot này.';

  @override
  String updatePluginTitle(String name) {
    return 'Cập nhật $name';
  }

  @override
  String pluginDiffSkillsAdded(String names) {
    return 'Kỹ năng mới: $names';
  }

  @override
  String pluginDiffSkillsChanged(String names) {
    return 'Kỹ năng thay đổi: $names';
  }

  @override
  String pluginDiffSkillsRemoved(String names) {
    return 'Kỹ năng đã gỡ: $names';
  }

  @override
  String pluginDiffServersAdded(String names) {
    return 'Máy chủ công cụ mới: $names';
  }

  @override
  String pluginDiffServersChanged(String names) {
    return 'Máy chủ công cụ thay đổi: $names';
  }

  @override
  String pluginDiffServersRemoved(String names) {
    return 'Máy chủ công cụ đã gỡ: $names';
  }

  @override
  String pluginDiffHosts(String hosts) {
    return 'Giao tiếp với máy chủ mới: $hosts';
  }

  @override
  String get pluginDiffNone => 'Không thay đổi thành phần đi kèm.';

  @override
  String get next => 'Tiếp theo';

  @override
  String get botNameLabel => 'Tên';

  @override
  String get importAgent => 'Nhập Agent';

  @override
  String get importAgentHelp =>
      'Đưa bot từ OpenClaw hoặc Hermes Agent sang, hoặc dán thiết lập từ Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark hay Instinct: hình mẫu, kỹ năng, lịch trình và trí nhớ. Bạn sẽ xem lại mọi thứ trước khi tạo. Khóa và tệp cài đặt không bao giờ bị đọc.';

  @override
  String get importAgentPickFolder => 'Chọn thư mục';

  @override
  String get importAgentPickZip => 'Tải lên tệp ZIP thư mục';

  @override
  String get importPasteChoice => 'Dán thiết lập của bot';

  @override
  String get importPasteChoiceHelp =>
      'Từ Grok Bot, Muse, ChatGPT Dots, Claude Duet, Hark, Instinct hoặc ứng dụng khác';

  @override
  String get importPasteTitle => 'Dán thiết lập của bot';

  @override
  String get importPasteHelp =>
      'Gửi câu lệnh bên dưới cho bot rồi dán toàn bộ câu trả lời vào đây. Bạn sẽ xem lại mọi thứ trước khi bot mới được tạo.';

  @override
  String get importPasteSource => 'Bot của bạn đang ở đâu?';

  @override
  String get importPasteOther => 'Nơi khác';

  @override
  String get importPasteStep1 => '1. Gửi câu lệnh này cho bot';

  @override
  String get importPasteReply => '2. Dán câu trả lời của bot';

  @override
  String get importPasteSafety =>
      'Các dòng giống khóa, mật khẩu hoặc số thẻ sẽ bị loại bỏ. Hãy đăng nhập lại các ứng dụng sau khi nhập.';

  @override
  String get importPasteSubtitle => 'Thiết lập đã dán';

  @override
  String get agentImportReviewHelp =>
      'Bỏ chọn những mục bạn không muốn. Chưa có gì được tạo cho tới khi bạn bấm nhập.';

  @override
  String get agentImportNoPersona => 'Không tìm thấy tệp hình mẫu nào.';

  @override
  String agentImportSkills(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kỹ năng',
      one: '1 kỹ năng',
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
      other: '$countString quy trình',
      one: '1 quy trình',
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
      other: '$countString mục ghi nhớ',
      one: '1 mục ghi nhớ',
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
      other: '$countString tệp khác',
      one: '1 tệp khác',
    );
    return 'Sao chép $_temp0 vào ~/imported/ trên máy tính của bot';
  }

  @override
  String agentImportSkipped(String files) {
    return 'Chưa nhập: $files';
  }

  @override
  String agentImportedWithFiles(String name, int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Đã nhập $name và sao chép $countString tệp vào máy tính của bot';
  }

  @override
  String agentImportedFilesLater(String name) {
    return 'Đã nhập $name. Các tệp khác chưa sao chép được; hãy gắn một máy tính cho bot rồi nhập lại để sao chép.';
  }

  @override
  String get importMemoryTitle => 'Nhập ký ức từ ChatGPT hoặc Claude';

  @override
  String get importMemoryHelp =>
      'Sao chép câu lệnh này vào ChatGPT hoặc Claude, rồi dán câu trả lời vào bên dưới.';

  @override
  String get importMemoryPick => 'Giữ lại những gì đúng; bỏ chọn phần còn lại.';

  @override
  String get importMemoryPaste => 'Câu trả lời';

  @override
  String get importMemoryNone =>
      'Không tìm thấy mục ghi nhớ nào trong câu trả lời đó.';

  @override
  String memoriesImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString mục ghi nhớ',
      one: '1 mục ghi nhớ',
    );
    return 'Đã thêm $_temp0';
  }

  @override
  String get routinesAsFiles => 'Quy trình và kỹ năng dạng tệp';

  @override
  String get routinesAsFilesHelp =>
      'Mọi quy trình và kỹ năng dưới dạng tệp Markdown: xuất ra, chỉnh sửa ở bất cứ đâu, nhập lại hoặc lưu trong kho GitHub.';

  @override
  String get exportFiles => 'Xuất thành tệp';

  @override
  String get importFiles => 'Nhập tệp';

  @override
  String get importFilesApply => 'Áp dụng';

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

    return '$createdString mới, $updatedString thay đổi, $unchangedString không đổi';
  }

  @override
  String filesImported(int created, int updated) {
    final intl.NumberFormat createdNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String createdString = createdNumberFormat.format(created);
    final intl.NumberFormat updatedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String updatedString = updatedNumberFormat.format(updated);

    return 'Đã nhập: $createdString mới, $updatedString thay đổi';
  }

  @override
  String get gitSync => 'Đồng bộ Git';

  @override
  String get gitSyncOff => 'Tắt';

  @override
  String get gitSyncHelp =>
      'Thay đổi trong Casama được commit lên kho lưu trữ, và các lần push lên kho sẽ cập nhật lại Casama sau khi kiểm tra. Nếu một tệp đổi ở cả hai nơi, Casama giữ bản của mình và mở pull request. Cần bí mật GITHUB_TOKEN được phép cho api.github.com.';

  @override
  String get gitSyncNeedsToken => 'Cần bí mật GITHUB_TOKEN';

  @override
  String gitSyncedWhen(String when) {
    return 'Đã đồng bộ: $when';
  }

  @override
  String get gitSyncPr => 'Có Pull Request đang chờ bạn';

  @override
  String get syncNow => 'Đồng bộ ngay';

  @override
  String get syncQueued => 'Sẽ đồng bộ trong vòng một phút';

  @override
  String get gitBranch => 'Nhánh';

  @override
  String get gitFolder => 'Thư mục trong kho lưu trữ (tùy chọn)';

  @override
  String get gitSyncOn => 'Đã bật đồng bộ';

  @override
  String get gitSyncRemove => 'Ngừng đồng bộ';

  @override
  String get gitWebhookTitle => 'Thêm webhook này vào kho lưu trữ';

  @override
  String get gitWebhookHelp =>
      'Trong phần cài đặt của kho lưu trữ, thêm một webhook cho sự kiện push với địa chỉ và mã bí mật này (content type application/json). Mã bí mật chỉ hiển thị lần này.';

  @override
  String get gitWebhookUrl => 'Payload URL';

  @override
  String get gitWebhookSecret => 'Bí mật';

  @override
  String get knowledge => 'Kiến thức';

  @override
  String get knowledgeRow => 'Tài liệu để bot tìm kiếm và trích dẫn';

  @override
  String get noKnowledge => 'Chưa có kiến thức nào';

  @override
  String get knowledgeHelp =>
      'Cung cấp tệp, trang web hoặc kho GitHub cho bot. Bot sẽ tìm khi phù hợp và cho bạn biết câu trả lời lấy từ tài liệu nào.';

  @override
  String get addKnowledge => 'Thêm kiến thức';

  @override
  String get addKnowledgeHelp =>
      'Tệp PDF, Word, Markdown, HTML, CSV hoặc văn bản; một trang web (một tên miền, tuân theo robots.txt); hoặc tài liệu từ một kho lưu trữ. Trang web và kho lưu trữ tự làm mới hằng ngày.';

  @override
  String get knowledgeFiles => 'Tệp';

  @override
  String get knowledgeWebsite => 'Trang web';

  @override
  String get knowledgePickFiles => 'Chọn tệp';

  @override
  String get knowledgeWebsiteUrl => 'Địa chỉ trang web';

  @override
  String get knowledgeRepoUrl => 'Liên kết GitHub';

  @override
  String get knowledgeShareAll =>
      'Chia sẻ với mọi bot trong không gian làm việc';

  @override
  String get knowledgeShared => 'Toàn không gian làm việc';

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
      other: '$docsString tài liệu',
      one: '1 tài liệu',
    );
    return '$_temp0, $chunksString đoạn';
  }

  @override
  String get knowledgeError => 'Không đọc được';

  @override
  String get knowledgeSyncing => 'Đang đọc…';

  @override
  String get knowledgePending => 'Đang chờ đọc';

  @override
  String get add => 'Thêm';

  @override
  String skillIdeaFrom(String bot, String name) {
    return '$bot gợi ý một kỹ năng: $name';
  }

  @override
  String skillEditFrom(String bot, String name) {
    return '$bot gợi ý cải thiện $name';
  }

  @override
  String skillUsesTools(String tools) {
    return 'Sử dụng: $tools';
  }

  @override
  String get saveSkill => 'Lưu kỹ năng';

  @override
  String get applyEdit => 'Áp dụng thay đổi';

  @override
  String skillSaved(String name) {
    return 'Đã lưu $name';
  }

  @override
  String skillUpdated(String name) {
    return 'Đã cập nhật $name';
  }

  @override
  String get skillStats => 'Hiệu quả hoạt động';

  @override
  String get skillNotUsedYet => 'Chưa được dùng';

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

    return 'Đã dùng $usesString lần · $rateString% suôn sẻ · $failuresString thất bại · $correctionsString đã sửa';
  }

  @override
  String skillLastFailure(String date) {
    return 'Sự cố gần nhất: $date';
  }

  @override
  String get skillHistory => 'Các phiên bản trước';

  @override
  String get replays => 'Bản phát lại';

  @override
  String get replaysRow => 'Các bước đã ghi để bot chạy thẳng';

  @override
  String get noReplays => 'Chưa có bản phát lại nào';

  @override
  String get replaysHelp =>
      'Bản phát lại là chuỗi thao tác trình duyệt hoặc máy tính được ghi lại để bot chạy lại nguyên trạng, nhanh và rẻ hơn. Nếu một bước không còn chạy được, bot sẽ tiếp quản từ đó và cập nhật lại bản phát lại. Hãy lưu từ một bản ghi dạy tác vụ hoặc bảo bot lưu việc vừa làm.';

  @override
  String replaySteps(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bước',
      one: '1 bước',
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
      other: 'đã chạy $runsString lần',
      one: 'đã chạy 1 lần',
    );
    String _temp1 = intl.Intl.pluralLogic(
      failures,
      locale: localeName,
      other: '$failuresString lần cần giúp',
      one: '1 lần cần giúp',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String runReplay(String name) {
    return 'Chạy $name';
  }

  @override
  String get runReplayHelp => 'Kiểm tra các giá trị điền sẵn rồi chạy.';

  @override
  String get run => 'Chạy';

  @override
  String get saveAsReplay => 'Đồng thời lưu thành bản phát lại';

  @override
  String replaySaved(String name) {
    return 'Đã lưu bản phát lại $name';
  }

  @override
  String get passwordManagers => 'Trình quản lý mật khẩu';

  @override
  String get passwordManagersRow =>
      'Đăng nhập 1Password hoặc Bitwarden cho bot';

  @override
  String get noPasswordManagers => 'Chưa kết nối trình quản lý mật khẩu nào';

  @override
  String get passwordManagersHelp =>
      'Bot có thể đăng nhập bằng tài khoản từ các két bạn chọn. Bot không bao giờ nhìn thấy mật khẩu: mật khẩu chỉ được điền vào trình duyệt trên đúng trang web của tài khoản đó.';

  @override
  String get connectPasswordManager => 'Kết nối trình quản lý mật khẩu';

  @override
  String get pmWorkspace => 'Toàn không gian làm việc';

  @override
  String get pmJustMe => 'Chỉ mình tôi';

  @override
  String get pmNoVaults => 'Chưa chọn két nào';

  @override
  String pmVaults(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString két',
      one: '1 két',
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
      other: '$countString tài khoản',
      one: '1 tài khoản',
    );
    return '$_temp0';
  }

  @override
  String get pmOnePasswordHelp =>
      'Dùng máy chủ 1Password Connect với token tài khoản dịch vụ.';

  @override
  String get pmBitwardenHelp =>
      'Dùng Vault Management API của Bitwarden (bw serve) cho các bộ sưu tập của tổ chức.';

  @override
  String get pmConnectUrl => 'Địa chỉ máy chủ Connect';

  @override
  String get pmConnectToken => 'Connect token';

  @override
  String get pmBwUrl => 'Địa chỉ bw serve';

  @override
  String get pmBwToken => 'Access token (tùy chọn)';

  @override
  String get pmForWorkspace => 'Cho toàn không gian làm việc';

  @override
  String get pmChooseVaults => 'Các két bot được phép dùng';

  @override
  String get pmChooseVaultsHelp =>
      'Chỉ các thông tin đăng nhập trong két hoặc bộ sưu tập bạn chọn mới khả dụng cho bot.';

  @override
  String get welcomeGettingReady => 'Đang chuẩn bị không gian cho bạn…';

  @override
  String get setUpManually => 'Thiết lập thủ công';

  @override
  String get tryAgain => 'Thử lại';

  @override
  String get inviteLinkCopied =>
      'Đã sao chép liên kết mời. Hãy gửi cho những người làm việc cùng bạn.';

  @override
  String get inviteFriends => 'Mời bạn bè';

  @override
  String inviteFriendsRow(String amount) {
    return 'Nhận $amount hạn mức miễn phí cho mỗi người bạn tham gia';
  }

  @override
  String get inviteFriendsRowPlain => 'Chia sẻ Casama với bạn bè';

  @override
  String inviteFriendsHeadline(String amount) {
    return 'Tặng Casama, nhận $amount';
  }

  @override
  String get inviteFriendsHeadlinePlain => 'Chia sẻ Casama với bạn bè';

  @override
  String inviteFriendsHelp(String amount) {
    return 'Gửi liên kết cho một người bạn. Khi họ đăng ký và hoàn tất cuộc trò chuyện đầu tiên, bạn nhận $amount hạn mức miễn phí.';
  }

  @override
  String get inviteFriendsHelpPlain =>
      'Gửi liên kết cho một người bạn. Họ có thể đăng ký ngay lập tức.';

  @override
  String get inviteFriendsYourCode => 'Mã mời của bạn. Chạm để sao chép.';

  @override
  String get inviteFriendsShare => 'Chia sẻ liên kết';

  @override
  String get inviteFriendsCopyLink => 'Sao chép liên kết';

  @override
  String get inviteFriendsCopied => 'Đã sao chép. Hãy gửi cho một người bạn.';

  @override
  String inviteFriendsShareText(String link, String code) {
    return 'Tham gia Casama cùng mình nhé, nơi có các đồng đội AI làm việc giúp bạn: $link (mã mời $code)';
  }

  @override
  String get inviteFriendsProgress => 'Lời mời của bạn';

  @override
  String get inviteFriendsJoined => 'Bạn bè đã tham gia';

  @override
  String inviteFriendsPending(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString người chưa xong cuộc trò chuyện đầu tiên',
      one: '1 người chưa xong cuộc trò chuyện đầu tiên',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsEarned => 'Hạn mức miễn phí đã nhận';

  @override
  String inviteFriendsLeft(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bạn còn có thể nhận thưởng từ $countString người bạn nữa',
      one: 'Bạn còn có thể nhận thưởng từ 1 người bạn nữa',
    );
    return '$_temp0';
  }

  @override
  String get inviteFriendsCapReached =>
      'Bạn đã nhận mức thưởng mời bạn bè tối đa. Cảm ơn bạn!';

  @override
  String get inviteFriendsHow => 'Cách hoạt động';

  @override
  String get inviteFriendsStep1 => 'Chia sẻ liên kết hoặc mã với một người bạn';

  @override
  String get inviteFriendsStep2 =>
      'Họ đăng ký và nhập mã của bạn trong vòng một tuần';

  @override
  String inviteFriendsStep3(String amount) {
    return 'Khi họ xong cuộc trò chuyện đầu tiên, bạn nhận $amount hạn mức miễn phí';
  }

  @override
  String get inviteFriendsStep3Plain =>
      'Họ bắt đầu làm việc với các đồng đội AI của riêng mình';

  @override
  String get inviteFriendsUnavailable =>
      'Lời mời không khả dụng trên máy chủ này.';

  @override
  String get referralHaveCode => 'Có mã của bạn bè?';

  @override
  String get referralCodeHint => 'Mã mời';

  @override
  String get referralUse => 'Dùng';

  @override
  String get referralRedeemed => 'Đã thêm mã mời. Chào mừng đến với Casama!';

  @override
  String referralRedeemedFrom(String name) {
    return 'Bạn đã tham gia qua lời mời của $name. Chào mừng đến với Casama!';
  }

  @override
  String referralJoinedThrough(String name) {
    return 'Bạn đã tham gia qua lời mời của $name.';
  }

  @override
  String get referralJoinedThroughFriend =>
      'Bạn đã tham gia qua lời mời của một người bạn.';

  @override
  String referralInvitedBy(String name) {
    return '$name đã mời bạn';
  }

  @override
  String get referralInvitedByFriend => 'Một người bạn đã mời bạn';

  @override
  String get referralWelcomeTitle => 'Chào mừng đến với Casama';

  @override
  String get referralWelcomeHelp =>
      'Những đồng đội AI làm việc cho bạn trên máy tính riêng. Hãy chấp nhận lời mời để người bạn của bạn nhận được phần thưởng.';

  @override
  String get referralAccept => 'Chấp nhận lời mời';

  @override
  String get referralGetStarted => 'Bắt đầu';

  @override
  String get referralInvalid => 'Lời mời này không hợp lệ';

  @override
  String get referralInvalidHelp =>
      'Mã có thể bị gõ nhầm. Bạn vẫn có thể đăng ký và dùng Casama.';

  @override
  String inviteFriendsHeadlineBoth(String amount) {
    return 'Tặng $amount, nhận $amount';
  }

  @override
  String inviteFriendsHelpBoth(String amount) {
    return 'Gửi liên kết cho bạn bè. Khi họ đăng ký bằng mã của bạn và hoàn tất cuộc trò chuyện đầu tiên, cả hai cùng nhận $amount hạn mức miễn phí.';
  }

  @override
  String inviteFriendsHelpTwo(String reward, String welcome) {
    return 'Gửi liên kết cho bạn bè. Khi họ đăng ký bằng mã của bạn và hoàn tất cuộc trò chuyện đầu tiên, bạn nhận $reward hạn mức miễn phí và họ nhận $welcome.';
  }

  @override
  String inviteFriendsStep3Both(String amount) {
    return 'Khi họ xong cuộc trò chuyện đầu tiên, mỗi người nhận $amount hạn mức miễn phí';
  }

  @override
  String inviteFriendsStep3Two(String reward, String welcome) {
    return 'Khi họ xong cuộc trò chuyện đầu tiên, bạn nhận $reward và họ nhận $welcome';
  }

  @override
  String inviteFriendsShareTextBonus(String link, String code, String amount) {
    return 'Tham gia Casama cùng mình nhé, nơi có các đồng đội AI làm việc giúp bạn. Đăng ký bằng mã mời $code của mình để nhận $amount hạn mức miễn phí: $link';
  }

  @override
  String referralHaveCodeHelp(String amount) {
    return 'Nhập mã trong vòng một tuần sau khi đăng ký để nhận $amount hạn mức miễn phí sau cuộc trò chuyện đầu tiên.';
  }

  @override
  String referralWelcomeEarned(String amount) {
    return 'Phần thưởng chào mừng $amount đã có trong không gian làm việc của bạn.';
  }

  @override
  String referralWelcomePending(String amount) {
    return 'Phần thưởng chào mừng $amount sẽ đến sau cuộc trò chuyện đầu tiên.';
  }

  @override
  String referralWelcomeHelpBonus(String amount) {
    return 'Những đồng đội AI làm việc cho bạn trên máy tính riêng. Chấp nhận lời mời để nhận $amount hạn mức miễn phí sau cuộc trò chuyện đầu tiên.';
  }

  @override
  String referralRedeemedBonus(String amount) {
    return 'Xong rồi! Phần thưởng chào mừng $amount sẽ đến sau cuộc trò chuyện đầu tiên.';
  }

  @override
  String get connectManaged => 'Đăng nhập qua Composio';

  @override
  String connectManagedHelp(String app) {
    return 'Casama kết nối $app qua Composio để xử lý đăng nhập. Bạn có thể ngắt kết nối bất cứ lúc nào.';
  }

  @override
  String get sharing => 'Chia sẻ';

  @override
  String get sharingRow => 'Ai có thể trò chuyện, chỉnh sửa hoặc quản lý bot';

  @override
  String get sharingHelp =>
      'Mọi người trong không gian làm việc đều trò chuyện được với bot trừ khi bạn đặt riêng tư. Người bạn thêm có thể trò chuyện, sửa cài đặt hoặc quản lý quyền truy cập. Khi bot làm việc cho ai, bot chỉ dùng máy tính cá nhân và kết nối của riêng người đó.';

  @override
  String get sharingPrivate => 'Riêng tư';

  @override
  String get sharingPrivateOn =>
      'Chỉ bạn và những người bên dưới mới thấy được';

  @override
  String get sharingPrivateOff =>
      'Mọi người trong không gian làm việc đều trò chuyện được với bot';

  @override
  String get sharingPeople => 'Mọi người';

  @override
  String get sharingOnlyCreator => 'Chỉ người tạo';

  @override
  String get sharingEveryoneChats =>
      'Mọi người đều trò chuyện được; thêm người được phép chỉnh sửa';

  @override
  String sharingEveryoneRole(String role) {
    return 'Tất cả $role';
  }

  @override
  String get accessChat => 'Có thể chat';

  @override
  String get accessEdit => 'Có thể sửa';

  @override
  String get accessAdmin => 'Có thể quản lý';

  @override
  String get sharingSaved => 'Đã lưu chia sẻ';

  @override
  String get triggerCalendar => 'Cuộc họp';

  @override
  String routineCalendar(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'Quanh thời gian các cuộc họp phù hợp ($minutesString phút)',
      zero: 'Khi bắt đầu các cuộc họp phù hợp',
    );
    return '$_temp0';
  }

  @override
  String get calendarTriggerNeedsCalendar =>
      'Kết nối Google Lịch hoặc Outlook trước.';

  @override
  String get calendarTriggerCalendar => 'Lịch';

  @override
  String calendarOffset(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString phút',
      zero: 'Khi bắt đầu',
    );
    return '$_temp0';
  }

  @override
  String get calendarOutsideGuests => 'Chỉ cuộc họp có người ngoài công ty tôi';

  @override
  String get calendarVideoLink => 'Chỉ cuộc họp có liên kết video';

  @override
  String get calendarTitleMatch => 'Chỉ tiêu đề có chứa (tùy chọn)';

  @override
  String get fullAccess => 'Toàn quyền truy cập';

  @override
  String get fullAccessHelp =>
      'Bot hành động không cần hỏi trước, trên máy tính của bot và trên máy Mac của bạn. Thanh toán, đổi mật khẩu và các quy tắc “hỏi” do bạn đặt vẫn sẽ hỏi trước.';

  @override
  String get fullAccessConfirmTitle => 'Bật toàn quyền truy cập?';

  @override
  String get fullAccessConfirmBody =>
      'Mọi bot trong không gian làm việc này sẽ gửi tin nhắn, xóa tệp, chạy lệnh trên máy Mac của bạn và thêm kết nối mà không hỏi trước. Thanh toán và đổi mật khẩu vẫn sẽ hỏi trước.';

  @override
  String get fullAccessTurnOn => 'Bật';

  @override
  String get botToBot => 'Bot có thể nói chuyện với nhau';

  @override
  String get botToBotHelp =>
      'Bot có thể @nhắc, nhắn tin và chuyển việc cho nhau.';

  @override
  String get capMessages => 'Tin nhắn (iMessage)';

  @override
  String get chatApps => 'Ứng dụng chat';

  @override
  String get chatAppsRow =>
      'Telegram, email, SMS, Slack, WhatsApp và nhiều ứng dụng khác';

  @override
  String get botEmail => 'Địa chỉ email';

  @override
  String get botEmailRow => 'Cấp cho bot này địa chỉ riêng';

  @override
  String botEmailClaimTitle(String name) {
    return 'Cấp địa chỉ email cho $name';
  }

  @override
  String get botEmailClaimHelp =>
      'Mọi người có thể viết thư tới địa chỉ này và bot sẽ trả lời qua email. Chuyển tiếp bất cứ gì cho bot: hóa đơn, đặt chỗ, bản tin.';

  @override
  String get botEmailNameHint => 'ada';

  @override
  String get botEmailNameFixed => 'Tên không thể đổi sau này.';

  @override
  String get botEmailNameLabel => 'Tên';

  @override
  String botEmailWillBe(String address) {
    return 'Địa chỉ của bot: $address.';
  }

  @override
  String get botEmailClaim => 'Tạo địa chỉ';

  @override
  String get botEmailTaken =>
      'Tên đó đã có người dùng. Thử một trong các gợi ý sau:';

  @override
  String get botEmailClaimed => 'Bot của bạn đã có địa chỉ';

  @override
  String get botEmailClaimedHelp =>
      'Email chào mừng đang được gửi tới bạn. Hãy trả lời thư đó hoặc chuyển tiếp bất kỳ thư nào.';

  @override
  String get botEmailCopy => 'Sao chép';

  @override
  String get botEmailCopied => 'Đã sao chép';

  @override
  String get botEmailContacts => 'Thêm vào danh bạ';

  @override
  String botEmailWrite(String name) {
    return 'Viết cho $name';
  }

  @override
  String get botEmailPaused =>
      'Đã tạm dừng. Bot vẫn nhận và giữ thư nhưng không trả lời.';

  @override
  String get botEmailPause => 'Tạm dừng';

  @override
  String get botEmailResume => 'Tiếp tục';

  @override
  String get botEmailSenders => 'Người gửi được phép';

  @override
  String get botEmailSendersHelp =>
      'Chỉ những người này mới nhận được trả lời. Thư từ người lạ được giữ lại và không kích hoạt gì.';

  @override
  String get botEmailEditSenders => 'Sửa trong Ứng dụng chat';

  @override
  String get botEmailMove => 'Chuyển sang bot khác';

  @override
  String get botEmailMoveHelp =>
      'Địa chỉ và toàn bộ thư sẽ chuyển sang bot kia.';

  @override
  String get botEmailRelease => 'Giải phóng địa chỉ';

  @override
  String get botEmailReleaseHelp =>
      'Ngừng nhận thư vĩnh viễn. Tên địa chỉ sẽ không bao giờ được cấp lại.';

  @override
  String botEmailReleaseConfirm(String address) {
    return 'Giải phóng $address? Địa chỉ ngừng nhận thư ngay lập tức và tên sẽ không bao giờ được cấp lại.';
  }

  @override
  String get botEmailReleaseNow => 'Giải phóng';

  @override
  String get botEmailMoved => 'Đã chuyển';

  @override
  String botEmailNewBotRow(String name) {
    return 'Cấp địa chỉ email cho $name';
  }

  @override
  String get botEmailInbox => 'Hộp thư đến';

  @override
  String get botEmailInboxRow => 'Thư đã lưu, người lạ và tệp';

  @override
  String get botEmailEmpty => 'Chưa có thư nào';

  @override
  String get botEmailStrangers => 'Người lạ';

  @override
  String get botEmailAll => 'Tất cả thư';

  @override
  String get botEmailUnconfirmed => 'Không xác minh được người gửi này';

  @override
  String get botEmailAllow => 'Cho phép';

  @override
  String get botEmailBlock => 'Chặn';

  @override
  String get botEmailBlocked =>
      'Đã chặn. Thư mới từ địa chỉ này sẽ bị từ chối.';

  @override
  String get botEmailUnblock => 'Bỏ chặn';

  @override
  String get botEmailOpenChat => 'Mở chat';

  @override
  String get botEmailFiles => 'Tệp';

  @override
  String get botEmailNewSenders => 'Báo cho tôi về người gửi mới';

  @override
  String get botEmailNewSendersHelp =>
      'Tối đa một lần mỗi ngày. Tắt trừ khi bạn bật lên.';

  @override
  String get botEmailTryTitle => 'Gợi ý thử nghiệm';

  @override
  String get botEmailTryForward => 'Chuyển tiếp hóa đơn hoặc đặt chỗ';

  @override
  String get botEmailTryForwardHelp =>
      'Chuyển tiếp bất kỳ thư nào tới địa chỉ trên. Bot sẽ đọc và trả lời tại đây.';

  @override
  String get botEmailTryReceipts => 'Lưu giữ biên lai của tôi';

  @override
  String botEmailTryReceiptsHelp(String address) {
    return 'Tạo một quy trình tự động lưu thư gửi tới $address.';
  }

  @override
  String get botEmailTryDigest => 'Một bản tổng hợp mỗi tuần';

  @override
  String botEmailTryDigestHelp(String address) {
    return 'Tạo một quy trình gom các bản tin từ $address thành bản tóm tắt hằng tuần.';
  }

  @override
  String get botEmailTryCopied => 'Đã sao chép địa chỉ';

  @override
  String get botEmailTryMade => 'Đã tạo quy trình';

  @override
  String get botEmailReceiptsName => 'Lưu giữ biên lai của tôi';

  @override
  String get botEmailReceiptsInstructions =>
      'Lưu biên lai từ thư này: chi cho việc gì, bao nhiêu tiền và khi nào. Không báo gì trừ khi có điều bất thường.';

  @override
  String get botEmailDigestName => 'Tổng hợp bản tin hằng tuần';

  @override
  String get botEmailDigestInstructions =>
      'Gom các bản tin tuần này và gửi một bản tóm tắt ngắn: chỉ những tiêu điểm đáng biết, không thêm gì khác.';

  @override
  String get botEmailTriggerTag => 'Thẻ địa chỉ';

  @override
  String get botEmailTriggerTagHelp =>
      'Chỉ thư gửi tới thẻ này, như shop cho ada+shop@. Chỉ áp dụng địa chỉ email.';

  @override
  String get botEmailTriggerUnconfirmed =>
      'Nhận cả thư từ người gửi chưa xác minh';

  @override
  String get botEmailTriggerAutomatic => 'Nhận cả thư tự động';

  @override
  String botEmailStorage(String used, String limit) {
    return '$used/$limit';
  }

  @override
  String botEmailStorageUsed(String used) {
    return 'Đã dùng $used';
  }

  @override
  String get botEmailStorageFull =>
      'Hộp thư đã đầy nên thư mới bị từ chối. Hãy xóa thư cũ để giải phóng dung lượng.';

  @override
  String get botEmailSelect => 'Chọn';

  @override
  String get botEmailSelectDone => 'Xong';

  @override
  String get botEmailDelete => 'Xóa';

  @override
  String botEmailDeleteCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Xóa $n thư',
      one: 'Xóa 1 thư',
    );
    return '$_temp0';
  }

  @override
  String botEmailDeleteTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Xóa $n thư?',
      one: 'Xóa thư này?',
    );
    return '$_temp0';
  }

  @override
  String get botEmailDeleteBody =>
      'Nội dung và tệp đính kèm sẽ mất vĩnh viễn. Bản sao đã có trong chat vẫn được giữ lại.';

  @override
  String get botEmailDeleteOlder => 'Xóa thư cũ hơn';

  @override
  String get botEmailOlder30Days => 'Cũ hơn 30 ngày';

  @override
  String get botEmailOlder6Months => 'Cũ hơn 6 tháng';

  @override
  String get botEmailOlderYear => 'Cũ hơn 1 năm';

  @override
  String botEmailDeleteOlderConfirm(String age) {
    String _temp0 = intl.Intl.selectLogic(age, {
      'days30': 'Xóa tất cả thư cũ hơn 30 ngày?',
      'months6': 'Xóa tất cả thư cũ hơn 6 tháng?',
      'other': 'Xóa tất cả thư cũ hơn 1 năm?',
    });
    return '$_temp0';
  }

  @override
  String botEmailDeleted(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Đã xóa $n thư',
      one: 'Đã xóa 1 thư',
      zero: 'Không có gì để xóa',
    );
    return '$_temp0';
  }

  @override
  String botEmailPerkAddresses(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n địa chỉ email bot',
      one: '1 địa chỉ email bot',
    );
    return '$_temp0';
  }

  @override
  String get botEmailPerkWritesNew => 'Bot viết email cho người mới';

  @override
  String get botEmailPerkRepliesOnly => 'Bot trả lời bạn qua email';

  @override
  String adminMailSentToday(int sent, int ceiling) {
    return 'Sent today: $sent of $ceiling';
  }

  @override
  String adminMailSentTodayNoCeiling(int sent) {
    return 'Sent today: $sent';
  }

  @override
  String get chatAppsAdd => 'Kết nối ứng dụng chat';

  @override
  String get chatAppsEmpty => 'Chưa có ứng dụng chat nào';

  @override
  String get chatAppsHelp =>
      'Cho phép mọi người nhắn cho bot này qua Telegram, email, SMS, Slack, WhatsApp, Messenger, Feishu hoặc iMessage. Bot chỉ trả lời người trong danh sách cho phép; mọi người khác được ghi lại tại đây.';

  @override
  String get chatAppsAddHelp =>
      'Dán thông tin đăng nhập từ phần cài đặt nhà phát triển của ứng dụng. Thông tin được lưu mã hóa và không bao giờ hiển thị lại.';

  @override
  String get chatAppsKind => 'Ứng dụng';

  @override
  String get chatAppsSenders => 'Người gửi được phép';

  @override
  String get chatAppsSendersHelp =>
      'Mỗi dòng một mục: địa chỉ email (hoặc *@company.com), số điện thoại hoặc ID người dùng. Không rõ ID? Cứ để trống, nhắn cho bot rồi sao chép ID từ Hoạt động.';

  @override
  String get chatAppsMac => 'Mac';

  @override
  String get chatAppsNoMac =>
      'Hãy bật “Dùng máy tính này cho bot” kèm quyền Tin nhắn trong ứng dụng máy tính trên máy Mac trước.';

  @override
  String chatAppsConnected(String name) {
    return 'Đã kết nối $name';
  }

  @override
  String get chatAppsTelegramDone =>
      'Telegram đã gửi tin nhắn về đây. Hãy nhắn thử cho bot của bạn.';

  @override
  String get chatAppsPasteUrl =>
      'Dán địa chỉ này vào phần cài đặt webhook của ứng dụng.';

  @override
  String get chatAppsWebhookUrl => 'Địa chỉ webhook';

  @override
  String get chatAppsVerifyToken => 'Token xác minh';

  @override
  String chatAppsAllowed(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString người gửi được phép',
      one: '1 người gửi được phép',
      zero: 'Chưa cho phép ai',
    );
    return '$_temp0';
  }

  @override
  String get chatAppsActivity => 'Hoạt động';

  @override
  String get chatAppsNoActivity => 'Chưa có tin nhắn nào.';

  @override
  String get chatAppsIgnored => 'Đã bỏ qua: không có trong danh sách cho phép';

  @override
  String get chatAppsAllow => 'Cho phép';

  @override
  String chatAppsSenderAllowed(String sender) {
    return '$sender giờ có thể nhắn cho bot này';
  }

  @override
  String get chatAppsRoutine => 'Đã bắt đầu một quy trình';

  @override
  String get chatAppsFailed => 'Không gửi được';

  @override
  String get chatAppsSent => 'Đã gửi';

  @override
  String get chatAppsAnswered => 'Đã trả lời';

  @override
  String get chatAppsRemove => 'Ngắt kết nối';

  @override
  String get chBotToken => 'Token của bot';

  @override
  String get chAddress => 'Địa chỉ email';

  @override
  String get chApiKey => 'Khóa API';

  @override
  String get chSigningSecret => 'Mã bí mật ký';

  @override
  String get chPhoneNumber => 'Số điện thoại';

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
  String get chPageToken => 'Token truy cập trang';

  @override
  String get chAppId => 'App ID';

  @override
  String get chEncryptKey => 'Khóa mã hóa';

  @override
  String get chVerificationToken => 'Token xác minh';

  @override
  String get chPublicKey => 'Khóa công khai';

  @override
  String get chTrackerUser => 'ID người dùng của bot trong trình theo dõi';

  @override
  String get chSiteUrl => 'Địa chỉ trang web (https://…)';

  @override
  String get chAccountEmail => 'Email tài khoản';

  @override
  String get routineMessage => 'Khi nhận được tin nhắn phù hợp';

  @override
  String get triggerMessage => 'Tin nhắn';

  @override
  String get messageTriggerHelp =>
      'Bắt đầu khi email hoặc tin nhắn gửi tới bot này khớp điều kiện. Hãy kết nối ứng dụng trong mục Ứng dụng chat trước.';

  @override
  String get messageTriggerAnyApp => 'Bất kỳ ứng dụng nào';

  @override
  String get messageTriggerSender => 'Từ (địa chỉ, số hoặc *@company.com)';

  @override
  String get messageTriggerSubject => 'Tiêu đề chứa';

  @override
  String get messageTriggerWords => 'Tin nhắn chứa';

  @override
  String callIncoming(String name) {
    return '$name đang gọi';
  }

  @override
  String get callAnswer => 'Trả lời';

  @override
  String get callDecline => 'Từ chối';

  @override
  String get callFullScreenTitle => 'Cuộc gọi trên màn hình khóa';

  @override
  String get callFullScreenOff =>
      'Tắt: cuộc gọi của bot chỉ hiện dạng thông báo. Chạm để cho phép cuộc gọi reo toàn màn hình.';

  @override
  String get encryption => 'Mã hóa nội dung';

  @override
  String get encryptionHelp =>
      'Tin nhắn, trí nhớ, phiếu việc, trang và kiến thức được mã hóa bằng khóa riêng của không gian làm việc này trước khi lưu. Khi tìm kiếm sẽ khớp theo tiêu đề và ngữ nghĩa thay vì khớp chính xác từng từ trong văn bản đã mã hóa.';

  @override
  String get encryptionOff => 'Tắt';

  @override
  String get encryptionUnavailable =>
      'Không khả dụng: máy chủ này chưa thiết lập khóa mã hóa';

  @override
  String get encryptionEncrypting => 'Đang bật: đang mã hóa dữ liệu đã lưu';

  @override
  String get encryptionOnServer => 'Đang bật, dùng khóa của máy chủ';

  @override
  String get encryptionOnKms => 'Đang bật, dùng AWS KMS';

  @override
  String get encryptionDecrypting => 'Đang tắt: đang giải mã dữ liệu đã lưu';

  @override
  String get encryptionConfirm =>
      'Nội dung sẽ được mã hóa bằng khóa của không gian làm việc này. Nếu không gian làm việc bị xóa, khóa sẽ bị hủy và không thể khôi phục nội dung. Tìm kiếm chính xác từng từ sẽ không còn khớp văn bản đã mã hóa.';

  @override
  String get encryptionTurnOn => 'Bật';

  @override
  String get encryptionRotate => 'Xoay vòng khóa';

  @override
  String get encryptionKeyManaged =>
      'Casama tạo và giữ khóa của không gian làm việc này giúp bạn, được bọc bằng khóa riêng của máy chủ. Không cần lưu hay sao chép gì.';

  @override
  String get encryptionRotateTitle => 'Xoay vòng khóa?';

  @override
  String get encryptionRotateBody =>
      'Khóa không gian làm việc được bọc lại bằng khóa hiện tại của máy chủ. Nội dung của bạn vẫn đọc được bình thường và không cần mã hóa lại. Hãy làm việc này sau khi đổi khóa máy chủ hoặc theo định kỳ.';

  @override
  String get encryptionRotateHelp =>
      'Bọc lại khóa không gian làm việc bằng khóa hiện tại của máy chủ';

  @override
  String encryptionRotatedWhen(String when) {
    return 'Xoay vòng gần nhất: $when';
  }

  @override
  String get memoryBackend => 'Nơi lưu trí nhớ';

  @override
  String get memoryBuiltIn => 'Tích hợp sẵn';

  @override
  String get memoryBackendHelp => 'Trí nhớ dài hạn của bot';

  @override
  String get memoryBackendSheetHelp =>
      'Lưu trí nhớ của bot trên Honcho hoặc Supermemory bằng tài khoản của riêng bạn. Màn hình trí nhớ, xuất dữ liệu và xóa vẫn hoạt động như cũ.';

  @override
  String get memoryHonchoWorkspace => 'Không gian làm việc Honcho';

  @override
  String get memoryHonchoWorkspaceHelp =>
      'Để trống để dùng không gian tạo riêng cho không gian làm việc Casama này';

  @override
  String get memoryBaseUrl => 'Địa chỉ máy chủ (tùy chọn)';

  @override
  String get memoryBaseUrlHelp =>
      'Chỉ dùng cho Honcho hoặc Supermemory tự lưu trữ';

  @override
  String get memoryCopyExisting => 'Sao chép ký ức hiện tại sang';

  @override
  String get memoryUseBuiltIn => 'Dùng lại trí nhớ tích hợp sẵn';

  @override
  String get providerHintData => 'dữ liệu trả phí (địa điểm, email, SEO)';

  @override
  String get kindA2a => 'Agent AI (A2A)';

  @override
  String get a2aAgentUrl => 'Địa chỉ agent hoặc URL agent card';

  @override
  String get a2aAgentToken => 'Access token (tùy chọn)';

  @override
  String get a2a => 'Agent-to-Agent (A2A)';

  @override
  String get a2aHelp =>
      'Agent bên ngoài có thể giao tác vụ cho bot bạn xuất bản.';

  @override
  String get chromeExtensionSwitch => 'Casama cho Chrome';

  @override
  String get chromeExtensionSwitchHelp =>
      'Thành viên có thể dùng tiện ích mở rộng trình duyệt với không gian làm việc này.';

  @override
  String get chromeActSwitch => 'Bot trên trình duyệt của thành viên';

  @override
  String get chromeActSwitchHelp =>
      'Thành viên có thể cho bot mở trang và thao tác trong Chrome của họ, trong một nhóm thẻ mà họ có thể dừng lại.';

  @override
  String get a2aPublish => 'Xuất bản thành Agent A2A';

  @override
  String get a2aPublishHelp =>
      'Agent bên ngoài có khóa API của không gian làm việc có thể giao tác vụ cho bot này.';

  @override
  String get a2aWorkspaceOff =>
      'Hãy bật Agent-to-Agent trong cài đặt không gian làm việc trước.';

  @override
  String get a2aCardUrl => 'Agent card';

  @override
  String get phoneCalls => 'Cuộc gọi điện thoại';

  @override
  String get phoneCallsHelp =>
      'Cho phép bot gọi điện cho doanh nghiệp thay bạn qua tài khoản Twilio. Mọi cuộc gọi đều hỏi trước theo quy tắc phê duyệt thông thường.';

  @override
  String get twilioSid => 'Account SID';

  @override
  String get twilioToken => 'Auth token';

  @override
  String get twilioFrom => 'Gọi đi từ số';

  @override
  String get phoneCallsPersonal => 'Cho phép gọi số cá nhân';

  @override
  String get phoneCallsCap => 'Số cuộc gọi mỗi ngày';

  @override
  String get phoneCallsOff => 'Chưa kết nối';

  @override
  String get outCall => 'Gọi';

  @override
  String get outCallRinging => 'Đang đổ chuông…';

  @override
  String get outCallLive => 'Đang trong cuộc gọi';

  @override
  String outCallEnded(int seconds) {
    final intl.NumberFormat secondsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Đã kết thúc sau $secondsString giây';
  }

  @override
  String get outCallEndedByYou => 'Bạn đã kết thúc cuộc gọi';

  @override
  String get outCallTakenOver => 'Bạn đã tiếp quản cuộc gọi';

  @override
  String get outCallFailed => 'Không kết nối được';

  @override
  String get outCallNothingYet => 'Chưa nói gì.';

  @override
  String get outCallTakeOver => 'Tiếp quản';

  @override
  String get outCallEnd => 'Kết thúc cuộc gọi';

  @override
  String get outCallYourPhone => 'Số điện thoại của bạn';

  @override
  String get outCallYourPhoneHelp =>
      'Định dạng quốc tế, như +84901234567. Để trống để dùng số đã lưu.';

  @override
  String get payments => 'Thanh toán';

  @override
  String get paymentsHelp =>
      'Cho phép bot thanh toán cho đơn vị bán hàng bằng thẻ ảo dùng một lần do bạn phê duyệt mỗi lần. Dùng tài khoản Stripe Issuing của riêng bạn.';

  @override
  String paymentsOn(String spent, String cap) {
    return 'Đã chi $spent/$cap tháng này';
  }

  @override
  String get paymentsSheetHelp =>
      'Mỗi thẻ đều do bạn phê duyệt với đúng số tiền hiển thị, chỉ dùng một lần tại đơn vị bán hàng đó trong một giờ, và không bao giờ dùng cho chứng khoán, tiền mã hóa, thẻ quà tặng hay chuyển khoản.';

  @override
  String get paymentsStripeKey => 'Khóa bí mật Stripe (có Issuing)';

  @override
  String get paymentsWebhookSecret => 'Mã bí mật ký webhook';

  @override
  String get paymentsWebhook => 'Trỏ webhook Stripe tới đây';

  @override
  String get paymentsCardholder => 'Tên trên thẻ';

  @override
  String get paymentsAddress => 'Địa chỉ thanh toán';

  @override
  String get paymentsCity => 'Thành phố';

  @override
  String get paymentsState => 'Bang hoặc khu vực';

  @override
  String get paymentsZip => 'Mã bưu chính';

  @override
  String get paymentsCountry => 'Quốc gia (2 chữ cái)';

  @override
  String get paymentsCap => 'Giới hạn không gian làm việc mỗi tháng (USD)';

  @override
  String get paymentsBotCap => 'Giới hạn mỗi bot mỗi tháng (USD)';

  @override
  String get links => 'Bot liên kết';

  @override
  String get linksRow => 'Liên kết với bot của người liên hệ đáng tin cậy';

  @override
  String get linksHelp =>
      'Bot của bạn có thể hỏi bot của người liên hệ đã liên kết những việc như đặt bàn ăn tối. Mỗi bot trả lời theo quy tắc của chủ nhân và chỉ chia sẻ thông tin cần thiết; cả hai bạn đều thấy mọi trao đổi.';

  @override
  String get linksEmpty => 'Chưa liên kết bot nào';

  @override
  String get linksInvite => 'Mời người liên hệ';

  @override
  String get linksContactName => 'Tên người liên hệ';

  @override
  String get linksInviteReady => 'Gửi lời mời này';

  @override
  String get linksInviteHelp =>
      'Gửi lời mời cho người liên hệ. Họ chấp nhận trong Casama bằng một bot của họ. Lời mời chỉ dùng được một lần, trong 7 ngày.';

  @override
  String get linksAccept => 'Chấp nhận lời mời';

  @override
  String get linksAcceptHelp => 'Dán lời mời người liên hệ đã gửi cho bạn.';

  @override
  String get linksInviteText => 'Lời mời';

  @override
  String linksActive(String bot) {
    return 'Đã liên kết với $bot';
  }

  @override
  String get linksPending => 'Đang chờ người liên hệ chấp nhận';

  @override
  String get linksRevoked => 'Đã hủy liên kết';

  @override
  String get linksExchanges => 'Trao đổi';

  @override
  String get linksNoExchanges => 'Chưa hỏi gì.';

  @override
  String get linksNoAnswer => 'Không có câu trả lời';

  @override
  String get linksWorking => 'Đang xử lý…';

  @override
  String get linksRevoke => 'Hủy liên kết';

  @override
  String get wakeWord => 'Từ đánh thức';

  @override
  String get wakeWordRow => 'Nói một cụm từ để bắt đầu cuộc gọi với bot';

  @override
  String wakeWordOnRow(String phrase) {
    return 'Đang nghe cụm từ “$phrase”';
  }

  @override
  String get wakeWordHelp =>
      'Khi Casama đang mở, thiết bị này lắng nghe cụm từ của bạn và bắt đầu cuộc gọi trực tiếp với bot bạn chọn.';

  @override
  String get wakeWordListen => 'Nghe từ đánh thức';

  @override
  String get wakeWordPhrase => 'Cụm từ';

  @override
  String get wakeWordPhraseHelp => 'Hai hoặc ba từ, như “hey casama”';

  @override
  String get wakeWordBot => 'Gọi bot này';

  @override
  String get wakeWordDownloading => 'Đang tải mô hình trên thiết bị…';

  @override
  String get wakeWordTest => 'Thử cụm từ';

  @override
  String get wakeWordTesting => 'Đang nghe… hãy nói cụm từ của bạn';

  @override
  String get wakeWordHeard => 'Đã nghe thấy!';

  @override
  String get wakeWordStopTest => 'Dừng';

  @override
  String get wakeWordPrivacy =>
      'Quá trình lắng nghe diễn ra trên thiết bị này bằng mô hình mã nguồn mở (khoảng 18 MB, tải một lần). Không có gì được gửi đi cho đến khi cuộc gọi bắt đầu.';

  @override
  String get secretStore => 'Nơi lưu bí mật';

  @override
  String get secretStoreVault => 'Két bảo mật của máy chủ này';

  @override
  String get secretStoreHelp =>
      'Lưu bí mật có tên của bot trong dự án Infisical của riêng bạn. Casama chỉ giữ tên từng bí mật và nơi nó được phép sử dụng.';

  @override
  String get secretStoreSite => 'Địa chỉ Infisical';

  @override
  String get secretStoreProject => 'ID dự án';

  @override
  String get secretStoreEnv => 'Môi trường';

  @override
  String get secretStoreClientId => 'Client ID danh tính máy';

  @override
  String get secretStoreClientSecret => 'Client secret';

  @override
  String get secretStoreMove => 'Chuyển bí mật hiện tại vào Infisical';

  @override
  String get secretStoreBack => 'Dùng lại két của máy chủ này';

  @override
  String get localServer => 'Chạy Casama trên máy tính này';

  @override
  String get setupTitleMac => 'Thiết lập Casama trên máy Mac này';

  @override
  String get setupTitle => 'Thiết lập Casama trên máy tính này';

  @override
  String get setupEntryMac => 'Chạy trên máy Mac này';

  @override
  String get setupEntry => 'Chạy trên máy tính này';

  @override
  String get setupEntryHelp =>
      'Máy chủ riêng của bạn trên máy tính này. Miễn phí cho nhu cầu cá nhân.';

  @override
  String get setupStepDocker => 'Docker';

  @override
  String get setupStepServer => 'Máy chủ';

  @override
  String get setupStepAccount => 'Tài khoản';

  @override
  String get setupStepModel => 'Mô hình AI';

  @override
  String get setupStepPhone => 'Điện thoại';

  @override
  String get setupDockerChecking => 'Đang kiểm tra Docker…';

  @override
  String get setupDockerMissingTitle => 'Trước tiên, cài đặt Docker';

  @override
  String get setupDockerMissingBodyMac =>
      'Máy chủ Casama chạy trong Docker Desktop, ứng dụng miễn phí giúp tách biệt khỏi phần còn lại của máy Mac.';

  @override
  String get setupDockerMissingBodyLinux =>
      'Máy chủ Casama chạy trong Docker, giúp máy chủ tách biệt khỏi phần còn lại của máy tính.';

  @override
  String get setupDockerGetMac => 'Tải Docker Desktop';

  @override
  String get setupDockerGetLinux => 'Mở hướng dẫn cài đặt Docker';

  @override
  String get setupDockerStep1 =>
      'Mở tệp đã tải về và kéo Docker vào thư mục Ứng dụng.';

  @override
  String get setupDockerStep2 => 'Mở Docker và chấp nhận điều khoản.';

  @override
  String get setupDockerStep3 => 'Quay lại đây. Trang này sẽ tự động tiếp tục.';

  @override
  String get setupDockerWaiting => 'Đang chờ Docker…';

  @override
  String get setupDockerStoppedTitle => 'Docker cần đang chạy';

  @override
  String get setupDockerStoppedBodyMac =>
      'Docker đã cài nhưng chưa mở. Sau khi Docker khởi động xong (có thể mất khoảng một phút), trang này sẽ tự động tiếp tục.';

  @override
  String get setupDockerStoppedBodyLinux =>
      'Docker đã cài nhưng chưa chạy. Khởi động bằng lệnh này và trang này sẽ tự động tiếp tục.';

  @override
  String get setupDockerOpen => 'Mở Docker';

  @override
  String get setupDockerOpening => 'Đang khởi động Docker…';

  @override
  String get setupDockerPermissionTitle => 'Docker cần bạn cấp quyền';

  @override
  String get setupDockerPermissionBody =>
      'Docker đang chạy, nhưng người dùng của bạn chưa được phép dùng. Chạy lệnh này rồi đăng xuất và đăng nhập lại.';

  @override
  String get setupDockerComposeTitle => 'Docker thiếu Compose';

  @override
  String get setupDockerComposeBody =>
      'Bản Docker này không có Compose v2. Docker Desktop đã kèm sẵn; trên Linux, hãy cài gói plugin docker-compose-plugin.';

  @override
  String get setupStepSkipped => 'Đã bỏ qua';

  @override
  String get setupArtDocker => 'Đầu tiên, môi trường nơi máy chủ hoạt động.';

  @override
  String get setupArtServer =>
      'Đang dựng không gian của bạn. Đây là bước lâu nhất.';

  @override
  String get setupArtAccount => 'Máy chủ của bạn đang chạy!';

  @override
  String get setupArtModel => 'Giờ hãy gắn bộ não cho máy chủ.';

  @override
  String get setupArtPhone => 'Bước cuối: mang theo bên mình.';

  @override
  String get setupDockerSlowTitle => 'Hơi lâu một chút?';

  @override
  String get setupDockerSlowMenuBar =>
      'Tìm biểu tượng cá voi trên thanh menu. Docker sẵn sàng khi biểu tượng ngừng chuyển động.';

  @override
  String get setupDockerSlowTerms =>
      'Nếu Docker hiện cửa sổ yêu cầu chấp nhận điều khoản, hãy hoàn tất trước. Đăng nhập Docker là tùy chọn.';

  @override
  String get setupDockerSlowRestart =>
      'Vẫn bị kẹt? Thoát Docker từ menu của nó rồi nhấn Kiểm tra lại.';

  @override
  String get setupDockerSlowInstalled =>
      'Đã cài sẵn? Mở Docker một lần từ thư mục Ứng dụng để tự thiết lập.';

  @override
  String get setupDockerSlowOther =>
      'Đang dùng OrbStack hay Colima? Hãy khởi động nó. Casama hoạt động với mọi Docker phản hồi lệnh docker info.';

  @override
  String get setupDockerSlowTerminal =>
      'Chạy docker info trong terminal để xem Docker báo gì.';

  @override
  String setupDockerSlowSaw(String detail) {
    return 'Docker báo: $detail';
  }

  @override
  String get setupDockerRecheck => 'Kiểm tra lại';

  @override
  String get setupDockerGuide => 'Hướng dẫn khắc phục';

  @override
  String setupDiskLow(String gb, String need) {
    return 'Chỉ còn $gb GB dung lượng ổ đĩa trống. Máy chủ cần khoảng $need GB.';
  }

  @override
  String get setupServerTitle => 'Tải và khởi động máy chủ';

  @override
  String get setupServerBody =>
      'Tải khoảng 2,5 GB (mất 5–10 phút lần đầu) và dùng khoảng 10 GB ổ đĩa sau khi thiết lập. Bạn vẫn có thể tiếp tục dùng máy tính.';

  @override
  String setupServerBodySized(String download, String disk) {
    return 'Tải $download GB, sau đó dùng khoảng $disk GB ổ đĩa khi thiết lập xong. Lần đầu mất 5–10 phút. Bạn vẫn có thể tiếp tục dùng máy tính.';
  }

  @override
  String get setupServerBodyNothing =>
      'Mọi thứ cần thiết đã có sẵn trên máy tính này nên sẽ khởi động trong một hoặc hai phút.';

  @override
  String get setupServerStart => 'Bắt đầu';

  @override
  String get setupServerStageDownload => 'Đang tải máy chủ';

  @override
  String get setupServerStagePrepare => 'Đang chuẩn bị';

  @override
  String get setupServerStageParts => 'Đang tải các thành phần';

  @override
  String setupServerDownloaded(int megabytes) {
    return 'Đã tải $megabytes MB';
  }

  @override
  String get setupServerStagePartsNote => 'Bước lâu nhất';

  @override
  String setupServerPartsCount(int done, int total) {
    return 'Đã tải $done/$total';
  }

  @override
  String get setupServerStageStart => 'Đang khởi động';

  @override
  String get setupServerStageWait => 'Đang chờ phản hồi';

  @override
  String get setupServerKeepOpen => 'Giữ Casama mở cho đến khi hoàn tất.';

  @override
  String get setupServerFailed => 'Máy chủ không khởi động được.';

  @override
  String get setupServerConnecting => 'Sẵn sàng. Đang kết nối…';

  @override
  String get setupShowDetails => 'Hiện chi tiết';

  @override
  String get setupHideDetails => 'Ẩn chi tiết';

  @override
  String get setupAccountTitle => 'Tạo tài khoản';

  @override
  String get setupAccountBody =>
      'Tài khoản chỉ lưu trên máy tính này và là chủ sở hữu máy chủ này. Không gửi email nào.';

  @override
  String get setupAccountName => 'Tên của bạn';

  @override
  String get setupAccountNameMissing => 'Nhập tên của bạn';

  @override
  String get setupAccountCreate => 'Tạo tài khoản';

  @override
  String get setupAccountHave => 'Tôi đã có tài khoản tại đây';

  @override
  String get setupAccountNew => 'Tạo tài khoản mới';

  @override
  String get setupAccountSignInTitle => 'Đăng nhập máy chủ';

  @override
  String get setupAccountSignInBody =>
      'Dùng tài khoản bạn đã tạo trên máy chủ này.';

  @override
  String get setupAccountClosed =>
      'Máy chủ này đã có chủ sở hữu. Hãy đăng nhập bằng tài khoản đó.';

  @override
  String get setupAccountPreparing => 'Đang chuẩn bị không gian cho bạn…';

  @override
  String get setupModelTitle => 'Cấp mô hình cho các bot';

  @override
  String get setupModelBody =>
      'Bot cần một mô hình AI để suy nghĩ. Đăng nhập bằng gói ChatGPT hoặc dán khóa từ OpenRouter, Google hay nhà cung cấp khác.';

  @override
  String get setupSkip => 'Bỏ qua lúc này';

  @override
  String get setupPhoneTitle => 'Kết nối điện thoại';

  @override
  String get setupPhoneBody =>
      'Casama Link cấp cho máy tính này một địa chỉ riêng để điện thoại truy cập từ bất cứ đâu. Bạn phê duyệt một lần bằng tài khoản Casama Cloud miễn phí. Cuộc trò chuyện vẫn nằm trên máy tính này.';

  @override
  String get setupPhoneTurnOn => 'Cấp địa chỉ cho máy tính này';

  @override
  String get setupPhoneScanTitle => 'Quét mã bằng camera điện thoại';

  @override
  String get setupPhoneScanBody =>
      'Mã sẽ mở Casama trên điện thoại và đăng nhập cho bạn. Nếu điện thoại chưa cài Casama, trang mở ra sẽ hướng dẫn nơi tải.';

  @override
  String get setupPhoneWaiting => 'Đang chờ điện thoại…';

  @override
  String get setupPhoneConnected => 'Đã kết nối điện thoại';

  @override
  String get setupPhoneConnectedBody =>
      'Điện thoại của bạn đã đăng nhập. Hiện mã mới để thêm thiết bị khác.';

  @override
  String get setupPhoneOwnerOnly =>
      'Chỉ chủ sở hữu máy chủ này mới cấp địa chỉ được.';

  @override
  String get setupFinish => 'Hoàn tất';

  @override
  String get setupCardTitle => 'Hoàn tất thiết lập';

  @override
  String get setupCardModel => 'Thêm mô hình AI để bot trả lời được.';

  @override
  String get setupCardPhone => 'Kết nối điện thoại với máy tính này.';

  @override
  String get setupCardOpen => 'Tiếp tục thiết lập';

  @override
  String get desktopUsers => 'Người dùng màn hình cùng lúc';

  @override
  String get desktopUsersHelp =>
      'Bot trên máy tính chung này dùng chung một màn hình. Các bot khác sẽ chờ (và vẫn dùng shell, tệp cùng trình duyệt) khi màn hình đang bận.';

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
      'calendar': '$bot muốn dùng lịch của bạn',
      'reminders': '$bot muốn dùng lời nhắc của bạn',
      'contacts': '$bot muốn dùng danh bạ của bạn',
      'places': '$bot muốn dùng địa điểm của bạn',
      'photos': '$bot muốn dùng ảnh của bạn',
      'health': '$bot muốn dùng dữ liệu sức khỏe của bạn',
      'notifications': '$bot muốn dùng thông báo của bạn',
      'activity': '$bot muốn dùng hoạt động máy tính của bạn',
      'browserTab': '$bot muốn dùng thẻ trình duyệt hiện tại',
      'browserHistory': '$bot muốn dùng lịch sử và dấu trang trình duyệt',
      'alarm': '$bot muốn dùng báo thức của bạn',
      'home': '$bot muốn dùng phụ kiện Nhà của bạn',
      'other': '$bot muốn dùng dữ liệu thiết bị của bạn',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessHelp =>
      'Chỉ trong các cuộc trò chuyện riêng của bạn. Bạn có thể dừng bất cứ lúc nào trong Cài đặt → Kết nối thiết bị.';

  @override
  String deviceAccessGranted(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Đã cho phép dùng lịch của bạn',
      'reminders': 'Đã cho phép dùng lời nhắc của bạn',
      'contacts': 'Đã cho phép dùng danh bạ của bạn',
      'places': 'Đã cho phép dùng địa điểm của bạn',
      'photos': 'Đã cho phép dùng ảnh của bạn',
      'health': 'Đã cho phép dùng dữ liệu sức khỏe của bạn',
      'notifications': 'Đã cho phép dùng thông báo của bạn',
      'activity': 'Đã cho phép dùng hoạt động máy tính của bạn',
      'browserTab': 'Đã cho phép dùng thẻ trình duyệt hiện tại',
      'browserHistory': 'Đã cho phép dùng lịch sử và dấu trang trình duyệt',
      'alarm': 'Đã cho phép dùng báo thức của bạn',
      'home': 'Đã cho phép dùng phụ kiện Nhà của bạn',
      'other': 'Đã cho phép dùng dữ liệu thiết bị của bạn',
    });
    return '$_temp0';
  }

  @override
  String get deviceAccessSkipped => 'Chưa chia sẻ';

  @override
  String get deviceKindCalendar => 'lịch';

  @override
  String get deviceKindReminders => 'lời nhắc';

  @override
  String get deviceKindContacts => 'danh bạ';

  @override
  String get deviceKindPlaces => 'địa điểm';

  @override
  String get deviceKindPhotos => 'ảnh';

  @override
  String get deviceKindHealth => 'dữ liệu sức khỏe';

  @override
  String get deviceKindNotifications => 'thông báo';

  @override
  String get deviceKindActivity => 'hoạt động máy tính';

  @override
  String get deviceKindBrowserTab => 'thẻ trình duyệt hiện tại';

  @override
  String get deviceKindBrowserHistory => 'lịch sử và dấu trang trình duyệt';

  @override
  String get deviceKindAlarm => 'báo thức';

  @override
  String get deviceKindHome => 'phụ kiện Nhà';

  @override
  String get deviceBrowserAsks => 'Những gì bot có thể hỏi trình duyệt';

  @override
  String get deviceBrowserAsksHelp =>
      'Casama cho Chrome trả lời trực tiếp các yêu cầu này và không lưu lại gì. Bật hoặc tắt trong cài đặt tiện ích mở rộng.';

  @override
  String deviceBrowserAskRevoke(String bot) {
    return 'Ngừng cho phép $bot hỏi';
  }

  @override
  String get deviceConnections => 'Kết nối thiết bị';

  @override
  String get deviceConnectionsHelp =>
      'Chia sẻ dữ liệu từ thiết bị này với các bot. Từng loại đều tắt cho đến khi bạn bật, và chỉ bot bạn cho phép mới đọc được, chỉ trong cuộc trò chuyện riêng của bạn.';

  @override
  String get deviceConnectionsNone =>
      'Thiết bị này chưa thể chia sẻ dữ liệu. Mở Casama trên điện thoại và bật những mục bạn muốn chia sẻ.';

  @override
  String get deviceKeepFor => 'Giữ trong';

  @override
  String get deviceKeepLiveOnly => 'Chỉ trực tiếp';

  @override
  String deviceKeepDays(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ngày',
      one: '1 ngày',
    );
    return '$_temp0';
  }

  @override
  String get devicePrivateModel => 'Chỉ mô hình riêng tư';

  @override
  String get devicePrivateModelHelp =>
      'Chỉ bot dùng mô hình cục bộ mới đọc được';

  @override
  String get deviceNoBots =>
      'Chưa có bot nào. Bot sẽ hỏi khi cần hoặc bạn có thể cho phép ngay bây giờ.';

  @override
  String get deviceAllowBot => 'Cho phép một bot';

  @override
  String deviceAllowBotAsk(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'calendar': 'Bot nào được đọc lịch của bạn?',
      'reminders': 'Bot nào được đọc lời nhắc của bạn?',
      'contacts': 'Bot nào được đọc danh bạ của bạn?',
      'places': 'Bot nào được đọc địa điểm của bạn?',
      'photos': 'Bot nào được đọc ảnh của bạn?',
      'health': 'Bot nào được đọc dữ liệu sức khỏe của bạn?',
      'notifications': 'Bot nào được đọc thông báo của bạn?',
      'activity': 'Bot nào được đọc hoạt động máy tính của bạn?',
      'browserTab': 'Bot nào được đọc thẻ trình duyệt hiện tại?',
      'browserHistory': 'Bot nào được đọc lịch sử và dấu trang trình duyệt?',
      'alarm': 'Bot nào được đọc báo thức của bạn?',
      'home': 'Bot nào được đọc phụ kiện Nhà của bạn?',
      'other': 'Bot nào được đọc dữ liệu thiết bị của bạn?',
    });
    return '$_temp0';
  }

  @override
  String get devicePermissionDenied =>
      'Casama chưa có quyền. Hãy cấp quyền trong cài đặt hệ thống rồi thử lại.';

  @override
  String get deviceOtherDevices => 'Thiết bị khác của bạn';

  @override
  String get deviceForget => 'Quên thiết bị này';

  @override
  String get deviceBrowsers => 'Trình duyệt bot có thể dùng';

  @override
  String get deviceBrowsersHelp =>
      'Đã ghép nối trong Casama cho Chrome. Các bot được phép làm việc trong nhóm thẻ riêng dưới phiên đăng nhập của bạn.';

  @override
  String deviceBrowserBots(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bot',
      one: '1 bot',
      zero: 'Chưa có bot nào',
    );
    return '$_temp0';
  }

  @override
  String get deviceBrowserOnline => 'Trực tuyến';

  @override
  String get deviceBrowserOffline => 'Ngoại tuyến';

  @override
  String get deviceBrowserUnpair => 'Hủy ghép nối trình duyệt này';

  @override
  String get deviceBrowserAllBots => 'Tất cả bot';

  @override
  String get deviceChromeNotPaired => 'Casama cho Chrome: chưa ghép nối';

  @override
  String get deviceChromeHowToPair =>
      'Cài đặt Casama cho Chrome, đăng nhập rồi mở Thêm → “Cho phép bot dùng trình duyệt này”.';

  @override
  String get deviceConnectionsRowHelp =>
      'Lịch, danh bạ và nhiều dữ liệu khác từ thiết bị này';

  @override
  String get healthExtraCycle => 'Theo dõi chu kỳ';

  @override
  String get healthExtraGlucose => 'Đường huyết';

  @override
  String get healthExtraBloodPressure => 'Huyết áp';

  @override
  String get appleHealth => 'Apple Health';

  @override
  String get appleHealthAbout =>
      'Đọc tóm tắt hằng ngày về giấc ngủ, hoạt động, bài tập và nhịp tim từ Apple Health (HealthKit), chỉ khi mục này đang bật. Casama không bao giờ ghi dữ liệu vào Apple Health.';

  @override
  String get healthNotMedical =>
      'Chỉ tóm tắt hằng ngày (giấc ngủ, hoạt động, bài tập, nhịp tim). Bot mô tả sự thay đổi so với mức thường ngày của bạn và không bao giờ đưa ra lời khuyên y tế.';

  @override
  String get healthNeedsEncryption =>
      'Dữ liệu sức khỏe cần bật mã hóa khi lưu trữ. Hãy bật cho một không gian làm việc bạn sở hữu rồi thử lại.';

  @override
  String get placeAddHere => 'Thêm vị trí hiện tại';

  @override
  String get placeName => 'Đặt tên địa điểm này (Nhà, Nơi làm việc, Phòng gym)';

  @override
  String get placeNoLocation =>
      'Vị trí của bạn chưa khả dụng. Hãy cấp quyền vị trí cho Casama rồi thử lại.';

  @override
  String get placesHelp =>
      'Bot được báo khi bạn đến hoặc rời các địa điểm này. Chỉ tên địa điểm và thời gian được chia sẻ, không bao giờ chia sẻ lộ trình của bạn.';

  @override
  String get watchedAppsHelp =>
      'Chỉ thông báo từ các ứng dụng này được chia sẻ. Mã dùng một lần bị ẩn trước khi rời khỏi điện thoại của bạn.';

  @override
  String get watchedAppAdd => 'Thêm ứng dụng (tên hoặc package id)';

  @override
  String get providerHintMaps => 'thời gian di chuyển để nhắc giờ xuất phát';

  @override
  String routineDevice(String event, String detail) {
    return 'Trên điện thoại: $event $detail';
  }

  @override
  String get ctxSelection => 'Văn bản đã chọn';

  @override
  String get ctxAddScreenshot => 'Thêm ảnh chụp màn hình';

  @override
  String get ctxScreenshotAdded => 'Đã thêm ảnh chụp màn hình';

  @override
  String get ctxScreenshotFailed =>
      'Không chụp được màn hình. Hãy cho phép ghi màn hình cho Casama trong cài đặt hệ thống.';

  @override
  String get watchedFolders => 'Thư mục được theo dõi';

  @override
  String get watchedFoldersHelp =>
      'Tệp mới trong một trong các thư mục này có thể kích hoạt quy trình (ví dụ: sắp xếp tệp PDF mới trong Tải về). Chỉ tên tệp được chia sẻ; bot chỉ đọc tệp nếu làm việc trên máy tính này.';

  @override
  String get whyTitle => 'Tại sao tôi thấy mục này?';

  @override
  String whyData(String data) {
    return 'Đã dùng: $data';
  }

  @override
  String whyUrgency(String urgency) {
    return 'Mức khẩn cấp: $urgency';
  }

  @override
  String get heldMeeting =>
      'Tin đã đợi khi bạn đang họp và gửi kèm bản tóm tắt.';

  @override
  String get heldFocus =>
      'Tin đã đợi khi Tập trung đang bật và gửi kèm bản tóm tắt.';

  @override
  String get heldDriving =>
      'Tin đã đợi khi bạn đang lái xe và gửi kèm bản tóm tắt.';

  @override
  String get heldCap =>
      'Bot đã gửi đủ 5 tin nhắn hôm nay nên tin này đợi gửi cùng bản tóm tắt.';

  @override
  String get heldLow =>
      'Tin không khẩn cấp nên đã đợi gửi cùng bản tóm tắt thay vì làm rung điện thoại.';

  @override
  String get lessLikeThis => 'Ít nội dung như vậy hơn';

  @override
  String get lessLikeThisDone => 'Đã hiểu, sẽ giảm bớt dạng này';

  @override
  String get widgetStatusWorking => 'Đang xử lý…';

  @override
  String get widgetStatusOff => 'Đã tắt';

  @override
  String get adminNoWorkspaces => 'No workspaces yet';

  @override
  String get suspendedByInstanceOwner => 'Bị đình chỉ bởi chủ sở hữu hệ thống';

  @override
  String get previewHi => 'Chào bạn!';

  @override
  String get previewAsk => 'Sắp xếp lại ghi chú giúp mình nhé?';

  @override
  String get previewOnIt => 'Làm ngay';

  @override
  String get previewDone => 'Xong! Đã xếp gọn vào ba thư mục rồi.';

  @override
  String get previewMessage => 'Nhắn tin';

  @override
  String get fontPreviewGreeting => 'Chào buổi sáng';

  @override
  String get photosFromUnsplash => 'Ảnh từ Unsplash';

  @override
  String get showBotSteps => 'Hiện các bước của bot';

  @override
  String get showBotStepsHelp =>
      'Câu lệnh và lỗi kỹ thuật trong mọi cuộc trò chuyện.';

  @override
  String get showScreenCard => 'Hiện màn hình bot trong lúc làm việc';

  @override
  String get showScreenCardHelp =>
      'Thẻ trực tiếp nhỏ trong cuộc trò chuyện. Chạm để xem toàn màn hình.';

  @override
  String get showReplyUsage => 'Hiện mức sử dụng trên câu trả lời';

  @override
  String get showReplyUsageHelp =>
      'Chi phí từng câu trả lời, hiện trên một dòng bên dưới.';

  @override
  String get openLinksInApp => 'Mở liên kết trong ứng dụng';

  @override
  String get openLinksInAppHelp =>
      'Liên kết web mở trong trình duyệt bên trong Casama. Tắt: mở bằng trình duyệt mặc định.';

  @override
  String replyUsageTokens(String count) {
    return '$count token';
  }

  @override
  String replyUsageOnYourKeys(String amount) {
    return '$amount bằng khóa của bạn';
  }

  @override
  String get replyUsageOnPlan => 'Trên gói ChatGPT của bạn';

  @override
  String replyUsageSoFar(String amount) {
    return '$amount tính tới lúc này';
  }

  @override
  String get replyUsageTooltip => 'Chi phí câu trả lời này';

  @override
  String get replyUsageTitle => 'Chi phí câu trả lời này';

  @override
  String get replyUsageFromCredits => 'Từ tín dụng của bạn';

  @override
  String get replyUsageYourKeys => 'Bằng khóa API của bạn';

  @override
  String get replyUsageTotal => 'Tổng';

  @override
  String get replyUsageTime => 'Thời gian';

  @override
  String get replyUsageTokensLabel => 'Token';

  @override
  String get replyUsageSteps => 'Số bước';

  @override
  String replyUsageHelpers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Bao gồm $n lượt chạy phụ',
      one: 'Bao gồm 1 lượt chạy phụ',
    );
    return '$_temp0';
  }

  @override
  String get replyUsageNothing =>
      'Không có chi phí nào được tính cho câu trả lời này.';

  @override
  String replyUsageCreditsValue(String price) {
    return '1 tín dụng = $price. Khóa API và gói riêng của bạn do nhà cung cấp tính phí, không phải Casama.';
  }

  @override
  String get replyUsageOpenRun => 'Mở lượt chạy';

  @override
  String get replyUsageLoadFailed =>
      'Không tải được mức sử dụng của câu trả lời này.';

  @override
  String get replyUsageOurCost => 'Chi phí của chúng tôi';

  @override
  String get replyUsageMargin => 'Biên lợi nhuận';

  @override
  String replyUsageItemCost(String amount) {
    return 'Chi phí của chúng tôi $amount';
  }

  @override
  String get replyUsageAdminNote =>
      'Chi phí của chúng tôi và biên lợi nhuận chỉ hiển thị vì bạn vận hành máy chủ này. Không ai khác thấy được.';

  @override
  String get kindSpeechToText => 'Giọng nói thành văn bản';

  @override
  String get kindVoice => 'Cuộc gọi thoại';

  @override
  String get kindImages => 'Hình ảnh';

  @override
  String get kindVideo => 'Video';

  @override
  String get kindSearch => 'Tìm kiếm web';

  @override
  String get kindData => 'Tra cứu dữ liệu';

  @override
  String get kindPhone => 'Cuộc gọi điện thoại';

  @override
  String get kindApps => 'Thao tác ứng dụng';

  @override
  String get activityReady => 'Đang chuẩn bị…';

  @override
  String get activitySearching => 'Đang tìm trên web…';

  @override
  String get activityBrowsing => 'Đang duyệt web…';

  @override
  String get activityComputer => 'Đang làm trên máy tính của bot…';

  @override
  String get activityFiles => 'Đang duyệt tệp…';

  @override
  String get activityImage => 'Đang tạo hình ảnh…';

  @override
  String get activityVideo => 'Đang tạo video…';

  @override
  String get activityMemory => 'Đang kiểm tra thông tin đã biết…';

  @override
  String get activityApps => 'Đang dùng ứng dụng của bạn…';

  @override
  String get activityScheduling => 'Đang lên lịch…';

  @override
  String get activityWorking => 'Đang xử lý…';

  @override
  String get activityWaitingForScreen => 'Đang chờ bạn trả lại màn hình…';

  @override
  String get runFailedPlain =>
      'Đã xảy ra lỗi. Thử lại hoặc mở Chi tiết để xem nguyên nhân.';

  @override
  String get newKeyTitle => 'Sao chép khóa mới';

  @override
  String get newKeyHelp =>
      'Khóa chỉ hiển thị một lần này. Dán vào ứng dụng bạn đang kết nối rồi chạm Xong.';

  @override
  String get copyKey => 'Sao chép khóa';

  @override
  String get keyCopied => 'Đã sao chép khóa';

  @override
  String revokeApiKeyTitle(String name) {
    return 'Thu hồi “$name”?';
  }

  @override
  String get revokeApiKeyBody =>
      'Ứng dụng dùng khóa này sẽ ngừng kết nối ngay lập tức. Không thể hoàn tác; để kết nối lại, hãy tạo khóa mới.';

  @override
  String unlinkTitle(String name) {
    return 'Hủy liên kết “$name”?';
  }

  @override
  String get unlinkBody =>
      'Các bot sẽ ngừng trao đổi với nhau ngay lập tức. Muốn liên kết lại cần một lời mời mới.';

  @override
  String get alreadyMember => 'Bạn đã ở trong không gian làm việc này rồi.';

  @override
  String get askAdminToInvite =>
      'Chỉ chủ sở hữu và quản trị viên mới mời được người khác. Hãy nhờ một trong số họ gửi liên kết mời.';

  @override
  String get askBeforeJoining => 'Hỏi ý kiến tôi trước khi người khác tham gia';

  @override
  String get askBeforeJoiningHelp =>
      'Quản trị viên phê duyệt từng người sử dụng liên kết.';

  @override
  String get askToJoin => 'Yêu cầu tham gia';

  @override
  String get customLinks => 'Liên kết tùy chỉnh';

  @override
  String get customLinksHelp =>
      'Liên kết có vai trò, hạn dùng hoặc số lượt sử dụng riêng.';

  @override
  String get emailAddresses => 'Địa chỉ email';

  @override
  String get emailAddressesHelp =>
      'Dán một hoặc nhiều địa chỉ, cách nhau bằng dấu phẩy hoặc xuống dòng.';

  @override
  String get getCode => 'Lấy mã';

  @override
  String get getNewCode => 'Lấy mã mới';

  @override
  String get getStarted => 'Bắt đầu';

  @override
  String get welcomeCta => 'Bắt đầu thôi';

  @override
  String get inviteAsAdmin => 'Mời làm quản trị viên';

  @override
  String get inviteByEmail => 'Mời qua email';

  @override
  String get inviteExpired => 'Đã hết hạn';

  @override
  String inviteExpires(String when) {
    return 'Hết hạn $when';
  }

  @override
  String get inviteInvalid => 'Lời mời này không hoạt động';

  @override
  String get inviteInvalidHelp =>
      'Có thể đã hết hạn, hết lượt dùng hoặc đã bị tắt. Hãy xin lời mời mới.';

  @override
  String get inviteLink => 'Liên kết mời';

  @override
  String get inviteLinkApprovalHelp =>
      'Bất kỳ ai có liên kết này đều có thể yêu cầu tham gia. Bạn phê duyệt bên dưới.';

  @override
  String get inviteLinkHelp =>
      'Bất kỳ ai có liên kết này đều có thể tham gia làm thành viên. Chia sẻ trong chat hoặc email.';

  @override
  String get inviteLinkOrCode => 'Liên kết hoặc mã mời';

  @override
  String inviteOtherServer(String host) {
    return 'Lời mời này dành cho $host, còn ứng dụng đang kết nối với máy chủ khác.';
  }

  @override
  String get inviteRenewed =>
      'Lời mời có hiệu lực thêm 7 ngày. Hãy gửi cho họ liên kết mới.';

  @override
  String inviteSentTo(String email) {
    return 'Đăng nhập bằng $email để chấp nhận.';
  }

  @override
  String inviteShareText(String workspace, String url) {
    return 'Tham gia $workspace trên Casama: $url';
  }

  @override
  String invitedBy(String name) {
    return '$name đã mời bạn tham gia';
  }

  @override
  String get invitedToJoin => 'Bạn được mời tham gia';

  @override
  String invitesSent(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã gửi $countString lời mời.',
      one: 'Đã gửi lời mời.',
    );
    return '$_temp0';
  }

  @override
  String get joinAsAdmin => 'Bạn sẽ tham gia với vai trò quản trị viên';

  @override
  String get joinAsMember => 'Bạn sẽ tham gia với vai trò thành viên';

  @override
  String get joinByDomain => 'Tham gia theo tên miền email';

  @override
  String get joinByDomainHelp =>
      'Địa chỉ đã xác minh có thể tham gia không cần lời mời.';

  @override
  String joinByDomainSwitch(String domain) {
    return 'Bất kỳ ai có email @$domain đã xác minh đều có thể tham gia';
  }

  @override
  String get joinByDomainUnavailable =>
      'Khả dụng khi bạn đăng nhập bằng email công việc đã xác minh (không dùng gmail.com và tương tự).';

  @override
  String get joinNeedsApproval =>
      'Quản trị viên phê duyệt người mới trước khi họ tham gia.';

  @override
  String get joinRequestSent => 'Đã gửi yêu cầu';

  @override
  String joinRequestSentHelp(String name) {
    return 'Quản trị viên của $name sẽ xem xét yêu cầu. Bạn sẽ nhận được thông báo khi được duyệt vào.';
  }

  @override
  String get joinWithLinkOrCode => 'Tham gia bằng liên kết hoặc mã';

  @override
  String get spacesInvite => 'Mời mọi người';

  @override
  String spacesInviteTo(String name) {
    return 'Vào $name';
  }

  @override
  String get spacesNew => 'Không gian làm việc mới';

  @override
  String get spacesNewHint => 'Có bot, thành viên và thanh toán riêng';

  @override
  String get spacesJoin => 'Tham gia không gian làm việc';

  @override
  String get spacesJoinHint => 'Bằng liên kết hoặc mã mời';

  @override
  String joinWorkspaceNamed(String name) {
    return 'Tham gia $name';
  }

  @override
  String get joinedBotsHelp =>
      'Các bot ở đây sẵn sàng hỗ trợ. Hãy chào một bot để bắt đầu.';

  @override
  String get joinedNoBots =>
      'Chưa có bot nào ở đây. Hãy tạo một bot hoặc xem quanh trước.';

  @override
  String memberCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString thành viên',
      one: '1 thành viên',
    );
    return '$_temp0';
  }

  @override
  String get members => 'Thành viên';

  @override
  String openToDomain(String domain) {
    return 'Mở cho @$domain';
  }

  @override
  String openWorkspace(String name) {
    return 'Mở $name';
  }

  @override
  String get pendingInvites => 'Lời mời chưa được chấp nhận';

  @override
  String get people => 'Mọi người';

  @override
  String get workspaceAdvancedSummary =>
      'Bí mật, trí nhớ, mã hóa, thanh toán, MCP';

  @override
  String get peopleAdvancedSummary =>
      'Mã mời, tên miền email, liên kết tùy chỉnh';

  @override
  String get inviteLinkToCopy => 'Liên kết mời, sẵn sàng sao chép';

  @override
  String linkMade(String when) {
    return 'Đã tạo $when';
  }

  @override
  String get billingAdvancedSummary =>
      'Phí theo máy chủ, máy chủ Casama Link và khóa';

  @override
  String get billingChargesSummary => 'Phí theo máy chủ';

  @override
  String get billingUsageRow => 'Những gì bot đã dùng và chi phí';

  @override
  String billingUsageSoFar(String amount) {
    return 'Tháng này tới nay: $amount';
  }

  @override
  String get usageAdvancedSummary => 'Số token, xuất JSON';

  @override
  String get peopleHelp => 'Mời mọi người và quyết định ai được vào.';

  @override
  String get peopleRow => 'Mời mọi người, phê duyệt yêu cầu, xem thành viên';

  @override
  String get qrCode => 'Mã QR';

  @override
  String get remove => 'Gỡ';

  @override
  String get resendInvite => 'Gửi lại';

  @override
  String get resetLink => 'Đặt lại liên kết';

  @override
  String get resetLinkHelp =>
      'Liên kết hiện tại ngừng hoạt động ngay và bạn nhận liên kết mới. Người đã vào vẫn ở lại.';

  @override
  String get revokeInvite => 'Hủy lời mời';

  @override
  String scanToJoin(String name) {
    return 'Quét để tham gia $name';
  }

  @override
  String sendInvitesCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Gửi $countString lời mời';
  }

  @override
  String get sendInvitesYourself => 'Tự gửi các lời mời này';

  @override
  String get sendInvitesYourselfHelp =>
      'Email chưa được thiết lập trên máy chủ này. Hãy gửi cho mỗi người liên kết của họ và họ sẽ đăng nhập bằng địa chỉ đó để tham gia.';

  @override
  String get signInToJoin => 'Đăng nhập để tham gia';

  @override
  String get startOwnWorkspace => 'Tạo không gian làm việc của riêng tôi';

  @override
  String switchToServer(String host) {
    return 'Chuyển sang $host';
  }

  @override
  String get waitingToJoin => 'Đang chờ tham gia';

  @override
  String welcomeToWorkspace(String name) {
    return 'Chào mừng đến với $name';
  }

  @override
  String get workspacesYouCanJoin => 'Không gian làm việc bạn có thể tham gia';

  @override
  String get yourTeamIsHere => 'Đội ngũ của bạn đã có mặt ở đây';

  @override
  String yourTeamIsHereHelp(String domain) {
    return 'Mọi người tại $domain đang dùng các không gian làm việc này. Hãy tham gia một không gian hoặc tự tạo cho mình.';
  }

  @override
  String get inviteCodeCardHelp =>
      'Dễ đọc to hoặc nhập tay. Có hiệu lực trong 48 giờ. Mọi người nhập mã tại mục Tham gia bằng liên kết hoặc mã.';

  @override
  String get inviteSomeoneNew => 'Mời người mới vào không gian làm việc';

  @override
  String oauthNeedsHttps(String app, String address) {
    return '$app chỉ đăng nhập trên địa chỉ bảo mật (https), còn máy chủ Casama này đang ở $address. Hãy chạy Casama qua https để dùng tính năng đăng nhập.';
  }

  @override
  String get aboutYou => 'Giới thiệu về bạn';

  @override
  String get aboutYouRow =>
      'Cách bot gọi tên bạn và những gì chúng biết về bạn';

  @override
  String get aboutYouIntro =>
      'Bot đọc mục này để gọi đúng tên bạn và trả lời theo cách bạn thích. Chỉ mình bạn xem được.';

  @override
  String get photoChange => 'Đổi ảnh hồ sơ';

  @override
  String get photoTake => 'Chụp ảnh';

  @override
  String get photoChoose => 'Chọn ảnh';

  @override
  String get photoUseGoogle => 'Dùng ảnh Google của tôi';

  @override
  String get photoRemove => 'Xóa ảnh';

  @override
  String get photoUnreadable =>
      'Tệp này không phải ảnh mà Casama dùng được. Hãy thử ảnh JPEG hoặc PNG.';

  @override
  String get whatToCallYou => 'Bot nên gọi bạn là gì?';

  @override
  String get pronounsOptional => 'Đại từ nhân xưng (không bắt buộc)';

  @override
  String get aboutMe => 'Về tôi';

  @override
  String get aboutMeHint =>
      'Công việc, những người xung quanh, sở thích của bạn. Bất cứ điều gì hữu ích.';

  @override
  String get replyStyle => 'Cách tôi thích được trả lời';

  @override
  String get replyStyleHint =>
      'Ví dụ: trả lời ngắn gọn, không dùng emoji, giải thích như cho người mới';

  @override
  String get learnAboutMe => 'Học về tôi từ trò chuyện';

  @override
  String get learnAboutMeHelp =>
      'Bot lưu các thông tin về bạn. Bạn sửa lại bất cứ lúc nào.';

  @override
  String get adultSites => 'Trang web người lớn';

  @override
  String get adultSitesHelp =>
      'Bot có thể mở trang web người lớn khi bạn yêu cầu. Chỉ dành cho người từ 18 tuổi trở lên.';

  @override
  String get adultSitesConfirmTitle => 'Bật trang web người lớn?';

  @override
  String get adultSitesConfirmBody =>
      'Bạn xác nhận mình từ 18 tuổi trở lên. Khi bạn yêu cầu, bot có thể mở trang web người lớn giúp bạn và liệt kê nội dung trên đó dưới dạng văn bản. Tính năng này hoạt động khi bạn yêu cầu từ Casama trên web hoặc ứng dụng máy tính, không hoạt động trong trò chuyện chung.';

  @override
  String get adultSitesConfirm => 'Tôi từ 18 tuổi trở lên';

  @override
  String get adultSitesApprovalDetail =>
      'Cho phép nghĩa là bạn xác nhận mình từ 18 tuổi trở lên và bật trang web người lớn cho tài khoản của mình. Bạn có thể tắt mục này trong Giới thiệu về bạn.';

  @override
  String useInThisSpace(String workspace) {
    return 'Dùng thông tin tôi đã chia sẻ trong $workspace';
  }

  @override
  String get useInThisSpaceHelp =>
      'Tắt: chỉ tên và cách trả lời của bạn được dùng ở đây.';

  @override
  String get learnedAboutYou => 'Điều bot đã học';

  @override
  String get noLearnedFacts =>
      'Chưa có gì. Thông tin bot học được về bạn trong lúc trò chuyện sẽ hiện ở đây.';

  @override
  String get addFact => 'Thêm thông tin';

  @override
  String get editFact => 'Sửa thông tin';

  @override
  String get deleteFactTitle => 'Xóa thông tin này?';

  @override
  String get deleteFactConfirm =>
      'Bot của bạn sẽ không còn biết thông tin này nữa.';

  @override
  String get importToProfile => 'Nhập từ ChatGPT hoặc Claude';

  @override
  String get savedToProfile => 'Đã lưu vào hồ sơ của bạn';

  @override
  String get undo => 'Hoàn tác';

  @override
  String get suggestedLookApplied => 'Đã áp dụng diện mạo mới';

  @override
  String get suggestedLookUnavailable => 'Ứng dụng này không có diện mạo đó';

  @override
  String get removedFromProfile => 'Đã xóa khỏi hồ sơ của bạn';

  @override
  String factsImported(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã thêm $countString thông tin',
      one: 'Đã thêm 1 thông tin',
    );
    return '$_temp0';
  }

  @override
  String get nameCardHelp =>
      'Bot sẽ dùng tên này trong mọi không gian làm việc. Bạn có thể đổi sau trong Cài đặt → Giới thiệu về bạn.';

  @override
  String get nameStepBubble => 'Rất vui được gặp bạn!';

  @override
  String get heardFromTitle => 'Bạn biết đến chúng tôi qua đâu?';

  @override
  String get heardFromHelp =>
      'Một lần chạm giúp chúng tôi biết kênh nào hiệu quả. Bạn có thể bỏ qua.';

  @override
  String get heardFromInstagram => 'Instagram';

  @override
  String get heardFromFacebook => 'Facebook';

  @override
  String get heardFromTiktok => 'TikTok';

  @override
  String get heardFromYoutube => 'YouTube';

  @override
  String get heardFromFriend => 'Bạn bè';

  @override
  String get heardFromSearch => 'Tìm kiếm';

  @override
  String get heardFromAiAssistant => 'Một trợ lý AI';

  @override
  String get heardFromOther => 'Khác';

  @override
  String get heardFromSkip => 'Bỏ qua';

  @override
  String get nameStepHint => 'Tên của bạn';

  @override
  String get skillCatalogSubtitle =>
      'Các kỹ năng dựng sẵn mà bot nạp vào khi công việc cần đến.';

  @override
  String get skillCategoryWork => 'Công việc';

  @override
  String get skillCategoryWriting => 'Viết lách';

  @override
  String get skillCategoryResearch => 'Nghiên cứu';

  @override
  String get skillCategoryData => 'Dữ liệu';

  @override
  String get skillCategoryMoney => 'Tài chính';

  @override
  String get skillCategoryBuild => 'Xây dựng';

  @override
  String get skillCategoryLife => 'Đời sống';

  @override
  String skillCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kỹ năng',
      one: '1 kỹ năng',
    );
    return '$_temp0';
  }

  @override
  String get skillInstalledBadge => 'Đã cài đặt';

  @override
  String skillInstalledFor(String names) {
    return 'Đã cài đặt cho $names';
  }

  @override
  String installSkillFor(String name) {
    return 'Cài đặt $name cho';
  }

  @override
  String skillUseHint(String name) {
    return 'Bot tự nạp kỹ năng này khi phù hợp, hoặc bạn gõ /$name trong cuộc trò chuyện để dùng.';
  }

  @override
  String get skillInstructions => 'Hướng dẫn';

  @override
  String get skillAlreadyEverywhere => 'Đã cài đặt ở mọi nơi có thể.';

  @override
  String get gallery => 'Kho mẫu';

  @override
  String get galleryEmpty => 'Không có gì trong Kho mẫu phù hợp.';

  @override
  String get galleryOffline =>
      'Hiện không kết nối được với Kho mẫu. Các diện mạo và kỹ năng tích hợp sẵn vẫn ở đây.';

  @override
  String get galleryUse => 'Dùng';

  @override
  String get galleryInstall => 'Cài đặt';

  @override
  String get galleryReport => 'Báo cáo';

  @override
  String get galleryShare => 'Chia sẻ lên Kho mẫu';

  @override
  String galleryBy(String name) {
    return 'Của $name';
  }

  @override
  String get galleryFeatured => 'Nổi bật';

  @override
  String get galleryAll => 'Tất cả';

  @override
  String get galleryThemes => 'Diện mạo';

  @override
  String get gallerySchemes => 'Màu sắc';

  @override
  String get galleryWallpapers => 'Hình nền';

  @override
  String get gallerySkills => 'Kỹ năng';

  @override
  String get fromGallery => 'Kho mẫu';

  @override
  String galleryApplied(String name) {
    return 'Đang dùng $name';
  }

  @override
  String get gallerySeeAll => 'Xem tất cả';

  @override
  String get galleryInUse => 'Đang dùng';

  @override
  String galleryInstalled(String name) {
    return 'Đã cài đặt $name';
  }

  @override
  String get galleryPreviewDark => 'Xem trước chế độ tối';

  @override
  String get galleryPreviewLight => 'Xem trước chế độ sáng';

  @override
  String get galleryClearSearch => 'Xóa tìm kiếm';

  @override
  String get galleryOfflineTitle => 'Kho mẫu đang ngoại tuyến';

  @override
  String galleryNoMatches(String query) {
    return 'Không có gì khớp với “$query”';
  }

  @override
  String get galleryInstructions => 'Hướng dẫn';

  @override
  String galleryPatternOn(String pattern, String palette) {
    return '$pattern trên $palette';
  }

  @override
  String get galleryImage => 'Hình ảnh';

  @override
  String get galleryMeshGradient => 'dải màu chuyển sắc';

  @override
  String get galleryOwnDoodles => 'Hình vẽ riêng';

  @override
  String get galleryLightAndDark => 'Sáng và tối';

  @override
  String get galleryContribute =>
      'Bạn tạo được diện mạo ưng ý? Chia sẻ để mọi người trên Casama cùng tìm thấy ở đây.';

  @override
  String get galleryTypeTheme => 'Diện mạo';

  @override
  String get galleryTypeScheme => 'Bảng màu';

  @override
  String get galleryTypeWallpaper => 'Hình nền';

  @override
  String get galleryTypeSkill => 'Kỹ năng';

  @override
  String get galleryBehindChats => 'Phía sau cuộc trò chuyện';

  @override
  String celebrateNewBot(String name) {
    return 'Chào $name nhé!';
  }

  @override
  String celebrateNewSpace(String name) {
    return '$name đã sẵn sàng!';
  }

  @override
  String get celebrateJoined =>
      'Bạn đã vào rồi! Chào mừng đến với không gian này.';

  @override
  String celebrateNewRoutine(String name) {
    return '$name đã sẵn sàng.';
  }

  @override
  String get fewerEffects => 'Giảm hiệu ứng';

  @override
  String get fewerEffectsHelp =>
      'Tắt pháo giấy chúc mừng, tab nảy và ảnh động của bot.';

  @override
  String get haptics => 'Phản hồi xúc giác';

  @override
  String get trackpadHaptics => 'Xúc giác bàn di chuột';

  @override
  String get hapticsHelp =>
      'Rung nhẹ khi có việc diễn ra hoặc khi bot cần bạn.';

  @override
  String get watchHaptics => 'Xúc giác';

  @override
  String get settingsAppSection => 'Ứng dụng';

  @override
  String get settingsSecuritySection => 'Đăng nhập & bảo mật';

  @override
  String get customize => 'Tùy chỉnh';

  @override
  String get customizeColors => 'Màu sắc';

  @override
  String get appearanceCustomLook => 'Diện mạo tùy chỉnh';

  @override
  String get appearanceCustomHelp =>
      'Thay đổi của riêng bạn. Lưu thành diện mạo để giữ lại.';

  @override
  String get appearanceFromGallery => 'Từ Kho mẫu';

  @override
  String appearanceShowAll(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    return 'Hiện tất cả $countString';
  }

  @override
  String appearanceSwitched(String name) {
    return 'Đã chuyển sang $name';
  }

  @override
  String appearanceSaved(String name) {
    return 'Đã lưu $name vào diện mạo của bạn';
  }

  @override
  String get appearanceAboutTheme => 'Về diện mạo này';

  @override
  String settingsOnDevServer(String host) {
    return 'Cài đặt · máy chủ phát triển $host';
  }

  @override
  String chatPreviewYou(String text) {
    return 'Bạn: $text';
  }

  @override
  String get chatPreviewPhoto => 'Ảnh';

  @override
  String get chatPreviewVideo => 'Video';

  @override
  String get chatPreviewVoice => 'Tin nhắn thoại';

  @override
  String get chatPreviewNone => 'Chưa có tin nhắn';

  @override
  String get chatTimeYesterday => 'Hôm qua';

  @override
  String get chatDayToday => 'Hôm nay';

  @override
  String chatDayAndTime(String day, String time) {
    return '$day · $time';
  }

  @override
  String messageSentAt(String day, String time) {
    return '$day lúc $time';
  }

  @override
  String get anyPriority => 'Mọi mức độ ưu tiên';

  @override
  String get readingAloud => 'Đang đọc to';

  @override
  String get readAloudPreparing => 'Đang chuẩn bị…';

  @override
  String get readAloudPaused => 'Đã tạm dừng';

  @override
  String get stopReading => 'Dừng đọc';

  @override
  String get readAloudSpeed => 'Tốc độ phát';

  @override
  String readAloudTimeLeft(String time) {
    return 'Còn $time';
  }

  @override
  String get readAloudShowMessage => 'Hiện tin nhắn đang đọc';

  @override
  String mentionOpenProfile(String name) {
    return '$name, mở hồ sơ';
  }

  @override
  String get paywallSubtitle =>
      'Thêm bot, thêm giờ dùng máy tính và tín dụng mới mỗi tháng để bot tiếp tục làm việc.';

  @override
  String get paywallPerkBots => 'Bot';

  @override
  String get paywallPerkBotsBody =>
      'Cả một đội ngũ, mỗi bot phụ trách một việc riêng.';

  @override
  String get paywallPerkComputers => 'Giờ dùng máy tính';

  @override
  String get paywallPerkComputersBody =>
      'Bot có máy tính riêng để duyệt web, viết mã và xây dựng.';

  @override
  String get paywallPerkCredits => 'Tín dụng hằng tháng';

  @override
  String get paywallPerkCreditsBody => 'Dành cho mô hình, tìm kiếm và công cụ.';

  @override
  String get paywallPerkSeats => 'Suất thành viên';

  @override
  String get paywallPerkSeatsBody =>
      'Đưa cả đội của bạn vào chung một không gian làm việc.';

  @override
  String paywallHours(String hours) {
    return '$hours giờ';
  }

  @override
  String get paywallWeekly => 'Hằng tuần';

  @override
  String get paywallMonthly => 'Hằng tháng';

  @override
  String get paywallYearly => 'Hằng năm';

  @override
  String get paywallPerMonth => '/ tháng';

  @override
  String get paywallPerYear => '/ năm';

  @override
  String get paywallContinue => 'Tiếp tục';

  @override
  String get paywallContinueCheckout => 'Tiếp tục thanh toán';

  @override
  String get paywallRestore => 'Khôi phục';

  @override
  String get paywallFineStore =>
      'Tự động gia hạn. Hủy bất cứ lúc nào trong cài đặt cửa hàng.';

  @override
  String get paywallFineWeb =>
      'Tự động gia hạn. Hủy bất cứ lúc nào từ mục Thanh toán.';

  @override
  String paywallStoreDisclosure(String price, String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store':
          '$price, tự động gia hạn cho đến khi bạn hủy. Khoản thanh toán được tính vào Tài khoản Apple của bạn. Hủy bất cứ lúc nào trong phần cài đặt Tài khoản Apple ít nhất 24 giờ trước khi gia hạn.',
      'google_play':
          '$price, tự động gia hạn cho đến khi bạn hủy. Khoản thanh toán được tính vào tài khoản Google Play của bạn. Hủy bất cứ lúc nào trong phần cài đặt tài khoản Google Play ít nhất 24 giờ trước khi gia hạn.',
      'other':
          '$price, tự động gia hạn cho đến khi bạn hủy. Khoản thanh toán được tính vào tài khoản cửa hàng của bạn. Hủy bất cứ lúc nào trong phần cài đặt tài khoản cửa hàng ít nhất 24 giờ trước khi gia hạn.',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreDisclosureTrial(int days, String price, String store) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Miễn phí $days ngày, sau đó là $price, tự động gia hạn cho đến khi bạn hủy.',
      one:
          'Miễn phí 1 ngày, sau đó là $price, tự động gia hạn cho đến khi bạn hủy.',
    );
    String _temp1 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Miễn phí $days ngày, sau đó là $price, tự động gia hạn cho đến khi bạn hủy.',
      one:
          'Miễn phí 1 ngày, sau đó là $price, tự động gia hạn cho đến khi bạn hủy.',
    );
    String _temp2 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Miễn phí $days ngày, sau đó là $price, tự động gia hạn cho đến khi bạn hủy.',
      one:
          'Miễn phí 1 ngày, sau đó là $price, tự động gia hạn cho đến khi bạn hủy.',
    );
    String _temp3 = intl.Intl.selectLogic(store, {
      'app_store':
          '$_temp0 Khoản thanh toán được tính vào Tài khoản Apple của bạn khi hết thời gian dùng thử. Hủy trong phần cài đặt Tài khoản Apple ít nhất 24 giờ trước khi hết thời gian dùng thử để không bị tính phí.',
      'google_play':
          '$_temp1 Khoản thanh toán được tính vào tài khoản Google Play của bạn khi hết thời gian dùng thử. Hủy trong phần cài đặt tài khoản Google Play ít nhất 24 giờ trước khi hết thời gian dùng thử để không bị tính phí.',
      'other':
          '$_temp2 Khoản thanh toán được tính vào tài khoản cửa hàng của bạn khi hết thời gian dùng thử. Hủy trong phần cài đặt tài khoản cửa hàng ít nhất 24 giờ trước khi hết thời gian dùng thử để không bị tính phí.',
    });
    return '$_temp3';
  }

  @override
  String get paywallStartFreeTrial => 'Bắt đầu dùng thử miễn phí';

  @override
  String paywallTrialThenYearly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày miễn phí, sau đó $price/năm',
      one: '1 ngày miễn phí, sau đó $price/năm',
    );
    return '$_temp0';
  }

  @override
  String paywallTrialThenMonthly(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày miễn phí, sau đó $price/tháng',
      one: '1 ngày miễn phí, sau đó $price/tháng',
    );
    return '$_temp0';
  }

  @override
  String paywallDisclosureWeb(String price) {
    return '$price, tự động gia hạn cho đến khi bạn hủy. Hủy bất cứ lúc nào từ mục Thanh toán; bạn vẫn giữ gói cho đến hết kỳ.';
  }

  @override
  String paywallDisclosureWebTrial(int days, String price) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other:
          'Miễn phí $days ngày, sau đó là $price, tự động gia hạn cho đến khi bạn hủy.',
      one:
          'Miễn phí 1 ngày, sau đó là $price, tự động gia hạn cho đến khi bạn hủy.',
    );
    return '$_temp0 Hủy từ mục Thanh toán trước khi hết thời gian dùng thử để không bị tính phí.';
  }

  @override
  String paywallPriceWithPeriod(String price, String period) {
    String _temp0 = intl.Intl.selectLogic(period, {
      'week': '$price mỗi tuần',
      'year': '$price mỗi năm',
      'other': '$price mỗi tháng',
    });
    return '$_temp0';
  }

  @override
  String get termsOfUse => 'Điều khoản sử dụng';

  @override
  String get privacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get aiConsentTitle =>
      'Cuộc trò chuyện của bạn được gửi tới các công ty AI';

  @override
  String get aiConsentBody =>
      'Để viết câu trả lời, Casama gửi những gì bạn chia sẻ với bot tới các nhà cung cấp AI bên ngoài. Không có gì được gửi đi cho đến khi bạn đồng ý.';

  @override
  String get aiConsentUpdatedNotice =>
      'Chúng tôi đã thêm các trang web vào danh sách này.';

  @override
  String get aiConsentWhatTitle => 'Dữ liệu được gửi đi';

  @override
  String get aiConsentWhat =>
      'Tin nhắn, tệp và ảnh của bạn, giọng nói trong cuộc gọi, tin nhắn thoại và đọc chính tả, những gì bot nhớ về bạn, các trang web bot mở giúp bạn (trên máy tính của bot hoặc trong trình duyệt trên thiết bị này) và bất kỳ dữ liệu điện thoại nào bạn bật như lịch hay sức khỏe.';

  @override
  String get aiConsentWhoTitle => 'Bên nhận dữ liệu';

  @override
  String get aiConsentWho =>
      'OpenRouter, đơn vị chuyển tiếp dữ liệu tới công ty tạo ra mô hình bạn dùng như DeepSeek, Google hoặc OpenAI. Cuộc gọi dùng Google Gemini, còn OpenAI chuyển tin nhắn thoại và đọc chính tả thành văn bản. Tìm kiếm web đi qua Parallel, Serper hoặc DeepSeek. Nếu dùng khóa API của bạn, dữ liệu sẽ đi thẳng tới nhà cung cấp đó.';

  @override
  String get aiConsentWhyTitle => 'Họ dùng dữ liệu để làm gì';

  @override
  String get aiConsentWhy =>
      'Họ dùng dữ liệu để tạo câu trả lời. Bạn có thể dừng việc này bất cứ lúc nào trong Cài đặt › Quyền riêng tư; chi tiết xem trong chính sách quyền riêng tư.';

  @override
  String get aiConsentAgree => 'Đồng ý và tiếp tục';

  @override
  String get aiConsentTile => 'Nhà cung cấp AI';

  @override
  String get aiConsentTileOn =>
      'Đã cho phép. Nội dung bạn chia sẻ với bot được gửi tới các nhà cung cấp AI bên ngoài để viết câu trả lời.';

  @override
  String get aiConsentWithdrawQuestion => 'Dừng chia sẻ với nhà cung cấp AI?';

  @override
  String get aiConsentWithdrawBody =>
      'Bot không thể trả lời nếu thiếu các nhà cung cấp này. Casama sẽ hỏi lại trước khi gửi thêm bất kỳ dữ liệu nào.';

  @override
  String get aiConsentWithdraw => 'Dừng chia sẻ';

  @override
  String get planChanged => 'Đã đổi gói';

  @override
  String get purchasesRestored => 'Đã khôi phục giao dịch mua';

  @override
  String get creditsAdded => 'Đã thêm tín dụng';

  @override
  String get purchasePending =>
      'Đang chờ phê duyệt giao dịch mua. Giao dịch sẽ được ghi nhận ngay khi được phê duyệt.';

  @override
  String get purchaseFailed =>
      'Giao dịch mua không thành công và bạn không bị tính phí.';

  @override
  String get purchaseVerifyFailed =>
      'Chưa xác nhận được giao dịch mua. Hệ thống sẽ tự thử lại; nếu sớm vẫn chưa thấy, hãy chạm Khôi phục giao dịch mua.';

  @override
  String paywallTitleFor(String plan) {
    return 'Mở rộng đội ngũ với $plan';
  }

  @override
  String paywallWelcomePlan(String plan) {
    return 'Chào mừng đến với $plan!';
  }

  @override
  String paywallMonthsFree(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Miễn phí $n tháng',
      one: 'Miễn phí 1 tháng',
    );
    return '$_temp0';
  }

  @override
  String paywallSwitchTo(String plan) {
    return 'Chuyển sang $plan';
  }

  @override
  String subscribedThroughStoreNote(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Bạn đăng ký trả phí qua App Store. Để đổi gói, hãy dùng App Store trên thiết bị bạn đã đăng ký.',
      'google_play': 'Bạn đăng ký trả phí qua Google Play. Để đổi gói, hãy dùng Google Play trên thiết bị bạn đã đăng ký.',
      'other': 'Bạn đăng ký trả phí qua một cửa hàng ứng dụng. Để đổi gói, hãy dùng cửa hàng đó trên thiết bị bạn đã đăng ký.',
    });
    return '$_temp0';
  }

  @override
  String get subscribedOnWebNote =>
      'Bạn đăng ký trả phí trên web. Hãy đổi gói tại đây qua thanh toán web hoặc quản lý gói đăng ký của bạn.';

  @override
  String get subscribedOutsideAppNote =>
      'Gói đăng ký của bạn được thanh toán bên ngoài ứng dụng này nên không thể đổi tại đây.';

  @override
  String get outOfCreditsTitle => 'Bạn đã hết tín dụng';

  @override
  String get outOfCreditsPaidBody =>
      'Bot sẽ tạm dừng cho đến khi bạn thêm tín dụng. Gói tín dụng mua từ App Store hoặc Google Play không bao giờ hết hạn; gói tín dụng mua trên web có thời hạn 12 tháng.';

  @override
  String get outOfCreditsFreeBody =>
      'Nâng cấp để có thêm tín dụng mỗi tháng, nhiều bot hơn và nhiều giờ dùng máy tính hơn.';

  @override
  String get addCredits => 'Thêm tín dụng';

  @override
  String get seePlansButton => 'Xem các gói';

  @override
  String get paywallAskAdmin =>
      'Chỉ chủ sở hữu và quản trị viên không gian làm việc mới đổi được gói. Hãy nhờ một trong số họ nâng cấp.';

  @override
  String get upgradeToPro => 'Nâng cấp lên Pro';

  @override
  String get upgradeToProBody =>
      'Thêm bot, giờ dùng máy tính và tín dụng hằng tháng.';

  @override
  String get manageTab => 'Quản lý';

  @override
  String get vitalsCpu => 'CPU';

  @override
  String get vitalsMemory => 'Bộ nhớ';

  @override
  String get vitalsDisk => 'Ổ đĩa';

  @override
  String get fixItTitle => 'Hoạt động chưa ổn?';

  @override
  String get fixItSubtitle =>
      'Hãy thử lần lượt các cách sau. Mỗi bước sẽ xử lý sâu hơn một chút.';

  @override
  String get fixRestart => 'Khởi động lại';

  @override
  String get fixRestartHelp => 'Khoảng 20 giây · không mất gì';

  @override
  String get fixResetSystem => 'Đặt lại hệ thống';

  @override
  String get fixResetSystemHelp => 'Hệ thống mới sạch sẽ · tệp của bạn vẫn còn';

  @override
  String get fixErase => 'Xóa toàn bộ';

  @override
  String get fixEraseHelp => 'Như mới · hoàn tác được trong 7 ngày';

  @override
  String get fixResetAction => 'Đặt lại…';

  @override
  String get fixEraseAction => 'Xóa…';

  @override
  String get computerRestarting => 'Đang khởi động lại…';

  @override
  String get computerRestarted =>
      'Đã khởi động lại. Mọi tệp của bạn vẫn còn nguyên.';

  @override
  String get computerUpdateTitle => 'Có bản cập nhật mới';

  @override
  String get computerUpdateBody =>
      'Các công cụ và bản sửa lỗi mới đã sẵn sàng. Cập nhật sẽ khởi động lại máy tính này: tệp của bạn vẫn còn, các cửa sổ và chương trình đang mở sẽ đóng lại.';

  @override
  String get computerUpdateBotWorking =>
      'Một bot đang làm việc trên máy tính này. Cập nhật sẽ dừng việc bot đang làm.';

  @override
  String get computerUpdateNow => 'Cập nhật ngay';

  @override
  String get computerUpdateLater => 'Để sau';

  @override
  String get computerUpdateConfirmTitle => 'Cập nhật máy tính này?';

  @override
  String get computerUpdateMenu => 'Cập nhật máy tính';

  @override
  String get computerUpdating => 'Đang cập nhật…';

  @override
  String get computerUpdated => 'Đã cập nhật. Mọi tệp của bạn vẫn còn nguyên.';

  @override
  String get computerUpdateBusyTitle => 'Một lệnh vẫn đang chạy';

  @override
  String get computerUpdateBusyBody =>
      'Cập nhật ngay sẽ dừng lệnh đó. Hãy đợi lệnh xong hoặc cứ cập nhật.';

  @override
  String get computerUpdateAnyway => 'Cứ cập nhật';

  @override
  String resetSheetTitle(String name) {
    return 'Đặt lại $name';
  }

  @override
  String resetSheetBusy(String bots) {
    return '$bots không thể dùng máy này trong khoảng một phút.';
  }

  @override
  String get resetSheetBusyNone => 'Máy không thể dùng trong khoảng một phút.';

  @override
  String get resetOptionSystem => 'Đặt lại hệ thống, giữ lại tệp của tôi';

  @override
  String get resetOptionSystemHelp =>
      'Sửa các bản cài đặt lỗi, cài đặt hệ thống và chương trình bị kẹt.';

  @override
  String get resetOptionErase => 'Xóa toàn bộ';

  @override
  String get resetOptionEraseHelp => 'Trở về như một máy tính hoàn toàn mới.';

  @override
  String get resetKept => 'Được giữ lại';

  @override
  String get resetRemoved => 'Bị xóa';

  @override
  String get resetKeptFiles => 'Tệp của bạn trong thư mục workspace';

  @override
  String get resetKeptSettings => 'Tên, cài đặt và các bot';

  @override
  String get resetKeptRestorePoints => 'Điểm khôi phục';

  @override
  String get resetRemovedApps => 'Ứng dụng và công cụ bạn đã cài';

  @override
  String get resetRemovedPrograms => 'Các chương trình đang chạy';

  @override
  String get resetRemovedCaches => 'Bộ nhớ đệm và cài đặt thư mục cá nhân';

  @override
  String get resetRemovedFiles => 'Mọi tệp, kể cả không gian làm việc';

  @override
  String get resetSavePoint => 'Lưu điểm khôi phục trước';

  @override
  String get resetSavePointHelp => 'Để bạn có thể hoàn tác trong 7 ngày';

  @override
  String eraseTypeName(String name) {
    return 'Nhập $name để xác nhận';
  }

  @override
  String get resetConfirmSystem => 'Đặt lại hệ thống';

  @override
  String get resetConfirmErase => 'Xóa toàn bộ';

  @override
  String get resetStepSaving => 'Đang lưu điểm khôi phục';

  @override
  String get resetStepWipingSystem => 'Đang gỡ ứng dụng và cài đặt';

  @override
  String get resetStepWipingErase => 'Đang xóa mọi tệp';

  @override
  String get resetStepRestarting => 'Đang khởi tạo hệ thống mới';

  @override
  String resettingStatus(int step, int total) {
    final intl.NumberFormat stepNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String stepString = stepNumberFormat.format(step);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Đang đặt lại… $stepString / $totalString';
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

    return 'Đang xóa… $stepString / $totalString';
  }

  @override
  String get resetLeaveHint =>
      'Bạn có thể rời màn hình này. Quá trình sẽ tự tiếp tục.';

  @override
  String get resetDone => 'Hệ thống mới đã sẵn sàng';

  @override
  String get eraseDone => 'Đã xóa sạch máy tính';

  @override
  String get resetFailed => 'Quá trình đặt lại chưa hoàn tất';

  @override
  String get resetUndoHint =>
      'Hoàn tác sẽ đưa mọi thứ trở lại như cũ. Điểm khôi phục được giữ trong 7 ngày.';

  @override
  String get restoredPrevious => 'Đã khôi phục lại như trước';

  @override
  String get usageThisMonth => 'Tháng này';

  @override
  String usageDuration(int hours, int minutes) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    return '$hoursString giờ $minutesString phút';
  }

  @override
  String get usageCostNote =>
      'Chỉ tính phí khi đang bật. Lúc ngủ không tốn phí.';

  @override
  String get usageNone => 'Chưa dùng trong tháng này';

  @override
  String get sleepTimerTitle => 'Tự chuyển sang ngủ sau';

  @override
  String sleepTimerMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString phút';
  }

  @override
  String get sleepTimerHour => '1 giờ';

  @override
  String get sleepTimerHelp =>
      'Không bao giờ ngủ khi bot đang làm việc hoặc bạn đang dùng máy. Thời gian chờ càng lâu, máy bật càng lâu và tốn nhiều chi phí hơn.';

  @override
  String sleepTimerSaved(String label) {
    return 'Ngủ sau $label không hoạt động';
  }

  @override
  String get storageTitle => 'Dung lượng';

  @override
  String storageOf(String total) {
    return 'trên $total';
  }

  @override
  String get storageFiles => 'Tệp của bạn';

  @override
  String get storageApps => 'Ứng dụng và công cụ';

  @override
  String get storageCaches => 'Bộ nhớ đệm';

  @override
  String get storageBrowser => 'Trình duyệt';

  @override
  String get storageOther => 'Khác';

  @override
  String get storageFree => 'Còn trống';

  @override
  String storageFreeUp(String size) {
    return 'Giải phóng $size';
  }

  @override
  String get storageNothingToClean => 'Không có bộ nhớ đệm để xóa';

  @override
  String storageFreed(String size) {
    return 'Đã giải phóng $size';
  }

  @override
  String get storageAsleep =>
      'Đánh thức máy tính để xem mục nào đang chiếm dung lượng.';

  @override
  String get processesTitle => 'Đang chạy';

  @override
  String get processesNone => 'Không có gì đang chạy ngoài chính máy tính này.';

  @override
  String get processesAsleep => 'Không có gì chạy khi máy đang ngủ.';

  @override
  String get processStop => 'Dừng';

  @override
  String processStopTitle(String name) {
    return 'Dừng $name?';
  }

  @override
  String get processStopMessage => 'Mọi dữ liệu chưa lưu sẽ bị mất.';

  @override
  String processStopped(String name) {
    return 'Đã dừng $name';
  }

  @override
  String processLine(String duration, String cpu, String memory) {
    return '$duration · $cpu% CPU · $memory';
  }

  @override
  String get usedByTitle => 'Được dùng bởi';

  @override
  String get usedByNone => 'Chưa có bot nào dùng máy tính này.';

  @override
  String botLastActive(String when) {
    return 'Hoạt động $when';
  }

  @override
  String get botNeverActive => 'Chưa từng hoạt động';

  @override
  String get restorePointsTitle => 'Điểm khôi phục';

  @override
  String get restorePointsNone =>
      'Chưa có điểm nào. Bot sẽ lưu một điểm trước khi thực hiện thay đổi rủi ro.';

  @override
  String get restorePointSaveNow => 'Lưu điểm khôi phục ngay';

  @override
  String get restorePointSaveTitle => 'Lưu điểm khôi phục';

  @override
  String get restorePointDefaultLabel => 'Lưu thủ công';

  @override
  String get restorePointSaved => 'Đã lưu điểm khôi phục';

  @override
  String restorePointsShowAll(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return 'Hiện tất cả $nString';
  }

  @override
  String get historyTitle => 'Lịch sử';

  @override
  String get historyNone => 'Chưa có hoạt động nào.';

  @override
  String get historyStarted => 'Đã thức dậy';

  @override
  String get historySlept => 'Đã chuyển sang ngủ';

  @override
  String get historySleptIdle => 'Đã chuyển sang ngủ (không hoạt động)';

  @override
  String get historyRestarted => 'Đã khởi động lại';

  @override
  String get historyReset => 'Đã đặt lại hệ thống';

  @override
  String get historyErased => 'Đã xóa toàn bộ';

  @override
  String get historyCheckpointCreated => 'Đã lưu điểm khôi phục';

  @override
  String get historyCheckpointRestored => 'Đã khôi phục một điểm khôi phục';

  @override
  String historyStorageCleaned(String size) {
    return 'Đã giải phóng $size';
  }

  @override
  String get historyStorageCleanedPlain => 'Đã giải phóng dung lượng';

  @override
  String historyProcessStopped(String name) {
    return 'Đã dừng $name';
  }

  @override
  String get historyUpdated => 'Đã thay đổi cài đặt';

  @override
  String get historyYou => 'bạn';

  @override
  String get yourDataTitle => 'Dữ liệu của bạn';

  @override
  String get downloadAllFiles => 'Tải xuống tất cả tệp';

  @override
  String get downloadAllFilesHelp =>
      'Tệp .zip chứa mọi thứ trong không gian làm việc';

  @override
  String get downloadNothing => 'Chưa có tệp nào để tải xuống.';

  @override
  String get deleteComputerHelp => 'Xóa máy tính cùng các điểm khôi phục';

  @override
  String get manageComputer => 'Quản lý';

  @override
  String get restartComputer => 'Khởi động lại';

  @override
  String get resetComputerMenu => 'Đặt lại…';

  @override
  String get moreFixes => 'Cách khắc phục khác';

  @override
  String durationMinutes(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString phút';
  }

  @override
  String durationHours(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString giờ';
  }

  @override
  String durationDays(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    return '$nString ngày';
  }

  @override
  String get remoteUpdateTitle => 'Đã đến lúc cập nhật Casama';

  @override
  String get remoteUpdateBody =>
      'Phiên bản Casama này không còn được hỗ trợ. Hãy cập nhật để tiếp tục.';

  @override
  String get remoteUpdateNoLink =>
      'Phiên bản Casama này không còn được hỗ trợ. Hãy cập nhật từ nơi bạn đã cài đặt.';

  @override
  String get remoteMaintenanceTitle => 'Casama đang bảo trì';

  @override
  String get openLink => 'Mở';

  @override
  String get routineIdeas => 'Ý tưởng';

  @override
  String get routineIdeasHelp =>
      'Bắt đầu từ một ý tưởng, rồi chỉnh sửa bất cứ điểm nào.';

  @override
  String get pluginDirectory => 'Plugin đã kiểm duyệt';

  @override
  String get pluginDirectoryHelp =>
      'Đã được Casama kiểm tra và ghim đúng phiên bản đã kiểm tra.';

  @override
  String get pluginOrPaste => 'Hoặc thêm từ liên kết GitHub';

  @override
  String byAuthor(String name) {
    return 'Của $name';
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
  String get paywallBillingPeriod => 'Chu kỳ thanh toán';

  @override
  String get paywallNotSoldTitle => 'Máy chủ này không bán gói';

  @override
  String get paywallNotSoldBody =>
      'Máy chủ này không bán gói dịch vụ nên không có gì để nâng cấp tại đây.';

  @override
  String get paywallPlansFailedTitle => 'Chưa tải được danh sách gói';

  @override
  String get paywallPlansFailedBody => 'Kiểm tra kết nối rồi thử lại.';

  @override
  String paywallStoreEmptyTitle(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'App Store chưa hiển thị các gói',
      'google_play': 'Google Play chưa hiển thị các gói',
      'other': 'Cửa hàng chưa hiển thị các gói',
    });
    return '$_temp0';
  }

  @override
  String paywallStoreEmptyBody(String store) {
    String _temp0 = intl.Intl.selectLogic(store, {
      'app_store': 'Hãy đảm bảo bạn đã đăng nhập App Store trên thiết bị này rồi thử lại.',
      'google_play': 'Hãy đảm bảo bạn đã đăng nhập Google Play trên thiết bị này rồi thử lại.',
      'other': 'Hãy đảm bảo bạn đã đăng nhập cửa hàng trên thiết bị này rồi thử lại.',
    });
    return '$_temp0';
  }

  @override
  String paywallSaveUpTo(int pct) {
    return 'Tiết kiệm tới $pct%';
  }

  @override
  String get paywallMostPopular => 'Phổ biến nhất';

  @override
  String get paywallTaglinePlus => 'Dành cho bạn và vài bot';

  @override
  String get paywallTaglinePro => 'Cho đội bot bận rộn và nhóm nhỏ';

  @override
  String get paywallTaglineMax => 'Cho đội ngũ có bot làm việc cả ngày';

  @override
  String get paywallPerMonthShort => '/tháng';

  @override
  String paywallBilledYearly(String price) {
    return '$price thanh toán hằng năm';
  }

  @override
  String paywallWorksOutTo(String price) {
    return 'Tính ra $price/tháng';
  }

  @override
  String get paywallBilledMonthly => 'Thanh toán hằng tháng';

  @override
  String get paywallBilledWeekly => 'Thanh toán hằng tuần';

  @override
  String get paywallPerWeekShort => '/tuần';

  @override
  String paywallPerWeekWorksOut(String price) {
    return 'Tức $price mỗi tuần';
  }

  @override
  String get paywallBilledYearlyPlain => 'Thanh toán hằng năm';

  @override
  String get paywallPerYearShort => '/năm';

  @override
  String paywallStartTrial(int n) {
    return 'Bắt đầu dùng thử miễn phí $n ngày';
  }

  @override
  String paywallGetPlan(String plan) {
    return 'Đăng ký trả phí $plan';
  }

  @override
  String paywallPeople(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count người',
      one: '1 người',
    );
    return '$_temp0';
  }

  @override
  String paywallFactHours(int hours) {
    final intl.NumberFormat hoursNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String hoursString = hoursNumberFormat.format(hours);

    return '$hoursString giờ dùng máy tính';
  }

  @override
  String get billingChangePlan => 'Đổi gói';

  @override
  String get billingChangePlanBody =>
      'So sánh tất cả các gói, theo tháng hoặc theo năm.';

  @override
  String paywallWhatYouGet(String plan) {
    return 'Những gì $plan mang lại cho bạn';
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
  String get updatesRow => 'Cập nhật';

  @override
  String get updatesRowSubtitle => 'Tin tức từ không gian làm việc';

  @override
  String get updatesEmpty => 'Chưa có cập nhật';

  @override
  String get updatesEmptyHelp =>
      'Thông báo của không gian làm việc và các trang mới sẽ hiện ở đây. Tin nhắn bot gửi riêng cho bạn nằm trong trò chuyện.';

  @override
  String chatsNeedsYou(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n mục cần bạn',
      one: '1 mục cần bạn',
    );
    return '$_temp0';
  }

  @override
  String suggestionInTopic(String title) {
    return 'Đang xử lý: $title';
  }

  @override
  String suggestionClosed(String title) {
    return 'Không phải lúc này: $title';
  }

  @override
  String openTopic(String title) {
    return 'Mở $title';
  }

  @override
  String get newTopic => 'Chủ đề mới';

  @override
  String get topics => 'Chủ đề';

  @override
  String get olderTopics => 'Cũ hơn';

  @override
  String get generalChat => 'Chung';

  @override
  String get allTopics => 'Tất cả chủ đề';

  @override
  String get cardSecrets => 'Khóa bí mật';

  @override
  String get cardApproval => 'Phê duyệt';

  @override
  String get cardTakeover => 'Tiếp quản';

  @override
  String get cardDevice => 'Quyền truy cập thiết bị';

  @override
  String get cardSuggestion => 'Gợi ý';

  @override
  String get formBack => 'Quay lại';

  @override
  String get formNext => 'Tiếp';

  @override
  String get formSkip => 'Bỏ qua';

  @override
  String formStep(int n, int total) {
    return 'Câu hỏi $n / $total';
  }

  @override
  String get cardSuggestions => 'Gợi ý';

  @override
  String suggestionsTitle(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Tìm thấy $n mục đáng xem',
      one: 'Tìm thấy 1 mục đáng xem',
    );
    return '$_temp0';
  }

  @override
  String suggestionStarted(String when) {
    return 'Đã bắt đầu $when';
  }

  @override
  String get suggestionStartedPlain => 'Đã bắt đầu';

  @override
  String get suggestionPutAway => 'Để sau';

  @override
  String get suggestionExpired => 'Đã hết hạn';

  @override
  String suggestionExpiredTitle(String title) {
    return 'Đã hết hạn: $title';
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
      other: 'Hết hạn sau $nString phút',
      one: 'Hết hạn sau 1 phút',
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
      other: 'Hết hạn sau $nString giờ',
      one: 'Hết hạn sau 1 giờ',
    );
    return '$_temp0';
  }

  @override
  String suggestionsHandled(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Đã xử lý $n gợi ý',
      one: 'Đã xử lý 1 gợi ý',
    );
    return '$_temp0';
  }

  @override
  String get casamaLink => 'Casama Link';

  @override
  String get linkRow => 'Dùng máy chủ này trên điện thoại';

  @override
  String get linkIntro =>
      'Cấp cho máy chủ này một địa chỉ để điện thoại truy cập từ mọi nơi. Không cần tên miền, không cần chỉnh bộ định tuyến.';

  @override
  String get linkIntroDetails =>
      'Tính năng này liên kết máy chủ với một tài khoản Casama Cloud miễn phí. Lưu lượng từ điện thoại đi qua Cloudflare thẳng tới máy tính này, không bao giờ qua máy chủ của Casama.';

  @override
  String get linkTurnOn => 'Dùng trên điện thoại';

  @override
  String get linkSignupsNote =>
      'Khi bật, lượt đăng ký tài khoản mới sẽ đóng lại. Chỉ những người đã có tài khoản ở đây mới đăng nhập được.';

  @override
  String get linkStepSignIn => 'Liên kết máy chủ này';

  @override
  String get linkSignInBody =>
      'Phê duyệt mã này trên trang vừa mở trong trình duyệt. Kiểm tra xem trang đó có hiện đúng mã này không.';

  @override
  String get linkSignInOpen => 'Mở lại trang';

  @override
  String get linkStepAddress => 'Nhận địa chỉ';

  @override
  String get linkStepRestart => 'Khởi động lại máy chủ';

  @override
  String get linkStepConnect => 'Kết nối';

  @override
  String get linkStateOnline => 'Trực tuyến';

  @override
  String get linkStateStarting => 'Đang khởi động';

  @override
  String get linkStateOffline => 'Ngoại tuyến';

  @override
  String get linkStateAttention => 'Cần chú ý';

  @override
  String get linkStateOff => 'Đang tắt';

  @override
  String get linkAddress => 'Địa chỉ';

  @override
  String get linkLocalAddress => 'Trên máy tính này';

  @override
  String get linkShowCode => 'Hiện mã đăng nhập';

  @override
  String get linkCheck => 'Kiểm tra lại';

  @override
  String get linkTurnOff => 'Tắt';

  @override
  String get linkTurnOffConfirm =>
      'Tắt truy cập từ xa? Địa chỉ sẽ ngừng hoạt động và điện thoại mất kết nối tới máy chủ này cho đến khi bạn bật lại. Địa chỉ cũ vẫn được giữ nguyên.';

  @override
  String get linkTurningOff => 'Đang tắt';

  @override
  String get linkNeedsOwner => 'Chỉ chủ sở hữu máy chủ này mới bật được.';

  @override
  String get linkTwoStepTip =>
      'Máy chủ này giờ đã truy cập được từ internet. Đăng nhập hai bước giúp mật khẩu bị đoán ra vẫn chưa đủ để vào.';

  @override
  String get linkProblemNotLinked =>
      'Máy chủ này chưa liên kết với Casama Cloud. Hãy bật lại để liên kết.';

  @override
  String get linkProblemCloudUnreachable =>
      'Hiện không kết nối được với Casama Cloud. Nếu địa chỉ vẫn đang chạy thì nó vẫn hoạt động bình thường.';

  @override
  String get linkProblemKeyRejected =>
      'Casama Cloud không còn chấp nhận khóa của máy chủ này. Hãy bật lại để liên kết.';

  @override
  String get linkProblemSuspended =>
      'Casama Cloud đã tắt truy cập từ xa cho máy chủ này.';

  @override
  String get linkProblemRemoved =>
      'Máy chủ này đã bị xóa khỏi không gian làm việc trên Casama Cloud. Hãy bật lại để liên kết.';

  @override
  String get linkProblemPlanLimit =>
      'Gói Casama Cloud của bạn kết nối được ít máy chủ hơn. Hãy gỡ bớt một máy ở đó hoặc nâng cấp.';

  @override
  String get linkProblemUnknownServer =>
      'Casama Cloud không còn địa chỉ cho máy chủ này nữa. Hãy bật lại.';

  @override
  String get linkProblemAddressChanged =>
      'Địa chỉ của máy chủ này đã thay đổi. Hãy bật lại để dùng địa chỉ mới.';

  @override
  String get connectProblemConnectorMissing =>
      'Trình kết nối chưa chạy. Kiểm tra xem Docker có đang chạy không rồi kiểm tra lại.';

  @override
  String get connectProblemConnectorBlocked =>
      'Mạng này đang chặn kết nối. Nguyên nhân thường gặp là VPN hoặc tường lửa chặn (cổng ra 7844).';

  @override
  String get linkProblemAddressUnanswered =>
      'Mọi thứ đã kết nối nhưng địa chỉ chưa phản hồi. Địa chỉ mới có thể mất khoảng một phút.';

  @override
  String get linkServers => 'Máy chủ đã liên kết';

  @override
  String linkServersHelp(int limit) {
    String _temp0 = intl.Intl.pluralLogic(
      limit,
      locale: localeName,
      other: 'Gói của bạn kết nối được $limit máy chủ.',
      one: 'Gói của bạn kết nối được 1 máy chủ.',
    );
    return '$_temp0';
  }

  @override
  String get linkServersNone =>
      'Chưa liên kết máy chủ nào. Trên máy chủ của bạn, mở Cài đặt rồi chọn Casama Link.';

  @override
  String linkServerRemoveConfirm(String name) {
    return 'Gỡ $name? Địa chỉ của máy sẽ ngừng hoạt động. Bạn có thể liên kết lại máy chủ này sau.';
  }

  @override
  String get linkStatusActive => 'Đã có địa chỉ';

  @override
  String get linkStatusParked => 'Gần đây không thấy hoạt động';

  @override
  String get linkStatusSuspended => 'Đã tạm ngưng';

  @override
  String get pairDevice => 'Đăng nhập trên thiết bị khác';

  @override
  String get pairDeviceRow => 'Hiện mã để điện thoại quét';

  @override
  String get pairDeviceHelp =>
      'Quét mã bằng camera điện thoại. Hoặc trong Casama trên điện thoại: Đăng nhập, rồi Quét mã.';

  @override
  String get pairDeviceWarning =>
      'Bất kỳ ai quét mã này đều đăng nhập bằng tài khoản của bạn. Mã chỉ dùng một lần trong vài phút.';

  @override
  String pairDeviceServer(String host) {
    return 'Đăng nhập vào $host';
  }

  @override
  String get pairDeviceNewCode => 'Mã mới';

  @override
  String get pairDeviceExpired => 'Mã này đã hết hạn.';

  @override
  String get pairDeviceNotReachable =>
      'Máy chủ này chỉ phản hồi trên máy tính này nên điện thoại chưa kết nối được.';

  @override
  String get pairDeviceNotReachableOther =>
      'Địa chỉ của máy chủ này chỉ chạy trong mạng nội bộ. Hãy hỏi người quản lý máy chủ để lấy địa chỉ truy cập được từ bên ngoài.';

  @override
  String get pairDeviceCopyLink => 'Sao chép liên kết';

  @override
  String get pairDeviceLinkCopied =>
      'Đã sao chép liên kết. Dán vào Casama cho Chrome hoặc trên thiết bị khác.';

  @override
  String get pairDeviceConnectChrome => 'Kết nối Chrome';

  @override
  String get pairDeviceChromeDone => 'Casama cho Chrome đã đăng nhập.';

  @override
  String get pairDeviceChromeFinish =>
      'Hoàn tất trong tab Casama cho Chrome vừa mở.';

  @override
  String get pairDeviceChromeMissing =>
      'Casama cho Chrome chưa được cài trong trình duyệt này.';

  @override
  String pairDeviceChromeFailed(String error) {
    return 'Casama cho Chrome không thể đăng nhập. $error';
  }

  @override
  String get scanToSignIn => 'Quét mã từ máy tính';

  @override
  String get scanToSignInTitle => 'Quét mã';

  @override
  String get scanToSignInHelp =>
      'Trên máy tính bạn đã đăng nhập, mở Cài đặt rồi chọn Đăng nhập trên thiết bị khác.';

  @override
  String pairSignInTo(String host) {
    return 'Đăng nhập vào $host?';
  }

  @override
  String get pairSignInBody =>
      'Mã này đăng nhập thiết bị này vào tài khoản đã hiển thị mã.';

  @override
  String pairSwitchServerBody(String current, String host) {
    return 'Thiết bị này hiện đang dùng $current. Đăng nhập vào $host sẽ chuyển sang máy chủ đó.';
  }

  @override
  String get pairSigningIn => 'Đang đăng nhập';

  @override
  String get pairCodeInvalid =>
      'Mã đó không còn hợp lệ. Hãy tạo mã mới rồi quét lại.';

  @override
  String get pairLinkInvalid => 'Đây không phải mã đăng nhập Casama.';

  @override
  String get linkServerTitle => 'Liên kết máy chủ';

  @override
  String linkServerBody(String name) {
    return '$name muốn kết nối với tài khoản Casama Cloud của bạn.';
  }

  @override
  String get linkServerCode => 'Mã trên máy chủ';

  @override
  String get linkServerCheck =>
      'Chỉ liên kết nếu chính bạn đã bắt đầu thao tác này trên máy chủ của bạn và máy chủ đó hiện đúng mã này.';

  @override
  String get linkServerWhat =>
      'Máy chủ sẽ có địa chỉ công khai và gửi được thông báo cho bạn, nhưng không thể tiêu tín dụng của bạn.';

  @override
  String get linkServerApprove => 'Liên kết';

  @override
  String get linkServerDone => 'Đã liên kết';

  @override
  String linkServerDoneBody(String name) {
    return 'Quay lại $name. Máy sẽ tự tiếp tục.';
  }

  @override
  String get linkServerInvalid =>
      'Mã đó không còn hợp lệ. Hãy bắt đầu lại trên máy chủ của bạn.';

  @override
  String get linkServerEnterCode => 'Mã hiện trên máy chủ';

  @override
  String get linkServerFind => 'Tìm';

  @override
  String get linkServerNeedAdmin =>
      'Chỉ chủ sở hữu và quản trị viên không gian làm việc mới liên kết được máy chủ.';

  @override
  String get localDockerStopped =>
      'Docker chưa chạy nên máy chủ của bạn đang dừng';

  @override
  String get localDockerStoppedBody =>
      'Máy chủ Casama của bạn chạy trong Docker trên máy tính này. Mở Docker lên và Casama sẽ tự kết nối lại khi máy chủ chạy lại, việc này có thể mất một phút.';

  @override
  String get serverOfflineTitle => 'Máy chủ của bạn đang ngoại tuyến';

  @override
  String get serverOfflineBody =>
      'Máy tính chạy máy chủ có đang bật và thức không? Ứng dụng sẽ tự kết nối lại.';

  @override
  String get signUpsClosed =>
      'Máy chủ này không nhận tài khoản mới. Hãy đăng nhập bằng tài khoản bạn đã có ở đây.';

  @override
  String get signUpsByInvitation =>
      'Tài khoản mới ở đây cần có lời mời. Hãy dùng địa chỉ email đã nhận lời mời.';

  @override
  String get linkPrivateNotifications => 'Thông báo riêng tư';

  @override
  String get linkPrivateNotificationsHelp =>
      'Thông báo đi đến điện thoại qua Casama Cloud. Khi bật, thông báo không mang nội dung mà chỉ báo \"Có hoạt động mới\"; ứng dụng sẽ tự tải phần còn lại từ máy chủ này.';

  @override
  String get linkInvites => 'Cho phép người được mời đăng ký';

  @override
  String get linkInvitesHelp =>
      'Tắt: không ai tạo được tài khoản mới. Bật: những người bạn mời qua email có thể tạo. Thay đổi mục này sẽ khởi động lại máy chủ.';

  @override
  String get linkKeepAwake => 'Giữ máy Mac này thức khi cắm sạc';

  @override
  String get linkKeepAwakeHelp =>
      'Điện thoại chỉ truy cập được máy chủ này khi máy tính này đang thức và Casama đang mở.';

  @override
  String get linkLiveView => 'Xem trực tiếp từ xa';

  @override
  String get linkLiveViewIncluded =>
      'Đã bao gồm trong gói của bạn. Khi ở xa máy tính này, màn hình của bot phát trực tiếp qua máy chủ chuyển tiếp của Casama Cloud.';

  @override
  String get linkLiveViewPlan =>
      'Có từ gói Plus trở lên trên Casama Cloud. Khi ở xa máy tính này, bạn thấy màn hình bot cập nhật khoảng mỗi giây một lần. Trên máy tính này thì luôn trực tiếp.';

  @override
  String get liveAwayNeedsPlan =>
      'Khi ở xa máy tính chạy máy chủ, video trực tiếp có từ gói Plus trở lên trên Casama Cloud. Trước khi nâng cấp, màn hình cập nhật khoảng mỗi giây một lần.';

  @override
  String get chatShareExport => 'Chia sẻ hoặc xuất';

  @override
  String get chatShareExportHelp =>
      'Lưu cuộc trò chuyện này thành tệp, hoặc tạo liên kết chỉ đọc.';

  @override
  String get chatExportMarkdown => 'Xuất dạng Markdown';

  @override
  String get chatExportMarkdownHelp => 'Tệp văn bản ai cũng đọc được';

  @override
  String get chatExportJson => 'Xuất dạng JSON';

  @override
  String get chatExportJsonHelp => 'Dành cho ứng dụng và tập lệnh khác';

  @override
  String get chatShareLink => 'Chia sẻ liên kết chỉ đọc';

  @override
  String get chatShareLinkHelp =>
      'Ai có liên kết đều đọc được cuộc trò chuyện này';

  @override
  String get chatStopSharing => 'Dừng chia sẻ liên kết';

  @override
  String get chatStopSharingHelp => 'Liên kết sẽ ngừng hoạt động';

  @override
  String get chatMakePublicTitle =>
      'Chia sẻ cuộc trò chuyện này bằng liên kết?';

  @override
  String get chatMakePublicBody =>
      'Ai có liên kết đều đọc được cuộc trò chuyện này đúng như bạn thấy. Tệp đính kèm chỉ hiện tên, không chia sẻ nội dung. Bạn có thể dừng bất cứ lúc nào.';

  @override
  String get chatMakePublic => 'Tạo liên kết';

  @override
  String get chatLinkTitle => 'Liên kết chỉ đọc';

  @override
  String get chatLinkBody =>
      'Đã sao chép. Liên kết không hiện trên công cụ tìm kiếm. Tạo liên kết mới sẽ vô hiệu hóa liên kết này.';

  @override
  String get chatSharingStopped => 'Liên kết không còn hoạt động';

  @override
  String get creationDuplicate => 'Nhân bản';

  @override
  String creationDuplicated(String title) {
    return 'Đã tạo bản sao: “$title”';
  }

  @override
  String get slackInstall => 'Thêm vào Slack';

  @override
  String slackInstallHelp(String bot) {
    return 'Kết nối không gian làm việc Slack chỉ trong một bước. $bot sẽ trả lời khi được @nhắc đến và qua tin nhắn trực tiếp ở đó.';
  }

  @override
  String get slackInstallFinish => 'Hoàn tất trong Slack rồi quay lại đây.';

  @override
  String get helpAndSupport => 'Trợ giúp & hỗ trợ';

  @override
  String get helpAndSupportRow =>
      'Hỏi Casama Help, liên hệ với chúng tôi, hướng dẫn';

  @override
  String get casamaHelp => 'Casama Help';

  @override
  String get casamaHelpPitch =>
      'Câu trả lời tức thì từ hướng dẫn và tài khoản của bạn. Kết nối với nhân viên hỗ trợ chỉ với một chạm.';

  @override
  String get supportIntro =>
      'Có câu hỏi, sự cố mua hàng hay tính năng chưa chạy? Hãy viết cho chúng tôi.';

  @override
  String supportSelfHosted(String host) {
    return 'Không gian làm việc của bạn chạy trên $host. Về đăng nhập, tài khoản và gói dịch vụ, hãy hỏi người quản lý máy chủ đó. Chúng tôi có thể hỗ trợ về bản thân ứng dụng.';
  }

  @override
  String get supportTalkToPerson => 'Nói chuyện với nhân viên hỗ trợ';

  @override
  String get contactSupport => 'Liên hệ hỗ trợ';

  @override
  String contactSupportRow(String email) {
    return 'Viết thư cho đội ngũ tại $email';
  }

  @override
  String get sendFeedback => 'Gửi phản hồi';

  @override
  String get sendFeedbackRow =>
      'Ý tưởng, điều bạn thích và chưa thích. Chúng tôi đọc mọi phản hồi.';

  @override
  String get feedbackHelp =>
      'Hãy cho biết bạn muốn Casama làm được gì, điều bạn yêu thích hoặc điều gì đang cản trở bạn.';

  @override
  String get feedbackKindPrompt => 'Bạn muốn phản hồi về điều gì?';

  @override
  String get feedbackKindIdea => 'Ý tưởng';

  @override
  String get feedbackKindLike => 'Tôi thích';

  @override
  String get feedbackKindDislike => 'Tôi không thích';

  @override
  String get feedbackKindConfusing => 'Khó hiểu';

  @override
  String get feedbackMessageLabel => 'Phản hồi của bạn';

  @override
  String get feedbackMessageHint =>
      'Ví dụ: Tôi ước có thể ghim một cuộc trò chuyện lên đầu.';

  @override
  String get feedbackContactOk => 'Tôi đồng ý được liên hệ về việc này';

  @override
  String get feedbackContactOkHelp =>
      'Chúng tôi có thể gửi email hỏi thêm hoặc báo bạn khi đã làm xong.';

  @override
  String get feedbackNote =>
      'Phiên bản ứng dụng và gói của bạn sẽ được gửi kèm. Gặp vấn đề với tài khoản hay giao dịch mua? Hãy dùng mục Liên hệ hỗ trợ.';

  @override
  String get feedbackThanks => 'Cảm ơn bạn! Chúng tôi đọc mọi phản hồi.';

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
  String get supportIdeasBoard => 'Bảng ý tưởng';

  @override
  String get supportIdeasBoardHelp =>
      'Xem những gì mọi người đã đề xuất và bình chọn cho tính năng bạn muốn tiếp theo';

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
      'Cho chúng tôi biết chuyện gì đang xảy ra. Chúng tôi sẽ trả lời qua email.';

  @override
  String get contactSupportHelpMail =>
      'Cho chúng tôi biết chuyện gì đang xảy ra. Thao tác này mở ứng dụng email của bạn với các thông tin đã điền sẵn.';

  @override
  String get supportSend => 'Gửi';

  @override
  String get supportWriteEmail => 'Mở email';

  @override
  String get supportTopicPrompt => 'Vấn đề về mục nào?';

  @override
  String get supportTopicBilling => 'Thanh toán & mua hàng';

  @override
  String get supportTopicBroken => 'Có gì đó không hoạt động';

  @override
  String get supportTopicAccount => 'Tài khoản & đăng nhập';

  @override
  String get supportTopicQuestion => 'Câu hỏi hoặc ý tưởng';

  @override
  String get supportTopicOther => 'Vấn đề khác';

  @override
  String get supportMessageLabel => 'Tin nhắn của bạn';

  @override
  String get supportMessageHint =>
      'Chuyện gì đã xảy ra và bạn mong đợi điều gì?';

  @override
  String get supportMessageMore =>
      'Thêm một hoặc hai câu: bạn đang làm gì và lỗi gì đã xảy ra.';

  @override
  String get supportIncludeChat =>
      'Gửi kèm cuộc trò chuyện của tôi với Casama Help';

  @override
  String get supportIncludeChatHelp =>
      'Để bạn không phải giải thích lại lần nữa.';

  @override
  String get supportDetailsNote =>
      'Chúng tôi gửi kèm phiên bản ứng dụng, ID không gian làm việc và ID tài khoản để tìm đúng tài khoản của bạn. Không bao giờ gửi các cuộc trò chuyện của bạn.';

  @override
  String get supportSentTitle => 'Đã gửi tin nhắn';

  @override
  String supportSentBody(String email, String reference) {
    return 'Chúng tôi sẽ trả lời tới $email. Mã tham chiếu của bạn là $reference.';
  }

  @override
  String supportNoMailApp(String email) {
    return 'Không tìm thấy ứng dụng email nên chúng tôi đã sao chép tin nhắn. Hãy dán vào email gửi tới $email.';
  }

  @override
  String get supportGuides => 'Hướng dẫn & Câu hỏi thường gặp';

  @override
  String get supportGuidesHelp =>
      'Hướng dẫn từng bước cho mọi tính năng trong Casama';

  @override
  String get introVideoTitle => 'Xem cách Casama hoạt động';

  @override
  String get introVideoSubtitle => 'Video dài 1 phút rưỡi';

  @override
  String get supportIntroVideo => 'Xem video giới thiệu';

  @override
  String get introVideoFailed =>
      'Không phát được video. Kiểm tra kết nối rồi thử lại.';

  @override
  String get introVideoOnYoutube => 'Xem trên YouTube';

  @override
  String get introVideoReplay => 'Phát lại';

  @override
  String get supportIntroVideoHelp =>
      'Xem những gì Casama làm được trong 1 phút rưỡi';

  @override
  String get supportRate => 'Đánh giá Casama';

  @override
  String get supportRateHelp =>
      'Chia sẻ cảm nhận của bạn trên trang cửa hàng ứng dụng';

  @override
  String get supportIds => 'Mã ID hỗ trợ';

  @override
  String get supportIdsHelp =>
      'Bộ phận hỗ trợ có thể hỏi các mã này. Chúng giúp tìm tài khoản và giao dịch mua của bạn, chứ không cấp quyền truy cập cho ai.';

  @override
  String supportWorkspaceId(String name) {
    return 'ID không gian làm việc · $name';
  }

  @override
  String get supportWorkspaceIdHelp =>
      'Cũng là ID mua hàng của bạn trên App Store và Google Play';

  @override
  String get supportAccountId => 'ID tài khoản';

  @override
  String get supportCopyAll => 'Sao chép toàn bộ thông tin';

  @override
  String get supportCopyAllHelp =>
      'Phiên bản ứng dụng, nền tảng và các mã ID để dán vào tin nhắn';

  @override
  String get supportNewChat => 'Cuộc trò chuyện mới';

  @override
  String get supportAskHint => 'Hỏi bất cứ điều gì về Casama';

  @override
  String get supportAiNote =>
      'Casama Help là AI nên có thể nhầm lẫn. Casama Help xem được gói và lỗi bot của bạn, không xem cuộc trò chuyện.';

  @override
  String get supportGreeting =>
      'Chào bạn! Tôi là Casama Help. Hãy hỏi tôi về Casama, gói của bạn hoặc sự cố bạn đang gặp. Nếu không tự xử lý được, tôi sẽ chuyển cho đội ngũ hỗ trợ.';

  @override
  String get supportStarterPurchase => 'Giao dịch mua của tôi không thành công';

  @override
  String get supportStarterCancel => 'Làm sao để hủy gói của tôi?';

  @override
  String get supportStarterBot => 'Bot của tôi không trả lời';

  @override
  String get supportStarterHowTo => 'Bot của tôi làm được gì?';

  @override
  String get supportAskPerson => 'Hỏi nhân viên hỗ trợ';

  @override
  String get supportHandoffTitle => 'Gửi nội dung này cho đội ngũ hỗ trợ?';

  @override
  String get supportHandoffButton => 'Xem lại và gửi';

  @override
  String get supportThinking => 'Đang kiểm tra…';

  @override
  String get supportAssistantError =>
      'Casama Help chưa trả lời được. Hãy thử lại hoặc hỏi nhân viên hỗ trợ.';

  @override
  String get supportAssistantLimit =>
      'Casama Help tạm thời hết lượt trả lời. Nhân viên hỗ trợ có thể giúp bạn.';

  @override
  String get purchaseHelp => 'Gặp trục trặc khi mua hàng? Nhận trợ giúp';

  @override
  String get adminReports => 'Reports';

  @override
  String get adminSupport => 'Support';

  @override
  String get report => 'Báo cáo';

  @override
  String get reportAndBlock => 'Báo cáo và chặn';

  @override
  String get reportReply => 'Báo cáo câu trả lời';

  @override
  String get reportBot => 'Báo cáo bot';

  @override
  String get reportBotRow =>
      'Tên, mô tả hoặc câu trả lời của bot có nội dung không ổn';

  @override
  String get reportPerson => 'Báo cáo người này';

  @override
  String get reportGalleryItem => 'Báo cáo mục trên Kho mẫu';

  @override
  String get reportGalleryRequest => 'Báo cáo yêu cầu';

  @override
  String get reportWorkspace => 'Báo cáo không gian làm việc';

  @override
  String get reportHelp =>
      'Cho những người quản lý máy chủ này biết vấn đề. Họ xem xét mọi báo cáo.';

  @override
  String get reportPersonHelp =>
      'Cho những người quản lý máy chủ này biết chuyện gì đã xảy ra. Chúng tôi cũng sẽ chặn người này giúp bạn.';

  @override
  String get reportNote => 'Điều gì khác họ nên biết (không bắt buộc)';

  @override
  String reportAlsoBlock(String name) {
    return 'Đồng thời chặn $name';
  }

  @override
  String get reportSent =>
      'Cảm ơn bạn. Báo cáo của bạn đã được gửi đi xem xét.';

  @override
  String get reportReasonSpam => 'Thư rác hoặc lừa đảo';

  @override
  String get reportReasonSexual => 'Nội dung tình dục';

  @override
  String get reportReasonViolence => 'Bạo lực hoặc đe dọa';

  @override
  String get reportReasonHarassment => 'Quấy rối hoặc thù ghét';

  @override
  String get reportReasonIllegal => 'Phi pháp hoặc nguy hiểm';

  @override
  String get reportReasonImpersonation => 'Giả mạo người khác';

  @override
  String get reportReasonOther => 'Lý do khác';

  @override
  String get thisPerson => 'người này';

  @override
  String blockPerson(String name) {
    return 'Chặn $name';
  }

  @override
  String blocked(String name) {
    return 'Đã chặn $name';
  }

  @override
  String get blockHelp =>
      'Người bị chặn không thể mời bạn vào không gian làm việc và bạn sẽ không nhận tin từ họ.';

  @override
  String get blockedPeople => 'Người đã chặn';

  @override
  String get blockedPeopleRow =>
      'Những người không thể mời hoặc liên hệ với bạn';

  @override
  String get noBlockedPeople => 'Chưa chặn ai';

  @override
  String get unblock => 'Bỏ chặn';

  @override
  String get emailTips => 'Mẹo và tin tức qua email';

  @override
  String get emailTipsHelp =>
      'Mẹo bắt đầu và thỉnh thoảng có bản cập nhật. Email về gói và tài khoản của bạn luôn được gửi.';

  @override
  String get reportsInApp => 'Được báo cáo trong ứng dụng';

  @override
  String get reportsNone =>
      'Không có báo cáo đang mở. Báo cáo mọi người gửi từ ứng dụng sẽ hiện ở đây.';

  @override
  String get reportsPublicLinks => 'Liên kết công khai bị báo cáo';

  @override
  String get reportsNoLinks => 'Không có liên kết công khai nào bị báo cáo.';

  @override
  String reportsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count báo cáo',
      one: '1 báo cáo',
    );
    return '$_temp0';
  }

  @override
  String get reportsTakeDown => 'Gỡ xuống';

  @override
  String get reportsRestore => 'Khôi phục';

  @override
  String get reportKindReply => 'Câu trả lời của bot';

  @override
  String get reportKindBot => 'Bot';

  @override
  String get reportKindPerson => 'Người dùng';

  @override
  String get reportKindGallery => 'Mục trên Kho mẫu';

  @override
  String get reportKindWorkspace => 'Không gian làm việc';

  @override
  String get reportMarkActioned => 'Đã xử lý';

  @override
  String reportSuspendWorkspace(String name) {
    return 'Đình chỉ không gian làm việc $name';
  }

  @override
  String get reportDismiss => 'Bỏ qua: không có gì sai';

  @override
  String get supportWebTitle => 'Casama Help trên trang web';

  @override
  String get supportWebOn => 'Bật';

  @override
  String get supportWebOff => 'Tắt';

  @override
  String supportWebPaused(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count địa chỉ IP đang tạm dừng',
      one: '1 địa chỉ IP đang tạm dừng',
    );
    return '$_temp0';
  }

  @override
  String supportWebGaps(int count) {
    return 'Hiện $count câu hỏi chưa được trả lời';
  }

  @override
  String get ticketsOpen => 'Đang mở';

  @override
  String get ticketsClosed => 'Đã đóng';

  @override
  String get ticketsAll => 'Tất cả';

  @override
  String get ticketsNone => 'Chưa có tin nhắn nào ở đây.';

  @override
  String get ticketClose => 'Đóng';

  @override
  String get ticketReopen => 'Mở lại';

  @override
  String get serviceStatus => 'Trạng thái';

  @override
  String get supportStatus => 'Trạng thái Casama Cloud';

  @override
  String get supportStatusHelp =>
      'Kiểm tra xem hiện có dịch vụ nào gặp sự cố không';

  @override
  String get galleryChatSuggestionLabel => 'Từ Kho mẫu';

  @override
  String get galleryChatAdd => 'Thêm';

  @override
  String galleryChatAdded(String name) {
    return 'Đã thêm $name';
  }

  @override
  String galleryChatReads(String things) {
    return 'Đọc: $things';
  }

  @override
  String get galleryChatRunsCode => 'Chạy mã';

  @override
  String get galleryChatComputer => 'Dùng máy tính';

  @override
  String galleryChatNeeds(String apps) {
    return 'Cần: $apps';
  }

  @override
  String get galleryChatDraftLabel => 'Bản nháp kỹ năng';

  @override
  String get galleryChatShowInstructions => 'Hiện hướng dẫn';

  @override
  String get galleryChatHideInstructions => 'Ẩn hướng dẫn';

  @override
  String get galleryChatSaveSkill => 'Lưu vào kỹ năng của tôi';

  @override
  String get galleryChatSaved => 'Đã lưu';

  @override
  String get galleryChatSavedSkill => 'Đã lưu vào kỹ năng của bạn';

  @override
  String get galleryChatSubmit => 'Gửi lên Kho mẫu';

  @override
  String galleryChatSubmitTitle(String name) {
    return 'Gửi $name lên Kho mẫu?';
  }

  @override
  String get galleryChatSubmitBody =>
      'Người kiểm duyệt sẽ xem trước. Khi được duyệt, ai cũng có thể tìm và dùng. Tên hiển thị của bạn xuất hiện ở mục tác giả, không bao giờ hiện email.';

  @override
  String get galleryChatSent => 'Đã gửi';

  @override
  String get galleryChatSubmitted => 'Đã gửi lên Kho mẫu để xét duyệt';

  @override
  String get galleryChatSubmissionsOff =>
      'Máy chủ này không nhận bài gửi lên Kho mẫu.';

  @override
  String get galleryPicksTitle => 'Gợi ý chọn lọc cho bạn';

  @override
  String get galleryPicksHelp =>
      'Bắt đầu với bộ kỹ năng, ứng dụng và quy trình phù hợp. Bạn có thể đổi mọi thứ sau.';

  @override
  String get galleryPicksAdd => 'Thêm bộ này';

  @override
  String get galleryPicksSkip => 'Bỏ qua lúc này';

  @override
  String galleryPicksAddNamed(String name) {
    return 'Thêm $name';
  }

  @override
  String get galleryPicksBestMatch => 'Phù hợp nhất';

  @override
  String get galleryPicksInside => 'Bên trong có gì';

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
      other: '$count kỹ năng',
      one: '1 kỹ năng',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count quy trình',
      one: '1 quy trình',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ứng dụng',
      one: '1 ứng dụng',
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
      other: '$count diện mạo',
      one: '1 diện mạo',
    );
    return '$_temp0';
  }

  @override
  String galleryPicksAdded(String name) {
    return 'Đã thêm $name';
  }

  @override
  String galleryPicksAddedNeedsApps(String name, String apps) {
    return 'Đã thêm $name. Kết nối $apps trong mục Ứng dụng để hoàn tất.';
  }

  @override
  String galleryPicksPending(String name) {
    return 'Quản trị viên sẽ xem qua $name trước khi thêm.';
  }

  @override
  String get galleryPolicyTitle => 'Kho mẫu';

  @override
  String get galleryPolicyRow =>
      'Những gì mọi người ở đây có thể thêm từ Kho mẫu';

  @override
  String get galleryPolicyMode => 'Ai được phép thêm';

  @override
  String get galleryPolicyOpen => 'Mở';

  @override
  String get galleryPolicyOpenHelp =>
      'Ai ở đây cũng có thể thêm bất kỳ mục nào chưa bị chặn.';

  @override
  String get galleryPolicyApproval => 'Hỏi trước';

  @override
  String get galleryPolicyApprovalHelp =>
      'Khi thêm sẽ hỏi quản trị viên trước đối với các loại bạn chọn bên dưới.';

  @override
  String get galleryPolicyAllowlist => 'Chỉ mục được phép';

  @override
  String get galleryPolicyAllowlistHelp =>
      'Mọi người chỉ thêm được các mục có trong danh sách cho phép.';

  @override
  String get galleryPolicyApprovalFor => 'Hỏi trước đối với';

  @override
  String get galleryPolicyRunsCode => 'Các mục có chạy mã';

  @override
  String get galleryPolicyApps => 'Các mục kết nối ứng dụng';

  @override
  String get galleryPolicyAll => 'Mọi thứ';

  @override
  String get galleryPolicyAllowed => 'Được phép';

  @override
  String get galleryPolicyAllowedHelp =>
      'Thêm luôn không cần hỏi. Khi chọn Chỉ mục được phép, đây là những thứ duy nhất mọi người thêm được.';

  @override
  String get galleryPolicyBlocked => 'Bị chặn';

  @override
  String get galleryPolicyBlockedHelp =>
      'Không ai ở đây thêm được các mục này.';

  @override
  String get galleryPolicyAddItem => 'Thêm từ Kho mẫu';

  @override
  String get galleryPolicyNone => 'Chưa có gì';

  @override
  String get galleryPolicySearch => 'Tìm trong Kho mẫu';

  @override
  String get galleryPolicyNoResults => 'Không có gì trong Kho mẫu phù hợp.';

  @override
  String get galleryPolicySaved => 'Đã lưu quy tắc Kho mẫu';

  @override
  String galleryPolicyRemove(String name) {
    return 'Gỡ $name';
  }

  @override
  String get galleryPolicyAdminsOnly =>
      'Chỉ quản trị viên và chủ sở hữu mới đổi được mục này.';

  @override
  String get galleryPolicyWaiting => 'Đang chờ phê duyệt';

  @override
  String galleryPolicyRequestedBy(String name) {
    return '$name đã yêu cầu';
  }

  @override
  String get galleryPolicyApprove => 'Phê duyệt';

  @override
  String get galleryPolicyDecline => 'Từ chối';

  @override
  String galleryPolicyApproved(String name) {
    return 'Đã phê duyệt và thêm $name';
  }

  @override
  String galleryPolicyDeclined(String name) {
    return 'Đã từ chối $name';
  }

  @override
  String galleryPolicyApproveFailed(String name, String error) {
    return 'Đã phê duyệt, nhưng chưa thêm được $name. $error';
  }

  @override
  String get galleryDigestEmails => 'Gợi ý Kho mẫu hằng tháng';

  @override
  String get galleryDigestHelp =>
      'Tối đa sáu kỹ năng, ứng dụng và quy trình mới phù hợp với những gì bạn đang dùng, mỗi tháng một lần.';

  @override
  String get newsletterTitle => 'Email hằng tháng của Casama';

  @override
  String get newsletterHelp =>
      'Có gì mới và sắp tới, tối đa mỗi tháng một lần.';

  @override
  String get newsletterSignUp =>
      'Gửi cho tôi email hằng tháng của Casama: tính năng mới và kế hoạch sắp tới, tối đa mỗi tháng một lần.';

  @override
  String get newsletterCardTitle => 'Nhận email hằng tháng của Casama?';

  @override
  String get newsletterCardBody =>
      'Có gì mới và sắp tới, tối đa mỗi tháng một lần. Dừng bất cứ lúc nào.';

  @override
  String get newsletterCardYes => 'Có, gửi cho tôi';

  @override
  String get newsletterCardNo => 'Không, cảm ơn';

  @override
  String get newsletterCardDone =>
      'Bạn đã đăng ký nhận tin. Tắt bất cứ lúc nào trong Cài đặt.';

  @override
  String get galleryKindApp => 'Ứng dụng';

  @override
  String get galleryKindApps => 'Ứng dụng';

  @override
  String get galleryKindBot => 'Bot mẫu';

  @override
  String get galleryKindBots => 'Bot mẫu';

  @override
  String get galleryKindRoutine => 'Quy trình';

  @override
  String get galleryKindRoutines => 'Quy trình';

  @override
  String get galleryKindPlugin => 'Plugin';

  @override
  String get galleryKindPlugins => 'Plugin';

  @override
  String get galleryKindSet => 'Bộ bot mẫu';

  @override
  String get galleryKindSets => 'Bộ bot mẫu';

  @override
  String get galleryTabBrowse => 'Khám phá';

  @override
  String get galleryTabInstalled => 'Đã cài đặt';

  @override
  String get gallerySearchEverything => 'Tìm kiếm mọi thứ';

  @override
  String get galleryNewBadge => 'Mới';

  @override
  String get galleryRowPicks => 'Chọn lọc';

  @override
  String get galleryRowNew => 'Mới';

  @override
  String get galleryRowTrending => 'Xu hướng tuần này';

  @override
  String get galleryRowMostUsed => 'Dùng nhiều nhất';

  @override
  String get galleryRowWorksWith => 'Tương thích với những gì bạn có';

  @override
  String get galleryRowSets => 'Bộ bot mẫu';

  @override
  String get galleryRowSeasonal => 'Theo mùa';

  @override
  String get galleryFilterFree => 'Miễn phí';

  @override
  String get galleryFilterPlan => 'Có dùng tín dụng';

  @override
  String get galleryFilterSelfHosted => 'Chạy được khi tự lưu trữ';

  @override
  String get galleryFilterComputer => 'Cần có máy tính';

  @override
  String get galleryNoFilterMatches => 'Không có gì khớp với các bộ lọc này';

  @override
  String get galleryClearFilters => 'Xóa bộ lọc';

  @override
  String get galleryRequestThis => 'Yêu cầu mục này';

  @override
  String get galleryAskCasama => 'Nhờ Casama tạo giúp';

  @override
  String galleryAskPrompt(String query) {
    return 'Tạo giúp tôi một mục cho yêu cầu này: $query';
  }

  @override
  String get galleryAccessTitle => 'Quyền truy cập';

  @override
  String galleryAccessReads(String things) {
    return 'Đọc: $things';
  }

  @override
  String get galleryAccessRunsCode => 'Chạy mã';

  @override
  String get galleryAccessComputer => 'Dùng máy tính';

  @override
  String get galleryAccessNothing =>
      'Không đọc hoặc thay đổi bất kỳ dữ liệu nào của bạn';

  @override
  String get galleryCreditsNone => 'Không tốn tín dụng';

  @override
  String get galleryCreditsLow => 'Dùng ít tín dụng';

  @override
  String get galleryCreditsMedium => 'Dùng vừa phải tín dụng';

  @override
  String get galleryCreditsHigh => 'Dùng nhiều tín dụng';

  @override
  String get galleryTryIt => 'Dùng thử';

  @override
  String galleryUsedBy(int count, String shown) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$shown người đã dùng',
      one: '1 người đã dùng',
    );
    return '$_temp0';
  }

  @override
  String galleryRunsFinish(int percent) {
    return '$percent% lượt chạy hoàn tất';
  }

  @override
  String get galleryAbout => 'Giới thiệu';

  @override
  String get galleryMadeByCasama => 'Do Casama tạo';

  @override
  String get galleryMadeByCommunity => 'Do cộng đồng tạo';

  @override
  String get galleryMadeReviewed => 'Đã kiểm duyệt';

  @override
  String get galleryReviewedHelp => 'Các bài kiểm tra đều đạt ở phiên bản này';

  @override
  String galleryMoreFrom(String name) {
    return 'Thêm từ $name';
  }

  @override
  String galleryVersion(int version) {
    return 'Phiên bản $version';
  }

  @override
  String galleryUpdatedOn(String date) {
    return 'Cập nhật $date';
  }

  @override
  String galleryRemixOf(String name) {
    return 'Phối lại từ $name';
  }

  @override
  String galleryChangesTitle(String name) {
    return 'Có gì thay đổi trong $name';
  }

  @override
  String get galleryBreaking => 'Hoạt động khác trước';

  @override
  String galleryAuthorCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục trong Kho mẫu',
      one: '1 mục trong Kho mẫu',
    );
    return '$_temp0';
  }

  @override
  String get galleryAuthorEmpty => 'Tác giả này chưa có mục nào trong Kho mẫu.';

  @override
  String get galleryInstalledWorkspace => 'Trong không gian làm việc này';

  @override
  String get galleryInstalledDevice => 'Diện mạo trên thiết bị này';

  @override
  String get galleryInstalledEmptyTitle => 'Chưa thêm mục nào';

  @override
  String get galleryInstalledEmpty =>
      'Kỹ năng, ứng dụng, quy trình và diện mạo bạn thêm từ Kho mẫu sẽ hiện ở đây kèm bản cập nhật.';

  @override
  String get galleryInstalledError => 'Không tải được danh sách đã cài đặt.';

  @override
  String galleryUpdatesAvailable(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bản cập nhật',
      one: '1 bản cập nhật',
    );
    return '$_temp0';
  }

  @override
  String get galleryUpdate => 'Cập nhật';

  @override
  String galleryUpdated(String name) {
    return 'Đã cập nhật $name';
  }

  @override
  String galleryUpdateFromTo(int from, int to) {
    return 'Phiên bản $from → $to';
  }

  @override
  String galleryUpdateAskTitle(String name) {
    return 'Cập nhật $name?';
  }

  @override
  String get galleryUpdateAccessHelp =>
      'Phiên bản mới làm được nhiều việc hơn bản bạn đang có:';

  @override
  String get galleryUpdateBreakingHelp =>
      'Phiên bản mới hoạt động khác đi, hãy kiểm tra lại sau khi cập nhật.';

  @override
  String galleryUpdateNowReads(String things) {
    return 'Nay đọc: $things';
  }

  @override
  String galleryUpdateNowWrites(String action) {
    return 'Nay có thể: $action';
  }

  @override
  String get galleryUpdateNowRunsCode => 'Nay chạy mã';

  @override
  String get galleryUpdateNowComputer => 'Nay dùng máy tính';

  @override
  String get galleryRemove => 'Gỡ bỏ';

  @override
  String galleryRemoveTitle(String name) {
    return 'Gỡ bỏ $name?';
  }

  @override
  String get galleryRemoveHelp =>
      'Mục này bị gỡ khỏi không gian làm việc này. Bạn có thể thêm lại từ Kho mẫu.';

  @override
  String galleryRemoved(String name) {
    return 'Đã gỡ $name';
  }

  @override
  String get galleryRetired => 'Không còn trên Kho mẫu';

  @override
  String get galleryRetiredReplaced =>
      'Không còn trên Kho mẫu; đã có bản thay thế';

  @override
  String get gallerySeeReplacement => 'Xem bản thay thế';

  @override
  String get galleryForgetLook => 'Xóa khỏi danh sách này';

  @override
  String galleryWizardTitle(String name) {
    return 'Thêm $name';
  }

  @override
  String get galleryWizardAdd => 'Thêm';

  @override
  String get galleryWizardRequired => 'Điền mục này';

  @override
  String galleryWizardSetIncludes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Gồm $count mục',
      one: 'Gồm 1 mục',
    );
    return '$_temp0';
  }

  @override
  String get galleryWizardNeeds => 'Những gì mục này cần';

  @override
  String galleryWizardNeedsSkills(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kỹ năng, được thêm sẵn cho bạn',
      one: '1 kỹ năng, được thêm sẵn cho bạn',
    );
    return '$_temp0';
  }

  @override
  String galleryWizardNeedsApps(String apps) {
    return 'Ứng dụng cần kết nối: $apps';
  }

  @override
  String get galleryWizardBot => 'Thêm cho bot nào';

  @override
  String get galleryWizardPickBot => 'Chọn một bot';

  @override
  String get galleryWizardSetBotHelp =>
      'Nơi đặt các quy trình của bộ. Nếu không chọn, quy trình sẽ bị bỏ qua.';

  @override
  String get galleryWizardSetNotAdded => 'Chưa thêm';

  @override
  String get galleryWizardNeedsTitle => 'Kết nối ứng dụng của bạn';

  @override
  String galleryWizardNeedsHelp(String name) {
    return '$name sẽ hoạt động ngay sau khi các ứng dụng này được kết nối.';
  }

  @override
  String get galleryWizardSkillAdded => 'Đã thêm';

  @override
  String get galleryWizardConnected => 'Đã kết nối';

  @override
  String get galleryWizardConnect => 'Kết nối';

  @override
  String galleryWizardConnectInApps(String name) {
    return 'Kết nối $name trong Cài đặt → Ứng dụng.';
  }

  @override
  String get galleryWizardContinue => 'Tiếp tục';

  @override
  String get galleryWizardSkip => 'Để sau';

  @override
  String galleryWizardDoneTitle(String name) {
    return '$name đã sẵn sàng';
  }

  @override
  String get galleryWizardDoneHelp =>
      'Bạn sẽ tìm thấy mục này cùng các mục khác của mình.';

  @override
  String galleryWizardDoneMissing(String apps) {
    return 'Để hoạt động đầy đủ, mục này cần kết nối các ứng dụng: $apps';
  }

  @override
  String get galleryWizardPendingTitle => 'Đang chờ phê duyệt';

  @override
  String get galleryWizardPendingHelp =>
      'Không gian làm việc của bạn yêu cầu hỏi quản trị viên trước. Mục sẽ được thêm ngay khi họ phê duyệt.';

  @override
  String get galleryRequestsTitle => 'Yêu cầu';

  @override
  String get galleryRequestsHelp =>
      'Ý tưởng cho Kho mẫu. Bình chọn cho mục bạn muốn; người tạo sẽ chọn làm từ những mục đứng đầu.';

  @override
  String get galleryRequestsLinkHelp =>
      'Đề xuất tính năng chưa có hoặc bình chọn';

  @override
  String get galleryRequestsTop => 'Hàng đầu';

  @override
  String get galleryRequestsNew => 'Mới';

  @override
  String get galleryRequestsEmpty =>
      'Chưa có yêu cầu nào. Hãy là người đầu tiên.';

  @override
  String get galleryRequestsError => 'Không tải được danh sách yêu cầu.';

  @override
  String get galleryRequestNew => 'Yêu cầu mới';

  @override
  String get galleryRequestNewHelp =>
      'Mô tả điều bạn muốn ai đó tạo ra. Các yêu cầu tương tự sẽ được gộp lại.';

  @override
  String get galleryRequestKind => 'Loại';

  @override
  String get galleryRequestTitleLabel => 'Nên làm được gì?';

  @override
  String get galleryRequestTitleLength => 'Dùng 4 đến 80 ký tự.';

  @override
  String get galleryRequestDetails => 'Chi tiết (không bắt buộc)';

  @override
  String get galleryRequestSend => 'Gửi yêu cầu';

  @override
  String get galleryRequestSent => 'Đã gửi yêu cầu';

  @override
  String galleryRequestSimilar(String title) {
    return '“$title” đã có người yêu cầu trước đó nên phiếu bình chọn của bạn được tính vào đó';
  }

  @override
  String get galleryRequestMine => 'Của bạn';

  @override
  String get galleryRequestVote => 'Bình chọn';

  @override
  String get galleryRequestOpen => 'Đang mở';

  @override
  String get galleryRequestPlanned => 'Đã lên kế hoạch';

  @override
  String get galleryRequestDone => 'Đã xong';

  @override
  String get galleryRequestDeclined => 'Đã từ chối';

  @override
  String get gallerySubmitStart => 'Gửi lên Kho mẫu';

  @override
  String get gallerySubmissionsLinkHelp =>
      'Chia sẻ diện mạo, kỹ năng, quy trình hoặc bot bạn đã tạo';

  @override
  String get gallerySubmitPick => 'Bạn muốn chia sẻ gì?';

  @override
  String get gallerySubmitPickHelp =>
      'Chọn thứ bạn đã tạo. Mục sẽ được kiểm duyệt trước khi lên Kho mẫu.';

  @override
  String get galleryLooksMine => 'Diện mạo của bạn';

  @override
  String get gallerySubmitCurrentScheme => 'Bảng màu đang dùng';

  @override
  String get gallerySubmitCurrentWallpaper => 'Hình nền đang dùng';

  @override
  String get gallerySubmitMyWallpaper => 'Hình nền của tôi';

  @override
  String gallerySubmitKindTitle(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'app': 'Gửi ứng dụng',
      'bot': 'Gửi bot mẫu',
      'routine': 'Gửi quy trình',
      'plugin': 'Gửi plugin',
      'set': 'Gửi bộ bot mẫu',
      'theme': 'Gửi diện mạo',
      'scheme': 'Gửi bảng màu',
      'wallpaper': 'Gửi hình nền',
      'other': 'Gửi kỹ năng',
    });
    return '$_temp0';
  }

  @override
  String get gallerySubmitHelp =>
      'Tên hiển thị của bạn xuất hiện ở mục tác giả. Email của bạn không bao giờ bị chia sẻ.';

  @override
  String get gallerySubmitName => 'Tên';

  @override
  String get gallerySubmitNameLength => 'Dùng 1 đến 60 ký tự.';

  @override
  String get gallerySubmitTags => 'Thẻ';

  @override
  String get gallerySubmitTagsHelp => 'Tối đa sáu thẻ, cách nhau bằng dấu phẩy';

  @override
  String get gallerySubmitLicense => 'Giấy phép';

  @override
  String gallerySubmitRemix(String name) {
    return 'Ghi nguồn bản gốc: $name';
  }

  @override
  String get gallerySubmitRemixUnnamed => 'Ghi nguồn mục gốc trong Kho mẫu';

  @override
  String get gallerySubmitSend => 'Gửi';

  @override
  String get gallerySubmitted => 'Đã gửi xét duyệt';

  @override
  String get gallerySubmissionsTitle => 'Bài gửi của tôi';

  @override
  String get gallerySubmissionsHelp =>
      'Những gì bạn đã gửi lên Kho mẫu và trạng thái hiện tại.';

  @override
  String get gallerySubmissionsSent => 'Đã gửi';

  @override
  String get gallerySubmissionsEmpty => 'Chưa gửi mục nào.';

  @override
  String get gallerySubmissionsError => 'Không tải được danh sách bài gửi.';

  @override
  String get gallerySubmissionOpen => 'Đang xét duyệt';

  @override
  String get gallerySubmissionMerged => 'Đã lên Kho mẫu';

  @override
  String get gallerySubmissionClosed => 'Không được duyệt';

  @override
  String get gallerySubmissionFailed => 'Không gửi được';

  @override
  String get galleryMyItems => 'Các mục của bạn trên Kho mẫu';

  @override
  String galleryReportsOpen(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count báo cáo đang mở',
      one: '1 báo cáo đang mở',
    );
    return '$_temp0';
  }

  @override
  String get islandBot => 'Một bot';

  @override
  String get islandNeedsOk => 'Cần bạn xác nhận';

  @override
  String get islandTakeOver => 'Muốn bạn tiếp quản';

  @override
  String get islandWriting => 'Đang viết câu trả lời';

  @override
  String get islandWorking => 'Đang làm việc';

  @override
  String get islandFinished => 'Đã xong';

  @override
  String get islandStoppedProblem => 'Đã dừng do gặp sự cố';

  @override
  String get islandOnThisMac => 'Trên máy Mac này';

  @override
  String get islandStale => 'Mở Casama để xem mới nhất';

  @override
  String get islandOpen => 'Mở';

  @override
  String get islandStop => 'Dừng';

  @override
  String get islandAllow => 'Cho phép';

  @override
  String get islandDeny => 'Từ chối';

  @override
  String get islandReview => 'Xem xét';

  @override
  String get islandNothing => 'Hiện không có bot nào đang làm việc';

  @override
  String get islandQuickAsk => 'Hỏi nhanh…';

  @override
  String get islandOpenCasama => 'Mở Casama';

  @override
  String get islandSettings => 'Cài đặt…';

  @override
  String get islandQuit => 'Thoát Casama';

  @override
  String get islandAskHint => 'Hỏi một bot…';

  @override
  String get islandNeedsYou => 'Cần bạn';

  @override
  String get islandDropHere => 'Thả vào đây để hỏi bot';

  @override
  String get siriSignedOut => 'Hãy đăng nhập Casama trước.';

  @override
  String get siriOpenToFinish => 'Mở Casama để hoàn tất.';

  @override
  String get siriTooMany =>
      'Bạn hỏi hơi nhiều trong một phút qua. Mở Casama để tiếp tục.';

  @override
  String get siriNoCredits =>
      'Bạn đã hết tín dụng. Mở Casama để thêm tín dụng.';

  @override
  String get siriOffline => 'Casama hiện không kết nối được internet.';

  @override
  String siriNeedsYou(String bot) {
    return '$bot cần bạn đồng ý trước. Mở Casama để xem xét.';
  }

  @override
  String siriBotFailed(String bot) {
    return '$bot gặp sự cố. Mở Casama để xem chuyện gì đã xảy ra.';
  }

  @override
  String siriRepliedHidden(String bot) {
    return '$bot đã trả lời. Mở Casama để đọc.';
  }

  @override
  String siriStillWorking(String bot) {
    return '$bot vẫn đang xử lý. Bạn sẽ nhận được thông báo khi xong.';
  }

  @override
  String siriAnsweredBy(String bot) {
    return '$bot đã trả lời.';
  }

  @override
  String siriRoutineStarted(String routine) {
    return 'Đã chạy $routine.';
  }

  @override
  String get siriNothingNeedsYou => 'Hiện không có gì cần bạn.';

  @override
  String siriThingsNeedYou(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Có $count việc cần bạn.',
      one: 'Có một việc cần bạn.',
    );
    return '$_temp0';
  }

  @override
  String siriNeedsYouBots(String bots) {
    return 'Đang chờ bạn: $bots.';
  }

  @override
  String get siriComputersUnavailable =>
      'Máy tính không khả dụng cho tài khoản này.';

  @override
  String get siriNoComputers =>
      'Bạn chưa có máy tính nào trong không gian làm việc này.';

  @override
  String siriStartingComputer(String computer) {
    return 'Đang khởi động $computer.';
  }

  @override
  String get siriComputerFailed => 'Hiện chưa khởi động được máy tính.';

  @override
  String get siriWhichBotToStop => 'Tôi nên dừng bot nào?';

  @override
  String get siriBotNotRunning => 'Bot đó hiện không chạy.';

  @override
  String get siriStopped => 'Đã dừng.';

  @override
  String get siriStopFailed => 'Hiện chưa dừng được bot.';

  @override
  String get focusFilterShowingAll => 'Bộ lọc Tập trung · Hiện tất cả';

  @override
  String focusFilterShown(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Bộ lọc Tập trung · Đang hiện $count',
      one: 'Bộ lọc Tập trung · Đang hiện 1',
    );
    return '$_temp0';
  }

  @override
  String get under13Title => 'Casama dành cho người từ 13 tuổi trở lên';

  @override
  String get under13Body =>
      'Tài khoản này không thể dùng Casama dựa trên độ tuổi đã khai báo. Bạn có thể đăng xuất hoặc xuất dữ liệu từ một tài khoản khác.';

  @override
  String get siriSpotlightSetting => 'Hiện trong Spotlight và Siri';

  @override
  String get siriSpotlightSettingHelp =>
      'Tên bot, tên quy trình và tiêu đề trò chuyện sẽ hiện trong Spotlight và Siri trên thiết bị này. Nội dung trò chuyện không bao giờ bị lộ. Mục này tắt khi bật khóa ứng dụng.';

  @override
  String get geminiSetting => 'Cho phép Gemini dùng Casama';

  @override
  String get geminiSettingHelp =>
      'Khi bạn yêu cầu Gemini dùng Casama, Gemini có thể hỏi bot của bạn, xem việc nào cần bạn và chạy quy trình trên điện thoại này. Gemini không bao giờ tự phê duyệt: các yêu cầu sẽ mở tại đây. Câu trả lời được ẩn trong không gian làm việc riêng tư, khi bật Ẩn nội dung trả lời hoặc khi bật khóa ứng dụng.';

  @override
  String get geminiOff =>
      'Gemini đang bị tắt đối với Casama trên điện thoại này. Bật lại trong Casama: Cài đặt, Quyền riêng tư.';

  @override
  String get islandBotWorking => 'Một bot đang làm việc';

  @override
  String get islandOnThisComputer => 'trên máy tính này';

  @override
  String get islandOnACall => 'Đang trong cuộc gọi';

  @override
  String get islandStartElsewhere => 'Bot bạn bắt đầu ở nơi khác';

  @override
  String get islandStartElsewhereHelp =>
      'Hiển thị các việc bạn bắt đầu trên thiết bị khác, như máy Mac, ngay trên Màn hình khóa của điện thoại này.';

  @override
  String get islandBotsAtWork => 'Bot đang làm việc';

  @override
  String islandSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bước',
      one: '1 bước',
    );
    return '$_temp0';
  }

  @override
  String get showBotsInNotch => 'Hiện bot ở phần khuyết';

  @override
  String get showBotsInNotchHelp =>
      'Hiện việc bot đang làm quanh cụm camera. Biểu tượng trên thanh menu vẫn luôn hiển thị dù bật hay tắt.';

  @override
  String get notchOnHover => 'Mở phần khuyết khi di chuột';

  @override
  String get notchOnHoverHelp => 'Tắt: nhấp vào phần khuyết để mở.';

  @override
  String get sitePublishToWeb => 'Xuất bản lên web';

  @override
  String get sitePublishToWebHelp => 'Cấp cho trang một địa chỉ web riêng.';

  @override
  String get siteAddressName => 'Tên địa chỉ';

  @override
  String get siteAddressRules =>
      'Gồm 3 đến 40 chữ cái thường, số và dấu gạch nối, bắt đầu và kết thúc bằng chữ cái hoặc số.';

  @override
  String get siteAddressChecking => 'Đang kiểm tra…';

  @override
  String get siteAddressAvailable => 'Khả dụng';

  @override
  String get siteAddressTaken => 'Tên này đã có người dùng.';

  @override
  String get siteAnyoneCanOpen => 'Ai có địa chỉ đều có thể mở trang này.';

  @override
  String get sitePublish => 'Xuất bản';

  @override
  String get siteOnTheWeb => 'Trên web';

  @override
  String get siteSearchEngines => 'Cho phép công cụ tìm kiếm tìm thấy';

  @override
  String get siteSearchEnginesHelp =>
      'Đưa trang vào kết quả của Google và các công cụ tìm kiếm khác.';

  @override
  String get siteSearchEnginesPaid => 'Cần có gói trả phí.';

  @override
  String get siteUseOwnDomain => 'Dùng tên miền của bạn';

  @override
  String get siteUnpublish => 'Gỡ xuất bản';

  @override
  String get siteUnpublishTitle => 'Gỡ xuất bản trang web này?';

  @override
  String get siteUnpublishBody =>
      'Trang sẽ ngừng mở ở các địa chỉ web của nó, nhưng vẫn nằm trong Thư viện của bạn.';

  @override
  String get siteHostLive => 'Đang hoạt động';

  @override
  String get siteHostWaitingForDns => 'Đang chờ DNS';

  @override
  String get siteHostGettingCertificate => 'Đang lấy chứng chỉ';

  @override
  String get siteHostNeedsAttention => 'Cần chú ý';

  @override
  String get siteHostPaused => 'Đã tạm dừng';

  @override
  String get siteHostSuspended => 'Đã tạm ngưng';

  @override
  String get settingsDomains => 'Tên miền';

  @override
  String get settingsDomainsHelp =>
      'Mở các trang web của bạn tại tên miền bạn sở hữu.';

  @override
  String get settingsSearchHint => 'Tìm trong cài đặt';

  @override
  String settingsSearchNone(String query) {
    return 'Không có mục cài đặt nào khớp với “$query”.';
  }

  @override
  String get domainsEmpty =>
      'Kết nối tên miền bạn sở hữu, như bakery.com, để mở trang web của bạn tại đó.';

  @override
  String get domainsConnectOwn => 'Kết nối tên miền bạn sở hữu';

  @override
  String get domainStateLive => 'Đang hoạt động';

  @override
  String get domainStateWaitingDns => 'Đang chờ DNS';

  @override
  String get domainStateWaitingCert => 'Đang lấy chứng chỉ';

  @override
  String get domainStatePaused => 'Đã tạm dừng';

  @override
  String get domainStateNeedsAttention => 'Cần chú ý';

  @override
  String get domainNoSite => 'Chưa có trang web';

  @override
  String get domainConnectField => 'Tên miền của bạn';

  @override
  String get domainConnectHelp =>
      'Nhập dạng bakery.com, www.bakery.com hoặc shop.bakery.com.';

  @override
  String get domainConnectSite => 'Trang web cần hiển thị';

  @override
  String get domainSiteNone => 'Không có';

  @override
  String get domainSiteNoneHelp =>
      'Tên miền sẽ không hiển thị gì cho đến khi bạn chọn một trang web.';

  @override
  String get domainConnect => 'Kết nối';

  @override
  String get domainClaimTitle => 'Chứng minh tên miền là của bạn';

  @override
  String get domainClaimBody =>
      'Một không gian làm việc khác đã kết nối tên miền này. Thêm bản ghi sau để chứng minh tên miền là của bạn, rồi chạm Kết nối lại.';

  @override
  String get domainRecordType => 'Loại';

  @override
  String get domainRecordName => 'Tên';

  @override
  String get domainRecordValue => 'Giá trị';

  @override
  String get domainSite => 'Trang web';

  @override
  String get domainPickSite => 'Chọn trang web';

  @override
  String get domainHosts => 'Địa chỉ';

  @override
  String get domainPrimary => 'Chính';

  @override
  String get domainPrimaryHelp =>
      'Khách truy cập sẽ vào trang này; các địa chỉ khác đều chuyển hướng về đây.';

  @override
  String get domainMakePrimary => 'Đặt làm chính';

  @override
  String get domainRecordsTitle => 'Các bản ghi cần thêm';

  @override
  String get domainRecordsAtCloudflare =>
      'Thêm các bản ghi này tại Cloudflare. Đặt bản ghi ở chế độ Chỉ DNS (DNS only).';

  @override
  String domainRecordsAt(String provider) {
    return 'Thêm các bản ghi này trong phần cài đặt DNS tại $provider.';
  }

  @override
  String get domainRecordsGeneric =>
      'Thêm các bản ghi này tại nơi quản lý DNS của tên miền, thường là công ty bạn đã mua tên miền.';

  @override
  String get domainRecordsNone => 'Không cần thêm gì. Bạn đã xong.';

  @override
  String get domainRecordOptional => 'Không bắt buộc';

  @override
  String domainRecordForward(String from, String to) {
    return 'Bật chuyển tiếp từ $from sang $to tại công ty bạn đã mua tên miền.';
  }

  @override
  String get domainRecordFound => 'Đã tìm thấy';

  @override
  String get domainRecordNotFound => 'Chưa tìm thấy';

  @override
  String get domainCheckAgain => 'Kiểm tra lại';

  @override
  String get domainCheckTooSoon =>
      'Chúng tôi vừa kiểm tra xong. Hãy thử lại sau vài giây.';

  @override
  String get domainChecksItself =>
      'Chúng tôi cũng tự động kiểm tra nên bạn có thể rời màn hình này.';

  @override
  String get domainHistory => 'Lịch sử';

  @override
  String get domainEventConnected => 'Đã kết nối';

  @override
  String get domainEventProved => 'Đã thấy bản ghi';

  @override
  String get domainEventLive => 'Đang hoạt động';

  @override
  String get domainEventNeedsDns => 'Vẫn đang chờ DNS';

  @override
  String get domainEventFailed => 'Chưa hoàn tất thiết lập được';

  @override
  String get domainEventDisconnected =>
      'Bản ghi đã bị xóa nên kết nối đã bị ngắt';

  @override
  String get domainEventPaused => 'Đã tạm dừng: gói của bạn chưa hỗ trợ';

  @override
  String get domainEventResumed => 'Đã hoạt động trở lại';

  @override
  String get domainEventRemoved => 'Đã ngắt kết nối';

  @override
  String get domainEventClaim => 'Đã yêu cầu chứng minh quyền sở hữu';

  @override
  String get domainEventClaimAttempt =>
      'Một không gian làm việc khác đã thử kết nối tên miền này';

  @override
  String get domainEventOverLimit => 'Vượt quá giới hạn gói của bạn';

  @override
  String get domainEventSuspended => 'Đã tạm ngưng';

  @override
  String get domainEventOther => 'Đã cập nhật';

  @override
  String domainDisconnectTitle(String name) {
    return 'Ngắt kết nối $name?';
  }

  @override
  String get domainDisconnectBody =>
      'Trang web của bạn sẽ ngừng mở ở tên miền này. Sau đó bạn có thể xóa các bản ghi tại nhà cung cấp DNS.';

  @override
  String get domainsFind => 'Tìm tên miền';

  @override
  String get domainsEmptyBuy =>
      'Mua tên miền cho trang web của bạn, hoặc kết nối tên miền bạn đã sở hữu.';

  @override
  String get domainFindField => 'Tên hoặc vài từ khóa';

  @override
  String get domainFindHint => 'tiembanh';

  @override
  String get domainFindHelp => 'Giá tính theo năm và chưa gồm thuế.';

  @override
  String get domainFindNone => 'Không tìm thấy tên nào. Hãy thử từ khác.';

  @override
  String get domainFindNotOffered =>
      'Ứng dụng này chưa hỗ trợ mua tên miền. Bạn vẫn có thể kết nối tên miền mình đã sở hữu.';

  @override
  String domainPricePerYear(String price) {
    return '$price mỗi năm cộng thuế';
  }

  @override
  String domainRenewsAt(String price) {
    return 'Gia hạn ở mức $price';
  }

  @override
  String get domainReasonTaken => 'Đã có người đăng ký';

  @override
  String get domainReasonPremium => 'Tên miền cao cấp, không bán tại đây';

  @override
  String get domainReasonNotSold => 'Không bán tại đây';

  @override
  String get domainBuy => 'Mua';

  @override
  String domainBuyTitle(String name) {
    return 'Mua $name';
  }

  @override
  String domainBuyPrice(String price, String renew) {
    return '$price cho năm đầu tiên, sau đó $renew mỗi năm, cộng thuế.';
  }

  @override
  String get domainBuyFinal =>
      'Sau khi tên miền được đăng ký, giao dịch không được hủy hay hoàn tiền. Nếu không đăng ký được, bạn sẽ được hoàn tiền đầy đủ.';

  @override
  String get domainBuyTerms => 'Tôi chấp nhận các điều khoản tên miền';

  @override
  String get domainBuyReadTerms => 'Đọc điều khoản';

  @override
  String get domainRenewAuto => 'Tự động gia hạn';

  @override
  String get domainRenewAutoHelp =>
      'Tính phí vào phương thức thanh toán đã lưu khoảng hai tuần trước khi hết hạn.';

  @override
  String get domainBuySite => 'Trang web cần hiển thị';

  @override
  String get domainBuyPayInBrowser =>
      'Hoàn tất thanh toán trong trình duyệt. Màn hình này sẽ tự cập nhật theo.';

  @override
  String get domainContactTitle => 'Thông tin liên hệ';

  @override
  String get domainContactHelp =>
      'Cá nhân hoặc doanh nghiệp đứng tên đăng ký tên miền. Nhà đăng ký luôn giữ kín các thông tin này.';

  @override
  String get domainContactFirstName => 'Tên';

  @override
  String get domainContactLastName => 'Họ';

  @override
  String get domainContactOrganization => 'Doanh nghiệp (không bắt buộc)';

  @override
  String get domainContactAddress1 => 'Địa chỉ';

  @override
  String get domainContactAddress2 => 'Địa chỉ dòng 2 (không bắt buộc)';

  @override
  String get domainContactCity => 'Thành phố';

  @override
  String get domainContactState => 'Bang / Tỉnh hoặc khu vực';

  @override
  String get domainContactZip => 'Mã bưu chính';

  @override
  String get domainContactCountry => 'Mã quốc gia';

  @override
  String get domainContactCountryHint => 'VN';

  @override
  String get domainContactPhone => 'Số điện thoại';

  @override
  String get domainContactPhoneHint => '+1 415 555 0100';

  @override
  String get domainContactEmail => 'Email';

  @override
  String get domainContactRequired => 'Bắt buộc';

  @override
  String get domainContactCountryInvalid => 'Dùng mã hai chữ cái, ví dụ US';

  @override
  String get domainContactPhoneInvalid =>
      'Dùng định dạng quốc tế, ví dụ +1 415 555 0100';

  @override
  String get domainContactEmailInvalid => 'Nhập email hợp lệ';

  @override
  String get domainContactSave => 'Lưu';

  @override
  String get domainContactSaved => 'Đã lưu thông tin liên hệ.';

  @override
  String get domainContactChangeNote =>
      'Thay đổi áp dụng cho mọi tên miền mà không gian làm việc này đã mua. Email mới sẽ cần được xác nhận lại.';

  @override
  String get domainOrderTitle => 'Đơn hàng của bạn';

  @override
  String get domainOrderWaitingPayment =>
      'Đang chờ bạn thanh toán trong trình duyệt.';

  @override
  String domainOrderRegistering(String name) {
    return 'Đang đăng ký $name…';
  }

  @override
  String domainOrderSettingUp(String name) {
    return 'Đang thiết lập $name…';
  }

  @override
  String domainOrderRefunding(String name) {
    return 'Không đăng ký được $name. Đang hoàn tiền cho bạn…';
  }

  @override
  String domainOrderRefunded(String name) {
    return 'Không đăng ký được $name nên chúng tôi đã hoàn tiền đầy đủ cho bạn.';
  }

  @override
  String get domainOrderAbandoned =>
      'Giao dịch này chưa được thanh toán nên bạn chưa bị tính phí.';

  @override
  String get domainOrderNeedsAttention =>
      'Đơn hàng này gặp trục trặc. Chúng tôi đã nhận được thông báo và sẽ xử lý sớm.';

  @override
  String domainOrderDone(String name) {
    return '$name đã thuộc về bạn.';
  }

  @override
  String get domainOrderLeave =>
      'Bạn có thể rời màn hình này. Chúng tôi sẽ báo cho bạn khi mọi thứ sẵn sàng.';

  @override
  String get domainOrderBack => 'Quay lại Tên miền';

  @override
  String domainRenewsOn(String date) {
    return 'Gia hạn vào $date';
  }

  @override
  String domainExpiresOn(String date) {
    return 'Hết hạn vào $date';
  }

  @override
  String domainRenewPrice(String price) {
    return '$price mỗi năm cộng thuế';
  }

  @override
  String get domainRenewNow => 'Gia hạn ngay';

  @override
  String get domainRenewPayInBrowser =>
      'Hoàn tất thanh toán trong trình duyệt. Ngày mới sẽ hiện ở đây sau khi thanh toán xong.';

  @override
  String get domainRenewCharged =>
      'Đã gia hạn. Ngày mới sẽ hiện ở đây sau một phút.';

  @override
  String get domainRegistration => 'Đăng ký';

  @override
  String domainExpired(String date) {
    return 'Đã hết hạn vào $date. Gia hạn trong vòng 25 ngày kể từ ngày đó để giữ tên miền.';
  }

  @override
  String get domainLapsed =>
      'Tên miền này đã quá hạn. Hãy viết cho bộ phận hỗ trợ để hỏi về việc khôi phục; điều đó không được đảm bảo.';

  @override
  String get domainSuspendedLine =>
      'Tên miền này đang bị tạm ngưng. Hãy viết cho bộ phận hỗ trợ để biết lý do.';

  @override
  String get domainVerifyTitle => 'Xác nhận email người đăng ký';

  @override
  String get domainVerifyBody =>
      'Nhà đăng ký đã gửi email tới địa chỉ của người đăng ký. Hãy mở và xác nhận, nếu không tên miền sẽ ngừng hoạt động.';

  @override
  String get domainVerifySendAgain => 'Gửi lại';

  @override
  String get domainVerifySent =>
      'Đã gửi. Hãy kiểm tra Hộp thư đến của người đăng ký.';

  @override
  String get domainDnsRecords => 'Bản ghi DNS';

  @override
  String get domainDnsRecordsHelp =>
      'Email, tên miền phụ và xác minh trang web';

  @override
  String get domainMoveOut => 'Chuyển sang nhà đăng ký khác';

  @override
  String domainMoveOutAfter(String date) {
    return 'Có thể chuyển sau $date';
  }

  @override
  String get domainMoveOutHelp => 'Lấy mã chuyển cho nhà đăng ký khác';

  @override
  String domainMoveOutTitle(String name) {
    return 'Chuyển $name?';
  }

  @override
  String domainMoveOutBody(String name) {
    return 'Thao tác này mở khóa tên miền và hiện mã chuyển một lần duy nhất. Nhập $name để xác nhận.';
  }

  @override
  String get domainMoveOutConfirm => 'Lấy mã chuyển';

  @override
  String domainMoveOutLocked(String date) {
    return 'Có thể chuyển sau $date.';
  }

  @override
  String get domainTransferCodeTitle => 'Mã chuyển';

  @override
  String get domainTransferCodeBody =>
      'Đưa mã này cho nhà đăng ký mới. Mã chỉ hiển thị duy nhất lần này, nên hãy sao chép ngay.';

  @override
  String get domainTransferCode => 'Mã';

  @override
  String get domainUnlocked => 'Đã mở khóa để chuyển';

  @override
  String get domainLockAgain => 'Khóa lại';

  @override
  String get domainLocked => 'Đã khóa lại.';

  @override
  String get domainReauthTitle => 'Đăng nhập lại';

  @override
  String get domainReauthSendCode => 'Gửi mã qua email cho tôi';

  @override
  String domainReauthCodeSent(String email) {
    return 'Chúng tôi đã gửi mã tới $email.';
  }

  @override
  String get domainReauthCode => 'Mã trong email';

  @override
  String get domainReauthSignIn => 'Đăng nhập';

  @override
  String get domainReauthSignOut =>
      'Đăng xuất rồi đăng nhập lại, sau đó thử thêm lần nữa.';

  @override
  String get dnsRecordsEmpty => 'Chưa có bản ghi nào.';

  @override
  String get dnsRecordAdd => 'Thêm bản ghi';

  @override
  String get dnsRecordEdit => 'Sửa bản ghi';

  @override
  String get dnsRecordManaged => 'Được trang web Casama của bạn sử dụng';

  @override
  String get dnsRecordType => 'Loại';

  @override
  String get dnsRecordHost => 'Tên';

  @override
  String dnsRecordHostHelp(String name) {
    return 'Để trống cho chính $name, hoặc nhập www, shop…';
  }

  @override
  String get dnsRecordAnswer => 'Giá trị';

  @override
  String get dnsRecordTtl => 'TTL (giây)';

  @override
  String get dnsRecordPriority => 'Độ ưu tiên';

  @override
  String get dnsRecordSave => 'Lưu';

  @override
  String get dnsRecordDeleteTitle => 'Xóa bản ghi này?';

  @override
  String dnsRecordDeleteBody(String type, String host, String answer) {
    return '$type $host → $answer';
  }

  @override
  String get dnsRecordTtlInvalid => 'Từ 300 giây trở lên';

  @override
  String get dnsRecordAnswerRequired => 'Bắt buộc';

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
      'Tên miền đã mua trong các không gian làm việc của bạn';

  @override
  String get deleteAccountDomainsBody =>
      'Các tên miền này vẫn còn hiệu lực đăng ký cho đến khi hết hạn, nhưng sẽ không tự gia hạn và các trang web gắn với chúng sẽ ngoại tuyến.';

  @override
  String get whatsNew010Sites =>
      'Đưa một trang lên web với địa chỉ riêng và dùng tên miền của chính bạn cho trang đó.';

  @override
  String get inAppAlertOpen => 'Mở';

  @override
  String get pushPrefsTitle => 'Thông báo';

  @override
  String get pushPrefsHelp =>
      'Chọn loại thông báo sẽ báo rung trên thiết bị của bạn. Mọi thứ vẫn vào Hộp thư đến.';

  @override
  String get pushAllOn => 'Bật tất cả';

  @override
  String pushKindOff(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'replies': 'Đã tắt Câu trả lời',
      'needsYou': 'Đã tắt Cần bạn',
      'routines': 'Đã tắt Quy trình và tóm tắt',
      'suggestions': 'Đã tắt Gợi ý và tin chủ động',
      'other': 'Đã tắt Tài khoản',
    });
    return '$_temp0';
  }

  @override
  String pushSomeOff(int count) {
    return 'Đã tắt $count loại';
  }

  @override
  String get pushReplies => 'Câu trả lời';

  @override
  String get pushRepliesHelp =>
      'Khi bot trả lời câu hỏi của bạn lúc bạn đã rời khỏi cuộc trò chuyện.';

  @override
  String get pushNeedsYou => 'Cần bạn';

  @override
  String get pushNeedsYouHelp =>
      'Phê duyệt, mật khẩu và yêu cầu tiếp quản mà bot đang chờ bạn.';

  @override
  String get pushNeedsYouOffWarning =>
      'Tắt: bot của bạn sẽ chờ cho đến khi bạn mở ứng dụng.';

  @override
  String get pushRoutines => 'Quy trình và tóm tắt';

  @override
  String get pushRoutinesHelp =>
      'Kết quả của quy trình và bản tóm tắt buổi sáng của bạn.';

  @override
  String get pushSuggestions => 'Gợi ý và tin chủ động';

  @override
  String get pushSuggestionsHelp => 'Những việc bot đề xuất làm giúp bạn.';

  @override
  String get pushAccount => 'Tài khoản';

  @override
  String get pushAccountHelp => 'Tín dụng sắp hết, dự án và máy chủ của bạn.';

  @override
  String get pushHideReplyText => 'Ẩn nội dung trả lời';

  @override
  String get pushHideReplyTextHelp =>
      'Thông báo chỉ báo bot đã trả lời, không hiện nội dung tin nhắn.';

  @override
  String get reactToMessage => 'Thả cảm xúc';

  @override
  String get moreReactions => 'Thêm biểu tượng cảm xúc';

  @override
  String get reactionsTitle => 'Cảm xúc';

  @override
  String get reactionsAll => 'Tất cả';

  @override
  String get reactionsYou => 'Bạn';

  @override
  String get reactionsTapToRemove => 'Chạm để gỡ';

  @override
  String get reactionsNone => 'Chưa có cảm xúc nào.';

  @override
  String get reactionsLoadFailed =>
      'Không tải được danh sách người đã thả cảm xúc.';

  @override
  String get searchEmoji => 'Tìm emoji';

  @override
  String reactionChip(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cảm xúc',
      one: '1 cảm xúc',
    );
    return '$emoji, $_temp0';
  }

  @override
  String reactionChipMine(String emoji, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cảm xúc',
      one: '1 cảm xúc',
    );
    return '$emoji, $_temp0, gồm cả của bạn';
  }

  @override
  String reactionQuick(String emoji) {
    return 'Thả cảm xúc $emoji';
  }

  @override
  String reactionRemove(String emoji) {
    return 'Gỡ cảm xúc $emoji của bạn';
  }

  @override
  String get packsShelfTitle => 'Bộ gói';

  @override
  String get packsShelfHelp =>
      'Bot, kỹ năng và quy trình phối hợp cùng nhau, thêm gọn trong một lần.';

  @override
  String get packReviewed => 'Đã kiểm duyệt';

  @override
  String get packNotReviewed => 'Chưa được Casama kiểm duyệt';

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
      other: '$count kỹ năng',
      one: '1 kỹ năng',
    );
    return '$_temp0';
  }

  @override
  String packCountRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count quy trình',
      one: '1 quy trình',
    );
    return '$_temp0';
  }

  @override
  String packCountApps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ứng dụng',
      one: '1 ứng dụng',
    );
    return '$_temp0';
  }

  @override
  String packCountLooks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count diện mạo',
      one: '1 diện mạo',
    );
    return '$_temp0';
  }

  @override
  String packCountTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count công cụ',
      one: '1 công cụ',
    );
    return '$_temp0';
  }

  @override
  String packCountItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục',
      one: '1 mục',
    );
    return '$_temp0';
  }

  @override
  String get packStarterSet => 'Bộ bot mẫu';

  @override
  String get packAddFromLink => 'Thêm bộ gói từ liên kết';

  @override
  String get packAddFromLinkHelp =>
      'Dán liên kết GitHub tới bộ gói và xem trước những gì sẽ được thêm.';

  @override
  String get packAddFromFile => 'Thêm từ tệp';

  @override
  String get packAddFromFileHelp => 'Chọn tệp .zip của bộ gói.';

  @override
  String get packLinkLabel => 'Liên kết GitHub';

  @override
  String get packFileUnreadable => 'Tệp này không phải tệp .zip của bộ gói.';

  @override
  String get packFileTooBig => 'Tệp này quá lớn đối với một bộ gói.';

  @override
  String packSource(String where, String commit) {
    return '$where tại $commit';
  }

  @override
  String get packFromFile => 'Từ tệp';

  @override
  String get packFromShare => 'Đã chia sẻ với bạn';

  @override
  String get packAlreadyHere => 'Không gian làm việc này đã có bộ gói này.';

  @override
  String get packOpenInstalled => 'Xem bộ gói đã cài';

  @override
  String get packAdd => 'Thêm bộ gói';

  @override
  String packWizardTitle(String name) {
    return 'Thêm $name';
  }

  @override
  String get packWhatsInside => 'Bên trong có gì';

  @override
  String get packWhatsInsideHelp => 'Bỏ chọn bất kỳ mục nào bạn không muốn.';

  @override
  String get packSectionBots => 'Bot';

  @override
  String get packSectionSkills => 'Kỹ năng';

  @override
  String get packSectionRoutines => 'Quy trình';

  @override
  String get packSectionApps => 'Ứng dụng';

  @override
  String get packSectionLooks => 'Diện mạo';

  @override
  String get packSectionIncludes => 'Từ Kho mẫu';

  @override
  String get packSectionTools => 'Công cụ';

  @override
  String get packSkillRunsScripts => 'Chạy tập lệnh trên máy tính của bot';

  @override
  String get packSkillForWorkspace => 'Dùng cho toàn bộ không gian làm việc';

  @override
  String packRoutineRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Chạy khoảng $count lần mỗi tuần',
      one: 'Chạy khoảng 1 lần mỗi tuần',
      zero: 'Chạy thỉnh thoảng',
    );
    return '$_temp0';
  }

  @override
  String packAppHost(String host) {
    return 'Giao tiếp với $host';
  }

  @override
  String packToolRemote(String url) {
    return 'Kết nối với $url';
  }

  @override
  String get packIncludeMissing => 'Không tìm thấy trong Kho mẫu';

  @override
  String get packLookHelp => 'Bạn có thể dùng trên thiết bị này sau khi thêm.';

  @override
  String get packNothingTicked => 'Chọn ít nhất một mục để thêm.';

  @override
  String get packQuestions => 'Vài câu hỏi nhỏ';

  @override
  String get packQuestionsHelp =>
      'Bộ gói sẽ điền các câu trả lời này vào bot và quy trình bên trong.';

  @override
  String get packSecretsTitle => 'Khóa và cài đặt';

  @override
  String get packSecretsHelp =>
      'Các công cụ của bộ gói cần thông tin này để hoạt động.';

  @override
  String get packReachTitle => 'Phạm vi tiếp cận';

  @override
  String get packReachHelp => 'Do Casama phân tích từ các tệp của bộ gói.';

  @override
  String get packReachRunsCode => 'Chạy mã';

  @override
  String get packReachComputer => 'Dùng máy tính của bot';

  @override
  String packReachHosts(String hosts) {
    return 'Giao tiếp với $hosts';
  }

  @override
  String get packReachNoHosts => 'Không giao tiếp với trang web khác';

  @override
  String packReachSecrets(String names) {
    return 'Dùng khóa: $names';
  }

  @override
  String packReachRuns(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Khoảng $count lượt chạy định kỳ mỗi tuần',
      one: 'Khoảng 1 lượt chạy định kỳ mỗi tuần',
      zero: 'Không có lượt chạy định kỳ',
    );
    return '$_temp0';
  }

  @override
  String get packUnreviewedWarning =>
      'Casama chưa kiểm duyệt bộ gói này. Chỉ thêm nếu bạn tin tưởng nguồn gốc. Các quy trình bên trong sẽ tắt sẵn khi mới thêm.';

  @override
  String get packPickBotTitle => 'Thêm cho bot nào?';

  @override
  String get packPickBotHelp =>
      'Bộ gói này không kèm bot nào. Hãy chọn một bot để nhận quy trình và công cụ của bộ gói.';

  @override
  String packDoneTitle(String name) {
    return 'Đã thêm $name';
  }

  @override
  String get packDoneHelp => 'Đây là những gì đã được thêm.';

  @override
  String get packPendingHelp =>
      'Chúng tôi đã hỏi quản trị viên. Bộ gói sẽ được thêm ngay khi họ phê duyệt.';

  @override
  String get packStatusInstalled => 'Đã thêm';

  @override
  String get packStatusPending => 'Đang chờ quản trị viên';

  @override
  String get packStatusSkipped => 'Đã bỏ qua';

  @override
  String get packStatusFailed => 'Không thành công';

  @override
  String get packStatusDevice => 'Trên thiết bị này';

  @override
  String get packConnectTitle => 'Kết nối ứng dụng của bộ gói';

  @override
  String get packConnectHelp =>
      'Các bot trong bộ hoạt động đầy đủ sau khi kết nối những ứng dụng này.';

  @override
  String get packLooksTitle => 'Dùng diện mạo trên thiết bị này?';

  @override
  String get packUseLook => 'Dùng';

  @override
  String get packLookInUse => 'Đang dùng';

  @override
  String get packInstalledTitle => 'Bộ gói này đã có ở đây';

  @override
  String get packsInstalledTitle => 'Bộ gói đã cài đặt';

  @override
  String get packsInstalledRow =>
      'Các bộ gói mà không gian làm việc này đã thêm, kèm bản cập nhật';

  @override
  String get packsInstalledEmpty =>
      'Chưa có bộ gói nào. Tìm một bộ gói trên kệ Bộ gói hoặc thêm từ liên kết.';

  @override
  String get packEditedBadge => 'Bạn đã sửa';

  @override
  String get packRemove => 'Gỡ bỏ';

  @override
  String get packUpToDate => 'Bộ gói này đang ở bản mới nhất.';

  @override
  String get packCantCheck =>
      'Bộ gói này được thêm từ tệp hoặc liên kết nên không thể tự kiểm tra cập nhật.';

  @override
  String packUpdateTitle(String name) {
    return 'Cập nhật $name';
  }

  @override
  String packDiffAdded(String names) {
    return 'Mới: $names';
  }

  @override
  String packDiffRemoved(String names) {
    return 'Đã gỡ: $names';
  }

  @override
  String packDiffChanged(String name) {
    return 'Đã thay đổi: $name';
  }

  @override
  String packDiffHosts(String hosts) {
    return 'Trang web mới có giao tiếp: $hosts';
  }

  @override
  String packDiffSecrets(String names) {
    return 'Khóa mới cần dùng: $names';
  }

  @override
  String packDiffSchedules(String names) {
    return 'Lịch chạy mới: $names';
  }

  @override
  String packDiffRuns(String from, String to) {
    return 'Lượt chạy định kỳ mỗi tuần: $from → $to';
  }

  @override
  String get packDiffNone => 'Không có thay đổi đáng kể nào.';

  @override
  String get packEditedTitle => 'Những mục bạn đã chỉnh sửa';

  @override
  String get packEditedHelp =>
      'Phiên bản của bạn vẫn giữ nguyên trừ khi bạn chọn đổi.';

  @override
  String get packTakeTheirs => 'Dùng bản của bộ gói';

  @override
  String get packReachGrewTitle => 'Mở rộng phạm vi hơn';

  @override
  String get packReachGrewHelp =>
      'Phiên bản mới tiếp cận nhiều hơn bản bạn đang có.';

  @override
  String get packReachConfirm =>
      'Tôi đã kiểm tra những gì bộ gói có thể tiếp cận hiện tại';

  @override
  String packUpdated(String name) {
    return 'Đã cập nhật $name.';
  }

  @override
  String packRemoveTitle(String name) {
    return 'Gỡ bỏ $name?';
  }

  @override
  String get packRemoveBody =>
      'Các công cụ và khóa của bộ sẽ bị gỡ cùng những kỹ năng và quy trình bạn chưa chỉnh sửa. Kết nối ứng dụng vẫn giữ lại.';

  @override
  String get packRemoveBots => 'Xóa luôn các bot mà bộ gói này đã tạo';

  @override
  String packRemoved(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã gỡ bộ gói. $count mục được giữ lại vì bạn đã chỉnh sửa.',
      one: 'Đã gỡ bộ gói. 1 mục được giữ lại vì bạn đã chỉnh sửa.',
      zero: 'Đã gỡ bộ gói.',
    );
    return '$_temp0';
  }

  @override
  String get sharePackTitle => 'Chia sẻ thành bộ gói';

  @override
  String get sharePackRow => 'Đóng gói bot và kỹ năng cho người khác dùng';

  @override
  String get sharePackHelp =>
      'Khóa, cuộc trò chuyện, trí nhớ, Giới thiệu về bạn và lựa chọn mô hình không bao giờ được đính kèm.';

  @override
  String get sharePackBots => 'Bot';

  @override
  String get sharePackBotsHelp =>
      'Chọn tối đa 5 bot. Mỗi bot mang theo hướng dẫn, kỹ năng và quy trình của mình.';

  @override
  String get sharePackSkills => 'Kỹ năng của không gian làm việc';

  @override
  String get sharePackName => 'Tên';

  @override
  String get sharePackSummary => 'Một dòng mô tả ngắn';

  @override
  String get sharePackLook => 'Đính kèm diện mạo của thiết bị này';

  @override
  String get sharePackCheck => 'Kiểm tra và chia sẻ';

  @override
  String get sharePackFindingsTitle => 'Một số dòng trông giống khóa bí mật';

  @override
  String get sharePackFindingsHelp =>
      'Kiểm tra kỹ trước khi chia sẻ. Quay lại để sửa hoặc chia sẻ nếu thấy an toàn.';

  @override
  String sharePackFinding(String path, int line, String what) {
    return '$path, dòng $line: $what';
  }

  @override
  String get sharePackGoBack => 'Quay lại';

  @override
  String get sharePackAnyway => 'Vẫn chia sẻ';

  @override
  String get sharePackLinkTitle => 'Liên kết bộ gói của bạn';

  @override
  String sharePackLinkHelp(String date) {
    return 'Bất kỳ ai đã đăng nhập Casama đều có thể mở liên kết này cho đến $date.';
  }

  @override
  String get sharePackShare => 'Chia sẻ';

  @override
  String get sharePackSaveFile => 'Lưu thành tệp';

  @override
  String get sharePackLinkCopied => 'Đã sao chép liên kết.';

  @override
  String get sharePackStop => 'Dừng chia sẻ';

  @override
  String get sharePackStopped => 'Liên kết không còn hoạt động.';

  @override
  String pluginFromPack(String pack) {
    return 'Từ bộ gói $pack';
  }

  @override
  String get pluginFromPackHelp =>
      'Cập nhật hoặc gỡ mục này cùng bộ gói của nó trong Kho mẫu → Bộ gói đã cài đặt.';

  @override
  String get pluginSettings => 'Cài đặt';

  @override
  String get pluginEditSettings => 'Sửa cài đặt';

  @override
  String get pluginSettingsSaved => 'Đã lưu cài đặt.';

  @override
  String get galleryPolicyKeyHelp =>
      'Bạn cũng có thể nhập kho lưu trữ (repo/owner:name) hoặc bộ gói (pack/name).';

  @override
  String galleryPolicyUseKey(String key) {
    return 'Thêm $key';
  }

  @override
  String galleryApprovalPack(String name) {
    return 'Bộ gói: $name';
  }

  @override
  String get reportPackShare => 'Báo cáo bộ gói này';

  @override
  String get appLock => 'Khóa ứng dụng';

  @override
  String get appLockRow => 'Yêu cầu mở khóa Casama khi mở ứng dụng';

  @override
  String get appLockHelp =>
      'Casama yêu cầu mở khóa mỗi khi mở ứng dụng hoặc sau một khoảng thời gian rời đi. Khi bật, thông tin đăng nhập được lưu trong chuỗi khóa của thiết bị này.';

  @override
  String get appLockSwitch => 'Khóa Casama';

  @override
  String get appLockLocked => 'Casama đang bị khóa';

  @override
  String get appLockUnlock => 'Mở khóa';

  @override
  String get appLockUnlockWithPasskey => 'Mở khóa bằng khóa truy cập';

  @override
  String get appLockUnlockReason => 'Mở khóa Casama';

  @override
  String get appLockTurnOnReason => 'Bật khóa ứng dụng';

  @override
  String get appLockConfirmReason => 'Xác nhận đó là bạn';

  @override
  String get appLockConfirmTitle => 'Xác nhận đó là bạn';

  @override
  String get approvalConfirmTitle => 'Cho phép thao tác này?';

  @override
  String get approvalConfirmBody =>
      'Đây là yêu cầu có rủi ro cao. Cho phép bot tiếp tục?';

  @override
  String get approvalConfirmAllow => 'Cho phép';

  @override
  String appLockUnlockWith(String method) {
    return 'Dùng $method.';
  }

  @override
  String get appLockDeviceIos => 'Face ID, Touch ID hoặc mật mã';

  @override
  String get appLockDeviceAndroid => 'vân tay, khuôn mặt hoặc khóa màn hình';

  @override
  String get appLockDeviceMac => 'Touch ID hoặc mật khẩu máy Mac';

  @override
  String get appLockDeviceWindows => 'Windows Hello';

  @override
  String get appLockDeviceOther => 'khóa màn hình của thiết bị';

  @override
  String appLockMethodDevice(String method) {
    return 'Mở khóa bằng $method';
  }

  @override
  String get appLockMethodPin => 'Mở khóa bằng mã PIN 6 chữ số';

  @override
  String get appLockMethodPasskey => 'Mở khóa bằng khóa truy cập';

  @override
  String get appLockPinHint => 'Nhập mã PIN';

  @override
  String appLockPinWrong(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Sai mã PIN. Còn $count lần thử.',
      one: 'Sai mã PIN. Còn 1 lần thử.',
      zero: 'Sai mã PIN.',
    );
    return '$_temp0';
  }

  @override
  String get appLockPinStopped =>
      'Nhập sai mã PIN quá nhiều lần. Hãy đăng xuất rồi đăng nhập lại để mở Casama.';

  @override
  String get appLockFailed => 'Không thành công. Hãy thử lại.';

  @override
  String get appLockUnavailable =>
      'Thiết bị này hiện không mở khóa Casama được. Hãy đăng xuất rồi đăng nhập lại để vào tiếp.';

  @override
  String get appLockSignOutConfirm =>
      'Đăng xuất sẽ tắt khóa ứng dụng trên thiết bị này. Đăng nhập lại để mở Casama.';

  @override
  String get appLockCallRinging =>
      'Có cuộc gọi đang đổ chuông. Mở khóa để nghe máy.';

  @override
  String get appLockRequiredTitle => 'Bật khóa ứng dụng';

  @override
  String appLockRequiredBody(String workspace) {
    return '$workspace yêu cầu bật khóa ứng dụng trên mọi thiết bị mở Casama.';
  }

  @override
  String get appLockRequiredNoWay =>
      'Trình duyệt này không dùng được khóa truy cập với máy chủ này nên không thể khóa Casama. Hãy mở Casama bằng ứng dụng trên điện thoại hoặc máy tính.';

  @override
  String appLockRequiredBy(String workspace) {
    return 'Đang bật. Bắt buộc bởi $workspace';
  }

  @override
  String get appLockTurnOn => 'Bật';

  @override
  String get appLockTurnedOn => 'Đã bật khóa ứng dụng';

  @override
  String get appLockNoWayHere =>
      'Trình duyệt này không dùng được khóa truy cập với máy chủ này nên không thể khóa Casama tại đây.';

  @override
  String get appLockNotChecked => 'Không thể xác nhận đó là bạn.';

  @override
  String get appLockPinSetupTitle => 'Chọn mã PIN';

  @override
  String get appLockPinAgainTitle => 'Nhập lại mã PIN';

  @override
  String get appLockPinSetupBody =>
      '6 chữ số. Bạn sẽ nhập mã này khi mở Casama.';

  @override
  String get appLockPinNext => 'Tiếp tục';

  @override
  String get appLockPinMismatch => 'Hai mã PIN không khớp. Hãy chọn lại.';

  @override
  String get appLockPinNotSaved => 'Không lưu được mã PIN trên thiết bị này.';

  @override
  String get appLockPinChanged => 'Đã đổi mã PIN';

  @override
  String get appLockChangePin => 'Đổi mã PIN';

  @override
  String get appLockAfter => 'Khóa sau';

  @override
  String get appLockAfterHelp =>
      'Thời gian chạy nền, thu nhỏ hoặc nằm sau các ứng dụng khác trên máy tính.';

  @override
  String get appLockAfterImmediately => 'Ngay lập tức';

  @override
  String get appLockAfterOneMinute => '1 phút';

  @override
  String get appLockAfterFiveMinutes => '5 phút';

  @override
  String get appLockAfterFifteenMinutes => '15 phút';

  @override
  String get appLockAfterOneHour => '1 giờ';

  @override
  String get appLockBlockScreenshots => 'Chặn ảnh chụp màn hình';

  @override
  String get appLockBlockScreenshotsHelp =>
      'Ảnh chụp màn hình, quay màn hình và chia sẻ màn hình sẽ không thấy nội dung Casama.';

  @override
  String get appLockLockNow => 'Khóa ngay';

  @override
  String get appLockPrivacySection => 'Quyền riêng tư nâng cao';

  @override
  String get appLockAskBeforeRisky => 'Xác nhận thao tác rủi ro';

  @override
  String get appLockAskBeforeRiskyHelp =>
      'Yêu cầu mở khóa lại trước khi xóa tài khoản, tạo khóa, đổi thanh toán, xuất dữ liệu, phê duyệt yêu cầu rủi ro cao và tiếp quản máy tính.';

  @override
  String get requireAppLock => 'Bắt buộc khóa ứng dụng';

  @override
  String get requireAppLockHelp =>
      'Thành viên phải khóa Casama trên mọi thiết bị trước khi mở. Trên web cần dùng khóa truy cập.';

  @override
  String get requireAppLockOwnFirst =>
      'Hãy bật khóa ứng dụng trên thiết bị này trước.';

  @override
  String get permLocation => 'Vị trí';

  @override
  String get permLocationAlways => 'Vị trí khi chạy nền';

  @override
  String get permCamera => 'Camera';

  @override
  String get permMicrophone => 'Micrô';

  @override
  String get permSpeech => 'Nhận dạng giọng nói';

  @override
  String get permPhotos => 'Ảnh';

  @override
  String get permContacts => 'Danh bạ';

  @override
  String get permCalendar => 'Lịch';

  @override
  String get permHealth => 'Sức khỏe';

  @override
  String get permNotifications => 'Thông báo';

  @override
  String get permNotificationAccess => 'Quyền đọc thông báo';

  @override
  String get permAccessibility => 'Trợ năng';

  @override
  String get permScreenRecording => 'Ghi màn hình';

  @override
  String get permAutomation => 'Tự động hóa';

  @override
  String get permFullDisk => 'Quyền truy cập đầy đủ vào ổ đĩa';

  @override
  String get permSharedFolders => 'Thư mục dùng chung';

  @override
  String get permLocalTools => 'Công cụ cục bộ';

  @override
  String get cardPermissions => 'Quyền';

  @override
  String permissionsTitle(String device) {
    return 'Bật các mục này cho $device';
  }

  @override
  String get permStateOn => 'Đang bật';

  @override
  String get permStateOff => 'Đang tắt';

  @override
  String get permStateNotAsked => 'Chưa hỏi';

  @override
  String get permStateLimited => 'Giới hạn';

  @override
  String get permStateUnknown => 'Không rõ';

  @override
  String get permStateUnavailable => 'Không khả dụng trên thiết bị này';

  @override
  String get permStateUpdate => 'Cập nhật Casama để bật mục này tại đây';

  @override
  String get permTurnOn => 'Bật';

  @override
  String get permOpenSettings => 'Mở cài đặt';

  @override
  String get permOpenHealth => 'Mở Sức khỏe';

  @override
  String get permHealthIosHow =>
      'Trong ứng dụng Sức khỏe, chạm vào ảnh đại diện, chọn Ứng dụng, chọn Casama rồi bật các mục bot được phép đọc.';

  @override
  String get permChoose => 'Chọn';

  @override
  String get permRestart => 'Khởi động lại Casama';

  @override
  String get permRestartToFinish => 'Khởi động lại Casama để hoàn tất';

  @override
  String permOpenedOn(String device) {
    return 'Đã mở trên $device';
  }

  @override
  String permSentTo(String device) {
    return 'Đã gửi tới $device: chạm vào thông báo ở đó';
  }

  @override
  String permOffline(String device) {
    return '$device đang ngoại tuyến';
  }

  @override
  String permRestarting(String device) {
    return 'Đang khởi động lại Casama trên $device';
  }

  @override
  String permOnlyOwner(String device) {
    return 'Chỉ chủ sở hữu của $device mới bật được các quyền này';
  }

  @override
  String get permNotNowLine => 'Để sau';

  @override
  String get permContinue => 'Tiếp tục';

  @override
  String get permContinueMessage => 'Đã bật rồi, cứ tiếp tục đi.';

  @override
  String get permContinuedLine => 'Đã bật';

  @override
  String get permissionsScreenTitle => 'Quyền';

  @override
  String get permissionsScreenHelp =>
      'Những gì bot được dùng trên thiết bị này. Casama chỉ hỏi quyền khi bạn chạm vào.';

  @override
  String get permissionsRowHelp =>
      'Vị trí, màn hình, micrô và các quyền khác trên thiết bị này';

  @override
  String permOtherDevice(String device) {
    return 'Mục này dành cho $device. Mở Casama ở đó để bật.';
  }

  @override
  String get permAnotherDevice => 'một thiết bị khác';

  @override
  String get permissionsNone => 'Không có quyền nào cần bật trên thiết bị này.';

  @override
  String get widgetNeedsYou => 'Cần bạn';

  @override
  String get widgetAllClear => 'Ổn cả';

  @override
  String get widgetAllow => 'Cho phép';

  @override
  String get widgetDeny => 'Từ chối';

  @override
  String get widgetReview => 'Xem xét';

  @override
  String get widgetOpen => 'Mở';

  @override
  String get widgetDoIt => 'Làm đi';

  @override
  String get widgetRunNow => 'Chạy ngay';

  @override
  String get widgetStarted => 'Đã chạy';

  @override
  String get widgetStop => 'Dừng';

  @override
  String get widgetAsk => 'Hỏi';

  @override
  String widgetAskBot(String bot) {
    return 'Hỏi $bot';
  }

  @override
  String get widgetTalk => 'Nói';

  @override
  String get widgetTry => 'Thử';

  @override
  String get widgetUpNext => 'Tiếp theo';

  @override
  String get widgetNoRoutines => 'Chưa có quy trình';

  @override
  String get widgetWorking => 'Đang làm';

  @override
  String get widgetWaiting => 'Đang chờ bạn';

  @override
  String get widgetIdle => 'Rảnh';

  @override
  String widgetRepliedAt(String time) {
    return 'Trả lời lúc $time';
  }

  @override
  String get widgetBrief => 'Tóm tắt';

  @override
  String widgetBriefAt(String time) {
    return 'Tóm tắt lúc $time';
  }

  @override
  String get widgetNoBrief => 'Chưa có tóm tắt';

  @override
  String get widgetToday => 'Hôm nay';

  @override
  String get widgetCredits => 'Tín dụng';

  @override
  String widgetCreditsLeft(String amount) {
    return 'Còn $amount';
  }

  @override
  String widgetSpentToday(String amount) {
    return '$amount hôm nay';
  }

  @override
  String widgetUsedPct(String n) {
    return 'Đã dùng $n%';
  }

  @override
  String widgetResetsAt(String time) {
    return 'Đặt lại $time';
  }

  @override
  String get widgetFinished => 'Đã xong';

  @override
  String get widgetLibrary => 'Thư viện';

  @override
  String get widgetNoCreations => 'Chưa tạo gì';

  @override
  String get widgetTasks => 'Việc';

  @override
  String get widgetTodo => 'Cần làm';

  @override
  String get widgetInProgress => 'Đang làm';

  @override
  String get widgetInReview => 'Đang duyệt';

  @override
  String get widgetBlocked => 'Bị chặn';

  @override
  String get widgetSignIn => 'Mở Casama để đăng nhập';

  @override
  String get widgetNoBots => 'Gặp gỡ bot đầu tiên';

  @override
  String widgetAsOf(String time) {
    return 'lúc $time';
  }

  @override
  String get widgetUpdateServer =>
      'Cập nhật máy chủ Casama để dùng tiện ích này';

  @override
  String widgetNeedsOkFrom(String bot) {
    return '$bot cần bạn đồng ý';
  }

  @override
  String widgetSuggests(String bot) {
    return '$bot gợi ý';
  }

  @override
  String widgetTakeOver(String bot) {
    return '$bot cần bạn tiếp quản';
  }

  @override
  String widgetNextBrief(String time) {
    return 'Tóm tắt tiếp theo $time';
  }

  @override
  String get widgetNothingNext => 'Chưa lên lịch gì';

  @override
  String get widgetsTitle => 'Tiện ích';

  @override
  String get widgetsRow => 'Bot của bạn trên Màn hình chính và Màn hình khóa';

  @override
  String get widgetsIntro =>
      'Tiện ích hiển thị việc bot đang làm và những gì đang chờ bạn mà không cần mở Casama.';

  @override
  String get widgetNameBot => 'Bot';

  @override
  String get widgetNameRoutines => 'Quy trình';

  @override
  String get widgetDescNeedsYou => 'Xem những bot nào đang chờ bạn';

  @override
  String get widgetDescBot => 'Xem một bot đang làm gì';

  @override
  String get widgetDescAsk => 'Hỏi hoặc trò chuyện với bot chỉ bằng một chạm';

  @override
  String get widgetDescRoutines => 'Xem quy trình sắp chạy và chạy ngay';

  @override
  String get widgetDescToday => 'Xem cả ngày của bạn trên một tiện ích lớn';

  @override
  String get widgetDescBrief => 'Đọc bản tóm tắt buổi sáng của bạn';

  @override
  String get widgetDescLibrary => 'Xem những gì bot mới tạo gần đây';

  @override
  String get widgetDescTasks => 'Xem tình hình bảng công việc';

  @override
  String get widgetDescCredits => 'Theo dõi số dư tín dụng của bạn';

  @override
  String get widgetsAddToHome => 'Thêm vào Màn hình chính';

  @override
  String get widgetsPinUnsupported =>
      'Trình khởi chạy của bạn không thêm tiện ích từ đây được. Chạm giữ chỗ trống trên Màn hình chính, chạm Tiện ích rồi chọn Casama.';

  @override
  String get widgetsHowToAdd => 'Cách thêm';

  @override
  String get widgetsHowToIos =>
      'Chạm giữ chỗ trống trên Màn hình chính, chạm Sửa, chọn Thêm tiện ích rồi chọn Casama.';

  @override
  String get widgetsHowToMac =>
      'Nhấp vào ngày giờ trên thanh menu, chọn Sửa tiện ích rồi chọn Casama. Hoặc nhấp chuột phải vào màn hình nền và chọn Sửa tiện ích.';

  @override
  String get widgetsLockScreen => 'Màn hình khóa và điều khiển';

  @override
  String get widgetsLockScreenHelp =>
      'Chạm giữ Màn hình khóa, chạm Tùy chỉnh, chọn Màn hình khóa rồi chạm vào vùng dưới đồng hồ để thêm Cần bạn, Tiếp theo, Bot hoặc Tín dụng. Yêu cầu sẽ ẩn cho đến khi bạn mở khóa.';

  @override
  String get widgetsControlsHelp =>
      'Mở Trung tâm điều khiển, chạm giữ, chạm Thêm điều khiển rồi chọn Hỏi Casama, Nói chuyện với bot hoặc Chạy quy trình. Chúng cũng gắn được vào góc Màn hình khóa và nút Tác vụ.';

  @override
  String get widgetsShowDetails => 'Hiện chi tiết trong tiện ích';

  @override
  String get widgetsShowDetailsHelp =>
      'Khi bật khóa ứng dụng, tiện ích chỉ hiện số lượng và tên bot, các nút bấm sẽ mở Casama. Bật mục này để hiện cả yêu cầu, tin nhắn và tên quy trình.';

  @override
  String get widgetsShowDetailsNoLock =>
      'Chỉ có tác dụng khi đang bật khóa ứng dụng. Khi tắt khóa, tiện ích luôn hiện chi tiết.';

  @override
  String widgetsShowDetailsRequired(String workspace) {
    return '$workspace yêu cầu khóa ứng dụng nên tiện ích luôn ẩn chi tiết.';
  }

  @override
  String get widgetsPinBot => 'Ghim bot ra Màn hình chính';

  @override
  String get widgetsPinBotHelp =>
      'Đưa bot lên Màn hình chính như một biểu tượng riêng. Chạm vào để trò chuyện.';

  @override
  String get widgetsPin => 'Ghim';

  @override
  String get widgetNudgeNeedsYou =>
      'Trả lời yêu cầu ngay từ Màn hình chính bằng tiện ích Cần bạn.';

  @override
  String get widgetNudgeRoutines =>
      'Chạy quy trình từ Màn hình chính bằng tiện ích Quy trình.';

  @override
  String get widgetNameCanvas => 'Canvas';

  @override
  String get widgetDescCanvas =>
      'Hiển thị những gì bot đặt lên đó, như câu trích dẫn hằng ngày hay bộ đếm ngược';

  @override
  String get canvasEmpty => 'Bảo một bot đặt thứ gì đó lên đây';

  @override
  String get canvasTry =>
      'Thử: đặt một câu châm ngôn mỗi ngày lên Màn hình khóa';

  @override
  String get canvasAutomatic => 'Tự động';

  @override
  String canvasIn(String time) {
    return 'còn $time';
  }

  @override
  String canvasSince(String time) {
    return 'đã $time';
  }

  @override
  String get canvasNow => 'Bây giờ';

  @override
  String canvasLeft(String n) {
    return 'còn $n';
  }

  @override
  String get canvasLeftUnit => 'còn';

  @override
  String canvasDaysUnit(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ngày',
      one: 'ngày',
    );
    return '$_temp0';
  }

  @override
  String get canvasCardLabel => 'Tiện ích';

  @override
  String canvasPreviewAsk(String bot) {
    return '$bot muốn hiển thị nội dung này trên tiện ích của bạn';
  }

  @override
  String canvasPreviewAskHelp(String bot) {
    return 'Một khi bạn đồng ý, $bot có thể tự cập nhật mà không cần hỏi lại. Bạn có thể dừng bất cứ lúc nào trong Cài đặt, Tiện ích.';
  }

  @override
  String canvasPreviewSet(String bot) {
    return '$bot đã đặt nội dung này lên tiện ích của bạn';
  }

  @override
  String get canvasShow => 'Hiện trên tiện ích của tôi';

  @override
  String get canvasShowing => 'Đang hiện trên tiện ích của bạn';

  @override
  String canvasNotShown(String bot) {
    return 'Chưa hiển thị. $bot có thể hỏi lại vào hôm khác.';
  }

  @override
  String get canvasGone => 'Không còn trên tiện ích của bạn';

  @override
  String get canvasNotPlaced => 'Thêm tiện ích Canvas để xem nội dung này.';

  @override
  String get canvasHowToIos =>
      'Chạm giữ Màn hình chính hoặc Màn hình khóa, chạm Sửa, chọn Thêm tiện ích, chọn Casama rồi chọn Canvas.';

  @override
  String get canvasHowToMac =>
      'Nhấp chuột phải vào màn hình nền, chọn Sửa tiện ích, chọn Casama rồi chọn Canvas.';

  @override
  String get canvasHowToElsewhere =>
      'Thêm tiện ích Canvas của Casama trên điện thoại hoặc máy Mac để xem tại đó.';

  @override
  String get canvasAdded => 'Đã thêm tiện ích Canvas';

  @override
  String get canvasLockScreen => 'Trên Màn hình khóa';

  @override
  String get widgetsFromBots => 'Từ bot của bạn';

  @override
  String get widgetsFromBotsEmpty =>
      'Chưa có gì. Hãy bảo bot câu gì đó như \"Đặt một câu châm ngôn mỗi ngày lên Màn hình khóa\".';

  @override
  String canvasSetAt(String time) {
    return 'Đặt lúc $time';
  }

  @override
  String canvasOnDevices(String devices) {
    return 'Đang hiện trên $devices';
  }

  @override
  String get canvasNoWidget => 'Chưa đặt tiện ích Canvas nào';

  @override
  String get canvasPausedLine => 'Đã tạm dừng';

  @override
  String get canvasWaitingLine => 'Đang chờ bạn đồng ý';

  @override
  String get canvasHideLocked => 'Ẩn khi điện thoại khóa';

  @override
  String get canvasPause => 'Tạm dừng';

  @override
  String get canvasResume => 'Tiếp tục';

  @override
  String get canvasClear => 'Xóa';

  @override
  String canvasClearTitle(String name) {
    return 'Xóa $name?';
  }

  @override
  String canvasClearMessage(String bot) {
    return 'Nội dung sẽ biến mất khỏi tiện ích. $bot có thể đặt nội dung khác lên đó lại.';
  }

  @override
  String get canvasAllowedBots => 'Bot được dùng tiện ích';

  @override
  String get canvasMayShow =>
      'Được phép hiển thị nội dung trên tiện ích của bạn';

  @override
  String canvasStopTitle(String bot) {
    return 'Dừng $bot?';
  }

  @override
  String canvasStopMessage(String bot) {
    return 'Những gì $bot hiển thị trên tiện ích sẽ bị xóa và bot phải hỏi xin lại quyền.';
  }

  @override
  String get canvasStop => 'Dừng';

  @override
  String get canvasDeviceIos => 'iPhone';

  @override
  String get canvasDeviceAndroid => 'Điện thoại Android';

  @override
  String get canvasDeviceMac => 'Mac';

  @override
  String get widgetNudgeAction => 'Xem thử';

  @override
  String get widgetLowRisk => 'Rủi ro thấp';

  @override
  String get widgetThisMonth => 'Tháng này';

  @override
  String get watchNow => 'Hiện tại';

  @override
  String get watchAsk => 'Hỏi';

  @override
  String watchAskBot(String bot) {
    return 'Hỏi $bot';
  }

  @override
  String get watchBots => 'Bot';

  @override
  String get watchUpNext => 'Tiếp theo';

  @override
  String get watchBrief => 'Tóm tắt';

  @override
  String get watchSettings => 'Cài đặt';

  @override
  String get watchChat => 'Trò chuyện';

  @override
  String get watchTalk => 'Nói';

  @override
  String get watchCredits => 'Tín dụng';

  @override
  String get watchNeedsYou => 'Cần bạn';

  @override
  String get watchNeedsYouOne => '1 cần bạn';

  @override
  String watchNeedsYouMany(String count) {
    return '$count cần bạn';
  }

  @override
  String get watchNeedsOk => 'Cần bạn đồng ý';

  @override
  String watchNeedsOkFrom(String bot) {
    return '$bot cần bạn đồng ý';
  }

  @override
  String watchSuggests(String bot) {
    return '$bot gợi ý';
  }

  @override
  String get watchTakeOver => 'Muốn bạn tiếp quản';

  @override
  String get watchAllClear => 'Ổn cả';

  @override
  String get watchNothingWaiting => 'Không có gì cần bạn';

  @override
  String get watchAllow => 'Cho phép';

  @override
  String get watchDeny => 'Từ chối';

  @override
  String get watchHoldToAllow => 'Nhấn giữ để cho phép';

  @override
  String get watchHoldHint => 'Cho phép yêu cầu này? Chạm đúp để cho phép.';

  @override
  String get watchReview => 'Xem xét';

  @override
  String get watchReviewOnIphone => 'Xem trên iPhone';

  @override
  String get watchReviewOnPhone => 'Xem trên điện thoại';

  @override
  String get watchWhyHighRisk => 'Rủi ro cao: trả lời trên điện thoại';

  @override
  String get watchWhyPayment => 'Thanh toán được xử lý trên điện thoại';

  @override
  String get watchWhySetting => 'Cài đặt của bạn giữ mục này trên điện thoại';

  @override
  String get watchWhyWorkspace =>
      'Không gian làm việc giữ mục này trên điện thoại';

  @override
  String get watchWhyNotYours =>
      'Chỉ người bắt đầu cuộc trò chuyện này mới cho phép được';

  @override
  String get watchHighRisk => 'Rủi ro cao';

  @override
  String get watchMediumRisk => 'Rủi ro vừa';

  @override
  String get watchLowRisk => 'Rủi ro thấp';

  @override
  String get watchAllowed => 'Đã cho phép';

  @override
  String get watchDenied => 'Đã từ chối';

  @override
  String get watchDone => 'Đã xong';

  @override
  String get watchAlreadyAnswered => 'Đã trả lời trước đó';

  @override
  String get watchLockToAllow =>
      'Đặt mật mã trên đồng hồ này để cho phép từ đây';

  @override
  String get watchDoIt => 'Làm đi';

  @override
  String get watchNotNow => 'Để sau';

  @override
  String get watchOpenOnIphone => 'Mở trên iPhone';

  @override
  String get watchOpenOnPhone => 'Mở trên điện thoại';

  @override
  String get watchSentToPhone => 'Đã gửi tới điện thoại';

  @override
  String get watchWorking => 'Đang làm';

  @override
  String watchIsWorking(String bot) {
    return '$bot đang làm việc';
  }

  @override
  String get watchWaitingForYou => 'Đang chờ bạn';

  @override
  String watchRepliedAt(String time) {
    return 'Trả lời lúc $time';
  }

  @override
  String get watchIdle => 'Rảnh';

  @override
  String get watchOff => 'Đang tắt';

  @override
  String watchStepCount(String count) {
    return 'Bước $count';
  }

  @override
  String get watchStop => 'Dừng';

  @override
  String get watchStopped => 'Đã dừng';

  @override
  String get watchFinished => 'Đã xong';

  @override
  String get watchProblem => 'Dừng do sự cố';

  @override
  String get watchCouldntFinish => 'Không hoàn tất được';

  @override
  String get watchListening => 'Đang nghe…';

  @override
  String get watchTapToStop => 'Chạm để dừng';

  @override
  String get watchTypeInstead => 'Nhập chữ thay thế';

  @override
  String get watchSending => 'Đang gửi…';

  @override
  String get watchHeard => 'Đã nghe';

  @override
  String get watchUndo => 'Hoàn tác';

  @override
  String get watchKeptOffline => 'Đã lưu. Sẽ gửi khi trực tuyến trở lại';

  @override
  String watchKeptOld(String time) {
    return 'Gửi câu bạn đã hỏi lúc $time?';
  }

  @override
  String get watchSend => 'Gửi';

  @override
  String get watchDiscard => 'Hủy bỏ';

  @override
  String get watchMicDenied =>
      'Cấp quyền micrô trong Cài đặt để hỏi bằng giọng nói';

  @override
  String get watchNoDictation =>
      'Máy chủ này chưa có dịch vụ giọng nói. Hãy dùng Nhập chữ thay thế';

  @override
  String get watchDidntCatch => 'Không nghe rõ. Hãy thử lại';

  @override
  String get watchReply => 'Trả lời';

  @override
  String get watchReadAloud => 'Đọc to';

  @override
  String get watchStopReading => 'Dừng đọc';

  @override
  String get watchContinuesOnIphone => 'Xem tiếp trên iPhone';

  @override
  String get watchContinuesOnPhone => 'Xem tiếp trên điện thoại';

  @override
  String get watchReplyReady => 'Đã có câu trả lời';

  @override
  String get watchYou => 'Bạn';

  @override
  String get watchQuickYes => 'Có';

  @override
  String get watchQuickNo => 'Không';

  @override
  String get watchQuickTellMore => 'Kể thêm đi';

  @override
  String get watchQuickNotNow => 'Để sau';

  @override
  String get watchRunNow => 'Chạy ngay';

  @override
  String get watchStarted => 'Đã chạy';

  @override
  String watchInMinutes(String minutes) {
    return 'sau $minutes phút';
  }

  @override
  String get watchNoRoutines => 'Chưa có quy trình';

  @override
  String watchBriefAt(String time) {
    return 'Tóm tắt lúc $time';
  }

  @override
  String watchBriefTomorrow(String time) {
    return 'Tóm tắt lúc $time ngày mai';
  }

  @override
  String get watchNoBrief => 'Chưa cài đặt tóm tắt';

  @override
  String get watchNoBots => 'Chưa có bot nào. Tạo trên điện thoại của bạn';

  @override
  String get watchSigningIn => 'Đang đăng nhập cho bạn';

  @override
  String watchSignedInAs(String name) {
    return 'Đã đăng nhập với tên $name';
  }

  @override
  String get watchOpenPhoneToFinishIphone =>
      'Mở Casama trên iPhone để hoàn tất';

  @override
  String get watchOpenPhoneToFinish => 'Mở Casama trên điện thoại để hoàn tất';

  @override
  String get watchUseCode => 'Đăng nhập bằng mã';

  @override
  String get watchCodeHelp =>
      'Nhập mã trong Casama trên điện thoại hoặc máy tính: Cài đặt → Đồng hồ';

  @override
  String get watchNewCode => 'Mã mới';

  @override
  String get watchSignedOut => 'Đồng hồ này đã đăng xuất';

  @override
  String get watchOpenToSignIn => 'Mở Casama để đăng nhập';

  @override
  String watchAsOf(String time) {
    return 'lúc $time';
  }

  @override
  String get watchOffline => 'Ngoại tuyến';

  @override
  String get watchCouldntReach => 'Không kết nối được với Casama';

  @override
  String get watchTryAgain => 'Thử lại';

  @override
  String get watchServerTooOld => 'Cập nhật máy chủ Casama để dùng đồng hồ';

  @override
  String get watchOutOfCredits => 'Hết tín dụng';

  @override
  String get watchTalkOnPhone => 'Đang bắt đầu cuộc gọi trên điện thoại';

  @override
  String get watchSignOut => 'Đăng xuất khỏi đồng hồ này';

  @override
  String get watchHideDetails => 'Ẩn chi tiết khi hạ cổ tay';

  @override
  String get watchReadRepliesAloud => 'Đọc to câu trả lời';

  @override
  String get watchAskUses => 'Bot cho mục Hỏi';

  @override
  String get watchWorkspace => 'Không gian làm việc';

  @override
  String get watchSignedInAsLabel => 'Đăng nhập bằng';

  @override
  String get watchCompNeedsYou => 'Cần bạn';

  @override
  String get watchCompAsk => 'Hỏi một bot';

  @override
  String get watchCompBot => 'Bot';

  @override
  String get watchCompUpNext => 'Tiếp theo';

  @override
  String get watchCompCasama => 'Casama';

  @override
  String get watchCompDescNeedsYou => 'Số yêu cầu đang chờ và yêu cầu đầu tiên';

  @override
  String get watchCompDescAsk => 'Hỏi bot bằng giọng nói chỉ với một chạm';

  @override
  String get watchCompDescBot => 'Trạng thái bot và việc bot đang làm';

  @override
  String get watchCompDescUpNext => 'Quy trình tiếp theo và thời điểm chạy';

  @override
  String get watchCompDescCredits => 'Tín dụng đã dùng trong kỳ này';

  @override
  String get watchNeedYouShort => 'cần bạn';

  @override
  String get watchControlAsk => 'Hỏi Casama';

  @override
  String get watchControlTalk => 'Nói chuyện với bot';

  @override
  String get watchControlRun => 'Chạy quy trình';

  @override
  String watchSiriNeeds(String count, String text) {
    return '$count việc cần bạn. Đầu tiên: $text';
  }

  @override
  String get watchPhoneTitle => 'Đồng hồ';

  @override
  String get watchPhoneIntro =>
      'Phản hồi bot, hỏi bằng giọng nói và xem ai đang làm việc ngay từ cổ tay.';

  @override
  String get watchPhoneWatches => 'Đồng hồ đã đăng nhập';

  @override
  String get watchPhoneNone =>
      'Chưa có đồng hồ nào đăng nhập. Mở Casama trên đồng hồ, thiết bị sẽ tự đăng nhập.';

  @override
  String watchPhoneLastUsed(String time) {
    return 'Dùng lần cuối $time';
  }

  @override
  String get watchPhoneNeverUsed => 'Chưa từng dùng';

  @override
  String get watchPhoneRemove => 'Gỡ';

  @override
  String watchPhoneRemoveTitle(String name) {
    return 'Gỡ $name?';
  }

  @override
  String get watchPhoneRemoveBody =>
      'Thiết bị sẽ đăng xuất ngay lập tức. Bạn có thể đăng nhập lại sau.';

  @override
  String get watchPhoneUseCode => 'Đăng nhập đồng hồ bằng mã';

  @override
  String get watchPhoneCodeHint => 'Mã trên đồng hồ của bạn';

  @override
  String watchPhoneCodeAsk(String name) {
    return 'Đăng nhập $name?';
  }

  @override
  String watchPhoneCodeAskBody(String workspace) {
    return 'Thiết bị sẽ đăng nhập vào $workspace bằng tài khoản của bạn. Chỉ cho phép mã hiển thị trên đồng hồ của chính bạn.';
  }

  @override
  String get watchPhoneCodeAllow => 'Đăng nhập thiết bị';

  @override
  String get watchPhoneCodeWrong =>
      'Mã đó không khớp. Hãy kiểm tra lại trên đồng hồ';

  @override
  String get watchPhoneCodeTaken =>
      'Đồng hồ này vẫn đang đăng nhập ở tài khoản khác. Hãy gỡ bên đó trong Cài đặt → Đồng hồ rồi lấy mã mới';

  @override
  String watchPhoneElsewhere(String workspace) {
    return 'Đang đăng nhập ở $workspace';
  }

  @override
  String get watchPhoneElsewhereUnknown =>
      'Đang đăng nhập ở một không gian làm việc khác';

  @override
  String watchPhoneSignedIn(String name) {
    return '$name đã đăng nhập';
  }

  @override
  String get watchPhoneAllowTitle => 'Cho phép từ đồng hồ';

  @override
  String get watchPhoneAllowMedium => 'Rủi ro thấp và vừa';

  @override
  String get watchPhoneAllowMediumBody =>
      'Rủi ro thấp chạm một lần, rủi ro vừa nhấn giữ. Rủi ro cao và thanh toán luôn cần điện thoại.';

  @override
  String get watchPhoneAllowLow => 'Chỉ rủi ro thấp';

  @override
  String get watchPhoneAllowNone => 'Không bao giờ';

  @override
  String get watchPhoneDetails => 'Hiện chi tiết trên đồng hồ';

  @override
  String get watchPhoneDetailsBody =>
      'Tắt: đồng hồ chỉ hiện số lượng và tên bot, không hiện nội dung bot viết.';

  @override
  String get watchPhoneQuickReplies => 'Trả lời nhanh';

  @override
  String get watchPhoneQuickRepliesBody =>
      'Câu trả lời ngắn gửi thẳng từ thông báo phản hồi. Tối đa sáu câu.';

  @override
  String get watchPhoneQuickAdd => 'Thêm câu trả lời nhanh';

  @override
  String get watchPhoneQuickReset => 'Dùng các câu trả lời mặc định';

  @override
  String get watchPhoneHowTo => 'Thêm Casama vào mặt đồng hồ';

  @override
  String get watchPhoneHowToApple =>
      'Chạm giữ mặt đồng hồ, chạm Sửa rồi chọn Casama cho một tổ hợp. Xoay Digital Crown trên mặt đồng hồ để tìm Casama trong Ngăn xếp thông minh.';

  @override
  String get watchPhoneHowToWear =>
      'Chạm giữ mặt đồng hồ để thêm tổ hợp Casama. Vuốt sang trái từ mặt đồng hồ và chạm + để thêm thẻ Casama.';

  @override
  String watchPhoneSigningInBanner(String name) {
    return 'Đang đăng nhập $name…';
  }

  @override
  String get watchPhoneLockAsk => 'Đăng nhập đồng hồ của bạn?';

  @override
  String get watchPhoneNudge =>
      'Casama cũng có trên đồng hồ. Trả lời bot ngay từ cổ tay bạn.';

  @override
  String get watchPhoneHandoffTitle => 'Từ đồng hồ của bạn';

  @override
  String get watchPhoneRow =>
      'Bot của bạn trên Apple Watch hoặc đồng hồ Wear OS';

  @override
  String get watchPhoneAllowLowBody =>
      'Rủi ro thấp chạm một lần. Mọi thứ khác cần điện thoại.';

  @override
  String get watchPhoneAllowNoneBody =>
      'Đồng hồ chỉ có thể từ chối. Cho phép trên điện thoại.';

  @override
  String get watchPhoneDetailsLockOff =>
      'Đã tắt vì khóa ứng dụng đang bật nên đồng hồ không hiện nội dung trò chuyện. Bật lại nếu muốn xem.';

  @override
  String get watchPhoneQuickHint => 'Một câu trả lời ngắn';

  @override
  String get watchPhoneQuickTooLong => 'Tối đa 40 ký tự';

  @override
  String get watchPhoneQuickMoveUp => 'Đưa lên';

  @override
  String get watchPhoneQuickMoveDown => 'Đưa xuống';

  @override
  String get watchPhoneQuickDelete => 'Xóa câu trả lời này';

  @override
  String get watchPhoneCodeBody =>
      'Trên đồng hồ, mở Casama và chọn Đăng nhập bằng mã.';

  @override
  String get watchPhoneAppleWatch => 'Apple Watch';

  @override
  String get watchPhoneWearOs => 'Wear OS';

  @override
  String get watchCompDescWorking => 'Ai đang làm việc và đang làm gì';

  @override
  String get watchCompDescBrief => 'Bản tóm tắt sáng nay';

  @override
  String get watchCodeWaiting => 'Đang chờ mã…';

  @override
  String watchCodeA11y(String code) {
    return 'Mã đăng nhập $code';
  }

  @override
  String get watchChooseBot => 'Chọn một bot';

  @override
  String get watchChannelRequests => 'Yêu cầu';

  @override
  String get watchChannelReplies => 'Câu trả lời';

  @override
  String get watchChannelRuns => 'Bot đang làm việc';

  @override
  String get watchChannelOther => 'Khác';

  @override
  String get watchOtherWorkspace =>
      'Việc này ở một không gian làm việc khác. Hãy trả lời trên điện thoại';

  @override
  String get watchReplySent => 'Đã gửi';

  @override
  String get watchReplyNotSent => 'Không gửi được câu trả lời của bạn';

  @override
  String watchAskDropped(String time) {
    return 'Không gửi được câu bạn đã hỏi lúc $time';
  }

  @override
  String get watchNeedsHttps =>
      'Đồng hồ chỉ kết nối được tới máy chủ qua https hoặc qua mạng Wi-Fi ở nhà';

  @override
  String get watchSignIn => 'Đăng nhập';

  @override
  String get watchNotOnWatch =>
      'Đồng hồ chưa trả lời được mục này. Hãy mở trên điện thoại';

  @override
  String watchMoreOnPhone(String count) {
    return 'còn $count mục nữa trên điện thoại';
  }

  @override
  String get watchShareCrashReports => 'Chia sẻ báo cáo sự cố';

  @override
  String get showList => 'Hiện danh sách';

  @override
  String get hideList => 'Ẩn danh sách';

  @override
  String get panePickLibrary => 'Chọn một mục từ Thư viện để xem tại đây.';

  @override
  String get panePickSetting => 'Chọn một mục cài đặt để xem tại đây.';

  @override
  String get trackpad => 'Bàn di chuột';

  @override
  String get trackpadHint =>
      'Một ngón để di chuyển con trỏ, hai ngón để cuộn, chạm để nhấp.';

  @override
  String get trackpadTakeControl =>
      'Tiếp quản quyền điều khiển để dùng bàn di chuột.';

  @override
  String get foldScreenTitle => 'Màn hình gập';

  @override
  String get foldRowHelp =>
      'Những gì Casama thấy từ các màn hình của thiết bị này';

  @override
  String get foldScreenHelp =>
      'Cách cầm thiết bị và vị trí nếp gập theo góc nhìn của Casama lúc này. Mở, đóng hoặc gập thiết bị để xem các con số thay đổi theo. Sao chép lại nếu thấy màn hình hiển thị sai.';

  @override
  String get foldPose => 'Tư thế gập';

  @override
  String get foldWindow => 'Cửa sổ';

  @override
  String get foldInsets => 'Vùng an toàn';

  @override
  String get foldStrip => 'Dải bên';

  @override
  String get foldFold => 'Nếp gập';

  @override
  String get foldHinge => 'Bản lề';

  @override
  String get foldSystemSays => 'Thông số từ hệ thống';

  @override
  String get inviteGateLine =>
      'Casama Cloud hiện chỉ nhận người dùng qua lời mời.';

  @override
  String get inviteGateSelfHost =>
      'Tự chạy Casama trên máy chủ riêng luôn mở cho tất cả mọi người.';

  @override
  String get joinTheWaitlist => 'Tham gia danh sách chờ';

  @override
  String get iHaveAnInvite => 'Tôi có mã mời';

  @override
  String get waitlistSubtitle =>
      'Chúng tôi mở dần cho từng nhóm nhỏ. Bạn sẽ nhận được một email khi đến lượt.';

  @override
  String get waitlistNote => 'Bạn muốn nhờ bot làm việc gì đầu tiên?';

  @override
  String get waitlistNoteHint => 'Không bắt buộc';

  @override
  String get waitlistSelfHosting => 'Tôi tự chạy Casama trên máy chủ riêng';

  @override
  String get waitlistNewsletter =>
      'Gửi thêm cho tôi email hằng tháng của Casama (tối đa mỗi tháng một lần)';

  @override
  String get waitlistAppleRelay =>
      'Đây là địa chỉ riêng tư Apple tạo cho bạn. Hãy giữ nguyên nếu bạn sẽ đăng nhập bằng Apple; Apple sẽ chuyển tiếp email của chúng tôi tới Hộp thư đến của bạn.';

  @override
  String get waitlistJoinedTitle => 'Bạn đã có tên trong danh sách.';

  @override
  String get waitlistJoinedBody =>
      'Chúng tôi mở dần cho từng nhóm nhỏ. Bạn sẽ chỉ nhận được một email khi đến lượt, ngoài ra không nhận thư nào khác trừ phi bạn chọn nhận email hằng tháng. Bạn quen ai đang dùng Casama? Lời mời từ họ sẽ đưa bạn vào ngay lập tức.';

  @override
  String get waitlistJoinedCode => 'Đã có mã mời? Nhập tại đây.';

  @override
  String get waitlistJoinedSelfHost =>
      'Không muốn chờ đợi? Casama là mã nguồn mở. Hãy tự chạy trên máy tính của bạn ngay hôm nay.';

  @override
  String get waitlistRunItYourself => 'Tự chạy phiên bản riêng';

  @override
  String get inviteSubtitle => 'Nhập mã mời hoặc dán liên kết mời.';

  @override
  String get inviteCodeLabel => 'Mã mời';

  @override
  String get inviteNotFound =>
      'Mã đó không khớp với lời mời nào. Kiểm tra lại rồi thử lần nữa.';

  @override
  String inviteFromName(String name) {
    return '$name đã mời bạn tham gia Casama';
  }

  @override
  String get inviteFromFriend => 'Một người bạn đã mời bạn tham gia Casama';

  @override
  String inviteFromCampaign(String label) {
    return 'Mã mời của bạn: $label';
  }

  @override
  String get inviteFromCasama => 'Mã mời tham gia Casama của bạn';

  @override
  String get inviteChooseSignIn =>
      'Giờ hãy chọn cách đăng nhập. Dùng địa chỉ bạn muốn cho tài khoản của mình.';

  @override
  String get inviteGoneHelp =>
      'Số lời mời này đã hết. Nhập email của bạn để vào danh sách chờ ở vị trí ưu tiên.';

  @override
  String get inviteEmailHelp =>
      'Chúng tôi sẽ duyệt địa chỉ này rồi gửi liên kết đăng nhập tới đó.';

  @override
  String inviteCheckInbox(String email) {
    return 'Bạn đã vào rồi. Kiểm tra $email để lấy liên kết đăng nhập hoặc nhập mã tại đây.';
  }

  @override
  String get inviteWaitlistedTitle => 'Bạn đang trong danh sách chờ';

  @override
  String get inviteWaitlisted =>
      'Số lời mời này đã hết, nhưng bạn đang ở vị trí ưu tiên.';

  @override
  String get inviteUseEmailHere =>
      'Trên thiết bị này, hãy chọn Tiếp tục bằng Email. Apple và Google hoạt động cùng mã mời trên ứng dụng iPhone, Mac và Android.';

  @override
  String get inviteDifferentCode => 'Dùng mã khác';

  @override
  String get inviteRefusedHelp =>
      'Tham gia danh sách chờ để chúng tôi gửi email khi đến lượt bạn, hoặc nhập mã mời nếu bạn đã có.';

  @override
  String get inviteRefusedWaitlisted =>
      'Casama Cloud hiện chỉ nhận người dùng qua lời mời. Chúng tôi sẽ gửi email khi đến lượt bạn. Có mã mời? Hãy dùng ngay.';

  @override
  String inviteFriendsInvitesLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Còn $count lời mời',
      one: 'Còn 1 lời mời',
      zero: 'Không còn lời mời nào',
    );
    return '$_temp0';
  }

  @override
  String inviteFriendsInvitesUsed(int used, int total) {
    return 'Đã dùng $used / $total. Mỗi lời mời giúp một người bạn tạo tài khoản.';
  }

  @override
  String get inviteFriendsInvitesLocked =>
      'Lời mời sẽ mở khóa sau khi bạn hoàn tất cuộc trò chuyện đầu tiên.';

  @override
  String get inviteWaitingTitle => 'Đang chờ lời mời của bạn';

  @override
  String get inviteWaitingUses => 'Cho họ vào sẽ dùng một lời mời của bạn.';

  @override
  String get inviteWaitingNoneLeft =>
      'Bạn sẽ nhận lại một lời mời khi người bạn mà bạn mời hoàn tất cuộc trò chuyện đầu tiên.';

  @override
  String get inviteWaitingLetIn => 'Cho vào';

  @override
  String inviteWaitingLetInLabel(String email) {
    return 'Cho $email vào';
  }

  @override
  String get inviteWaitingDone =>
      'Họ sẽ nhận được email để đăng ký sau vài phút.';

  @override
  String inviteShareSaved(int count, String link) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mình giữ cho bạn một trong $count lời mời Casama của mình đây.',
      one: 'Mình giữ cho bạn lời mời Casama của mình đây.',
    );
    return '$_temp0 Casama hiện chỉ nhận người dùng qua lời mời, liên kết này giúp bạn vào ngay: $link';
  }

  @override
  String inviteShareSavedBonus(int count, String link, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mình giữ cho bạn một trong $count lời mời Casama của mình đây.',
      one: 'Mình giữ cho bạn lời mời Casama của mình đây.',
    );
    return '$_temp0 Casama hiện chỉ nhận người dùng qua lời mời. Liên kết này giúp bạn vào ngay và nhận thêm $amount hạn mức miễn phí sau cuộc trò chuyện đầu tiên: $link';
  }

  @override
  String inviteShareNamed(String name, String text) {
    return '$name, $text';
  }

  @override
  String get inviteNameTitle => 'Gửi cho ai?';

  @override
  String get inviteNameHelp =>
      'Thêm tên của họ để trang lời mời chào đón bằng tên riêng. Bạn có thể để trống.';

  @override
  String get inviteNameHint => 'Tên';

  @override
  String get inviteNameShare => 'Chia sẻ lời mời';

  @override
  String get inviteAskTitle => 'Còn ai nữa sẽ dùng ứng dụng này?';

  @override
  String inviteAskBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bạn có $count lời mời vào Casama. Mỗi lời mời giúp một người bạn vào ngay lập tức.',
      one: 'Bạn có 1 lời mời vào Casama. Lời mời này giúp một người bạn vào ngay lập tức.',
    );
    return '$_temp0';
  }

  @override
  String inviteAskRewardBoth(String amount) {
    return 'Mỗi người nhận $amount hạn mức miễn phí sau cuộc trò chuyện đầu tiên của họ.';
  }

  @override
  String inviteAskReward(String amount) {
    return 'Bạn nhận $amount hạn mức miễn phí sau cuộc trò chuyện đầu tiên của họ.';
  }

  @override
  String get inviteAskSend => 'Gửi lời mời';

  @override
  String get inviteAskNotNow => 'Để sau';

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
      other: 'Đã lưu $count lượt đặt lại',
      one: 'Đã lưu 1 lượt đặt lại',
    );
    return '$_temp0';
  }

  @override
  String savedResetExpiry(String date) {
    return 'Dùng trước $date';
  }

  @override
  String get savedResetUse => 'Dùng lượt đặt lại';

  @override
  String get savedResetConfirmTitle => 'Dùng lượt đặt lại này?';

  @override
  String get savedResetConfirmDaily =>
      'Xóa giới hạn hôm nay để bot của bạn làm việc tiếp trong ngày. Không thể hoàn tác thao tác này.';

  @override
  String get savedResetConfirmComputer =>
      'Hoàn lại số giờ dùng máy tính của tháng này. Không thể hoàn tác thao tác này.';

  @override
  String get savedResetOwnerRequired =>
      'Chỉ chủ sở hữu không gian làm việc mới dùng được.';

  @override
  String get savedResetPaused => 'Tạm dừng lúc này. Hãy kiểm tra lại sau.';

  @override
  String get savedResetPeriodLimit =>
      'Bạn đã dùng lượt đặt lại của kỳ này. Bạn có thể dùng lượt này vào kỳ sau.';

  @override
  String get savedResetNothingToRefill =>
      'Chưa có gì cần bù thêm. Hãy giữ lại cho lúc sắp hết hạn mức.';

  @override
  String get savedResetNoBillingPeriod =>
      'Khả dụng ngay sau khi gói của bạn thiết lập xong.';

  @override
  String get savedResetUnavailable => 'Hiện chưa khả dụng.';

  @override
  String savedResetDone(String amount) {
    return 'Đã dùng lượt đặt lại: đã cộng $amount';
  }

  @override
  String get savedResetDoneNoCredits => 'Đã dùng lượt đặt lại';

  @override
  String savedResetConfirm(String amount) {
    return 'Bù lại $amount tín dụng đi kèm của kỳ này. Không thể hoàn tác thao tác này.';
  }

  @override
  String get adminResets => 'Resets';

  @override
  String get resetsEnabled => 'Bật lượt đặt lại đã lưu';

  @override
  String get resetsOffNote => 'Tắt: không ai nhận được lượt đặt lại đã lưu.';

  @override
  String get resetsDecrease => 'Giảm';

  @override
  String get resetsIncrease => 'Tăng';

  @override
  String get resetsSettings => 'Cài đặt';

  @override
  String get resetsCampaigns => 'Chiến dịch';

  @override
  String get resetsStatLive => 'Đang chạy';

  @override
  String get resetsStatGiven => 'Đã cấp';

  @override
  String get resetsStatUsed => 'Đã dùng';

  @override
  String get resetsStatRefilled => 'Đã bù lại';

  @override
  String get resetsFilterActive => 'Đang hoạt động';

  @override
  String get resetsFilterEnded => 'Đã kết thúc';

  @override
  String get resetsFilterAll => 'Tất cả';

  @override
  String get resetsStateDraft => 'Bản nháp';

  @override
  String get resetsStateScheduled => 'Đã lên lịch';

  @override
  String get resetsStateLive => 'Đang chạy';

  @override
  String get resetsStatePaused => 'Đã tạm dừng';

  @override
  String get resetsStateEnded => 'Đã kết thúc';

  @override
  String get resetsStateCancelled => 'Đã hủy';

  @override
  String resetsBudgetUsed(String used, String budget) {
    return 'Đã dùng $used / $budget ngân sách';
  }

  @override
  String resetsGivenN(String count) {
    return 'Đã cấp $count';
  }

  @override
  String resetsUsedN(String count) {
    return 'Đã dùng $count';
  }

  @override
  String resetsStartsEnds(String start, String end) {
    return 'Bắt đầu $start · Kết thúc $end';
  }

  @override
  String get resetsToday => 'hôm nay';

  @override
  String get resetsTomorrow => 'ngày mai';

  @override
  String get resetsYesterday => 'hôm qua';

  @override
  String get resetsAudienceEveryone => 'Mọi không gian làm việc';

  @override
  String resetsAudienceWorkspaces(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count không gian làm việc',
      one: '1 không gian làm việc',
    );
    return '$_temp0';
  }

  @override
  String resetsAudienceJoinedBefore(String date) {
    return 'Tham gia trước $date';
  }

  @override
  String resetsAudienceLimited(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Chạm giới hạn trong $days ngày qua',
      one: 'Chạm giới hạn hôm nay',
    );
    return '$_temp0';
  }

  @override
  String get resetsCancelCampaign => 'Hủy chiến dịch';

  @override
  String get resetsCancelConfirm => 'Hủy chiến dịch này?';

  @override
  String get resetsCancelConfirmBody =>
      'Ngừng cấp các lượt đặt lại đã lưu. Không thể hoàn tác thao tác này.';

  @override
  String get resetsDeleteConfirm => 'Xóa chiến dịch này?';

  @override
  String get resetsDeleteConfirmBody => 'Bản nháp sẽ bị xóa vĩnh viễn.';

  @override
  String get resetsNoCampaigns =>
      'Chưa có chiến dịch nào. Tạo chiến dịch để cấp lượt đặt lại đã lưu cho nhiều không gian làm việc cùng lúc.';

  @override
  String get resetsNoMatches => 'Không có chiến dịch nào ở đây.';

  @override
  String get resetsEditCampaign => 'Sửa chiến dịch';

  @override
  String get resetsSectionBasics => 'Cơ bản';

  @override
  String get resetsSectionAudience => 'Đối tượng';

  @override
  String get resetsSectionTiming => 'Thời gian';

  @override
  String get resetsSectionRefill => 'Bù lại';

  @override
  String get resetsSectionWhat => 'Mục được đặt lại';

  @override
  String get resetsSectionNotify => 'Thông báo';

  @override
  String get resetsPreviewLabel => 'Nội dung mọi người thấy';

  @override
  String get resetsMonthly => 'Hằng tháng';

  @override
  String get resetsYearly => 'Hằng năm';

  @override
  String get resetsPlanPlus => 'Plus';

  @override
  String get resetsPlanPro => 'Pro';

  @override
  String get resetsPlanMax => 'Max';

  @override
  String get resetsPlansLabel => 'Các gói';

  @override
  String get resetsPlansHint => 'Không chọn mục nào để áp dụng cho mọi gói.';

  @override
  String get resetsWorkspacesLabel => 'Không gian làm việc';

  @override
  String get resetsWorkspacesHint =>
      'Để trống để áp dụng cho mọi không gian làm việc.';

  @override
  String get resetsSearchWorkspaces => 'Tìm không gian làm việc theo tên';

  @override
  String get resetsNoWorkspaceMatch => 'Không có không gian làm việc nào khớp.';

  @override
  String resetsOnlyWorkspace(String name) {
    return 'Chỉ $name';
  }

  @override
  String get resetsJoinedBefore => 'Tham gia trước';

  @override
  String get resetsLimitedDaysLabel => 'Chạm giới hạn trong N ngày qua';

  @override
  String get resetsStartsLabel => 'Bắt đầu';

  @override
  String get resetsEndsLabel => 'Hết hạn';

  @override
  String resetsPercentValue(int percent) {
    return 'Bù lại $percent% tín dụng đi kèm';
  }

  @override
  String get resetsCapLabel => 'Tối đa mỗi lần dùng';

  @override
  String get resetsBudgetLabel => 'Tổng ngân sách';

  @override
  String get resetsOptional => 'Không bắt buộc';

  @override
  String resetsEstimate(int count, String credits, String cost) {
    return 'Tiếp cận khoảng $count không gian làm việc · $credits tín dụng · chi phí ước tính $cost';
  }

  @override
  String get resetsEstimating => 'Đang tính phạm vi tiếp cận…';

  @override
  String get resetsEstimateNeedsFields =>
      'Điền các trường để xem phạm vi tiếp cận.';

  @override
  String get resetsLockedNote =>
      'Chiến dịch này đang chạy: chỉ sửa được thông điệp, ngày hết hạn, ngân sách và lời nhắc.';

  @override
  String get resetsRequired => 'Bắt buộc.';

  @override
  String get resetsTooLong => 'Tối đa 120 ký tự.';

  @override
  String get resetsDaysInvalid => 'Nhập từ 1 đến 365 ngày.';

  @override
  String get resetsMoneyInvalid => 'Nhập từ 0 trở lên.';

  @override
  String get resetsExpiryBeforeStart =>
      'Chọn thời điểm kết thúc sau thời điểm bắt đầu.';

  @override
  String resetsGivenTo(String name) {
    return 'Đã cấp lượt đặt lại đã lưu cho $name';
  }

  @override
  String get resetsCampaignSaved => 'Đã lưu chiến dịch';

  @override
  String get resetsDefaultMessage =>
      'Tặng bạn một lượt đặt lại đã lưu. Hãy dùng khi chạm giới hạn.';

  @override
  String resetsGiveName(String name) {
    return 'Lượt đặt lại đã lưu cho $name';
  }

  @override
  String get resetsOneWorkspace => 'Một không gian làm việc';

  @override
  String get resetsPickWorkspace =>
      'Chọn một không gian làm việc để xem các lượt đặt lại đã lưu của nơi đó.';

  @override
  String get resetsAllHistory => 'Toàn bộ lịch sử';

  @override
  String get resetsAllWorkspaces => 'Mọi không gian làm việc';

  @override
  String get resetsNoEvents => 'Chưa có dữ liệu.';

  @override
  String get resetsEventGiven => 'Đã cấp lượt đặt lại đã lưu';

  @override
  String get resetsEventUsed => 'Đã dùng lượt đặt lại đã lưu';

  @override
  String get resetsEventRevoked => 'Đã thu hồi';

  @override
  String get resetsEventUndone => 'Đã hoàn tác lượt bù';

  @override
  String get resetsEventExpired => 'Hết hạn khi chưa dùng';

  @override
  String get resetsEventCreated => 'Đã tạo chiến dịch';

  @override
  String get resetsEventEdited => 'Đã sửa chiến dịch';

  @override
  String get resetsEventStarted => 'Chiến dịch đã bắt đầu';

  @override
  String get resetsEventEnded => 'Chiến dịch đã kết thúc';

  @override
  String get resetsEventScheduled => 'Đã lên lịch chiến dịch';

  @override
  String get resetsEventPaused => 'Đã tạm dừng chiến dịch';

  @override
  String get resetsEventResumed => 'Đã tiếp tục chiến dịch';

  @override
  String get resetsEventCancelled => 'Đã hủy chiến dịch';

  @override
  String get resetsEventDeleted => 'Đã xóa chiến dịch';

  @override
  String get resetsEventSettings => 'Đã thay đổi cài đặt';

  @override
  String get resetsRevokeConfirm => 'Thu hồi lượt đặt lại đã lưu này?';

  @override
  String get resetsRevokeConfirmBody =>
      'Không gian làm việc sẽ mất lượt này trước khi kịp dùng.';

  @override
  String get resetsUndoConfirm => 'Hoàn tác lượt bù này?';

  @override
  String get resetsUndoConfirmBody => 'Số tín dụng đã cộng sẽ bị trừ lại.';

  @override
  String get resetsPerPeriod => 'Số lần dùng mỗi không gian làm việc mỗi kỳ';

  @override
  String get resetsMaxHeld => 'Số lượt đặt lại đã lưu tối đa';

  @override
  String get resetsNotifyOwners => 'Thông báo cho chủ sở hữu máy chủ';

  @override
  String get resetsNewCampaign => 'Chiến dịch mới';

  @override
  String get resetsName => 'Tên';

  @override
  String get resetsMessage => 'Thông điệp gửi mọi người';

  @override
  String get resetsPlans =>
      'Mã gói, cách nhau bằng dấu phẩy (để trống là tất cả)';

  @override
  String get resetsWorkspaces =>
      'ID không gian làm việc, cách nhau bằng dấu phẩy (để trống là tất cả)';

  @override
  String get resetsBefore => 'Tạo trước (ngày giờ, không bắt buộc)';

  @override
  String get resetsLimitedDays =>
      'Chạm giới hạn trong N ngày qua (không bắt buộc)';

  @override
  String get resetsStart => 'Bắt đầu (ngày giờ)';

  @override
  String get resetsExpiry => 'Hết hạn (ngày giờ)';

  @override
  String get resetsPercent => 'Tín dụng đi kèm cần bù (%)';

  @override
  String get resetsCap => 'Số đô-la tối đa mỗi lần dùng (không bắt buộc)';

  @override
  String get resetsBudget =>
      'Tổng ngân sách tín dụng tính bằng đô-la (không bắt buộc)';

  @override
  String get resetsDaily => 'Xóa giới hạn mô hình hôm nay';

  @override
  String get resetsComputer => 'Bù lại số giờ dùng máy tính tháng này';

  @override
  String get resetsArrival => 'Báo khi được cấp';

  @override
  String get resetsReminder => 'Nhắc trước khi hết hạn';

  @override
  String get resetsPreviewSave => 'Xem trước và lưu';

  @override
  String get resetsSchedule => 'Lên lịch';

  @override
  String get resetsPause => 'Tạm dừng';

  @override
  String get resetsResume => 'Tiếp tục';

  @override
  String resetsPreviewMessage(int count, String credits, String cost) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count không gian làm việc. Mức bù tối đa: $credits. Chi phí ước tính: $cost.',
      one:
          '1 không gian làm việc. Mức bù tối đa: $credits. Chi phí ước tính: $cost.',
    );
    return '$_temp0';
  }

  @override
  String get resetsWorkspace =>
      'ID không gian làm việc (để trống để xem toàn bộ lịch sử)';

  @override
  String get resetsHistory => 'Tải lịch sử';

  @override
  String get resetsGive => 'Cấp lượt đặt lại đã lưu';

  @override
  String get resetsCopyCsv => 'Sao chép CSV';

  @override
  String get resetsRevoke => 'Thu hồi';

  @override
  String get resetsUndo => 'Hoàn tác lượt bù chưa dùng';

  @override
  String get adminVendors => 'Vendors';

  @override
  String get vendorNeedsAttention => 'Dịch vụ nhà cung cấp cần chú ý';

  @override
  String get vendorNotSetUp => 'Chưa thiết lập';

  @override
  String get vendorCheckNow => 'Kiểm tra ngay';

  @override
  String get vendorLimit => 'Hạn mức hoặc số tiền nạp trước';

  @override
  String get vendorWarnAt => 'Cảnh báo ở mức';

  @override
  String get vendorExpiry => 'Hết hạn';

  @override
  String get vendorHistory => 'Các lần đọc gần đây';

  @override
  String get vendorSave => 'Lưu';

  @override
  String get vendorEnabled => 'Đã bật theo dõi';

  @override
  String get vendorUnknown => 'Không rõ';

  @override
  String get vendorLow => 'Sắp hết';

  @override
  String get vendorOut => 'Đã hết';

  @override
  String get vendorOk => 'Ổn';

  @override
  String get vendorNoReading => 'Chưa có số liệu';

  @override
  String vendorSummaryAttention(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dịch vụ cần chú ý',
      one: '1 dịch vụ cần chú ý',
    );
    return '$_temp0';
  }

  @override
  String vendorSummaryOk(int count) {
    return '$count ổn';
  }

  @override
  String vendorSummaryIdle(int count) {
    return '$count chưa thiết lập';
  }

  @override
  String get vendorNoVendors => 'Chưa có dịch vụ nào để theo dõi.';

  @override
  String get vendorCheckAll => 'Kiểm tra tất cả';

  @override
  String vendorCheckingProgress(int done, int total) {
    return 'Đang kiểm tra $done / $total';
  }

  @override
  String vendorCheckedAll(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã kiểm tra $count dịch vụ',
      one: 'Đã kiểm tra 1 dịch vụ',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckAllFailed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lần kiểm tra thất bại',
      one: '1 lần kiểm tra thất bại',
    );
    return '$_temp0';
  }

  @override
  String get vendorGroupAttention => 'Cần chú ý';

  @override
  String get vendorGroupHealthy => 'Hoạt động tốt';

  @override
  String get vendorGroupIdle => 'Chưa thiết lập hoặc đang tắt';

  @override
  String vendorShowMore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Hiện thêm $count',
      one: 'Hiện thêm 1',
    );
    return '$_temp0';
  }

  @override
  String get vendorShowLess => 'Thu gọn';

  @override
  String get vendorOff => 'Đang tắt';

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
    return 'Còn $amount';
  }

  @override
  String vendorWarnBelowCaption(String amount) {
    return 'Cảnh báo khi dưới $amount';
  }

  @override
  String vendorResetsWhen(String when) {
    return 'Đặt lại $when';
  }

  @override
  String vendorRenewsOn(String date) {
    return 'Gia hạn $date';
  }

  @override
  String vendorExpiredOn(String date) {
    return 'Hết hạn $date';
  }

  @override
  String vendorInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sau $count phút',
      one: 'sau 1 phút',
    );
    return '$_temp0';
  }

  @override
  String vendorInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sau $count giờ',
      one: 'sau 1 giờ',
    );
    return '$_temp0';
  }

  @override
  String vendorInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'sau $count ngày',
      one: 'sau 1 ngày',
    );
    return '$_temp0';
  }

  @override
  String vendorCheckedAgo(String when) {
    return 'Kiểm tra $when';
  }

  @override
  String get vendorSourceApi => 'Từ dịch vụ';

  @override
  String get vendorSourceOwnCount => 'Do Casama đếm';

  @override
  String get vendorSourceManual => 'Nhập thủ công';

  @override
  String vendorReadingError(String error) {
    return 'Lần kiểm tra gần nhất lỗi: $error';
  }

  @override
  String get vendorNotSetUpHint =>
      'Thêm khóa trên máy chủ để bắt đầu kiểm tra.';

  @override
  String get vendorOffHint => 'Tính năng theo dõi đang tắt.';

  @override
  String get vendorPickOne => 'Chọn một dịch vụ để xem chi tiết.';

  @override
  String get vendorSectionStatus => 'Trạng thái';

  @override
  String get vendorSectionActions => 'Thao tác';

  @override
  String get vendorSectionAlerts => 'Cảnh báo';

  @override
  String get vendorSectionPlan => 'Gói';

  @override
  String vendorWarnAtValue(int percent) {
    return 'Cảnh báo khi đã dùng $percent%';
  }

  @override
  String get vendorWarnAtHelp => 'Thanh đo chuyển màu hổ phách tại mức này.';

  @override
  String get vendorPeriod => 'Chu kỳ';

  @override
  String get vendorPeriodNone => 'Chưa đặt';

  @override
  String get vendorPeriodDay => 'Hằng ngày';

  @override
  String get vendorPeriodMonth => 'Hằng tháng';

  @override
  String get vendorPeriodBilling => 'Mỗi kỳ thanh toán';

  @override
  String get vendorPeriodPrepaid => 'Trả trước';

  @override
  String get vendorDateNotSet => 'Chưa đặt';

  @override
  String get vendorClearDate => 'Xóa ngày';

  @override
  String get vendorLimitInvalid => 'Nhập số lớn hơn 0.';

  @override
  String get vendorAmountInvalid => 'Nhập từ 0 trở lên.';

  @override
  String get vendorMonthsInvalid => 'Nhập từ 1 đến 120 tháng.';

  @override
  String get vendorWarnAtInvalid => 'Chọn mức từ 1% đến 100%.';

  @override
  String get vendorSaved => 'Đã lưu cài đặt';

  @override
  String get vendorCheckDone => 'Đã kiểm tra';

  @override
  String get vendorHistoryEmpty => 'Chưa có số liệu.';

  @override
  String get vendorCheckFailed => 'Kiểm tra thất bại';

  @override
  String get vendorResets => 'Đặt lại';

  @override
  String get vendorSource => 'Nguồn';

  @override
  String get vendorBilling => 'Thanh toán và nạp thêm';

  @override
  String get vendorBalanceWarning => 'Cảnh báo khi số dư thấp hơn';

  @override
  String get vendorPeriodStart => 'Kỳ bắt đầu';

  @override
  String get vendorInvalidSettings =>
      'Nhập hạn mức dương, mức cảnh báo từ 0 đến 1 và ngày hợp lệ.';

  @override
  String get card24hRange => 'Biên độ 24 giờ';

  @override
  String get card52wRange => 'Biên độ 52 tuần';

  @override
  String get cardAgain => 'Lần nữa';

  @override
  String get cardAgoSuffix => 'trước';

  @override
  String get cardAirQuality => 'Chất lượng không khí';

  @override
  String get cardAqiAdviceBad =>
      'Mọi người nên giảm hoạt động gắng sức hoặc kéo dài ngoài trời; đóng kín cửa sổ.';

  @override
  String get cardAqiAdviceGood => 'Ngày tuyệt vời để ra ngoài.';

  @override
  String get cardAqiAdviceModerate =>
      'Ổn với đa số mọi người; người quá nhạy cảm nên vận động nhẹ nhàng.';

  @override
  String get cardAqiAdviceSensitive =>
      'Trẻ em, người lớn tuổi và người bị hen suyễn nên hạn chế vận động lâu ngoài trời.';

  @override
  String get cardAqiGood => 'Tốt';

  @override
  String get cardAqiHazardous => 'Nguy hại';

  @override
  String get cardAqiModerate => 'Trung bình';

  @override
  String get cardAqiSensitive => 'Kém cho nhóm nhạy cảm';

  @override
  String get cardAqiUnhealthy => 'Kém';

  @override
  String get cardAqiVeryUnhealthy => 'Rất kém';

  @override
  String get cardBaggage => 'Hành lý';

  @override
  String get cardCalcAmount => 'Số tiền';

  @override
  String get cardCalcBill => 'Hóa đơn';

  @override
  String get cardCalcDiscount => 'Giảm giá';

  @override
  String get cardCalcDiscountTitle => 'Giảm giá';

  @override
  String get cardCalcGross => 'Đã gồm thuế';

  @override
  String get cardCalcGrowth => 'Tăng trưởng';

  @override
  String get cardCalcInterest => 'Tiền lãi';

  @override
  String get cardCalcLoan => 'Khoản vay';

  @override
  String get cardCalcMonthly => 'Mỗi tháng';

  @override
  String get cardCalcMonthlyPayment => 'Khoản trả hằng tháng';

  @override
  String get cardCalcNet => 'Trước thuế';

  @override
  String get cardCalcPeople => 'Số người';

  @override
  String get cardCalcPerPerson => 'Mỗi người trả';

  @override
  String get cardCalcPrice => 'Giá';

  @override
  String get cardCalcPrincipal => 'Tiền gốc';

  @override
  String get cardCalcRate => 'Lãi suất năm';

  @override
  String get cardCalcSavings => 'Tiền tiết kiệm';

  @override
  String get cardCalcStart => 'Số tiền ban đầu';

  @override
  String get cardCalcTax => 'Thuế';

  @override
  String get cardCalcTaxIncluded => 'Đã bao gồm thuế';

  @override
  String get cardCalcTaxRate => 'Thuế suất';

  @override
  String get cardCalcTip => 'Tiền boa';

  @override
  String get cardCalcTipAmount => 'Tiền boa';

  @override
  String get cardCalcTipSplit => 'Tiền boa và chia hóa đơn';

  @override
  String get cardCalcTotal => 'Tổng cộng';

  @override
  String get cardCalcTotalInterest => 'Tổng tiền lãi';

  @override
  String get cardCalcTotalPaid => 'Tổng tiền phải trả';

  @override
  String get cardCalcUnits => 'Đổi đơn vị';

  @override
  String get cardCalcValue => 'Giá trị';

  @override
  String get cardCalcVat => 'Thuế';

  @override
  String get cardCalcYears => 'Số năm';

  @override
  String get cardCalcYouPay => 'Bạn trả';

  @override
  String get cardCalcYouPutIn => 'Bạn đóng góp';

  @override
  String get cardCalcYouSave => 'Bạn tiết kiệm';

  @override
  String get cardCall => 'Gọi';

  @override
  String get cardCaloriesWord => 'Calo';

  @override
  String get cardComparison => 'So sánh';

  @override
  String get cardCondClear => 'Trời quang';

  @override
  String get cardCondCloudy => 'Nhiều mây';

  @override
  String get cardCondDrizzle => 'Mưa phùn';

  @override
  String get cardCondFog => 'Sương mù';

  @override
  String get cardCondHail => 'Mưa đá';

  @override
  String get cardCondHeavyRain => 'Mưa lớn';

  @override
  String get cardCondHeavySnow => 'Tuyết rơi dày';

  @override
  String get cardCondLightRain => 'Mưa nhẹ';

  @override
  String get cardCondLightSnow => 'Tuyết nhẹ';

  @override
  String get cardCondMostlyClear => 'Ít mây';

  @override
  String get cardCondPartlyCloudy => 'Có mây';

  @override
  String get cardCondRain => 'Mưa';

  @override
  String get cardCondShowers => 'Mưa rào';

  @override
  String get cardCondSleet => 'Mưa tuyết';

  @override
  String get cardCondSnow => 'Tuyết';

  @override
  String get cardCondThunder => 'Dông bão';

  @override
  String get cardCons => 'Nhược điểm';

  @override
  String get cardCopied => 'Đã sao chép';

  @override
  String get cardCopy => 'Sao chép dạng văn bản';

  @override
  String get cardCouldntUpdate => 'Không cập nhật được';

  @override
  String get cardCurrency => 'Tiền tệ';

  @override
  String get cardDayLength => 'Độ dài ban ngày';

  @override
  String get cardDayRange => 'Biên độ ngày';

  @override
  String get cardDays => 'ngày';

  @override
  String get cardDelay => 'Trễ';

  @override
  String get cardDictionary => 'Từ điển';

  @override
  String get cardEmail => 'Email';

  @override
  String get cardFlightCancelled => 'Đã hủy';

  @override
  String get cardFlightDiverted => 'Đã chuyển hướng';

  @override
  String get cardFlightInAir => 'Đang bay';

  @override
  String get cardFlightIncident => 'Sự cố';

  @override
  String get cardFlightLanded => 'Đã hạ cánh';

  @override
  String get cardFlightScheduled => 'Đúng giờ';

  @override
  String cardStaysFromNight(String price) {
    return 'từ $price mỗi đêm';
  }

  @override
  String get cardStaysANight => 'mỗi đêm';

  @override
  String cardStaysNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n đêm',
      one: '1 đêm',
    );
    return '$_temp0';
  }

  @override
  String cardStaysGuests(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n khách',
      one: '1 khách',
    );
    return '$_temp0';
  }

  @override
  String cardStaysRooms(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n phòng',
      one: '1 phòng',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysSortBest => 'Tốt nhất';

  @override
  String get cardStaysSortCheapest => 'Rẻ nhất';

  @override
  String get cardStaysSortTopRated => 'Đánh giá cao nhất';

  @override
  String get cardStaysSortClosest => 'Gần nhất';

  @override
  String get cardStaysFilterFreeCancel => 'Hủy miễn phí';

  @override
  String get cardStaysFilterBreakfast => 'Bữa sáng';

  @override
  String get cardStaysFilterPayAtHotel => 'Thanh toán tại khách sạn';

  @override
  String get cardStaysFilterStars => 'Từ 4 sao trở lên';

  @override
  String get cardStaysFilterRated => 'Điểm 8+';

  @override
  String get cardStaysList => 'Danh sách';

  @override
  String get cardStaysMap => 'Bản đồ';

  @override
  String get cardStaysEdit => 'Chỉnh sửa';

  @override
  String cardStaysRating(String value, String max) {
    return '$value / $max';
  }

  @override
  String cardStaysKm(String km) {
    return 'Cách trung tâm $km km';
  }

  @override
  String cardStaysStars(int n) {
    return '$n sao';
  }

  @override
  String cardStaysTotalNights(String price, int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$price cho $n đêm',
      one: '$price cho 1 đêm',
    );
    return '$_temp0';
  }

  @override
  String cardStaysMoreSites(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '+$n trang nữa',
      one: '+1 trang nữa',
    );
    return '$_temp0';
  }

  @override
  String get cardStaysViewDeal => 'Xem ưu đãi';

  @override
  String get cardStaysView => 'Xem';

  @override
  String cardStaysShowAll(int n) {
    return 'Hiện tất cả $n';
  }

  @override
  String get cardStaysShowFewer => 'Thu gọn';

  @override
  String get cardStaysNone => 'Không có nơi nào khớp với bộ lọc này.';

  @override
  String get cardStaysNoMap =>
      'Không có địa điểm nào ở đây có vị trí trên bản đồ.';

  @override
  String get cardStaysNoDeals => 'Không có giá cho những ngày này.';

  @override
  String get cardStaysCheck => 'Giá được kiểm tra trên trang web đặt phòng.';

  @override
  String cardStaysCompare(int n) {
    return 'So sánh ($n)';
  }

  @override
  String get cardStaysCompareHint => 'Chọn tối đa 4 nơi để so sánh';

  @override
  String get cardStaysComparePick => 'Chọn để so sánh';

  @override
  String get cardStaysCompareTitle => 'So sánh';

  @override
  String get cardStaysRowNight => 'Giá mỗi đêm';

  @override
  String get cardStaysRowTotal => 'Tổng cộng';

  @override
  String get cardStaysRowRating => 'Xếp hạng';

  @override
  String get cardStaysRowStars => 'Hạng sao';

  @override
  String get cardStaysRowDistance => 'Khoảng cách';

  @override
  String get cardStaysYes => 'Có';

  @override
  String get cardStaysNo => 'Không';

  @override
  String get cardStaysTermFreeCancel => 'Hủy miễn phí';

  @override
  String get cardStaysTermBreakfast => 'Bao gồm bữa sáng';

  @override
  String get cardStaysTermNoBreakfast => 'Không gồm bữa sáng';

  @override
  String get cardStaysTermPayAtHotel => 'Thanh toán tại khách sạn';

  @override
  String get cardStaysTermNonRefundable => 'Không hoàn tiền';

  @override
  String get cardStaysDetailsTitle => 'Chỗ ở';

  @override
  String get cardStaysCheapest => 'Rẻ nhất';

  @override
  String get cardStaysAmenities => 'Tiện nghi';

  @override
  String cardStaysCheckIn(String time) {
    return 'Nhận phòng $time';
  }

  @override
  String cardStaysCheckOut(String time) {
    return 'Trả phòng $time';
  }

  @override
  String get cardStaysNearby => 'Lân cận';

  @override
  String get cardStaysHotelSite => 'Trang web khách sạn';

  @override
  String get cardStaysBook => 'Đặt giúp tôi';

  @override
  String cardStaysBookLabel(String name, String site) {
    return 'Đặt $name trên $site';
  }

  @override
  String cardStaysPhoto(int n, int total) {
    return 'Ảnh $n / $total';
  }

  @override
  String cardStaysTrendTitle(String place) {
    return '$place · giá theo tháng';
  }

  @override
  String cardStaysTrendClass(int n) {
    return '$n★';
  }

  @override
  String cardStaysTrendCheapest(String month, String price) {
    return 'Rẻ nhất: $month, khoảng $price mỗi đêm';
  }

  @override
  String get cardStaysTrendNote => 'Đây là dự báo, không phải giá trực tiếp.';

  @override
  String get cardStaysTrendPick => 'Chọn ngày';

  @override
  String get cardStaysSearchTitle => 'Tìm chỗ ở';

  @override
  String get cardStaysSearchWhere => 'Địa điểm';

  @override
  String get cardStaysSearchWhereHint => 'Thành phố, khu vực hoặc khách sạn';

  @override
  String get cardStaysSearchDates => 'Chọn ngày';

  @override
  String get cardStaysSearchAdults => 'Người lớn';

  @override
  String get cardStaysSearchRooms => 'Phòng';

  @override
  String get cardStaysSearchBudget => 'Ngân sách mỗi đêm (không bắt buộc)';

  @override
  String get cardStaysSearchNotNow => 'Để sau';

  @override
  String get cardStaysSearchGo => 'Tìm chỗ ở';

  @override
  String get cardStaysSearchSent => 'Đang tìm';

  @override
  String cardStaysSearchLabel(String where, String dates) {
    return 'Chỗ ở tại $where, $dates';
  }

  @override
  String cardStaysFewer(String label) {
    return 'Ít hơn: $label';
  }

  @override
  String cardStaysMore(String label) {
    return 'Thêm: $label';
  }

  @override
  String get cardStaysAmenityPool => 'Hồ bơi';

  @override
  String get cardStaysAmenityParking => 'Chỗ đỗ xe';

  @override
  String get cardStaysAmenityPets => 'Cho phép thú cưng';

  @override
  String get cardStaysAmenityGym => 'Phòng tập';

  @override
  String get cardStaysAmenitySpa => 'Spa';

  @override
  String get cardStaysAmenityKitchen => 'Bếp';

  @override
  String get cardStaysAmenityWifi => 'WiFi';

  @override
  String get cardStaysAmenityAirCon => 'Điều hòa';

  @override
  String get cardProductsTitle => 'Sản phẩm nên mua';

  @override
  String cardProductsFrom(String price) {
    return 'từ $price';
  }

  @override
  String cardProductsUnder(String price) {
    return 'dưới $price';
  }

  @override
  String get cardProductsSortBest => 'Phù hợp nhất';

  @override
  String get cardProductsSortCheapest => 'Rẻ nhất';

  @override
  String get cardProductsSortTopRated => 'Đánh giá cao nhất';

  @override
  String get cardProductsOnSale => 'Đang giảm giá';

  @override
  String get cardProductsRated => 'Đánh giá 4+';

  @override
  String cardProductsOff(int pct) {
    return '−$pct%';
  }

  @override
  String get cardProductsOtherStores => 'và các cửa hàng khác';

  @override
  String cardProductsShowAll(int n) {
    return 'Hiện tất cả $n';
  }

  @override
  String get cardProductsShowFewer => 'Thu gọn';

  @override
  String get cardProductsShowMore => 'Xem thêm';

  @override
  String get cardProductsNone => 'Không có sản phẩm nào khớp với bộ lọc này.';

  @override
  String get cardProductsCheck => 'Giá được kiểm tra tại cửa hàng.';

  @override
  String get cardProductsBuy => 'Mua';

  @override
  String get cardProductsCompareStores => 'So sánh cửa hàng';

  @override
  String cardProductsCompareLabel(String title) {
    return 'So sánh cửa hàng cho $title';
  }

  @override
  String get cardProductsBuyForMe => 'Mua giúp tôi';

  @override
  String cardProductsBuyLabel(String title, String store) {
    return 'Mua $title tại $store';
  }

  @override
  String get cardProductsRowPrice => 'Giá';

  @override
  String get cardProductsRowStore => 'Cửa hàng';

  @override
  String get cardProductsRowRating => 'Đánh giá';

  @override
  String get cardProductsRowDelivery => 'Giao hàng';

  @override
  String cardProductsDelivery(String text) {
    return 'Giao hàng: $text';
  }

  @override
  String cardProductsBy(String brand) {
    return 'của $brand';
  }

  @override
  String get cardProductsOffers => 'Cửa hàng';

  @override
  String get cardProductsLowest => 'Tổng thấp nhất';

  @override
  String cardProductsTotal(String price) {
    return 'Tổng $price';
  }

  @override
  String get cardProductsOutOfStock => 'Hết hàng';

  @override
  String get cardProductsFeatures => 'Thông tin sản phẩm';

  @override
  String get cardProductsReviews => 'Nhận xét từ người mua';

  @override
  String get cardCheckoutTitle => 'Kiểm tra trước khi bot thanh toán';

  @override
  String get cardCheckoutTotal => 'Tổng cộng';

  @override
  String cardCheckoutQty(int n) {
    return '× $n';
  }

  @override
  String get cardCheckoutOpen => 'Mở trang';

  @override
  String get cardCheckoutCancel => 'Hủy';

  @override
  String get cardCheckoutChange => 'Thay đổi';

  @override
  String get cardCheckoutConfirm => 'Xác nhận và thanh toán';

  @override
  String get cardCheckoutCancelLabel => 'Hủy giao dịch này';

  @override
  String get cardCheckoutChangeLabel => 'Tôi muốn thay đổi';

  @override
  String cardCheckoutConfirmLabel(String total, String seller) {
    return 'Xác nhận thanh toán $total tại $seller';
  }

  @override
  String cardCheckoutConfirmNoSellerLabel(String total) {
    return 'Xác nhận $total';
  }

  @override
  String get cardCheckoutConfirmed => 'Đã xác nhận';

  @override
  String get cardCheckoutChanging => 'Đang thay đổi';

  @override
  String get cardCheckoutCancelled => 'Đã hủy';

  @override
  String get cardBookingTitle => 'Đặt chỗ của bạn';

  @override
  String cardBookingWith(String site) {
    return 'Đặt qua $site';
  }

  @override
  String get cardBookingCheckIn => 'Nhận phòng';

  @override
  String get cardBookingCheckOut => 'Trả phòng';

  @override
  String get cardBookingConfirmation => 'Mã xác nhận';

  @override
  String get cardBookingCopy => 'Sao chép mã xác nhận';

  @override
  String get cardBookingPaid => 'Đã thanh toán';

  @override
  String get cardBookingPayAtHotel => 'Thanh toán tại khách sạn';

  @override
  String cardBookingCancelBy(String date) {
    return 'Hủy miễn phí đến $date';
  }

  @override
  String get cardBookingDirections => 'Chỉ đường';

  @override
  String get cardBookingManage => 'Quản lý đặt chỗ';

  @override
  String get cardBookingCalendar => 'Thêm vào lịch';

  @override
  String cardBookingCalendarLabel(String name) {
    return 'Thêm $name vào lịch của tôi';
  }

  @override
  String cardOrderNumber(String id) {
    return 'Đơn hàng $id';
  }

  @override
  String cardOrderPlaced(String date) {
    return 'Đặt ngày $date';
  }

  @override
  String get cardOrderStepOrdered => 'Đã đặt';

  @override
  String get cardOrderStepShipped => 'Đã gửi hàng';

  @override
  String get cardOrderStepOut => 'Đang giao hàng';

  @override
  String get cardOrderStepDelivered => 'Đã giao';

  @override
  String get cardOrderCancelled => 'Đã hủy';

  @override
  String get cardOrderReturned => 'Đã trả hàng';

  @override
  String cardOrderArrives(String date) {
    return 'Dự kiến đến $date';
  }

  @override
  String get cardOrderTracking => 'Mã vận đơn';

  @override
  String get cardOrderCopy => 'Sao chép mã vận đơn';

  @override
  String get cardOrderTrack => 'Theo dõi';

  @override
  String cardOrderTrackLabel(String number) {
    return 'Theo dõi $number';
  }

  @override
  String get cardOrderPage => 'Trang đơn hàng';

  @override
  String get cardFaresBest => 'Tốt nhất';

  @override
  String get cardFaresCheapest => 'Rẻ nhất';

  @override
  String get cardFaresFastest => 'Nhanh nhất';

  @override
  String get cardFaresDirectOnly => 'Chỉ bay thẳng';

  @override
  String get cardFaresDirect => 'Bay thẳng';

  @override
  String cardFaresStops(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n điểm dừng',
      one: '1 điểm dừng',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresBook => 'Đặt vé';

  @override
  String cardFaresFromPrice(String price) {
    return 'từ $price';
  }

  @override
  String cardFaresTravellers(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n hành khách',
      one: '1 hành khách',
    );
    return '$_temp0';
  }

  @override
  String cardFaresNights(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n đêm',
      one: '1 đêm',
    );
    return '$_temp0';
  }

  @override
  String get cardFaresEconomy => 'Phổ thông';

  @override
  String get cardFaresPremium => 'Phổ thông đặc biệt';

  @override
  String get cardFaresBusiness => 'Thương gia';

  @override
  String get cardFaresFirst => 'Hạng nhất';

  @override
  String cardFaresTypical(String low, String high) {
    return 'Thường từ $low–$high cho chuyến này';
  }

  @override
  String get cardFaresLevelLow => 'Hiện đang thấp';

  @override
  String get cardFaresLevelTypical => 'Hiện ở mức thường';

  @override
  String get cardFaresLevelHigh => 'Hiện đang cao';

  @override
  String cardFaresShowAll(int n) {
    return 'Hiện tất cả $n';
  }

  @override
  String get cardFaresShowFewer => 'Thu gọn';

  @override
  String get cardFaresNoDirect =>
      'Không có chuyến bay thẳng nào trong tìm kiếm này.';

  @override
  String get cardFaresOutboundOnly =>
      'Giá áp dụng cho cả chuyến; chọn chuyến về trên Google Flights.';

  @override
  String get cardFaresSeeAll => 'Xem tất cả trên Google Flights';

  @override
  String get cardFaresCheck =>
      'Giá tính cho tất cả hành khách và được kiểm tra lại trên trang web đặt vé.';

  @override
  String cardFaresBags(int cabin, int checked) {
    return '$cabin hành lý xách tay, $checked hành lý ký gửi';
  }

  @override
  String get cardFaresAffiliate =>
      'Casama có thể nhận hoa hồng khi bạn đặt qua các liên kết này, nhưng giá vé không đổi.';

  @override
  String cardFaresCompare(String site) {
    return 'So sánh trên $site';
  }

  @override
  String get cardFaresWatch => 'Theo dõi giá';

  @override
  String cardFaresWatching(String date) {
    return 'Đang theo dõi · kết thúc $date';
  }

  @override
  String cardFaresWatchingBelow(String price, String date) {
    return 'Đang theo dõi mức $price trở xuống · kết thúc $date';
  }

  @override
  String get cardFaresWatchStop => 'Dừng';

  @override
  String get cardFaresWatchTitle => 'Theo dõi mức giá này';

  @override
  String get cardFaresWatchBody =>
      'Casama kiểm tra giá này vài lần mỗi ngày và gửi thông báo khi giá giảm. Tính năng tự dừng khi qua ngày bay hoặc sau 60 ngày.';

  @override
  String get cardFaresWatchTarget => 'Báo tôi khi giá dưới (không bắt buộc)';

  @override
  String get cardFaresWatchAnyDrop => 'Để trống để báo mọi đợt giảm mạnh';

  @override
  String get cardFaresWatchStart => 'Theo dõi';

  @override
  String get cardFaresWatchStarted =>
      'Đang theo dõi mức giá này. Bạn sẽ nhận thông báo khi giá giảm.';

  @override
  String get cardFaresWatchStopped => 'Đã dừng theo dõi mức giá này.';

  @override
  String get cardFaresWatchFull =>
      'Bạn đã theo dõi đủ 10 mức giá. Hãy dừng một mục trong Cài đặt → Thẻ trước.';

  @override
  String get cardFaresWatchFailed =>
      'Không thay đổi được mục theo dõi giá. Hãy thử lại.';

  @override
  String get cardFaresFlagSeparate => 'Vé tách rời';

  @override
  String get cardFaresFlagOvernight => 'Quá cảnh qua đêm';

  @override
  String get cardFaresFlagAirport => 'Đổi sân bay';

  @override
  String get cardFaresFlagShort => 'Quá cảnh ngắn';

  @override
  String get cardFaresFlagLong => 'Quá cảnh dài';

  @override
  String get cardFaresNoteSeparate =>
      'Các hãng bay khác nhau trên cùng một chiều nên đây có thể là các vé tách rời. Nếu lỡ chuyến nối, chặng sau có thể không được hỗ trợ. Hãy kiểm tra trên trang web đặt vé.';

  @override
  String get cardFaresNoteOvernight => 'Có chặng quá cảnh qua đêm.';

  @override
  String get cardFaresNoteAirport => 'Chuyến nối cất cánh từ sân bay khác.';

  @override
  String get cardFaresNoteShort => 'Thời gian quá cảnh dưới 1 giờ.';

  @override
  String get cardFaresNoteLong => 'Thời gian quá cảnh hơn 8 giờ.';

  @override
  String get cardFaresOutbound => 'Chiều đi';

  @override
  String get cardFaresReturn => 'Chiều về';

  @override
  String cardFaresEmissions(int kg) {
    return 'Khoảng $kg kg CO₂ mỗi hành khách';
  }

  @override
  String cardFaresLayover(String time, String place) {
    return 'Quá cảnh $time tại $place';
  }

  @override
  String cardFaresLeaveFrom(String place) {
    return 'chuyến tiếp theo cất cánh từ $place';
  }

  @override
  String get cardFaresViewFailed => 'Không tải được các giá vé này.';

  @override
  String get cardFaresTryAgain => 'Thử lại';

  @override
  String get cardFaresMorning => 'Buổi sáng';

  @override
  String get cardFaresAfternoon => 'Buổi chiều';

  @override
  String get cardFaresEvening => 'Buổi tối';

  @override
  String get cardFaresNight => 'Ban đêm';

  @override
  String get cardFaresTime => 'Thời gian';

  @override
  String get cardFaresAirlines => 'Hãng hàng không';

  @override
  String get cardFaresBagIncluded => 'Đã gồm hành lý';

  @override
  String get cardFaresNoMatch => 'Không có chuyến bay nào khớp với bộ lọc này.';

  @override
  String get cardFaresOpenInChat => 'Mở trong trò chuyện';

  @override
  String cardFaresOpenLabel(String route, String date) {
    return 'Hiện chuyến bay $route ngày $date';
  }

  @override
  String get cardFaresEdit => 'Sửa tìm kiếm';

  @override
  String get cardFaresDetails => 'Chi tiết';

  @override
  String get cardFaresSinceStart => 'kể từ khi bắt đầu theo dõi';

  @override
  String get cardFareCalOneWay => 'Một chiều';

  @override
  String cardFareCalReturn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Về sau $n đêm',
      one: 'Về sau 1 đêm',
    );
    return '$_temp0';
  }

  @override
  String get cardFareCalLow => 'Thấp';

  @override
  String get cardFareCalUsual => 'Thông thường';

  @override
  String get cardFareCalHigh => 'Cao';

  @override
  String cardFareCalCheapest(String day, String price) {
    return 'Rẻ nhất: $day · $price';
  }

  @override
  String get cardFareCalSeeFares => 'Xem giá vé';

  @override
  String cardFareCalDay(String day, String price) {
    return '$day: $price';
  }

  @override
  String cardFareCalNoPrice(String day) {
    return '$day: không có giá';
  }

  @override
  String cardFareExploreAnywhere(String from) {
    return 'Từ $from · mọi nơi';
  }

  @override
  String cardFareExploreAbroad(String from) {
    return 'Từ $from · quốc tế';
  }

  @override
  String cardFareExploreDomestic(String from) {
    return 'Từ $from · nội địa';
  }

  @override
  String cardFareExploreCountry(String from, String country) {
    return '$from → $country';
  }

  @override
  String cardFareExploreUnder(String price) {
    return 'dưới $price';
  }

  @override
  String get cardFlightSearchTitle => 'Tìm chuyến bay';

  @override
  String get cardFlightSearchReturn => 'Khứ hồi';

  @override
  String get cardFlightSearchOneWay => 'Một chiều';

  @override
  String get cardFlightSearchFrom => 'Điểm đi';

  @override
  String get cardFlightSearchTo => 'Điểm đến';

  @override
  String get cardFlightSearchPlaceHint => 'Thành phố hoặc sân bay';

  @override
  String get cardFlightSearchAnywhere => 'Mọi nơi';

  @override
  String get cardFlightSearchSwap => 'Đổi chỗ địa điểm';

  @override
  String get cardFlightSearchPickDates => 'Chọn ngày';

  @override
  String get cardFlightSearchPickDate => 'Chọn một ngày';

  @override
  String get cardFlightSearchWholeMonth => 'Cả tháng';

  @override
  String get cardFlightSearchNights => 'Số đêm ở lại';

  @override
  String get cardFlightSearchAdults => 'Người lớn';

  @override
  String get cardFlightSearchChildren => 'Trẻ em (2 đến 11 tuổi)';

  @override
  String get cardFlightSearchInfants => 'Em bé (dưới 2 tuổi)';

  @override
  String get cardFlightSearchNotNow => 'Để sau';

  @override
  String get cardFlightSearchSent => 'Đang tìm…';

  @override
  String cardFlightSearchLabel(String route, String dates) {
    return 'Chuyến bay $route, $dates';
  }

  @override
  String get cardFareTrendNow => 'Rẻ nhất hiện tại';

  @override
  String cardFareTrendHistory(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n ngày qua',
      one: 'Ngày vừa qua',
    );
    return '$_temp0';
  }

  @override
  String cardFareTrendSeen(String low, String high) {
    return 'từ $low đến $high';
  }

  @override
  String get cardFareTrendNote =>
      'Đây là lịch sử giá trước đây, không phải dự báo. Giá có thể thay đổi bất cứ lúc nào.';

  @override
  String get cardFareWatchesTitle => 'Theo dõi giá';

  @override
  String get cardFareWatchesNone =>
      'Bạn chưa theo dõi giá vé nào. Chạm Theo dõi giá trên thẻ giá vé để bắt đầu.';

  @override
  String get cardFareWatchesNoPrice => 'Chưa có giá';

  @override
  String cardFareWatchesTarget(String price) {
    return 'Mục tiêu $price';
  }

  @override
  String get cardFareWatchesAnyDrop => 'Mọi đợt giảm mạnh';

  @override
  String cardFareWatchesLow(String price) {
    return 'thấp nhất $price';
  }

  @override
  String cardFareWatchesEnds(String date) {
    return 'kết thúc $date';
  }

  @override
  String get cardsFareWatches => 'Theo dõi giá';

  @override
  String get cardsFareWatchesNone =>
      'Chưa theo dõi giá nào. Chạm Theo dõi giá trên thẻ giá vé máy bay để nhận thông báo khi giá giảm.';

  @override
  String cardsFareWatchLine(String price, String date) {
    return 'Hiện tại $price · kết thúc $date';
  }

  @override
  String get cardFromBot => 'Do bot viết; có thể sai sót';

  @override
  String get cardFullRecipe => 'Công thức đầy đủ';

  @override
  String get cardGate => 'Cửa';

  @override
  String get cardGo => 'Bắt đầu';

  @override
  String get cardHeads => 'Mặt ngửa';

  @override
  String get cardHolidays => 'Ngày lễ';

  @override
  String get cardHoursShort => 'giờ';

  @override
  String get cardHumidity => 'Độ ẩm';

  @override
  String get cardItsTime => 'Đến giờ rồi!';

  @override
  String get cardJustNow => 'vừa xong';

  @override
  String get cardLast24h => '24 giờ qua';

  @override
  String get cardLast30Days => '30 ngày qua';

  @override
  String get cardListen => 'Nghe';

  @override
  String get cardLiveNow => 'Ngay lúc này';

  @override
  String get cardLongWeekend => 'Kỳ nghỉ dài';

  @override
  String get cardLostShort => 'B';

  @override
  String get cardMarket24h => '24/7';

  @override
  String get cardMarketCap => 'Vốn hóa thị trường';

  @override
  String get cardMarketClosed => 'Đã đóng cửa';

  @override
  String get cardMarketOpen => 'Đang mở cửa';

  @override
  String get cardMarketPost => 'Ngoài giờ';

  @override
  String get cardMarketPre => 'Trước giờ mở cửa';

  @override
  String get cardMessage => 'Tin nhắn';

  @override
  String get cardMinutesShort => 'phút';

  @override
  String get cardMoonFirstQuarter => 'Bán nguyệt đầu';

  @override
  String get cardMoonFull => 'Trăng tròn';

  @override
  String get cardMoonLastQuarter => 'Bán nguyệt cuối';

  @override
  String get cardMoonNew => 'Trăng non';

  @override
  String get cardMoonWaningCrescent => 'Trăng khuyết cuối tháng';

  @override
  String get cardMoonWaningGibbous => 'Trăng tròn khuyết';

  @override
  String get cardMoonWaxingCrescent => 'Trăng lưỡi liềm đầu tháng';

  @override
  String get cardMoonWaxingGibbous => 'Trăng khuyết đầu tháng';

  @override
  String get cardMore => 'Thêm';

  @override
  String get cardNext24h => '24 giờ tới';

  @override
  String get cardNoAlerts => 'Không có cảnh báo';

  @override
  String get cardNoAlertsLong =>
      'Hiện không có cảnh báo thời tiết nào có hiệu lực ở đây.';

  @override
  String get cardNoChart => 'Không có biểu đồ cho khoảng thời gian này';

  @override
  String get cardNoGames => 'Không có trận đấu nào';

  @override
  String get cardNoHolidays => 'Không còn ngày lễ nào trong năm nay.';

  @override
  String get cardNoQuakes => 'Gần đây không có trận động đất nào ở mức đó.';

  @override
  String get cardNoStorms => 'Không có bão hoạt động';

  @override
  String get cardNoStormsLong =>
      'Hiện không có bão nhiệt đới nào đang hoạt động.';

  @override
  String get cardNotAdvice => 'Không phải lời khuyên tài chính';

  @override
  String get cardNow => 'Bây giờ';

  @override
  String get cardNutritionFacts => 'Giá trị dinh dưỡng';

  @override
  String get cardOpen => 'Mở';

  @override
  String get cardOpenSource => 'Mở nguồn';

  @override
  String get cardParcel => 'Bưu kiện';

  @override
  String get cardParcelDelivered => 'Đã giao';

  @override
  String get cardParcelInTransit => 'Đang vận chuyển';

  @override
  String get cardParcelOrdered => 'Đã tạo nhãn gửi';

  @override
  String get cardParcelOut => 'Đang giao hàng';

  @override
  String get cardParcelProblem => 'Có sự cố';

  @override
  String get cardParcelNoLive =>
      'Chưa có trạng thái trực tiếp cho mã này ở đây. Trang của đơn vị vận chuyển có thông tin mới nhất.';

  @override
  String cardParcelTrackOn(String site) {
    return 'Theo dõi trên $site';
  }

  @override
  String get cardPin => 'Ghim lên tiện ích';

  @override
  String get cardPinFailed => 'Không ghim được thẻ này';

  @override
  String get cardPinned => 'Đã ghim lên tiện ích của bạn';

  @override
  String get cardPinnedWaiting =>
      'Đã ghim. Hãy cho phép bot này trên tiện ích để xem thẻ ở đó';

  @override
  String get cardPlayedShort => 'Trận';

  @override
  String get cardPointsShort => 'Điểm';

  @override
  String get cardPrevClose => 'Đóng cửa trước';

  @override
  String get cardPros => 'Ưu điểm';

  @override
  String get cardProsCons => 'Ưu và nhược điểm';

  @override
  String get cardQuiz => 'Câu đố';

  @override
  String get cardRain => 'Mưa';

  @override
  String get cardRainChance => 'Khả năng mưa';

  @override
  String get cardRandom => 'Ngẫu nhiên';

  @override
  String get cardReadMore => 'Đọc thêm';

  @override
  String get cardReferenceRates =>
      'Tỷ giá tham chiếu ngân hàng trung ương, công bố hằng ngày';

  @override
  String get cardRefresh => 'Làm mới';

  @override
  String get cardReport => 'Báo sai dữ liệu';

  @override
  String get cardReported => 'Cảm ơn bạn, chúng tôi sẽ kiểm tra lại';

  @override
  String get cardSameTime => 'cùng giờ';

  @override
  String get cardScores => 'Tỷ số';

  @override
  String get cardSecondsShort => 'giây';

  @override
  String get cardServings => 'Khẩu phần';

  @override
  String get cardShareImage => 'Chia sẻ dạng ảnh';

  @override
  String get cardStandings => 'Bảng xếp hạng';

  @override
  String get cardStorms => 'Bão nhiệt đới';

  @override
  String get cardSunMoon => 'Mặt trời và mặt trăng';

  @override
  String get cardSunrise => 'Bình minh';

  @override
  String get cardSunset => 'Hoàng hôn';

  @override
  String get cardSwap => 'Đổi chiều';

  @override
  String get cardSynonyms => 'Tương tự:';

  @override
  String get cardTails => 'Mặt sấp';

  @override
  String get cardTeam => 'Đội';

  @override
  String get cardTerminal => 'Nhà ga';

  @override
  String get cardTimeIn => 'Giờ tại từng địa điểm';

  @override
  String get cardTimeline => 'Dòng thời gian';

  @override
  String get cardToday => 'Hôm nay';

  @override
  String get cardTomorrow => 'Ngày mai';

  @override
  String get cardTranslation => 'Bản dịch';

  @override
  String get cardTsunami => 'Sóng thần';

  @override
  String get cardUnpin => 'Gỡ khỏi tiện ích';

  @override
  String get cardUnpinned => 'Đã gỡ khỏi tiện ích của bạn';

  @override
  String get cardUv => 'UV';

  @override
  String get cardUvExtreme => 'cực cao';

  @override
  String get cardUvHigh => 'cao';

  @override
  String get cardUvLow => 'thấp';

  @override
  String get cardUvModerate => 'trung bình';

  @override
  String get cardUvVeryHigh => 'rất cao';

  @override
  String get cardVolume => 'Khối lượng';

  @override
  String get cardWatchlist => 'Danh sách theo dõi';

  @override
  String get cardWeather => 'Thời tiết';

  @override
  String get cardWeatherAlerts => 'Cảnh báo thời tiết';

  @override
  String get cardWebsite => 'Trang web';

  @override
  String get cardWind => 'Gió';

  @override
  String get cardWonShort => 'T';

  @override
  String get cardWorldClock => 'Giờ thế giới';

  @override
  String get cardYesterday => 'Hôm qua';

  @override
  String get cardQuakesWorld => 'Những trận động đất mạnh nhất hôm nay';

  @override
  String cardMinutesAgo(int n) {
    return '$n phút trước';
  }

  @override
  String cardHoursAgo(int n) {
    return '$n giờ trước';
  }

  @override
  String cardStale(String ago) {
    return 'Không cập nhật được · từ $ago';
  }

  @override
  String cardUpdated(String ago) {
    return 'Cập nhật $ago';
  }

  @override
  String cardDelayed(int minutes) {
    return 'Trễ $minutes phút';
  }

  @override
  String cardHighLow(String high, String low) {
    return 'C $high  T $low';
  }

  @override
  String cardFeelsLike(String temp) {
    return 'Cảm giác như $temp';
  }

  @override
  String cardNextDays(int n) {
    return '$n ngày';
  }

  @override
  String cardUntil(String when) {
    return 'Đến $when';
  }

  @override
  String cardAlertCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Có $n cảnh báo hiệu lực',
      one: 'Có 1 cảnh báo hiệu lực',
    );
    return '$_temp0';
  }

  @override
  String cardAqiMainPollutant(String pollutant) {
    return 'Chủ yếu là $pollutant';
  }

  @override
  String cardPollenKind(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'alder': 'Phấn hoa tống quán sủi',
      'birch': 'Phấn hoa bạch dương',
      'grass': 'Phấn hoa cỏ',
      'mugwort': 'Phấn hoa ngải cứu',
      'olive': 'Phấn hoa ô liu',
      'ragweed': 'Phấn hoa cỏ phấn hương',
      'other': 'Phấn hoa',
    });
    return '$_temp0';
  }

  @override
  String cardDuration(int h, int m) {
    return '$h giờ $m phút';
  }

  @override
  String cardGoldenHour(String time) {
    return 'Giờ vàng từ $time';
  }

  @override
  String cardMoonLit(int pct) {
    return 'Sáng $pct%';
  }

  @override
  String cardMoonrise(String time) {
    return 'Mọc lúc $time';
  }

  @override
  String cardMoonset(String time) {
    return 'Lặn lúc $time';
  }

  @override
  String cardRangeChange(String range) {
    return 'Thay đổi trong $range';
  }

  @override
  String cardUpDown(int up, int down) {
    return '$up tăng · $down giảm';
  }

  @override
  String cardRatesOf(String date) {
    return 'Tỷ giá ngày $date';
  }

  @override
  String cardAtTime(String when) {
    return 'Vào lúc $when';
  }

  @override
  String cardInDays(int n) {
    return 'sau $n ngày';
  }

  @override
  String cardPercentThere(int pct) {
    return 'Đã qua $pct%';
  }

  @override
  String cardQuakesNear(String place) {
    return 'Động đất gần $place';
  }

  @override
  String cardQuakeCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n trận động đất',
      one: '1 trận động đất',
      zero: 'Không có',
    );
    return '$_temp0';
  }

  @override
  String cardDepth(String depth) {
    return 'Sâu $depth';
  }

  @override
  String cardAway(String distance) {
    return 'Cách $distance';
  }

  @override
  String cardStormCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n cơn bão hoạt động',
      one: '1 cơn bão hoạt động',
    );
    return '$_temp0';
  }

  @override
  String cardAlertLevel(String level) {
    return 'Cảnh báo $level';
  }

  @override
  String cardGameCount(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n trận đấu',
      one: '1 trận đấu',
    );
    return '$_temp0';
  }

  @override
  String cardLiveCount(int n) {
    return '$n đang diễn ra';
  }

  @override
  String cardMinutes(int n) {
    return '$n phút';
  }

  @override
  String cardExpected(String date) {
    return 'Dự kiến $date';
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
      other: '$n bước',
      one: '1 bước',
    );
    return '$_temp0';
  }

  @override
  String cardWins(int n) {
    return 'Thắng $n';
  }

  @override
  String cardServingSize(String size) {
    return 'Khẩu phần: $size';
  }

  @override
  String cardChecksPassed(int passed, int total) {
    return 'Đạt $passed / $total lượt kiểm tra';
  }

  @override
  String cardTotal(int n) {
    return 'Tổng: $n';
  }

  @override
  String cardCalcAfterYears(int n) {
    return 'Sau $n năm';
  }

  @override
  String get cardsSettingsTitle => 'Thẻ thông tin';

  @override
  String get cardsSettingsRow => 'Thành phố chính, đơn vị và nguồn dữ liệu';

  @override
  String get cardsSettingsIntro =>
      'Bot trả lời thời tiết, giá cả, tỷ giá, giờ giấc và nhiều thông tin khác bằng các thẻ dữ liệu thực luôn mới. Thành phố chính sẽ được dùng khi bạn hỏi mà không nêu rõ địa điểm.';

  @override
  String get cardsSettingsSaveFailed => 'Không lưu được. Hãy thử lại.';

  @override
  String get cardsHomeCity => 'Thành phố chính';

  @override
  String get cardsHomeClear => 'Xóa';

  @override
  String get cardsHomeNone =>
      'Chưa đặt. Bot sẽ dùng thành phố chính của múi giờ bạn đang ở cho đến khi bạn chọn.';

  @override
  String get cardsHomeSearch => 'Tìm thành phố của bạn';

  @override
  String get cardsHomePrivacy =>
      'Chỉ lưu tên thành phố, không bao giờ lưu địa chỉ nhà; thông tin gửi tới dịch vụ thời tiết là tọa độ đã làm tròn.';

  @override
  String get cardsUnits => 'Đơn vị';

  @override
  String get cardsTemperature => 'Nhiệt độ';

  @override
  String get cardsWind => 'Gió';

  @override
  String get cardsRain => 'Mưa';

  @override
  String get cardsDistance => 'Khoảng cách';

  @override
  String get cardsPrices => 'Giá cả';

  @override
  String get cardsRedUp => 'Đỏ là tăng';

  @override
  String get cardsRedUpHint =>
      'Hiện giá tăng màu đỏ và giá giảm màu xanh lá, theo quy ước thị trường ở Trung Quốc, Nhật Bản và Hàn Quốc.';

  @override
  String get cardsSources => 'Nguồn dữ liệu';

  @override
  String get cardsSourcesIntro =>
      'Các thẻ luôn ghi rõ dữ liệu lấy từ đâu và vào lúc nào. Những dịch vụ sau cung cấp dữ liệu đó:';

  @override
  String get cardFewerServings => 'Giảm khẩu phần';

  @override
  String get cardMoreServings => 'Tăng khẩu phần';

  @override
  String get cropTitle => 'Di chuyển và thu phóng';

  @override
  String get cropDone => 'Xong';

  @override
  String get cropPosition => 'Vị trí ảnh';

  @override
  String get cropMoveUp => 'Dịch lên';

  @override
  String get cropMoveDown => 'Dịch xuống';

  @override
  String get cropMoveLeft => 'Dịch trái';

  @override
  String get cropMoveRight => 'Dịch phải';

  @override
  String get cropRotate => 'Xoay';

  @override
  String get cropMirror => 'Lật đối xứng';

  @override
  String get cropReset => 'Đặt lại';

  @override
  String get cropZoom => 'Thu phóng';

  @override
  String get cropZoomIn => 'Phóng to';

  @override
  String get cropZoomOut => 'Thu nhỏ';

  @override
  String get cropSoft => 'Phóng to khá sát: ảnh có thể trông hơi mờ';

  @override
  String get cropAnimatedStill => 'Ảnh động sẽ đứng yên';

  @override
  String get cropBackground => 'Nền';

  @override
  String get cropBackgroundNone => 'Không có';

  @override
  String cropBackgroundBot(String name) {
    return 'Màu của $name';
  }

  @override
  String get cropBackgroundWhite => 'Trắng';

  @override
  String get cropBackgroundBlack => 'Đen';

  @override
  String get cropUnreadable =>
      'Không mở được ảnh này ở đây. Hãy thử ảnh JPEG hoặc PNG.';

  @override
  String cropTooBig(String size) {
    return 'Tệp này nặng $size, vượt quá giới hạn 40 MB.';
  }

  @override
  String get botPicture => 'Ảnh đại diện';

  @override
  String botPictureTitle(String name) {
    return 'Ảnh của $name';
  }

  @override
  String botPictureChange(String name) {
    return 'Đổi ảnh của $name';
  }

  @override
  String get botPicturePaste => 'Dán ảnh';

  @override
  String get botPictureDraw => 'Tạo ảnh bằng AI';

  @override
  String get botPictureDrawHelp => 'Casama vẽ hai phương án để bạn chọn';

  @override
  String get botPictureRecrop => 'Cắt lại';

  @override
  String get botPictureMascot => 'Dùng linh vật thay thế';

  @override
  String get botPictureRemove => 'Xóa ảnh';

  @override
  String get botPictureRecent => 'Gần đây';

  @override
  String get botPictureUpdated => 'Đã cập nhật ảnh';

  @override
  String get botPictureRemoved => 'Đã xóa ảnh';

  @override
  String get botPictureFailed => 'Không lưu được ảnh';

  @override
  String botPictureDrop(String name) {
    return 'Thả vào để dùng làm ảnh cho $name';
  }

  @override
  String botPictureUseAs(String name) {
    return 'Dùng làm ảnh của $name';
  }

  @override
  String get botPictureUseAsBot => 'Dùng làm ảnh của bot';

  @override
  String get botPictureWhichBot => 'Bot nào nhận ảnh này?';

  @override
  String botDrawTitle(String name) {
    return 'Ảnh cho $name';
  }

  @override
  String get botDrawIntro =>
      'Chọn một diện mạo, thêm vài từ mô tả nếu muốn, rồi Casama sẽ vẽ hai bức để bạn chọn.';

  @override
  String get botDrawDescribe => 'Mô tả ảnh (không bắt buộc)';

  @override
  String get botDrawHint => 'Một chú cú thân thiện đeo kính đọc sách';

  @override
  String get botDrawMake => 'Tạo 2 ảnh';

  @override
  String get botDrawMore => 'Tạo thêm 2 ảnh';

  @override
  String get botDrawPick => 'Chạm vào một ảnh để chọn dùng';

  @override
  String get botDrawCost =>
      'Mỗi ảnh dùng tín dụng hình ảnh, giống mọi hình ảnh Casama tạo.';

  @override
  String get botDrawWorking => 'Đang vẽ…';

  @override
  String get botDrawStyleCloud => 'Casama Cloud';

  @override
  String get botDrawStyleSoft3d => '3D dịu mắt';

  @override
  String get botDrawStyleWatercolor => 'Màu nước';

  @override
  String get botDrawStyleFlat => 'Biểu tượng phẳng';

  @override
  String get botDrawStylePixel => 'Nghệ thuật điểm ảnh';

  @override
  String get botDrawStyleLine => 'Vẽ nét';

  @override
  String get botDrawStylePhoto => 'Ảnh chụp';

  @override
  String get sharePictureStays =>
      'Ảnh của bot vẫn ở lại không gian làm việc này: bản sao sẽ dùng linh vật trước đó hoặc chữ cái đầu.';

  @override
  String savedResetRefills(String amount) {
    return 'Bù lại $amount tín dụng';
  }

  @override
  String get savedResetClearsDaily => 'Xóa giới hạn hôm nay';

  @override
  String get savedResetGivesHours => 'Hoàn lại giờ dùng máy tính';

  @override
  String savedResetDaysLeft(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Còn $count ngày',
      one: 'Còn 1 ngày',
      zero: 'Hết hạn hôm nay',
    );
    return '$_temp0';
  }

  @override
  String get modelsTitle => 'Mô hình';

  @override
  String get modelsRowHelp => 'Mô hình của Casama hoặc khóa API của bạn';

  @override
  String get modelsIntro =>
      'Chọn để Casama vận hành bot hoặc kết nối khóa mô hình của riêng bạn. Khóa được lưu mã hóa và không bao giờ hiển thị lại.';

  @override
  String get whoRunsYourBots => 'Bên vận hành bot của bạn';

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
      'Đi kèm trong gói của bạn; dùng tín dụng không gian làm việc';

  @override
  String get whoRunsCasamaOffHelp => 'Đang tạm dừng trên gói hiện tại';

  @override
  String get whoRunsOwn => 'Nhà cung cấp riêng của bạn';

  @override
  String get whoRunsOwnHelp =>
      'Do nhà cung cấp của bạn tính phí trực tiếp; không dùng tín dụng Casama';

  @override
  String get whoRunsCasamaShort =>
      'Mô hình của Casama, đi kèm trong gói của bạn';

  @override
  String get whoRunsCasamaCost => 'Có dùng tín dụng';

  @override
  String get whoRunsOwnShort => 'Khóa API của bạn, do nhà cung cấp tính phí';

  @override
  String get whoRunsOwnCost => 'Không dùng tín dụng Casama';

  @override
  String get whoRunsOwnNeedsKey =>
      'Để dùng nhà cung cấp riêng, trước tiên hãy thêm khóa trò chuyện từ nhà cung cấp đó ở mục Thêm khóa bên dưới.';

  @override
  String get whoRunsOwnNeedsModel =>
      'Chọn một mô hình cho khóa này bên dưới để chuyển đổi.';

  @override
  String get whoRunsAdminOnly =>
      'Chỉ quản trị viên không gian làm việc mới thay đổi được bên vận hành bot.';

  @override
  String get botModelSource => 'Nguồn mô hình';

  @override
  String get botModelSourceWorkspace => 'Mặc định của không gian làm việc';

  @override
  String get botModelSourceCasama => 'Casama';

  @override
  String get botModelSourceOwn => 'Một trong các khóa API của bạn';

  @override
  String get useCasamaFallback =>
      'Nếu nhà cung cấp của tôi gặp lỗi, hãy dùng mô hình của Casama';

  @override
  String get useCasamaFallbackHelp =>
      'Khi khóa của bạn chạm giới hạn tần suất hoặc hạn mức, tự chuyển sang mô hình của Casama bằng tín dụng không gian làm việc.';

  @override
  String get keyCoversOpenRouter =>
      'Trò chuyện, ảnh, video, đọc to, tin nhắn thoại và đọc chính tả';

  @override
  String get keyCoversGoogle => 'Trò chuyện và cuộc gọi trực tiếp';

  @override
  String get keyCoversOpenAi => 'Trò chuyện và tìm kiếm trí nhớ';

  @override
  String get keyCoversChat => 'Trò chuyện';

  @override
  String get ownProviderPrivacyNote =>
      'Với nhà cung cấp riêng, điều khoản của họ áp dụng cho dữ liệu bot gửi đi. Thiết lập không dùng dữ liệu để huấn luyện của Casama chỉ áp dụng trên khóa của Casama.';

  @override
  String get creditsOwnProviderNote =>
      'Mô hình dùng nhà cung cấp riêng không tiêu tín dụng.';

  @override
  String get routineWaitingForModel => 'Đang chờ mô hình';

  @override
  String get ownProviderRequiredTitle =>
      'Kết nối một mô hình để tiếp tục trò chuyện';

  @override
  String get ownProviderRequiredBody =>
      'Các mô hình của Casama hiện không khả dụng trên gói này. Hãy thêm khóa mô hình riêng hoặc nâng cấp gói.';

  @override
  String get modelNoToolsWarning =>
      'Mô hình này không hỗ trợ công cụ nên bot chỉ trả lời được bằng văn bản.';

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
  String get appBrowserTitle => 'Trình duyệt trên điện thoại này';

  @override
  String get appBrowserTitleMac => 'Trình duyệt trên máy Mac này';

  @override
  String get appBrowserTitleLinux => 'Trình duyệt trên máy tính này';

  @override
  String get appBrowserTitleWindows => 'Trình duyệt trên PC này';

  @override
  String get appBrowserHelp =>
      'Một trình duyệt nhỏ bên trong Casama mà các bot bạn cho phép có thể dùng khi bạn theo dõi, chỉ trong lúc bạn mở cuộc trò chuyện với bot trên điện thoại này. Phiên đăng nhập vẫn ở trên điện thoại này.';

  @override
  String get appBrowserHelpMac =>
      'Một trình duyệt nhỏ bên trong Casama mà các bot bạn cho phép có thể dùng khi bạn theo dõi, trong lúc Casama đang mở trên máy Mac này. Phiên đăng nhập vẫn ở trên máy Mac này.';

  @override
  String get appBrowserHelpLinux =>
      'Một trình duyệt nhỏ bên trong Casama mà các bot bạn cho phép có thể dùng khi bạn theo dõi, trong lúc Casama đang mở trên máy tính này. Phiên đăng nhập vẫn ở trên máy tính này.';

  @override
  String get appBrowserHelpWindows =>
      'Một trình duyệt nhỏ bên trong Casama mà các bot bạn cho phép có thể dùng khi bạn theo dõi, trong lúc Casama đang mở trên PC này. Phiên đăng nhập vẫn ở trên PC này.';

  @override
  String get appBrowserSwitchHelp =>
      'Các bot bạn cho phép có thể mở trang tại đây trong lúc cuộc trò chuyện với chúng đang mở trên điện thoại này.';

  @override
  String get appBrowserSwitchHelpMac =>
      'Các bot bạn cho phép có thể mở trang tại đây trong lúc Casama đang mở trên máy Mac này.';

  @override
  String get appBrowserSwitchHelpLinux =>
      'Các bot bạn cho phép có thể mở trang tại đây trong lúc Casama đang mở trên máy tính này.';

  @override
  String get appBrowserSwitchHelpWindows =>
      'Các bot bạn cho phép có thể mở trang tại đây trong lúc Casama đang mở trên PC này.';

  @override
  String get appBrowserOn => 'Đang bật';

  @override
  String get appBrowserOff => 'Đang tắt';

  @override
  String appBrowserSwitchedOff(String reason) {
    return 'Đã tắt: $reason';
  }

  @override
  String get appBrowserReasonOff => 'chưa khả dụng.';

  @override
  String get appBrowserReasonNotTester =>
      'hiện chỉ dành cho người dùng thử nghiệm.';

  @override
  String get appBrowserReasonSystemOff => 'chưa khả dụng trên thiết bị này.';

  @override
  String get appBrowserReasonWorkspaceOff =>
      'quản trị viên đã tắt tính năng này cho không gian làm việc.';

  @override
  String get appBrowserReasonUnavailable =>
      'máy chủ này chưa có kết nối thiết bị.';

  @override
  String get appBrowserReasonUnsupported =>
      'trình duyệt của thiết bị này không chạy được.';

  @override
  String get appBrowserReasonNeedsMacos14 => 'cần macOS 14 trở lên.';

  @override
  String appBrowserReasonNeedsWebkitgtk(String command) {
    return 'Hãy cài WebKitGTK để dùng trình duyệt tại đây: $command';
  }

  @override
  String get appBrowserReasonNeedsWebview2 =>
      'Hãy cài đặt hoặc cập nhật Microsoft Edge WebView2 để dùng trình duyệt tại đây.';

  @override
  String get appBrowserGetWebview2 => 'Tải WebView2';

  @override
  String get appBrowserReasonNoToken =>
      'Đã ghép nối ở lần cài trước. Hãy bật lại để ghép nối thiết bị này.';

  @override
  String get appBrowserAllBots => 'Tất cả bot của bạn';

  @override
  String get appBrowserAllBotsHelp =>
      'Mọi bot bạn trò chuyện cùng đều có thể dùng trình duyệt này. Tắt để chọn từng bot riêng lẻ.';

  @override
  String get appBrowserModeHeader => 'Khi bot cần dùng trình duyệt';

  @override
  String get appBrowserModeAlways => 'Luôn dùng thiết bị này';

  @override
  String get appBrowserModeAlwaysHelp =>
      'Bot sẽ mở mọi trang tại đây trong lúc bạn mở cuộc trò chuyện với chúng. Máy tính của bot chỉ được dùng khi bạn yêu cầu.';

  @override
  String get appBrowserOpenTooltip => 'Mở trình duyệt';

  @override
  String get appBrowserBotsBrowseHere => 'Bot duyệt web tại đây';

  @override
  String get appBrowserBotsBrowseHereHelp =>
      'Mọi trang trong các cuộc trò chuyện của bạn sẽ mở trong trình duyệt này khi bạn xem';

  @override
  String get appBrowserModeAsk => 'Hỏi khi cần thiết';

  @override
  String get appBrowserModeAskHelp =>
      'Đưa ra lựa chọn khi một trang web cần bạn đăng nhập hoặc chặn máy tính của bot.';

  @override
  String get appBrowserModeComputer => 'Luôn dùng máy tính của bot';

  @override
  String get appBrowserModeComputerHelp =>
      'Không bao giờ gợi ý trình duyệt của thiết bị này trừ khi bạn tự yêu cầu trong trò chuyện.';

  @override
  String get appBrowserModeDevice => 'Ưu tiên thiết bị này';

  @override
  String get appBrowserModeDeviceHelp =>
      'Dùng trình duyệt của thiết bị này cho các trang cần đăng nhập và trang bị chặn mà không cần hỏi.';

  @override
  String get appBrowserNeverAsk => 'Máy tính của bot (không hỏi)';

  @override
  String get appBrowserDeviceMac => 'Mac';

  @override
  String get appBrowserDeviceLinux => 'Máy tính Linux';

  @override
  String get appBrowserDeviceWindows => 'Máy tính Windows';

  @override
  String get adminAppBrowserMacos => 'Mac (macOS 14+)';

  @override
  String get adminAppBrowserLinux => 'Linux (WebKitGTK 4.1+)';

  @override
  String get adminAppBrowserWindows => 'Windows (WebView2 120+)';

  @override
  String get browserWaiting =>
      'Đang chờ bạn. Hãy giữ mở cuộc trò chuyện này để tiếp tục trong trình duyệt.';

  @override
  String browserWaitingSite(String site) {
    return 'Đang chờ bạn. Hãy giữ mở cuộc trò chuyện này để tiếp tục với $site trong trình duyệt.';
  }

  @override
  String get browserWaitEnded => 'Đã ngừng chờ trình duyệt của bạn.';

  @override
  String get browserHandBackWaiting =>
      'Đến lượt bạn trong trình duyệt. Thực hiện bước trên trang rồi chạm Trả lại.';

  @override
  String browserHandBackWaitingSite(String site) {
    return 'Đến lượt bạn trên $site. Thực hiện bước trên trang rồi chạm Trả lại.';
  }

  @override
  String get browserHandBackEnded => 'Đã ngừng chờ bạn trả lại trình duyệt.';

  @override
  String get browserChoiceCardLabel => 'Chọn trình duyệt';

  @override
  String browserChoiceTitle(String bot, String site) {
    return '$bot nên mở $site ở đâu?';
  }

  @override
  String get browserChoiceSubtitleSignIn => 'Trang web này cần bạn đăng nhập.';

  @override
  String browserChoiceSubtitleBlocked(String bot) {
    return 'Trang web này đã chặn máy tính của $bot.';
  }

  @override
  String get browserChoiceOnPhone => 'Trên điện thoại này';

  @override
  String get browserChoiceOnMac => 'Trên máy Mac này';

  @override
  String get browserChoiceOnLinux => 'Trên máy tính này';

  @override
  String get browserChoiceOnWindows => 'Trên PC này';

  @override
  String get browserChoiceOnDeviceHelp =>
      'Bạn theo dõi trực tiếp và tự đăng nhập. Những gì bot đọc sẽ được gửi tới AI.';

  @override
  String get browserChoiceInChrome => 'Trong Chrome của bạn';

  @override
  String get browserChoiceInChromeHelp =>
      'Đã đăng nhập sẵn vào các trang web của bạn.';

  @override
  String browserChoiceOnComputer(String bot) {
    return 'Trên máy tính của $bot';
  }

  @override
  String get browserChoiceOnComputerHelp => 'Vẫn chạy tiếp dù bạn rời đi.';

  @override
  String browserChoiceRemember(String site) {
    return 'Ghi nhớ cho $site';
  }

  @override
  String browserChoicePickedPhone(String site) {
    return 'Đã mở $site trên điện thoại này';
  }

  @override
  String browserChoicePickedMac(String site) {
    return 'Đã mở $site trên máy Mac này';
  }

  @override
  String browserChoicePickedLinux(String site) {
    return 'Đã mở $site trên máy tính này';
  }

  @override
  String browserChoicePickedWindows(String site) {
    return 'Đã mở $site trên PC này';
  }

  @override
  String browserChoicePickedChrome(String site) {
    return 'Đã mở $site trong Chrome của bạn';
  }

  @override
  String browserChoicePickedComputer(String site, String bot) {
    return 'Đã mở $site trên máy tính của $bot';
  }

  @override
  String browserChoiceExpired(String bot) {
    return 'Chưa kịp trả lời; giữ nguyên trên máy tính của $bot';
  }

  @override
  String get appBrowserConsentTitle =>
      'Cho phép bot dùng trình duyệt trong Casama?';

  @override
  String get appBrowserConsentPages =>
      'Các trang bot đọc ở đây sẽ được gửi tới Casama và mô hình AI của bot, tương tự như trang bot đọc trên máy tính riêng của nó.';

  @override
  String get appBrowserConsentSignIns =>
      'Phiên đăng nhập của bạn giữ nguyên trên thiết bị này. Bot không bao giờ thấy mật khẩu, số thẻ hay mã xác nhận; chính bạn sẽ tự nhập chúng.';

  @override
  String get appBrowserConsentWatch =>
      'Tính năng chỉ chạy khi bạn mở cuộc trò chuyện với bot tại đây. Bạn có thể xem, tiếp quản hoặc dừng bất cứ lúc nào.';

  @override
  String get appBrowserConsentYours =>
      'Những gì bạn tự duyệt không bao giờ bị gửi đi đâu.';

  @override
  String get appBrowserBots => 'Các bot được phép dùng';

  @override
  String get appBrowserBotsHelp =>
      'Chỉ những bot được bật tại đây mới dùng được trình duyệt trên thiết bị này.';

  @override
  String get appBrowserNoBots => 'Chưa có bot nào.';

  @override
  String get appBrowserSites => 'Trang web';

  @override
  String get appBrowserSitesHelp =>
      'Các trang web bạn đã chọn Luôn cho phép hoặc Không bao giờ. Gỡ một trang để được hỏi lại vào lần sau.';

  @override
  String get appBrowserNoSites =>
      'Chưa có trang web nào. Bot sẽ hỏi trong lần đầu mở một trang web.';

  @override
  String appBrowserRemoveSite(String site) {
    return 'Gỡ $site';
  }

  @override
  String get appBrowserKinds => 'Các trang web luôn tắt';

  @override
  String get appBrowserKindsHelp =>
      'Những loại trang web này mặc định luôn tắt trừ khi bạn tự bật lên. Ngay cả khi đã bật, bot vẫn luôn hỏi lại mỗi lần truy cập.';

  @override
  String get appBrowserKindBanking => 'Ngân hàng và Thanh toán';

  @override
  String get appBrowserKindHealth => 'Sức khỏe';

  @override
  String get appBrowserKindPasswords => 'Trình quản lý mật khẩu';

  @override
  String get appBrowserKindGovernment => 'Định danh chính phủ';

  @override
  String get appBrowserSignIn => 'Đăng nhập vào một trang web';

  @override
  String get appBrowserSignInHelp =>
      'Mở một trang web, tự đăng nhập rồi cho bot sử dụng. Mọi thao tác của bạn ở đó không bị gửi đi đâu.';

  @override
  String get appBrowserClearData => 'Xóa dữ liệu duyệt web';

  @override
  String get appBrowserClearDataHelp =>
      'Đăng xuất trình duyệt này khỏi mọi trang web và xóa dữ liệu các trang đã lưu.';

  @override
  String get appBrowserClearDataConfirm =>
      'Xóa thông tin đăng nhập và dữ liệu trang web của trình duyệt này?';

  @override
  String get appBrowserClearDataDone => 'Đã xóa dữ liệu duyệt web';

  @override
  String get appBrowserUnpair => 'Hủy ghép nối thiết bị này';

  @override
  String get appBrowserUnpairConfirm =>
      'Hủy ghép nối trình duyệt của thiết bị này? Bot không thể dùng trình duyệt cho đến khi bạn bật lại.';

  @override
  String appBrowserWorking(String bot) {
    return '$bot đang làm việc';
  }

  @override
  String get appBrowserTakeOver => 'Tiếp quản';

  @override
  String get appBrowserHandBack => 'Trả lại';

  @override
  String get appBrowserYourTurn => 'Đến lượt bạn';

  @override
  String appBrowserPaused(String bot) {
    return '$bot tạm dừng trong khi bạn dùng trang';
  }

  @override
  String get appBrowserAway => 'Đã tạm dừng: cuộc trò chuyện đang không mở';

  @override
  String get appBrowserAddress => 'Địa chỉ trang web';

  @override
  String get appBrowserBack => 'Quay lại';

  @override
  String get appBrowserForward => 'Tiếp';

  @override
  String get appBrowserReload => 'Tải lại';

  @override
  String get appBrowserAllowSite => 'Cho phép bot dùng trang web này';

  @override
  String appBrowserSiteAdded(String site) {
    return 'Đã thêm $site. Bot của bạn có thể dùng trang này tại đây.';
  }

  @override
  String get appBrowserAddressRefused => 'Không mở được địa chỉ đó ở đây.';

  @override
  String get appBrowserSecure => 'Kết nối bảo mật';

  @override
  String get appBrowserNotSecure => 'Không bảo mật';

  @override
  String get appBrowserCardLabel => 'Trình duyệt trong ứng dụng';

  @override
  String appBrowserSiteAskTitle(String bot, String site) {
    return '$bot muốn mở $site';
  }

  @override
  String get appBrowserSiteAskHelp =>
      'Trong Casama trên thiết bị này, dùng phiên đăng nhập của bạn. Chọn Luôn cho phép để bot tự mở trang web này từ nay về sau.';

  @override
  String get appBrowserSiteAskHelpMac =>
      'Trên máy Mac này, dùng phiên đăng nhập của bạn. Chọn Luôn cho phép để bot tự mở trang web này từ nay về sau.';

  @override
  String get appBrowserSiteAskHelpLinux =>
      'Trên máy tính này, dùng phiên đăng nhập của bạn. Chọn Luôn cho phép để bot tự mở trang web này từ nay về sau.';

  @override
  String get appBrowserSiteAskHelpWindows =>
      'Trên PC này, dùng phiên đăng nhập của bạn. Chọn Luôn cho phép để bot tự mở trang web này từ nay về sau.';

  @override
  String appBrowserSiteKindAsks(String kind) {
    String _temp0 = intl.Intl.selectLogic(kind, {
      'banking': 'Các trang web Ngân hàng và Thanh toán luôn hỏi mỗi lần.',
      'health': 'Các trang web Sức khỏe luôn hỏi mỗi lần.',
      'passwords': 'Các trang web Trình quản lý mật khẩu luôn hỏi mỗi lần.',
      'government':
          'Các trang web Giấy tờ tùy thân chính phủ luôn hỏi mỗi lần.',
      'other': 'Những trang web này luôn hỏi mỗi lần.',
    });
    return '$_temp0';
  }

  @override
  String get appBrowserOnce => 'Một lần';

  @override
  String get appBrowserAlways => 'Luôn luôn';

  @override
  String get appBrowserNever => 'Không bao giờ';

  @override
  String appBrowserStepAskTitle(String bot) {
    return 'Cho phép $bot làm thao tác này?';
  }

  @override
  String get appBrowserStepAskHelp =>
      'Trong Casama trên thiết bị này, với phiên đăng nhập của bạn.';

  @override
  String get appBrowserStepAskHelpMac =>
      'Trên máy Mac này, với phiên đăng nhập của bạn.';

  @override
  String get appBrowserStepAskHelpLinux =>
      'Trên máy tính này, với phiên đăng nhập của bạn.';

  @override
  String get appBrowserStepAskHelpWindows =>
      'Trên PC này, với phiên đăng nhập của bạn.';

  @override
  String appBrowserStepClick(String name) {
    return 'Chạm “$name”';
  }

  @override
  String appBrowserStepType(String name) {
    return 'Nhập vào “$name”';
  }

  @override
  String appBrowserStepPress(String name) {
    return 'Nhấn phím trong “$name”';
  }

  @override
  String appBrowserStepUpload(String name) {
    return 'Tải tệp lên “$name”';
  }

  @override
  String appBrowserStepOn(String step, String name) {
    return '$step: “$name”';
  }

  @override
  String get appBrowserDontAllow => 'Không cho phép';

  @override
  String get appBrowserDeviceIos => 'iPhone';

  @override
  String get appBrowserDeviceAndroid => 'Điện thoại Android';

  @override
  String get toolOnThisPhone => 'trên thiết bị này';

  @override
  String get appBrowserWorkspaceSwitch =>
      'Bot trong trình duyệt trong ứng dụng của thành viên';

  @override
  String get appBrowserWorkspaceSwitchHelp =>
      'Thành viên có thể cho bot dùng trình duyệt bên trong Casama trên điện thoại hoặc máy tính của họ trong lúc họ theo dõi.';

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
  String get vendorRenewalUsd => 'Chi phí mỗi lần gia hạn (USD)';

  @override
  String get vendorRenewalMonths => 'Số tháng mỗi lần gia hạn chi trả';

  @override
  String get vendorSeeSpend => 'Xem chi tiêu';

  @override
  String get costSpent => 'Đã chi';

  @override
  String get costCharged => 'Đã thu';

  @override
  String get costMargin => 'Biên lợi nhuận';

  @override
  String get costMarginNone => 'Chưa thu khoản nào';

  @override
  String get costNotRecorded => 'Chưa ghi nhận';

  @override
  String get costNotRecordedHint => 'Xem ý nghĩa và các dịch vụ liên quan';

  @override
  String get costNotRecordedHelp =>
      'Một số dịch vụ tự báo cáo tổng chi phí riêng. Khi số liệu của họ cao hơn mức máy chủ này ghi nhận, phần chênh lệch sẽ hiện ở đây. Đây là chi tiêu thực tế chưa được gắn vào tính năng, khóa hoặc không gian làm việc nào.';

  @override
  String get costNotRecordedWhy => 'Phần dịch vụ báo cáo vượt mức này';

  @override
  String get costNotRecordedNone => 'Khớp với báo cáo của dịch vụ';

  @override
  String get costNotRecordedAllMatch =>
      'Mọi dịch vụ có báo cáo tổng đều khớp với số liệu máy chủ này ghi nhận.';

  @override
  String get costNotRecordedNoList =>
      'Danh sách dịch vụ hiện chưa sẵn sàng. Hãy thử lại sau ít phút.';

  @override
  String get costNoVendorFigures => 'Chưa có dịch vụ nào báo cáo tổng chi phí';

  @override
  String get costNoVendorFiguresHelp =>
      'Chưa có dịch vụ nào báo cáo tổng chi phí riêng cho giai đoạn này nên chưa có số liệu đối chiếu.';

  @override
  String costNoFigureFrom(String names) {
    return 'Chưa có tổng từ: $names';
  }

  @override
  String costServicesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dịch vụ',
      one: '1 dịch vụ',
    );
    return '$_temp0';
  }

  @override
  String costTheySayWeRecorded(String theirs, String ours) {
    return 'Họ báo $theirs · ta ghi $ours';
  }

  @override
  String costReported(String theirs, String ours, String gap) {
    return 'Họ báo $theirs · ta ghi $ours · thiếu $gap';
  }

  @override
  String costReportedMatch(String theirs, String ours) {
    return 'Họ báo $theirs · ta ghi $ours · khớp hoàn toàn';
  }

  @override
  String get costNoVendorFigure =>
      'Dịch vụ này không cung cấp tổng chi phí riêng cho giai đoạn này.';

  @override
  String get costNoVendorFigureKind =>
      'Dịch vụ này không tự báo cáo tổng chi phí.';

  @override
  String costUpdated(String when) {
    return 'Cập nhật $when';
  }

  @override
  String costVsBefore(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'so với $days ngày trước đó',
      one: 'so với ngày trước đó',
    );
    return '$_temp0';
  }

  @override
  String get costChangeUnknown => 'chưa có giai đoạn trước để so sánh';

  @override
  String get costChangeNew => 'Mới';

  @override
  String get costChangeNewSpoken => 'mới trong giai đoạn này';

  @override
  String get costChangeFlat => 'không đổi';

  @override
  String costChangeUp(String amount) {
    return 'tăng $amount';
  }

  @override
  String costChangeDown(String amount) {
    return 'giảm $amount';
  }

  @override
  String costPoints(String count) {
    return '$count điểm';
  }

  @override
  String get costOther => 'Khác';

  @override
  String get costNotLabelled => 'Chưa gắn nhãn';

  @override
  String get costNotLabelledHelp =>
      'Những chi phí này được ghi nhận mà chưa có nhãn cho cách phân nhóm này nên chưa thể tách chi tiết hơn. Chúng vẫn được tính vào tổng chi phí.';

  @override
  String get costGroupService => 'Dịch vụ';

  @override
  String get costGroupKey => 'Khóa';

  @override
  String get costGroupApp => 'Ứng dụng & MCP';

  @override
  String get costGroupFeature => 'Tính năng';

  @override
  String get costGroupModel => 'Mô hình';

  @override
  String get costGroupWorkspace => 'Không gian làm việc';

  @override
  String get costGroupBy => 'Nhóm theo';

  @override
  String get costFilters => 'Bộ lọc';

  @override
  String get costNoFilters =>
      'Chưa có. Mở một dòng rồi chọn Hiện trong bảng để thu hẹp góc nhìn.';

  @override
  String costFilterChip(String group, String value) {
    return '$group: $value';
  }

  @override
  String costRemoveFilter(String name) {
    return 'Xóa bộ lọc $name';
  }

  @override
  String get costIncludeFixed => 'Gồm cả hóa đơn cố định';

  @override
  String get costIncludeFixedHelp =>
      'Cộng thêm gói đăng ký và gia hạn vào mục Đã chi, phân bổ đều cho số ngày tương ứng.';

  @override
  String get costOptions => 'Khoảng thời gian và bộ lọc';

  @override
  String get costPeriod => 'Khoảng thời gian';

  @override
  String costPeriodDays(int days) {
    return '$days ngày';
  }

  @override
  String get costPeriodCustom => 'Tùy chỉnh';

  @override
  String costLastDays(int days) {
    return '$days ngày qua';
  }

  @override
  String get costChangeDates => 'Đổi ngày';

  @override
  String get costDone => 'Xong';

  @override
  String get costDaysUtc => 'Các ngày tính theo giờ UTC.';

  @override
  String get costDailySpend => 'Chi tiêu hằng ngày';

  @override
  String costStackedBy(String group) {
    return 'Xếp chồng theo $group: các mục lớn nhất trước, rồi đến Khác.';
  }

  @override
  String costChartSemantics(
    int days,
    String total,
    String peakDay,
    String peakAmount,
  ) {
    return 'Biểu đồ chi tiêu hằng ngày, $days ngày, tổng $total. Ngày cao nhất là $peakDay với $peakAmount.';
  }

  @override
  String costChartSemanticsEmpty(int days) {
    return 'Biểu đồ chi tiêu hằng ngày, $days ngày, chưa phát sinh chi tiêu.';
  }

  @override
  String get costSourceMetered => 'Đo theo lượt gọi';

  @override
  String get costSourceCounted => 'Tự đếm';

  @override
  String get costSourceFixed => 'Cố định';

  @override
  String get costSourceEstimated => 'Ước tính';

  @override
  String get costSourceMeteredHelp =>
      'Chi phí thực tế được ghi nhận cho mỗi lượt gọi.';

  @override
  String get costSourceCountedHelp =>
      'Số lượt máy chủ tự đếm nhân với đơn giá.';

  @override
  String get costSourceFixedHelp =>
      'Khoản thanh toán được chia đều theo số ngày hiệu lực.';

  @override
  String get costSourceEstimatedHelp =>
      'Tính từ độ dài văn bản. Chi phí thực tế tối thiểu bằng mức này.';

  @override
  String get costEstimated => 'ước tính';

  @override
  String get costColShare => 'Tỷ trọng';

  @override
  String get costColChange => 'Thay đổi';

  @override
  String get costColCalls => 'Lượt gọi';

  @override
  String get costColSource => 'Nguồn';

  @override
  String get costColFailed => 'Thất bại';

  @override
  String get costColFees => 'Phí nhà cung cấp';

  @override
  String get costColTokens => 'Chi phí token';

  @override
  String get costTokenCost => 'Chi phí token';

  @override
  String get costFailureRate => 'Tỷ lệ lỗi';

  @override
  String costSortBy(String column) {
    return 'Sắp xếp theo $column';
  }

  @override
  String costSortedAscending(String column) {
    return '$column, sắp xếp từ thấp đến cao';
  }

  @override
  String costSortedDescending(String column) {
    return '$column, sắp xếp từ cao đến thấp';
  }

  @override
  String get costOpenRowHint => 'Mở chi tiết';

  @override
  String costSpokenSpent(String amount) {
    return 'đã chi $amount';
  }

  @override
  String costSpokenFees(String amount) {
    return 'phí nhà cung cấp $amount';
  }

  @override
  String costSpokenShare(String share) {
    return '$share tổng chi phí';
  }

  @override
  String costSpokenCalls(String count) {
    return '$count lượt gọi';
  }

  @override
  String costSpokenFailed(String rate) {
    return '$rate lỗi';
  }

  @override
  String costSpokenTokens(String amount) {
    return 'chi phí token ước tính $amount';
  }

  @override
  String costSpokenCharged(String amount) {
    return 'đã thu $amount';
  }

  @override
  String costCallsCount(String count) {
    return '$count lượt gọi';
  }

  @override
  String costFailedShare(String rate) {
    return '$rate lỗi';
  }

  @override
  String costTokensEstimated(String amount) {
    return '$amount token, ước tính';
  }

  @override
  String get costOpenBilling => 'Mở trang thanh toán';

  @override
  String get costByDay => 'Theo ngày';

  @override
  String get costSplitBy => 'Chia theo';

  @override
  String get costShowInTable => 'Hiện trong bảng';

  @override
  String costShowInTableHelp(String name, String group) {
    return 'Thu hẹp bảng chỉ còn $name và nhóm theo $group.';
  }

  @override
  String get costNothingRecorded =>
      'Không có dữ liệu nào được ghi nhận trong khoảng thời gian này.';

  @override
  String costLastUsed(String when) {
    return 'dùng lần cuối $when';
  }

  @override
  String costMoreRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Và $count dòng nữa. Hiện trong bảng.',
      one: 'Và 1 dòng nữa. Hiện trong bảng.',
    );
    return '$_temp0';
  }

  @override
  String get costKeyPurpose => 'Mục đích';

  @override
  String get costKeyService => 'Dịch vụ';

  @override
  String get costKeySetting => 'Cài đặt';

  @override
  String get costKeySetIn => 'Nơi thiết lập';

  @override
  String get costKeyVault => 'Mục trong két';

  @override
  String get costKeyStatus => 'Trạng thái';

  @override
  String get costKeyConfigured => 'Đã đặt';

  @override
  String get costKeyNotConfigured => 'Chưa đặt';

  @override
  String get costKeyLastUsed => 'Dùng lần cuối';

  @override
  String get costKeyNotUsed => 'Không dùng trong kỳ này';

  @override
  String get costKeyCap => 'Giới hạn chi tiêu';

  @override
  String costKeyCapLeft(String left, String cap) {
    return 'Còn $left trên $cap';
  }

  @override
  String costKeyCapUsed(String share) {
    return 'Đã dùng $share giới hạn';
  }

  @override
  String get costKeyNoCap => 'Không có';

  @override
  String costEmptyDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Không có chi tiêu nào trong $days ngày này',
      one: 'Không có chi tiêu nào trong ngày này',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyRange => 'Không có chi tiêu nào trong những ngày này';

  @override
  String get costEmptyFiltered =>
      'Không có chi tiêu nào khớp với các bộ lọc này';

  @override
  String get costEmptyGroup => 'Không có mục nào cho cách phân nhóm này';

  @override
  String get costAppsNote =>
      'Ứng dụng và máy chủ MCP: Đã chi là số tiền nhà cung cấp lập hóa đơn. Chi phí token là ước tính chi phí token mô hình từ kết quả của chúng và đã nằm trong tổng chi phí mô hình.';

  @override
  String costFixedLeftOut(String amount) {
    return '$amount hóa đơn cố định của giai đoạn này đang được tách ra. Bật Gồm cả hóa đơn cố định để cộng thêm.';
  }

  @override
  String costOwnKeys(String amount) {
    return 'Các không gian làm việc đã tự trả $amount bằng khóa API của họ. Đó không phải tiền của máy chủ này nên không tính vào đây.';
  }

  @override
  String get costOlderServerTitle => 'Máy chủ này cần cập nhật';

  @override
  String get costOlderServer =>
      'Chi phí theo dịch vụ, khóa và ứng dụng chỉ có trên phiên bản máy chủ mới hơn. Hãy cập nhật máy chủ rồi kiểm tra lại.';

  @override
  String get costCheckAgain => 'Kiểm tra lại';

  @override
  String get costSpendCardTitle => 'Chi tiêu, 30 ngày qua';

  @override
  String get costSpendCardOpen => 'Chi phí';

  @override
  String get costSpendCardHint => 'Mở tab Chi phí';

  @override
  String costSpendCardSemantics(String spent, String charged, String margin) {
    return 'Chi tiêu trong 30 ngày qua: đã chi $spent, đã thu $charged, biên lợi nhuận $margin';
  }

  @override
  String get costSort => 'Sắp xếp theo';

  @override
  String get costSortName => 'Tên';

  @override
  String get costByWorkspace => 'Theo không gian làm việc';

  @override
  String get costTopTools => 'Công cụ dùng nhiều';

  @override
  String get costToolList => 'Danh sách công cụ gửi tới mô hình';

  @override
  String costMoreTools(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Và $count công cụ nữa.',
      one: 'Và 1 công cụ nữa.',
    );
    return '$_temp0';
  }

  @override
  String get telegramUseCasama => 'Dùng bot Telegram của Casama';

  @override
  String telegramUseCasamaHelp(String bot) {
    return 'Nhắn với $bot trên Telegram. Một chạm, không cần cài đặt.';
  }

  @override
  String get telegramOtherWorkspace =>
      'Telegram của bạn đang kết nối với không gian làm việc khác. Kết nối ở đây sẽ chuyển sang đây.';

  @override
  String telegramLinkedTitle(String name) {
    return 'Telegram: $name';
  }

  @override
  String telegramGoesTo(String bot) {
    return 'Tin nhắn của bạn ở đó được gửi tới $bot.';
  }

  @override
  String telegramGoesElsewhere(String other, String bot) {
    return 'Tin nhắn của bạn ở đó hiện gửi tới $other. Chạm để chuyển sang $bot.';
  }

  @override
  String telegramNowGoesTo(String bot) {
    return 'Tin nhắn Telegram giờ sẽ gửi tới $bot.';
  }

  @override
  String get telegramFinish => 'Hoàn tất trong Telegram';

  @override
  String get telegramFinishHelp =>
      'Nhấn Bắt đầu trong Telegram. Chỉ thực hiện trên tài khoản Telegram của chính bạn. Mục này sẽ cập nhật sau khi kết nối.';

  @override
  String get telegramOpenAgain => 'Mở lại Telegram';

  @override
  String get telegramConnected => 'Đã kết nối Telegram';

  @override
  String telegramConnectedHelp(String name) {
    return 'Đã kết nối dưới tên $name. Nhắn cho bot trên Telegram bất cứ lúc nào; cuộc trò chuyện cũng hiện ở đây trong mục Chung.';
  }

  @override
  String get telegramConnectedHelpPlain =>
      'Nhắn cho bot trên Telegram bất cứ lúc nào; cuộc trò chuyện cũng hiện ở đây trong mục Chung.';

  @override
  String get telegramConnect => 'Kết nối Telegram';

  @override
  String get telegramDisconnect => 'Ngắt kết nối Telegram';

  @override
  String get telegramDisconnectConfirm => 'Ngắt kết nối Telegram?';

  @override
  String get telegramDisconnectHelp =>
      'Bot của bạn sẽ ngừng trả lời trên Telegram. Lịch sử trò chuyện vẫn được giữ tại đây.';

  @override
  String get telegramPickBot => 'Tin nhắn Telegram gửi tới';

  @override
  String get telegramNeedsBot =>
      'Hãy tạo một bot trước rồi mới kết nối Telegram.';

  @override
  String get telegramNotOffered =>
      'Máy chủ này chưa có bot Telegram riêng. Bạn có thể tự kết nối bot của mình trong mục Ứng dụng chat của bot.';

  @override
  String get chatAppsSettingsHelp =>
      'Trò chuyện với bot ngay từ các ứng dụng chat bạn quen dùng. Tin nhắn sẽ đổ về mục Chung để bạn tiện theo dõi tiếp ở đây.';

  @override
  String get chatAppsPerBot =>
      'Email và các bot riêng được thiết lập theo từng bot: mở một bot, rồi vào Ứng dụng chat.';

  @override
  String get chatAppsRowHelp =>
      'Telegram, Discord, Slack và nhiều ứng dụng khác';

  @override
  String get chatAppsSlackHelp =>
      'Slack được thêm theo từng không gian làm việc Slack, cho một bot. Chọn bot rồi chọn Thêm vào Slack.';

  @override
  String get chatAppsSlackPickBot => 'Thêm Slack cho';

  @override
  String get slackAnyoneInWorkspace =>
      'Mọi người trong không gian làm việc Slack này';

  @override
  String get slackAnyoneInWorkspaceHelp =>
      'Mọi người trong không gian làm việc đều nói chuyện được với bot, không chỉ những người trong danh sách. Phê duyệt vẫn cần người thuộc danh sách.';

  @override
  String get discordUseCasama => 'Dùng bot Discord của Casama';

  @override
  String discordUseCasamaHelp(String bot) {
    return 'Nhắn với $bot trên Discord. Đăng nhập Discord một lần, rồi nhắn trực tiếp cho bot hoặc dùng /ask ở bất cứ đâu.';
  }

  @override
  String get discordOtherWorkspace =>
      'Discord của bạn đang kết nối với không gian làm việc khác. Kết nối ở đây sẽ chuyển sang đây.';

  @override
  String discordLinkedTitle(String name) {
    return 'Discord: $name';
  }

  @override
  String discordNowGoesTo(String bot) {
    return 'Tin nhắn Discord giờ sẽ gửi tới $bot.';
  }

  @override
  String get discordFinish => 'Hoàn tất trong Discord';

  @override
  String get discordFinishHelp =>
      'Đăng nhập Discord trong trình duyệt và cho phép Casama. Chỉ thực hiện bằng tài khoản Discord của chính bạn. Mục này sẽ cập nhật sau khi kết nối.';

  @override
  String get discordOpenAgain => 'Mở lại trang đăng nhập Discord';

  @override
  String get discordConnected => 'Đã kết nối Discord';

  @override
  String discordConnectedHelp(String name) {
    return 'Đã kết nối dưới tên $name. Nhắn cho bot Casama trên Discord hoặc dùng /ask ở bất cứ đâu; cuộc trò chuyện cũng hiện ở đây trong mục Chung.';
  }

  @override
  String get discordConnectedHelpPlain =>
      'Nhắn cho bot Casama trên Discord hoặc dùng /ask ở bất cứ đâu; cuộc trò chuyện cũng hiện ở đây trong mục Chung.';

  @override
  String get discordConnect => 'Kết nối Discord';

  @override
  String get discordDisconnect => 'Ngắt kết nối Discord';

  @override
  String get discordDisconnectConfirm => 'Ngắt kết nối Discord?';

  @override
  String get discordDisconnectHelp =>
      'Bot của bạn sẽ ngừng trả lời trên Discord. Lịch sử trò chuyện vẫn được giữ tại đây.';

  @override
  String get discordPickBot => 'Tin nhắn Discord gửi tới';

  @override
  String get discordNeedsBot =>
      'Hãy tạo một bot trước rồi mới kết nối Discord.';

  @override
  String get discordNotOffered =>
      'Máy chủ này chưa có ứng dụng Discord riêng. Bạn có thể tự kết nối ứng dụng Discord của mình trong mục Ứng dụng chat của bot.';

  @override
  String get inactiveAccountsNote =>
      'Nếu bạn ngừng dùng Casama: sau 30 ngày các quy trình và trình theo dõi sẽ tạm nghỉ cho đến khi bạn quay lại. Sau 6 tháng tệp đã lưu trên máy tính của bạn sẽ bị xóa, và sau 12 tháng (24 tháng nếu từng thanh toán) tài khoản sẽ bị xóa. Chúng tôi luôn gửi email báo trước khi xóa bất kỳ thứ gì. Tài khoản đang dùng gói trả phí không bao giờ bị ảnh hưởng.';

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
  String get inactivityModeOff => 'Tắt';

  @override
  String get inactivityModeReport => 'Báo cáo';

  @override
  String get inactivityModeOn => 'Bật';

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
    return 'hoạt động $when';
  }

  @override
  String get inactivityStateResting => 'Đang nghỉ';

  @override
  String get inactivityStateFilesSoon => 'Sắp xóa tệp';

  @override
  String get inactivityStateRemovalSoon => 'Sắp xóa';

  @override
  String get inactivityStateRemoving => 'Đang xóa';

  @override
  String get inactivityKept => 'Được giữ';

  @override
  String get keepAccount => 'Giữ tài khoản này';

  @override
  String get keepAccountHelp =>
      'Không bao giờ tạm nghỉ hay xóa vì lâu không dùng';

  @override
  String get computerFilesRemoved => 'Đã xóa tệp đã lưu';

  @override
  String computerFilesRemovedHelp(String date) {
    return 'Máy tính này không được dùng trong 6 tháng nên các tệp đã lưu đã bị xóa vào $date. Máy khởi tạo lại từ đầu.';
  }

  @override
  String get downloadSavedFiles => 'Tải xuống tệp đã lưu';

  @override
  String get downloadSavedFilesHelp =>
      'Tệp .tar.gz của thư mục cá nhân, không cần đánh thức máy';

  @override
  String get liveActivity => 'Hoạt động trực tiếp';

  @override
  String get liveRowHelp =>
      'Danh sách chờ, lượt đăng ký và lượt tải theo thời gian thực';

  @override
  String get liveRefresh => 'Làm mới';

  @override
  String get liveTabActivity => 'Hoạt động';

  @override
  String get liveTabAlerts => 'Cảnh báo';

  @override
  String get liveGroupAll => 'Tất cả';

  @override
  String get liveGroupWaitlist => 'Danh sách chờ';

  @override
  String get liveGroupAccounts => 'Tài khoản';

  @override
  String get liveGroupMoney => 'Tài chính';

  @override
  String get liveGroupWebsite => 'Trang web';

  @override
  String get liveGroupGrowth => 'Tăng trưởng';

  @override
  String get liveGroupSupport => 'Hỗ trợ';

  @override
  String get liveKindWaitlistJoined => 'Đã tham gia danh sách chờ';

  @override
  String get liveKindWaitlistAdmitted => 'Đã duyệt từ danh sách chờ';

  @override
  String get liveKindSignup => 'Tài khoản mới';

  @override
  String get liveKindSignupRefused => 'Từ chối đăng ký';

  @override
  String get liveKindFirstChat => 'Cuộc trò chuyện đầu tiên';

  @override
  String get liveKindMilestone =>
      'Cột mốc đầu tiên khác (bot, máy tính, cuộc gọi, quy trình)';

  @override
  String get liveKindSubscription => 'Gói đăng ký mới';

  @override
  String get liveKindSubscriptionEnded => 'Gói đăng ký đã kết thúc';

  @override
  String get liveKindPurchase => 'Đã mua tín dụng';

  @override
  String get liveKindSupportTicket => 'Phiếu hỗ trợ';

  @override
  String get liveKindFeedback => 'Phản hồi';

  @override
  String get liveKindAccountDeleted => 'Đã xóa tài khoản';

  @override
  String get liveKindDownloadClick => 'Nhấp tải xuống';

  @override
  String get liveKindQrOpen => 'Đã mở mã QR tải xuống';

  @override
  String get liveKindStartClick => 'Nhấp bắt đầu miễn phí';

  @override
  String get liveKindInviteOpen => 'Đã mở liên kết mời';

  @override
  String get liveNow => 'bây giờ';

  @override
  String liveMinutesAgo(int minutes) {
    return '$minutes phút';
  }

  @override
  String liveHoursAgo(int hours) {
    return '$hours giờ';
  }

  @override
  String get liveTestSent =>
      'Đã gửi cảnh báo thử nghiệm tới các thiết bị của bạn';

  @override
  String get liveTodayWaitlist => 'Tham gia hôm nay';

  @override
  String get liveTodaySignups => 'Tài khoản hôm nay';

  @override
  String get liveTodayDownloads => 'Lượt tải hôm nay';

  @override
  String get liveTodayMoney => 'Doanh thu hôm nay';

  @override
  String get liveRetry => 'Thử lại';

  @override
  String get liveEmpty =>
      'Chưa có gì. Hoạt động mới sẽ hiện ở đây chỉ sau vài giây.';

  @override
  String get liveOlder => 'Hiện cũ hơn';

  @override
  String get liveAlertsHelp =>
      'Chọn những mục sẽ gửi thông báo đẩy tới điện thoại, máy Mac và trình duyệt. Khi nhiều sự kiện xảy ra cùng lúc, bạn sẽ nhận một bản tóm tắt gộp thay vì từng thông báo lẻ.';

  @override
  String get livePauseAll => 'Tạm dừng mọi cảnh báo';

  @override
  String get livePauseAllHelp => 'Hoạt động vẫn hiện tại đây';

  @override
  String get liveSendTest => 'Gửi cảnh báo thử nghiệm';

  @override
  String get liveSendTestHelp =>
      'Kiểm tra xem cảnh báo có tới thiết bị này không';

  @override
  String get liveAlertsFooter =>
      'Cảnh báo sẽ chờ trong giờ yên tĩnh (Cài đặt → Thông báo) rồi gửi gộp thành một bản tóm tắt sau đó. Trên trình duyệt, hãy cho phép thông báo cho trang web này để nhận tại đây.';

  @override
  String get liveStatusOn => 'Trực tiếp: cập nhật mỗi vài giây';

  @override
  String get liveStatusPaused => 'Trực tiếp. Cảnh báo đang tạm dừng';

  @override
  String get liveGroupApp => 'Ứng dụng';

  @override
  String get liveKindAppFirstOpen => 'Mở ứng dụng lần đầu';

  @override
  String get liveKindAppReinstall => 'Cài đặt lại ứng dụng';

  @override
  String get liveKindSigninStarted => 'Bắt đầu đăng nhập';

  @override
  String get liveKindTrialStarted => 'Bắt đầu dùng thử';

  @override
  String get liveKindRenewal => 'Gia hạn gói đăng ký';

  @override
  String get liveKindRefund => 'Hoàn tiền';

  @override
  String get liveKindDisputeOpened => 'Mở tranh chấp';

  @override
  String get liveKindPlanCancelFailed => 'Chưa hủy được gói';

  @override
  String get liveKindStoreReview => 'Đánh giá trên cửa hàng';

  @override
  String get liveKindStoreCrashes => 'Báo cáo lỗi cửa hàng';

  @override
  String get liveKindDay2Return => 'Quay lại vào ngày 2';

  @override
  String get liveKindWeek1Return => 'Quay lại trong tuần 1';

  @override
  String get liveKindDeviceGone => 'Khả năng ứng dụng đã bị xóa';

  @override
  String get liveKindPartnerInterest => 'Nhà sáng tạo quan tâm Đối tác';

  @override
  String get liveKindCreatorOpen => 'Đã mở liên kết nhà sáng tạo';

  @override
  String get liveKindPartnerClaimed => 'Đã dùng mã nhà sáng tạo';

  @override
  String get liveKindGiftOpen => 'Đã mở liên kết quà tặng';

  @override
  String get liveKindCompRedeemed => 'Đã đổi gói quà tặng';

  @override
  String get liveKindReferralRewarded => 'Lời mời đã phát huy hiệu quả';

  @override
  String get liveKindNewsletterConfirmed => 'Đăng ký nhận bản tin';

  @override
  String get liveKindTestimonialSubmitted => 'Lời nhận xét chờ duyệt';

  @override
  String get liveDailyDigest => 'Tóm tắt buổi sáng';

  @override
  String get liveDailyDigestHelp =>
      'Phễu chuyển đổi và lượt tải hôm qua, gửi lúc 9 giờ theo múi giờ của bạn';

  @override
  String get liveFunnelClicks => 'Lượt nhấp';

  @override
  String get liveFunnelOpens => 'Lần mở đầu';

  @override
  String get liveFunnelSignups => 'Tài khoản';

  @override
  String get liveFunnelChats => 'Cuộc trò chuyện đầu';

  @override
  String get liveFunnelPaying => 'Đã trả phí';

  @override
  String liveFunnelRate(String label, int percent) {
    return '$label · $percent%';
  }

  @override
  String get liveByPerson => 'Theo từng người';

  @override
  String get liveSearch => 'Tìm email, quốc gia, nguồn';

  @override
  String get liveNoMatches => 'Không có gì khớp với tìm kiếm này';

  @override
  String liveSteps(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bước',
      one: '1 bước',
    );
    return '$_temp0';
  }

  @override
  String get liveLikely => 'nhiều khả năng';

  @override
  String get liveStepClick => 'Đã nhấp tải xuống';

  @override
  String get liveStepOpen => 'Đã mở ứng dụng';

  @override
  String get liveStepSignup => 'Đã tạo tài khoản';

  @override
  String get liveStepChat => 'Cuộc trò chuyện đầu';

  @override
  String get liveStepPaying => 'Đang trả phí';

  @override
  String get liveJourneyTitle => 'Diễn biến';

  @override
  String get liveJourneyVisitor => 'Khách truy cập';

  @override
  String get liveJourneyWho => 'Ai';

  @override
  String get liveJourneyFrom => 'Từ đâu';

  @override
  String get liveJourneyDevice => 'Thiết bị';

  @override
  String get liveJourneyTimeline => 'Dòng thời gian';

  @override
  String get liveJourneyNow => 'Hiện tại';

  @override
  String get liveJourneySource => 'Nguồn';

  @override
  String get liveJourneyCampaign => 'Chiến dịch';

  @override
  String get liveJourneyLanding => 'Trang đầu tiên';

  @override
  String get liveJourneyClickedFrom => 'Nhấp từ';

  @override
  String get liveJourneyPlatform => 'Nền tảng';

  @override
  String get liveJourneyStore => 'Từ';

  @override
  String get liveJourneyVersion => 'Phiên bản';

  @override
  String get liveJourneyCountry => 'Quốc gia';

  @override
  String get liveJourneyLikelyHelp =>
      'Khớp với lượt nhấp trên trang web theo thiết bị, quốc gia và thời gian chứ không qua liên kết trực tiếp. Chỉ nên xem là phỏng đoán hợp lý.';

  @override
  String get liveJourneyPlan => 'Gói';

  @override
  String get liveJourneyMessages => 'Tin nhắn đã gửi';

  @override
  String get liveJourneyBots => 'Bot';

  @override
  String get liveJourneyDevices => 'Đã đăng nhập trên';

  @override
  String get liveJourneyLastActive => 'Hoạt động lần cuối';

  @override
  String get liveJourneyJoined => 'Ngày tạo tài khoản';

  @override
  String liveJourneyAfter(String gap) {
    return '$gap sau đó';
  }

  @override
  String get liveJourneyNone => 'Chưa có thêm thông tin về lượt này.';

  @override
  String get liveJourneyCopyEmail => 'Sao chép email';

  @override
  String get liveJourneyCopied => 'Đã sao chép email';

  @override
  String get liveJourneyOpenAdmin => 'Mở trong Quản trị';

  @override
  String get liveJourneyGone =>
      'Mục này đã quá 30 ngày nên chi tiết đã bị xóa.';

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
  String get planChangeTitle => 'Xác nhận đổi gói';

  @override
  String planChangeSwitchTo(String plan) {
    return 'Chuyển sang $plan';
  }

  @override
  String get planChangeChargedNow => 'Tính phí ngay';

  @override
  String planChangeTaxIncluded(String tax) {
    return 'Đã gồm $tax thuế';
  }

  @override
  String get planChangeCredit => 'Khấu trừ thời gian chưa dùng';

  @override
  String planChangeThen(String amount, String period) {
    return 'Sau đó $amount / $period (chưa tính thuế)';
  }

  @override
  String planChangeNextBilling(String date) {
    return 'Kỳ thanh toán tiếp theo vào $date';
  }

  @override
  String get planChangeConfirmAndPay => 'Xác nhận và thanh toán';

  @override
  String get planChangeHaveCode => 'Có mã giảm giá?';

  @override
  String get planChangeCodeLabel => 'Mã giảm giá';

  @override
  String get planChangeCodeHint => 'Nhập mã';

  @override
  String get planChangeApply => 'Áp dụng';

  @override
  String get planChangeRemove => 'Gỡ bỏ';

  @override
  String get planChangeDiscountApplied => 'Đã áp dụng mã giảm giá';

  @override
  String planChangePercentEveryRenewal(String percent) {
    return 'Giảm $percent%, mọi kỳ gia hạn';
  }

  @override
  String planChangePercentForRenewals(String percent, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Giảm $percent%, cho $count kỳ gia hạn',
      one: 'Giảm $percent%, cho 1 kỳ gia hạn',
    );
    return '$_temp0';
  }

  @override
  String planChangeAmountEveryRenewal(String amount) {
    return 'Giảm $amount, mọi kỳ gia hạn';
  }

  @override
  String planChangeAmountForRenewals(String amount, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Giảm $amount, cho $count kỳ gia hạn',
      one: 'Giảm $amount, cho 1 kỳ gia hạn',
    );
    return '$_temp0';
  }

  @override
  String planChangePercentUntilPlanChange(String percent) {
    return 'Giảm $percent% mỗi kỳ gia hạn; kết thúc nếu bạn đổi gói lần nữa';
  }

  @override
  String planChangeAmountUntilPlanChange(String amount) {
    return 'Giảm $amount mỗi kỳ gia hạn; kết thúc nếu bạn đổi gói lần nữa';
  }

  @override
  String get planChangeInvalidCode => 'Không dùng được mã đó cho gói này.';

  @override
  String get planChangeCodeCostsMore =>
      'Mã này sẽ thay thế mức giảm giá hiện tại và khiến chi phí cao hơn.';

  @override
  String get planChangeCodeEndsLasting =>
      'Mã này sẽ chấm dứt mức giảm giá dài hạn hiện tại của bạn.';

  @override
  String get planChangeCodeNotBetter =>
      'Bạn đang có mức giảm giá bằng hoặc tốt hơn rồi.';

  @override
  String planChangeReplacesPercent(String percent) {
    return 'Thay thế mức giảm $percent% hiện tại';
  }

  @override
  String get planChangeReplacesDiscount => 'Thay thế mức giảm giá hiện tại';

  @override
  String get planChangePriceMoved =>
      'Tổng tiền đã thay đổi kể từ khi bạn mở trang này. Hãy xem lại số tiền mới rồi xác nhận lại.';

  @override
  String get planChangePeriodWeek => 'tuần';

  @override
  String get planChangePeriodMonth => 'tháng';

  @override
  String get planChangePeriodYear => 'năm';

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
  String get partnerSection => 'Đối tác Casama';

  @override
  String get partnerProgramTitle => 'Làm video, bài viết hay bản tin?';

  @override
  String get partnerProgramSubtitle =>
      'Nhận 30% số tiền người bạn giới thiệu thanh toán, trong một năm';

  @override
  String get partnerYourCode => 'Mã nhà sáng tạo của bạn';

  @override
  String get partnerPaused => 'Đã tạm dừng';

  @override
  String get partnerPortal => 'Thu nhập và chi trả';

  @override
  String partnerShareText(String link, String code) {
    return 'Thử Casama đi, những đồng đội AI làm việc giúp bạn. Nhập mã $code của mình khi đăng ký nhé: $link';
  }

  @override
  String partnerSentBy(String name) {
    return '$name đã giới thiệu bạn đến Casama.';
  }

  @override
  String get partnerClaimed =>
      'Đã thêm mã nhà sáng tạo. Chào mừng đến với Casama!';

  @override
  String partnerClaimedFrom(String name) {
    return 'Cảm ơn bạn đã ủng hộ $name. Chào mừng đến với Casama!';
  }

  @override
  String get partnerErrNotFound =>
      'Mã nhà sáng tạo đó không tồn tại. Kiểm tra lại rồi thử lần nữa.';

  @override
  String get partnerErrOwnCode =>
      'Đó là mã của chính bạn. Hãy chia sẻ với khán giả của bạn nhé.';

  @override
  String get partnerErrWindowClosed =>
      'Mã nhà sáng tạo chỉ nhập được trong những ngày đầu sau khi đăng ký.';

  @override
  String get partnerErrAlreadyPaying =>
      'Mã nhà sáng tạo chỉ dành cho tài khoản mới, trước lần thanh toán đầu tiên.';

  @override
  String get partnerErrAlready => 'Bạn đã nhập mã nhà sáng tạo trước đó rồi.';

  @override
  String get partnerErrReferred =>
      'Bạn tham gia bằng lời mời của bạn bè nên không thể thêm mã nhà sáng tạo.';

  @override
  String get partnerErrOff =>
      'Mã nhà sáng tạo không khả dụng trên máy chủ này.';

  @override
  String get referralHaveCodeAny => 'Có mã giới thiệu?';

  @override
  String get referralCodeHintAny => 'Mã của bạn bè hoặc nhà sáng tạo';

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
  String get testimonialStateLive => 'Đang hiển thị';

  @override
  String get testimonialStateDraft => 'Bản nháp';

  @override
  String get testimonialStateHidden => 'Đã ẩn';

  @override
  String get testimonialStateWithdrawn => 'Đã thu hồi';

  @override
  String get testimonialPlaceSiteHome => 'Trang chủ casama.ai';

  @override
  String get testimonialPlaceSitePricing => 'Trang giá casama.ai';

  @override
  String get testimonialPlaceAppPaywall => 'Các gói trong ứng dụng';

  @override
  String get testimonialPlaceAppSignin => 'Trang đăng nhập ứng dụng';

  @override
  String get testimonialSourceEmail => 'Email';

  @override
  String get testimonialSourceInApp => 'Trong ứng dụng';

  @override
  String get testimonialSourceOther => 'Khác';

  @override
  String testimonialStars(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sao',
      one: '1 sao',
    );
    return '$_temp0';
  }

  @override
  String get testimonialsLabel => 'Mọi người nói gì về Casama';

  @override
  String get testimonialAskTitle => 'Bạn thấy Casama thế nào?';

  @override
  String get testimonialAskSubtitle => 'Hãy chia sẻ trong một câu nhé.';

  @override
  String get testimonialAskHint => 'Bạn thích điều gì ở ứng dụng?';

  @override
  String testimonialAskConsent(String name) {
    return 'Casama có thể trích dẫn lời tôi trên casama.ai và trong ứng dụng dưới tên $name';
  }

  @override
  String get testimonialAskConsentAnonymous =>
      'Casama có thể trích dẫn lời tôi trên casama.ai và trong ứng dụng với tư cách người dùng Casama';

  @override
  String get testimonialAskSend => 'Gửi';

  @override
  String get testimonialAskNotNow => 'Để sau';

  @override
  String get testimonialAskThanks =>
      'Cảm ơn bạn! Chúng tôi đọc mọi lời chia sẻ.';

  @override
  String get communityTitle => 'Cộng đồng';

  @override
  String get communitySentence =>
      'Casama là phần mềm mã nguồn mở. Nếu thấy hữu ích, một ngôi sao trên GitHub sẽ giúp nhiều người hơn biết tới.';

  @override
  String get communityStarOnGitHub => 'Tặng sao trên GitHub';

  @override
  String get communityDiscord => 'Discord';

  @override
  String get communityDiscordHelp =>
      'Trò chuyện cùng đội ngũ và những người khác đang dùng Casama';

  @override
  String get starAskTitle => 'Casama trên GitHub';

  @override
  String get starAskNotNow => 'Để sau';

  @override
  String get cloudSignInTitle => 'Đăng nhập bằng tài khoản Casama';

  @override
  String get cloudSignInBody =>
      'Giấy phép cá nhân miễn phí được cấp từ tài khoản Casama của bạn. Chỉ có giấy phép được gửi tới máy chủ này; cuộc trò chuyện của bạn vẫn ở nguyên đây.';

  @override
  String get cloudSignInEmail => 'Email';

  @override
  String get cloudSignInSendCode => 'Gửi mã';

  @override
  String get cloudSignInCode => 'Mã trong email';

  @override
  String get cloudSignInVerify => 'Đăng nhập';

  @override
  String cloudSignInCodeSent(String email) {
    return 'Chúng tôi đã gửi mã tới $email. Nhập mã vào đây.';
  }

  @override
  String get licenseSetupTitle => 'Nhận giấy phép cá nhân miễn phí';

  @override
  String get licenseSetupBody =>
      'Máy chủ này cần có giấy phép trước khi bot chạy được. Dùng cá nhân miễn phí cho một người: chỉ cần đăng nhập bằng tài khoản Casama, giấy phép sẽ tự gia hạn trực tuyến mỗi 30 ngày.';

  @override
  String get licensePersonalButton => 'Nhận giấy phép cá nhân miễn phí';

  @override
  String get licensePersonalNote =>
      'Cá nhân: một người, dùng cho mục đích cá nhân, trên máy tính hoặc máy chủ của bạn.';

  @override
  String get licenseBusinessTitle => 'Hoặc nhập khóa doanh nghiệp';

  @override
  String get licenseBusinessHint => 'Dán khóa giấy phép của bạn';

  @override
  String get licenseBusinessSave => 'Dùng khóa này';

  @override
  String licenseBusinessPrices(
    String monthlyPrice,
    String yearlyMonthlyPrice,
    String email,
  ) {
    return 'Dùng Casama cho công việc hoặc nhóm? Gói Business có giá $monthlyPrice mỗi tháng cho mỗi người dùng hoạt động ($yearlyMonthlyPrice nếu thanh toán hằng năm). Viết thư tới $email.';
  }

  @override
  String get licenseActivated =>
      'Giấy phép đã kích hoạt. Bot của bạn đã chạy được.';

  @override
  String get licenseOtherServer => 'Dùng máy chủ khác';

  @override
  String get licenseRenew => 'Gia hạn';

  @override
  String get licenseRenewTitle => 'Gia hạn giấy phép máy chủ này';

  @override
  String licenseGraceBanner(String date) {
    return 'Giấy phép của máy chủ này đã hết hạn. Bot vẫn chạy tiếp đến hết $date; hãy gia hạn trước thời điểm đó.';
  }

  @override
  String get licenseGraceBannerSoon =>
      'Giấy phép của máy chủ này đã hết hạn. Hãy gia hạn sớm để bot tiếp tục chạy.';

  @override
  String get licenseExpiredBanner =>
      'Giấy phép của máy chủ này đã hết hạn nên các lượt chạy mới của bot đang tạm dừng. Dữ liệu của bạn vẫn an toàn: bạn vẫn đăng nhập, đọc và xuất dữ liệu bình thường. Gia hạn để bot chạy lại.';

  @override
  String get licenseErrorRequired =>
      'Máy chủ này cần có giấy phép trước. Hãy lấy giấy phép cá nhân miễn phí hoặc nhập khóa doanh nghiệp.';

  @override
  String licenseErrorSeats(String email) {
    return 'Mọi suất trên giấy phép của máy chủ này đã được dùng hết. Để thêm người, bạn cần giấy phép Business: hãy viết thư tới $email.';
  }

  @override
  String get licenseErrorExpired =>
      'Giấy phép của máy chủ này đã hết hạn nên các lượt chạy mới của bot đang tạm dừng. Dữ liệu của bạn vẫn an toàn. Gia hạn giấy phép để bot chạy lại.';

  @override
  String get licenseEditionPersonal => 'Cá nhân';

  @override
  String get licenseEditionTrial => 'Dùng thử';

  @override
  String get licenseEditionBusiness => 'Doanh nghiệp';

  @override
  String get licenseFeatureSso => 'SSO';

  @override
  String get licenseFeatureAuditExport => 'Xuất nhật ký kiểm toán';

  @override
  String get licenseFeatureAuditForwarding => 'Chuyển tiếp nhật ký kiểm toán';

  @override
  String get licenseFeatureRoles => 'Phân quyền nâng cao';

  @override
  String get setupLicenseTitle => 'Giấy phép cá nhân miễn phí';

  @override
  String get setupLicenseBody =>
      'Đăng nhập bằng tài khoản Casama để nhận giấy phép cá nhân miễn phí cho máy chủ này: một người, dùng cho mục đích cá nhân. Bạn cũng có thể làm sau.';

  @override
  String get setupLicenseSignIn => 'Đăng nhập với Casama';

  @override
  String get setupLicenseReady =>
      'Giấy phép cá nhân miễn phí đi kèm cùng máy chủ của bạn.';

  @override
  String setupLicenseReadyFor(String email) {
    return 'Đã đăng nhập với $email. Giấy phép cá nhân miễn phí đi kèm cùng máy chủ của bạn.';
  }

  @override
  String get setupLicenseSkipped =>
      'Chưa có giấy phép. Máy chủ sẽ hỏi giấy phép khi khởi động.';

  @override
  String setupLicenseFailed(String error) {
    return 'Chưa tạo được giấy phép cá nhân ($error). Máy chủ sẽ hỏi giấy phép khi khởi động.';
  }

  @override
  String get setupDockerMissingBodyWindows =>
      'Máy chủ Casama chạy trong Docker Desktop, ứng dụng miễn phí dùng WSL 2 để tách biệt với phần còn lại của máy tính Windows.';

  @override
  String get setupDockerStep1Windows =>
      'Chạy trình cài đặt đã tải xuống và giữ nguyên tùy chọn \"Use WSL 2\".';

  @override
  String localUpdateAvailable(String version) {
    return 'Đã có bản cập nhật máy chủ: $version';
  }

  @override
  String get localUpdateButton => 'Cập nhật';

  @override
  String get localUpdateLater => 'Để sau';

  @override
  String localUpdateTitle(String version) {
    return 'Cập nhật máy chủ lên $version';
  }

  @override
  String get localUpdateBody =>
      'Cơ sở dữ liệu sẽ được sao lưu trước. Nếu phiên bản mới không khởi động được, máy chủ sẽ tự quay về phiên bản hiện tại.';

  @override
  String localUpdateDone(String version) {
    return 'Đã cập nhật lên $version.';
  }

  @override
  String get localUpdateRolledBack =>
      'Phiên bản mới không khởi động được nên máy chủ đã quay về phiên bản cũ. Không mất dữ liệu nào và một bản sao lưu cơ sở dữ liệu đã được lưu lại.';

  @override
  String localUpdateFailed(String detail) {
    return 'Cập nhật thất bại: $detail';
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
  String get shCloudScreenTitle => 'Mô hình Casama Cloud';

  @override
  String get shCloudPitch =>
      'Các mô hình của Casama, không cần quản lý khóa. Thanh toán bằng gói Casama Cloud.';

  @override
  String get shCloudTurnOn => 'Bật';

  @override
  String shCloudOnPaidBy(String workspace) {
    return 'Đang bật · $workspace thanh toán';
  }

  @override
  String shCloudMemberState(String workspace) {
    return 'Casama Cloud, do $workspace thanh toán';
  }

  @override
  String get shCloudMemberOff =>
      'Chưa bật. Chỉ quản trị viên máy chủ này mới bật được.';

  @override
  String get shCloudManage => 'Quản lý';

  @override
  String get shCloudSignInBody =>
      'Đăng nhập bằng tài khoản Casama để chọn bên thanh toán cho mô hình Casama Cloud. Bot, cuộc trò chuyện và trí nhớ vẫn ở trên máy chủ này.';

  @override
  String shCloudSignedInAs(String email) {
    return 'Đã đăng nhập Casama Cloud với $email';
  }

  @override
  String get shCloudOtherAccount => 'Dùng tài khoản khác';

  @override
  String get shCloudContinue => 'Tiếp tục';

  @override
  String get shCloudPayerTitle => 'Ai thanh toán?';

  @override
  String get shCloudPayerBody =>
      'Mô hình Casama Cloud được thanh toán bởi một không gian làm việc Casama Cloud bạn sở hữu hoặc quản lý. Gói, hạn mức đi kèm và giới hạn hằng ngày của gói được dùng chung với mọi thứ khác mà không gian đó sử dụng.';

  @override
  String get shCloudPayerNone =>
      'Bạn chưa quản lý không gian làm việc Casama Cloud nào. Hãy tạo một không gian để thanh toán; không gian mới sẽ bắt đầu trống.';

  @override
  String get shCloudCreateWorkspace => 'Tạo ngay';

  @override
  String shCloudWorkspaceNamed(String name) {
    return 'Không gian làm việc của $name';
  }

  @override
  String get shCloudNoPlan => 'Chưa có gói nào';

  @override
  String shCloudCovered(String plan) {
    return 'Gói $plan của bạn đã bao gồm mục này.';
  }

  @override
  String get shCloudPlanTitle => 'Chọn gói';

  @override
  String get shCloudPlanBody =>
      'Mô hình Casama Cloud đi kèm mọi gói Casama Cloud: cùng hạn mức đi kèm, giới hạn hằng ngày và gói nạp thêm như trên Cloud. Không tính giá riêng cho tự lưu trữ.';

  @override
  String get shCloudTryFirst => 'Dùng thử trước';

  @override
  String shCloudTryFirstBody(String amount) {
    return 'Hạn mức dùng thử miễn phí: tin nhắn trị giá khoảng $amount, một lần cho mỗi tài khoản Casama. Không cần mua gì.';
  }

  @override
  String get shCloudTrialUsed =>
      'Hạn mức dùng thử miễn phí trên tài khoản Casama này đã hết. Hãy chọn một gói để tiếp tục.';

  @override
  String get shCloudIntervalWeek => 'Hằng tuần';

  @override
  String get shCloudIntervalMonth => 'Hằng tháng';

  @override
  String get shCloudIntervalYear => 'Hằng năm';

  @override
  String get shCloudWaitingForPlan =>
      'Hoàn tất thanh toán trong trình duyệt. Màn hình này tự động tiếp tục khi gói có hiệu lực.';

  @override
  String get shCloudWaitingTimedOut =>
      'Gói chưa hiển thị. Thanh toán có thể mất vài phút để cập nhật.';

  @override
  String get shCloudCheckAgain => 'Kiểm tra lại';

  @override
  String get shCloudGiftCode => 'Có mã quà tặng?';

  @override
  String get shCloudGiftCodeLabel => 'Mã quà tặng';

  @override
  String get shCloudRedeem => 'Đổi mã';

  @override
  String get shCloudNoWayToBuy =>
      'Không mua gói trong ứng dụng này được. Hãy mua trên casama.ai bằng cùng tài khoản rồi kiểm tra lại ở đây.';

  @override
  String get shCloudPurchasePending =>
      'Giao dịch mua đang chờ phê duyệt. Quá trình sẽ tự tiếp tục khi hoàn tất.';

  @override
  String get shCloudPurchaseFailed =>
      'Giao dịch mua không thành công. Bạn không bị tính phí.';

  @override
  String get shCloudConnecting => 'Đang kết nối máy chủ này với Casama Cloud…';

  @override
  String get shCloudLoading => 'Đang tải…';

  @override
  String get shCloudReviewTitle => 'Kiểm tra trước khi bật';

  @override
  String get shCloudReviewPays => 'Bên thanh toán';

  @override
  String shCloudReviewPaysLine(String plan, String workspace, String email) {
    return '$plan trên $workspace ($email)';
  }

  @override
  String shCloudReviewTrialLine(String workspace, String email) {
    return 'Hạn mức dùng thử miễn phí trên $workspace ($email)';
  }

  @override
  String get shCloudReviewBots => 'Bot nào chuyển sang';

  @override
  String get shCloudReviewAll => 'Tất cả bot';

  @override
  String get shCloudReviewNoKey => 'Chỉ bot chưa có khóa hoạt động';

  @override
  String get shCloudReviewPick => 'Chọn bot';

  @override
  String get shCloudReviewNoBots =>
      'Máy chủ này chưa có bot nào. Bot mới tạo có thể dùng Casama Cloud.';

  @override
  String get shCloudReviewDefault => 'Bot mới cũng dùng Casama Cloud';

  @override
  String shCloudFromTo(String from, String to) {
    return '$from → $to';
  }

  @override
  String shCloudToCloud(String model) {
    return '$model (Casama Cloud)';
  }

  @override
  String get shCloudCloudModel => 'Mô hình Casama Cloud';

  @override
  String get shCloudNoKeyYet => 'Chưa có khóa hoạt động';

  @override
  String shCloudStepDown(String from) {
    return 'Câu trả lời có thể ngắn hoặc kém kỹ lưỡng hơn so với $from. Hãy thử trước với một bot.';
  }

  @override
  String get shCloudReviewJobs => 'Trí nhớ, hình ảnh và giọng nói';

  @override
  String get shCloudJobMemory => 'Tìm kiếm trí nhớ';

  @override
  String get shCloudJobImages => 'Hình ảnh';

  @override
  String get shCloudJobTts => 'Đọc to';

  @override
  String get shCloudJobStt => 'Đọc chính tả';

  @override
  String get shCloudJobOwnKey => 'Khóa API của bạn';

  @override
  String get shCloudJobMemoryOptIn => 'Dùng Casama Cloud cho cả trí nhớ';

  @override
  String get shCloudJobMemoryOptInHelp =>
      'Trí nhớ được lập chỉ mục lại ngầm; tính năng tìm kiếm vẫn hoạt động bình thường trong lúc đó.';

  @override
  String get shCloudJobLiveNote =>
      'Giọng nói trực tiếp, cuộc gọi điện thoại và video vẫn dùng khóa API của bạn.';

  @override
  String get shCloudWhatGoes => 'Dữ liệu gửi tới Casama Cloud';

  @override
  String get shCloudReviewPrivacy =>
      'Tin nhắn gửi tới mô hình đi qua Casama Cloud và không được lưu trữ lại. Mức sử dụng (mô hình, token, chi phí) hiện trên hóa đơn Cloud của bạn. Bot, cuộc trò chuyện, trí nhớ, tệp và máy tính vẫn ở nguyên trên máy chủ này.';

  @override
  String get shCloudWhatGoesLink => 'Những gì máy chủ này gửi đi';

  @override
  String get shCloudFallback =>
      'Nếu Casama Cloud hết hạn mức hoặc không kết nối được, hãy dùng khóa API của tôi';

  @override
  String get shCloudFallbackHelp =>
      'Mỗi câu trả lời dùng khóa API của bạn đều ghi rõ.';

  @override
  String shCloudSeatsNote(int used, String plan, int seats) {
    final intl.NumberFormat usedNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String usedString = usedNumberFormat.format(used);
    final intl.NumberFormat seatsNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String seatsString = seatsNumberFormat.format(seats);

    return '$usedString người dùng máy chủ này và gói $plan bao gồm $seatsString suất. Mỗi người thêm được tính theo giá mỗi người bổ sung của Casama Cloud.';
  }

  @override
  String get shCloudApply => 'Bật Casama Cloud';

  @override
  String get shCloudPickOne =>
      'Chọn ít nhất một bot hoặc cho phép bot mới dùng.';

  @override
  String get shCloudPolicyTitle => 'Ai được phép dùng';

  @override
  String get shCloudPolicyEveryone => 'Mọi người trên máy chủ này';

  @override
  String get shCloudPolicyChosen => 'Chỉ những người được chọn';

  @override
  String shCloudPolicyChosenCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã chọn $countString người',
      one: 'Đã chọn 1 người',
      zero: 'Chưa chọn ai',
    );
    return '$_temp0';
  }

  @override
  String get shCloudDailyLimit => 'Giới hạn hằng ngày mỗi người';

  @override
  String get shCloudNoLimit => 'Không giới hạn';

  @override
  String shCloudDailyLimitValue(String amount) {
    return '$amount mỗi ngày';
  }

  @override
  String get shCloudPolicySaved => 'Đã lưu';

  @override
  String get shCloudDoneTitle => 'Casama Cloud đã bật';

  @override
  String shCloudDoneBody(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString bot hiện dùng Casama Cloud.',
      one: '1 bot hiện dùng Casama Cloud.',
      zero: 'Các bot mới dùng Casama Cloud.',
    );
    return '$_temp0 Mức sử dụng hiển thị trên màn hình Mức sử dụng của máy chủ và trên hóa đơn Cloud.';
  }

  @override
  String shCloudSayHi(String bot) {
    return 'Chào $bot đi nào';
  }

  @override
  String get shCloudDone => 'Xong';

  @override
  String get shCloudUsageTitle => 'Mức sử dụng';

  @override
  String shCloudIncludedLeft(String amount) {
    return 'Còn $amount hạn mức đi kèm trong tháng này';
  }

  @override
  String shCloudToday(String spend, String cap) {
    return 'Hôm nay: $spend / $cap';
  }

  @override
  String shCloudTodayNoCap(String spend) {
    return 'Hôm nay: $spend';
  }

  @override
  String shCloudCredits(String amount) {
    return '$amount tín dụng';
  }

  @override
  String shCloudTrialLeft(String amount) {
    return 'Còn $amount hạn mức dùng thử miễn phí';
  }

  @override
  String get shCloudPriceNote =>
      'Tính theo giá Casama Cloud. Các lượt gọi cũng hiện trên hóa đơn Cloud dưới tên máy chủ này.';

  @override
  String shCloudYourToday(String spend, String limit) {
    return 'Của bạn hôm nay: $spend / $limit';
  }

  @override
  String get shCloudWarnIncluded =>
      'Casama Cloud đã dùng 80% hạn mức đi kèm tháng này.';

  @override
  String get shCloudWarnDaily => 'Casama Cloud đã dùng 80% giới hạn hôm nay.';

  @override
  String get shCloudTopUp => 'Nạp thêm';

  @override
  String get shCloudUseOwnKey => 'Dùng khóa API của tôi';

  @override
  String get shCloudStopOutOfCredits =>
      'Casama Cloud đã hết hạn mức cho tháng này.';

  @override
  String shCloudStopDailyCap(String time) {
    return 'Giới hạn Casama Cloud hôm nay đã hết. Sẽ đặt lại lúc $time.';
  }

  @override
  String get shCloudStopDailyCapSoon =>
      'Giới hạn Casama Cloud hôm nay đã hết. Sẽ đặt lại vào ngày mai.';

  @override
  String shCloudStopPlanRequired(String workspace) {
    return 'Casama Cloud cần có một gói trên $workspace.';
  }

  @override
  String shCloudStopPlanEnded(String workspace) {
    return 'Gói Casama Cloud trên $workspace đã kết thúc.';
  }

  @override
  String shCloudStopSeats(String workspace) {
    return 'Gói trên $workspace không đủ cho tất cả mọi người dùng Casama Cloud ở đây.';
  }

  @override
  String get shCloudStopMemberLimit =>
      'Bạn đã chạm giới hạn Casama Cloud hôm nay trên máy chủ này.';

  @override
  String get shCloudStopMemberNotAllowed =>
      'Quản trị viên chưa bật Casama Cloud cho bạn.';

  @override
  String get shCloudStopDisconnected =>
      'Casama Cloud đã bị ngắt kết nối khỏi máy chủ này.';

  @override
  String get shCloudStopUnreachable =>
      'Hiện không kết nối được với Casama Cloud. Đang thử lại.';

  @override
  String get shCloudSeePlans => 'Xem các gói';

  @override
  String get shCloudRenew => 'Gia hạn';

  @override
  String get shCloudAskAdmin => 'Hỏi quản trị viên';

  @override
  String get shCloudAskAdminBody =>
      'Chỉ quản trị viên máy chủ này mới thay đổi được Casama Cloud. Hãy nhờ một trong số họ; bot và quy trình sẽ tự chạy tiếp khi được khắc phục.';

  @override
  String get shCloudReconnect => 'Kết nối lại';

  @override
  String get shCloudFallbackActive =>
      'Trong lúc này khóa API của bạn đang trả lời, và mỗi câu trả lời đều ghi rõ.';

  @override
  String get shCloudUseOwnKeyTitle => 'Dùng khóa API của bạn trong lúc này?';

  @override
  String get shCloudUseOwnKeyBody =>
      'Khi Casama Cloud chưa trả lời được, bot sẽ dùng khóa API của bạn và ghi rõ trên từng câu trả lời. Bạn có thể tắt bất cứ lúc nào tại màn hình này.';

  @override
  String get shCloudAddKeyFirst =>
      'Trước tiên hãy thêm một khóa của riêng bạn trên màn hình Mô hình.';

  @override
  String get shCloudRoutinesWait =>
      'Quy trình sẽ chờ và tự chạy tiếp khi được khắc phục.';

  @override
  String shCloudMemoryCatchingUp(int done, int total) {
    final intl.NumberFormat doneNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String doneString = doneNumberFormat.format(done);
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);

    return 'Trí nhớ đang đồng bộ: $doneString / $totalString';
  }

  @override
  String get shCloudMemoryCatchingUpHelp =>
      'Tìm kiếm tạm dùng từ khóa cho những mục trí nhớ chưa lập chỉ mục lại.';

  @override
  String shCloudMemberNotice(String workspace) {
    return 'Tin nhắn gửi tới mô hình giờ đi qua Casama Cloud, do $workspace thanh toán.';
  }

  @override
  String get shCloudGotIt => 'Đã hiểu';

  @override
  String shCloudChipPaidBy(String workspace) {
    return '$workspace thanh toán';
  }

  @override
  String get shCloudPaidBy => 'Bên thanh toán';

  @override
  String get shCloudChangePayer => 'Thay đổi';

  @override
  String get shCloudChangeBots => 'Đổi bot';

  @override
  String get shCloudFallbackSection => 'Khi Casama Cloud không trả lời được';

  @override
  String get shCloudTurnOff => 'Tắt';

  @override
  String get shCloudOffTitle => 'Tắt Casama Cloud?';

  @override
  String get shCloudOffBody =>
      'Các bot này sẽ quay lại dùng khóa trước đó nếu còn hoạt động, hoặc khóa mặc định của không gian làm việc. Mọi thứ khác giữ nguyên và bạn có thể bật lại bất cứ lúc nào.';

  @override
  String get shCloudOffBotsNone => 'Hiện không có bot nào dùng Casama Cloud.';

  @override
  String get shCloudOffDoneTitle => 'Casama Cloud đã tắt';

  @override
  String shCloudOffBackTo(String key) {
    return 'Quay lại $key';
  }

  @override
  String get shCloudOffNeedsKey => 'Cần có khóa';

  @override
  String get shCloudAddKey => 'Thêm khóa';

  @override
  String get shCloudSignInAgain =>
      'Phiên đăng nhập Casama Cloud của bạn đã hết hạn. Đăng nhập lại để tiếp tục.';

  @override
  String get cloudAccountSection => 'Tài khoản Casama Cloud';

  @override
  String cloudAccountRow(String email) {
    return 'Đã đăng nhập với $email';
  }

  @override
  String get cloudAccountRowHelp =>
      'Dùng cho giấy phép của máy chủ này và mô hình Casama Cloud';

  @override
  String get cloudAccountSignOut => 'Đăng xuất khỏi Casama Cloud';

  @override
  String get cloudAccountSignOutBody =>
      'Thiết bị này sẽ quên phiên đăng nhập Casama Cloud của bạn. Máy chủ này, giấy phép và các mô hình Casama Cloud vẫn hoạt động bình thường.';

  @override
  String get cloudAccountDelete => 'Xóa tài khoản Casama Cloud';

  @override
  String get cloudAccountDeleteHelp =>
      'Xóa tài khoản của bạn trên Casama Cloud. Máy chủ này và dữ liệu của máy vẫn giữ nguyên.';

  @override
  String cloudAccountDeleteConfirm(String email) {
    return 'Nhập $email để xóa tài khoản Casama Cloud của bạn. Các không gian làm việc Cloud chỉ do mình bạn sở hữu sẽ bị xóa theo, và mô hình Casama Cloud sẽ ngừng chạy trên các máy chủ mà những không gian làm việc đó trả tiền. Gói bạn mua trên web sẽ tự động hủy. Gói mua trên App Store hoặc Google Play không tự hủy: hãy hủy tại cửa hàng đó.';
  }

  @override
  String cloudAccountDeleted(String date) {
    return 'Tài khoản Casama Cloud của bạn đã bị xóa. Dữ liệu sẽ bị xóa vĩnh viễn vào $date.';
  }

  @override
  String get wsMoveSettingsToCloud => 'Chuyển sang Casama Cloud';

  @override
  String get wsMoveSettingsToServer => 'Chuyển sang máy chủ của tôi';

  @override
  String get wsMoveSettingsHelp =>
      'Mang theo bot, cuộc trò chuyện, trí nhớ và tệp của không gian làm việc này sang máy chủ khác';

  @override
  String get wsMoveTitle => 'Chuyển không gian làm việc này';

  @override
  String get wsMoveIntro =>
      'Mọi thứ đều đi cùng: bot, cuộc trò chuyện, trí nhớ, quy trình, tệp và máy tính. Khi chuyển xong, bản sao này vẫn đọc được nhưng ngừng hoạt động.';

  @override
  String get wsMoveCloudOption => 'Chuyển sang Casama Cloud';

  @override
  String get wsMoveCloudOptionHelp =>
      'Đăng nhập bằng tài khoản Casama của bạn rồi chọn nơi chuyển đến.';

  @override
  String get wsMoveServerOption => 'Chuyển sang máy chủ của riêng tôi';

  @override
  String get wsMoveServerOptionHelp =>
      'Trên máy chủ đó, mở Cài đặt › Đưa không gian làm việc về đây rồi sao chép mã chuyển.';

  @override
  String get wsMoveInstallServer => 'Cài đặt Máy chủ Casama';

  @override
  String get wsMoveInstallServerHelp =>
      'Chưa có máy chủ? Hãy chạy một máy chủ trên máy tính này trước.';

  @override
  String get wsMoveReceiveOption => 'Đưa một không gian làm việc về đây';

  @override
  String get wsMoveReceiveOptionHelp =>
      'Lấy mã chuyển cho không gian làm việc này để dùng trên máy chủ đang chứa không gian làm việc kia.';

  @override
  String get wsMoveOwnerOnly =>
      'Chỉ chủ sở hữu không gian làm việc mới chuyển được.';

  @override
  String get wsMoveCloudPickTitle => 'Chuyển đi đâu?';

  @override
  String get wsMoveCloudNew => 'Một không gian làm việc mới';

  @override
  String wsMoveCloudNewHelp(String name) {
    return 'Bắt đầu trống trên Casama Cloud, đặt tên là $name.';
  }

  @override
  String get wsMoveCloudExistingHelp =>
      'Các mục được chuyển sẽ nằm cạnh dữ liệu sẵn có. Tên bị trùng sẽ thêm “(moved)”.';

  @override
  String get wsMoveServerTitle => 'Chuyển sang máy chủ của bạn';

  @override
  String get wsMoveServerAddress => 'Địa chỉ máy chủ';

  @override
  String get wsMoveServerCode => 'Mã chuyển';

  @override
  String get wsMoveCheckButton => 'Kiểm tra';

  @override
  String get wsMoveReceiveTitle => 'Đưa không gian làm việc về đây';

  @override
  String wsMoveReceiveBody(String time, String name) {
    return 'Trên máy chủ đang chứa không gian làm việc, mở Cài đặt › Chuyển sang máy chủ của tôi và nhập địa chỉ cùng mã này. Mã dùng một lần đến $time, đưa mọi thứ vào $name.';
  }

  @override
  String get wsMoveReceiveAddress => 'Địa chỉ máy chủ này';

  @override
  String get wsMoveReceiveCode => 'Mã chuyển';

  @override
  String get wsMoveCopy => 'Sao chép';

  @override
  String get wsMoveCopied => 'Đã sao chép';

  @override
  String get wsMoveCheckTitle => 'Sẵn sàng chuyển';

  @override
  String wsMoveCheckTo(String name) {
    return 'Đến $name';
  }

  @override
  String wsMoveCheckSize(String size, int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString phút',
      one: '1 phút',
    );
    return 'Cần sao chép $size, khoảng $_temp0';
  }

  @override
  String wsMoveCheckPause(int minutes) {
    final intl.NumberFormat minutesNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String minutesString = minutesNumberFormat.format(minutes);

    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutesString phút',
      one: '1 phút',
    );
    return 'Gần cuối quá trình, bot tạm dừng khoảng $_temp0 rồi tiếp tục hoạt động ở nơi mới.';
  }

  @override
  String get wsMoveCheckLongPause =>
      'Thời gian tạm dừng khá lâu. Hãy chọn lúc ít bận.';

  @override
  String get wsMoveCheckComes => 'Những gì được chuyển cùng';

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
      other: '$nString cuộc trò chuyện',
      one: '1 cuộc trò chuyện',
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
      other: '$nString trí nhớ',
      one: '1 trí nhớ',
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
      other: '$nString quy trình',
      one: '1 quy trình',
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
      other: '$nString tệp',
      one: '1 tệp',
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
      other: '$nString máy tính',
      one: '1 máy tính',
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
      other: '$nString người',
      one: '1 người',
    );
    return '$_temp0';
  }

  @override
  String get wsMoveCheckAfter => 'Những việc cần bạn sau khi chuyển';

  @override
  String wsMoveReconnect(String names) {
    return 'Đăng nhập lại các ứng dụng này tại nơi mới: $names';
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
      other: '$nString người sẽ nhận',
      one: '1 người sẽ nhận',
    );
    return '$_temp0 email mời';
  }

  @override
  String chatMovedAuthorInvited(String name) {
    return '$name (đã mời)';
  }

  @override
  String get wsMoveChatgptPlans =>
      'Gói ChatGPT sẽ ở lại. Hãy đăng nhập lại ChatGPT ở nơi mới.';

  @override
  String wsMoveComputersNote(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString máy tính khởi động',
      one: '1 máy tính khởi động',
    );
    return '$_temp0 mới tại nơi mới, kèm thư mục cá nhân được khôi phục.';
  }

  @override
  String get wsMoveResetNote =>
      'Phê duyệt, toàn quyền truy cập và quyền truy cập thiết bị bắt đầu lại từ mặc định của máy chủ mới.';

  @override
  String get wsMoveBringKeys => 'Mang theo khóa API của tôi';

  @override
  String wsMoveBringKeysHelp(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString khóa',
      one: '1 khóa',
    );
    return '$_temp0 được chuyển cùng, niêm phong để chỉ máy chủ mới đọc được.';
  }

  @override
  String get wsMoveNoKeysHelp =>
      'Bạn sẽ thêm lại khóa mô hình và ứng dụng chat tại nơi mới.';

  @override
  String get wsMoveDoesntFit =>
      'Không gian làm việc này vượt quá gói ở nơi mới';

  @override
  String wsMoveNeedsPlan(String plan) {
    return 'Gói $plan đáp ứng được. Hãy chọn gói này trên Casama Cloud rồi kiểm tra lại.';
  }

  @override
  String wsMoveOverLine(String what, String have, String limit) {
    return '$what: $have / $limit';
  }

  @override
  String get wsMoveOverPeople => 'Số người';

  @override
  String get wsMoveOverBots => 'Bot';

  @override
  String get wsMoveOverComputers => 'Máy tính';

  @override
  String get wsMoveOverStorage => 'Dung lượng';

  @override
  String get wsMoveUpdateSource =>
      'Hãy cập nhật máy chủ này trước. Bản hiện tại cũ hơn máy chủ đích.';

  @override
  String get wsMoveUpdateTarget => 'Máy chủ đích cần được cập nhật trước.';

  @override
  String get wsMoveStart => 'Bắt đầu chuyển';

  @override
  String get wsMoveCheckAgain => 'Kiểm tra lại';

  @override
  String get wsMoveProgressTitle => 'Đang chuyển';

  @override
  String get wsMoveStepStarting => 'Đang chuẩn bị';

  @override
  String get wsMoveStepCopying =>
      'Đang sao chép tệp trong khi mọi thứ vẫn chạy bình thường';

  @override
  String get wsMoveStepPausing =>
      'Đang tạm dừng bot để sao chép các thay đổi cuối';

  @override
  String get wsMoveStepFinishing =>
      'Đang gửi cuộc trò chuyện, trí nhớ và cài đặt';

  @override
  String get wsMoveStepImporting => 'Máy chủ mới đang tiếp nhận dữ liệu';

  @override
  String wsMoveProgressBytes(String done, String total) {
    return '$done / $total';
  }

  @override
  String get wsMoveProgressLeave =>
      'Bạn có thể đóng ứng dụng. Quá trình chuyển vẫn tiếp tục và bạn sẽ nhận thông báo khi xong.';

  @override
  String get wsMoveFailedTitle => 'Quá trình chuyển đã dừng';

  @override
  String get wsMoveFailedBody =>
      'Không có gì thay đổi ở đây: không gian làm việc này vẫn hoạt động bình thường.';

  @override
  String get wsMoveTryAgain => 'Thử lại';

  @override
  String get wsMoveNewCodeNeeded => 'Để thử lại, hãy lấy một mã chuyển mới.';

  @override
  String get wsMoveDoneTitle => 'Đã chuyển xong';

  @override
  String wsMoveDoneBody(String server) {
    return 'Mọi thứ đã sang tới $server.';
  }

  @override
  String get wsMoveDoneNeeds => 'Còn vài việc cần bạn tại nơi mới:';

  @override
  String get wsMoveOpenThere => 'Mở tại nơi mới';

  @override
  String wsMoveAfterReconnect(String name) {
    return 'Đăng nhập lại $name';
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
      other: 'Đã mời $nString người',
      one: 'Đã mời 1 người',
    );
    return '$_temp0 qua email';
  }

  @override
  String wsMoveAfterChatApp(String name) {
    return 'Kết nối lại $name';
  }

  @override
  String wsMoveAfterWebhook(String name) {
    return 'Cung cấp địa chỉ webhook mới cho bên gửi của $name';
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
      other: '$nString ngày',
      one: '1 ngày',
    );
    return 'Các webhook vẫn gửi tới đây sẽ được chuyển tiếp trong $_temp0.';
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
    return 'Kiểm tra phê duyệt cho $_temp0';
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
    return 'Kết nối mô hình Casama Cloud trong Cài đặt hoặc chọn mô hình khác cho $_temp0';
  }

  @override
  String get wsMoveAfterKeys => 'Thêm khóa mô hình của bạn tại đó';

  @override
  String wsMoveAfterRenamed(int n) {
    final intl.NumberFormat nNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String nString = nNumberFormat.format(n);

    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$nString mục đã được đổi tên',
      one: '1 mục đã được đổi tên',
    );
    return '$_temp0 thành “(moved)”';
  }

  @override
  String get wsMoveAfterReindex =>
      'Tìm kiếm trí nhớ sẽ đồng bộ xong sau vài phút.';

  @override
  String get wsMoveAfterNothing => 'Không cần làm gì thêm.';

  @override
  String get wsMoveSubTitle => 'Các gói đăng ký của bạn';

  @override
  String get wsMoveSubToCloud =>
      'Bot trên Casama Cloud chạy bằng gói Cloud của bạn. Nếu đã mua giấy phép doanh nghiệp cho máy chủ này, hãy hủy khi không còn cần đến.';

  @override
  String get wsMoveSubFromCloud =>
      'Gói Casama Cloud của bạn vẫn tiếp tục gia hạn. Hãy hủy khi bạn đã ổn định trên máy chủ riêng.';

  @override
  String get wsMoveSubManage => 'Quản lý gói';

  @override
  String get wsMovedTitle => 'Không gian làm việc này đã được chuyển';

  @override
  String get wsMovedBodyCloud =>
      'Dữ liệu hiện ở trên Casama Cloud. Đăng nhập ở đó để tiếp tục. Bản sao này ở chế độ chỉ đọc.';

  @override
  String wsMovedBodyServer(String host) {
    return 'Dữ liệu hiện ở trên $host. Đăng nhập ở đó để tiếp tục. Bản sao này ở chế độ chỉ đọc.';
  }

  @override
  String get wsMovedSignInCloud => 'Đăng nhập Casama Cloud';

  @override
  String wsMovedOpenServer(String host) {
    return 'Mở $host';
  }

  @override
  String get wsMovedViewOld => 'Xem bản sao cũ';

  @override
  String get languageDevice => 'Ngôn ngữ thiết bị';

  @override
  String get shortcutQuickAsk => 'Hỏi nhanh';

  @override
  String shortcutAskBot(String name) {
    return 'Hỏi $name';
  }

  @override
  String shortcutRunRoutine(String name) {
    return 'Chạy $name';
  }

  @override
  String get settingsWordsWorkspace =>
      'không gian làm việc chuyển đổi đội nhóm tổ chức vai trò workspace switch change team organization org role';

  @override
  String get settingsWordsAboutYou =>
      'hồ sơ tên ảnh đại diện đại từ nhân xưng về tôi phong cách trả lời thông tin trí nhớ profile name photo picture avatar pronouns about me reply style facts memory';

  @override
  String get settingsWordsPeople =>
      'thành viên mời nhóm người dùng quản trị vai trò liên kết mời mã tham gia gỡ members invite team users admins roles invite link code join remove';

  @override
  String get settingsWordsWorkspaceSettings =>
      'không gian làm việc tên biểu tượng logo mã hóa trí nhớ thanh toán stripe thẻ trình quản lý mật khẩu bot với bot tiện ích chrome kho mẫu toàn quyền truy cập quyền phê duyệt hỏi bỏ qua workspace name icon logo encryption memory payments stripe card password managers chrome extension gallery full access permissions approvals ask bypass';

  @override
  String get settingsWordsSettingsDomains =>
      'tên miền trang web tùy chỉnh dns mua kết nối domain website custom dns buy connect sites';

  @override
  String get settingsWordsUsage =>
      'chi phí chi tiêu tiền tín dụng token giới hạn cost spend spending money credits tokens limits';

  @override
  String get settingsWordsBilling =>
      'gói đăng ký nâng cấp pro plus max thanh toán hóa đơn thẻ giá plan subscription upgrade pro plus max payment invoice card pricing';

  @override
  String get settingsWordsInviteFriends =>
      'giới thiệu tín dụng phần thưởng chia sẻ referral credit reward share';

  @override
  String get settingsWordsAdminConsole =>
      'bảng điều khiển quản trị admin console';

  @override
  String get settingsWordsAppearance =>
      'chủ đề chế độ tối chế độ sáng ban đêm màu sắc phông chữ cỡ chữ hình nền diện mạo kiểu hiệu ứng chuyển động theme dark mode light mode night colors font text size background wallpaper look style effects motion animations xúc giác rung phản hồi bàn di chuột haptics vibration trackpad';

  @override
  String get settingsWordsQuietHours =>
      'không làm phiền dnd ngủ tắt tiếng thông báo lịch trình do not disturb dnd sleep mute silence notifications schedule';

  @override
  String get settingsWordsPushPrefsTitle =>
      'thông báo đẩy cảnh báo trả lời âm thanh notifications push alerts replies sounds';

  @override
  String get settingsWordsCallFullScreenTitle =>
      'cuộc gọi điện thoại đổ chuông màn hình khóa toàn màn hình gọi đến trả lời calls phone ring ringing lock screen full screen incoming answer';

  @override
  String get settingsWordsEmailTips =>
      'email bản tin mẹo tin tức hủy đăng ký email newsletter tips news unsubscribe';

  @override
  String get settingsWordsGalleryDigestEmails =>
      'email kho mẫu gợi ý chọn lọc hằng tháng email gallery digest monthly picks';

  @override
  String get settingsWordsNewsletterTitle =>
      'email bản tin hằng tháng cập nhật đăng ký hủy đăng ký email newsletter monthly news updates subscribe unsubscribe';

  @override
  String get settingsWordsWakeWord =>
      'giọng nói rảnh tay micrô nghe voice hey hands free microphone mic listen';

  @override
  String get settingsWordsShowBotSteps =>
      'bước công cụ chi tiết tiến độ steps tools details progress';

  @override
  String get settingsWordsShowReplyUsage =>
      'chi phí token giá mức sử dụng mỗi câu trả lời cost tokens price usage per reply';

  @override
  String get settingsWordsCheckForUpdates =>
      'cập nhật phiên bản nâng cấp tải xuống tự động update updates version upgrade download automatic';

  @override
  String get settingsWordsOpenAtLogin =>
      'khởi động mở khi đăng nhập tự động chạy startup launch login boot start automatically';

  @override
  String get settingsWordsIslandStartElsewhere =>
      'hoạt động trực tiếp dynamic island màn hình khóa thiết bị khác live activity dynamic island lock screen other devices';

  @override
  String get settingsWordsShowBotsInNotch =>
      'phần khuyết thanh menu dynamic island notch menu bar dynamic island';

  @override
  String get settingsWordsNotchOnHover =>
      'phần khuyết di chuột notch hover mouse';

  @override
  String get settingsWordsLanguage =>
      'ngôn ngữ bản dịch tiếng việt tiếng anh language locale english translation';

  @override
  String get settingsWordsIntegrations =>
      'ứng dụng kết nối gmail google slack lịch plugin công cụ mcp apps connect connections gmail google slack calendar plugins tools mcp';

  @override
  String get settingsWordsSkills =>
      'kỹ năng danh mục khả năng hướng dẫn skills catalog abilities instructions';

  @override
  String get settingsWordsCasamaLink =>
      'truy cập từ xa địa chỉ đường hầm tự lưu trữ điện thoại remote access address tunnel self host phone';

  @override
  String get settingsWordsServiceKeys =>
      'khóa api tìm kiếm bản đồ dữ liệu api keys search maps data';

  @override
  String get settingsWordsModelsTitle =>
      'khóa api openai anthropic openrouter gemini mô hình nhà cung cấp ollama mô hình cục bộ api keys openai anthropic openrouter gemini models providers ollama local models';

  @override
  String get settingsWordsModelKeys =>
      'khóa api openai anthropic openrouter gemini mô hình nhà cung cấp ollama mô hình cục bộ api keys openai anthropic openrouter gemini models providers ollama local models';

  @override
  String get settingsWordsAccount =>
      'email đổi email mật khẩu đăng xuất mọi nơi đăng nhập email change email password sign out everywhere login';

  @override
  String get settingsWordsTwoStepSignIn =>
      '2fa mfa hai yếu tố xác thực totp otp mã bảo mật two factor authenticator security code';

  @override
  String get settingsWordsPairDevice =>
      'mã qr quét đăng nhập ghép nối điện thoại thiết bị khác qr code scan sign in pair phone another device';

  @override
  String get settingsWordsPasskeys =>
      'khóa truy cập passkey face id touch id vân tay sinh trắc học fingerprint biometric';

  @override
  String get settingsWordsWidgetsTitle =>
      'tiện ích màn hình chính màn hình khóa trung tâm điều khiển ghim lối tắt widgets home screen lock screen controls control center glance pin shortcut';

  @override
  String get settingsWordsCardsSettingsTitle =>
      'thẻ thời tiết đơn vị độ c độ f thành phố chính vị trí tiền tệ chứng khoán đỏ xanh nguồn dữ liệu cards weather units celsius fahrenheit home city location currency stocks red green data sources';

  @override
  String get settingsWordsAppLock =>
      'khóa ứng dụng pin mật mã face id touch id vân tay sinh trắc học windows hello ảnh chụp màn hình quyền riêng tư app lock pin passcode fingerprint biometric windows hello screenshots privacy lock screen';

  @override
  String get settingsWordsPrivacy =>
      'dữ liệu xuất tải xuống xóa tài khoản phân tích theo dõi lịch sử lưu giữ người bị chặn data export download delete account analytics tracking history retention blocked people block';

  @override
  String get settingsWordsSecrets =>
      'bí mật mật khẩu thông tin đăng nhập két biến môi trường secrets passwords credentials vault environment variables';

  @override
  String get settingsWordsComputers =>
      'máy tính máy docker hộp cát màn hình desktop computers machines docker sandbox';

  @override
  String get settingsWordsDeviceConnections =>
      'thiết bị vị trí sức khỏe địa điểm thư mục ứng dụng theo dõi trình duyệt tiện ích chrome quyền điện thoại devices location health places folders watched apps browsers chrome extension phone permissions';

  @override
  String get settingsWordsUseThisComputer =>
      'máy tính này mac tệp cục bộ companion this computer local files';

  @override
  String get settingsWordsHelpAndSupport =>
      'trợ giúp hỗ trợ liên hệ phiếu việc báo lỗi phản hồi tài liệu cộng đồng github sao mã nguồn mở discord bảng ý tưởng trạng thái help support contact ticket bug report feedback docs community github star open source discord ideas board status';

  @override
  String get settingsWordsSignOut => 'đăng xuất thoát log out logout sign out';

  @override
  String get notifDoIt => 'Làm đi';

  @override
  String get notifNotNow => 'Để sau';

  @override
  String get notifAllow => 'Cho phép';

  @override
  String get notifDeny => 'Từ chối';

  @override
  String get notifApprove => 'Phê duyệt';

  @override
  String get notifReview => 'Xem xét';

  @override
  String get notifReply => 'Trả lời';

  @override
  String get notifSend => 'Gửi';

  @override
  String get notifReplyPlaceholder => 'Trả lời…';

  @override
  String get notifChannelReplies => 'Câu trả lời';

  @override
  String get notifChannelRepliesDescription => 'Bot đã trả lời câu hỏi của bạn';

  @override
  String get notifChannelNeedsYou => 'Cần bạn';

  @override
  String get notifChannelNeedsYouDescription =>
      'Phê duyệt, mật khẩu và yêu cầu tiếp quản mà bot đang chờ';

  @override
  String get notifChannelRoutines => 'Quy trình và tóm tắt';

  @override
  String get notifChannelRoutinesDescription =>
      'Kết quả quy trình và bản tóm tắt buổi sáng';

  @override
  String get notifChannelSuggestions => 'Gợi ý';

  @override
  String get notifChannelSuggestionsDescription =>
      'Những việc bot đề xuất làm giúp bạn';

  @override
  String get notifChannelAccount => 'Tài khoản';

  @override
  String get notifChannelAccountDescription =>
      'Tín dụng, dự án và máy chủ của bạn';

  @override
  String get notifCallChannel => 'Cuộc gọi';

  @override
  String get notifCallLive => 'Đang trong cuộc gọi';

  @override
  String get notifCallMuted => 'Đã tắt tiếng';

  @override
  String get notifCallReconnecting => 'Đang kết nối lại';

  @override
  String get notifCallMute => 'Tắt tiếng';

  @override
  String get notifCallUnmute => 'Bật tiếng';

  @override
  String get notifCallEnd => 'Kết thúc cuộc gọi';

  @override
  String get notifFromYourWatch => 'Từ đồng hồ của bạn';

  @override
  String get notifLiveOpen => 'Mở';

  @override
  String get notifLiveStop => 'Dừng';

  @override
  String get notifLiveReview => 'Xem xét';

  @override
  String get notifLiveAllow => 'Cho phép';

  @override
  String get notifLiveDeny => 'Từ chối';

  @override
  String get notifLiveNeedsOk => 'Cần bạn đồng ý';

  @override
  String get notifLiveNeedsYou => 'Cần bạn';

  @override
  String get notifLiveWorking => 'Đang làm';

  @override
  String get notifLiveTakeOver => 'Muốn bạn tiếp quản';

  @override
  String get notifLiveFinished => 'Đã xong';

  @override
  String get notifLiveProblem => 'Dừng do sự cố';

  @override
  String get notifLiveBotWorking => 'Một bot đang làm việc';

  @override
  String get notifLiveBotsAtWork => 'Bot đang làm việc';

  @override
  String get notifLiveStepOne => '1 bước';

  @override
  String notifLiveSteps(int count) {
    return '$count bước';
  }

  @override
  String get notifAlarmTitle => 'Báo thức Casama';

  @override
  String get notifAlarmStop => 'Dừng';

  @override
  String get widgetIosNeedsYouDescription =>
      'Xem những bot nào đang chờ bạn và xử lý nhanh các yêu cầu đơn giản.';

  @override
  String get widgetIosBotDescription =>
      'Theo dõi việc một bot của bạn đang làm.';

  @override
  String get widgetIosAskDescription =>
      'Hỏi bot hoặc bắt đầu cuộc gọi chỉ với một chạm, kèm gợi ý dùng thử.';

  @override
  String get widgetIosRoutinesDescription =>
      'Xem quy trình sắp chạy và chạy ngay một quy trình.';

  @override
  String get widgetIosTodayDescription =>
      'Xem trọn vẹn ngày của bạn ở một nơi: việc cần bạn, lịch chạy tiếp theo và tín dụng.';

  @override
  String get widgetIosBriefDescription =>
      'Đọc bản tin bot gửi cho bạn sáng nay.';

  @override
  String get widgetIosLibraryDescription => 'Mở những gì bot vừa tạo gần đây.';

  @override
  String get widgetIosTasksDescription =>
      'Xem tình hình bảng công việc, ưu tiên việc đang chờ bạn.';

  @override
  String get widgetIosCreditsDescription =>
      'Kiểm tra lượng tín dụng bạn đã dùng.';

  @override
  String get widgetIosInlineDescription =>
      'Xem một việc quan trọng nhất ngay phía trên đồng hồ.';

  @override
  String get widgetIosCanvasDescription =>
      'Hiển thị nội dung bot đặt lên đây: câu trích dẫn, đếm ngược, chuỗi ngày, danh sách hoặc hình ảnh.';

  @override
  String get widgetMacNeedsYouDescription => 'Xem những bot nào đang chờ bạn.';

  @override
  String get widgetMacRoutinesDescription => 'Xem quy trình sắp chạy.';

  @override
  String get widgetAskCasama => 'Hỏi Casama';

  @override
  String get widgetControlAskDescription =>
      'Mở nhanh ô Hỏi nhanh kèm bàn phím.';

  @override
  String get widgetTalkToBot => 'Nói chuyện với bot';

  @override
  String widgetTalkToName(String name) {
    return 'Nói chuyện với $name';
  }

  @override
  String get widgetControlTalkDescription =>
      'Bắt đầu cuộc gọi với bot bạn chọn.';

  @override
  String get widgetRunRoutine => 'Chạy quy trình';

  @override
  String get widgetControlRunDescription =>
      'Chạy quy trình bạn chọn mà không cần mở Casama.';

  @override
  String widgetFallbackAskBot(String bot) {
    return 'Hỏi $bot bất cứ điều gì';
  }

  @override
  String get widgetFallbackBrief => 'Tóm tắt buổi sáng';

  @override
  String widgetFallbackFinished(String bot, String title) {
    return '$bot đã xong $title';
  }

  @override
  String widgetFallbackAsOf(String time) {
    return 'Tính đến $time';
  }

  @override
  String get widgetFallbackNothingNext => 'Chưa có lịch hẹn nào';

  @override
  String widgetFallbackWantsTakeOver(String bot) {
    return '$bot muốn bạn tiếp quản';
  }

  @override
  String get widgetFallbackDay => 'ngày';

  @override
  String get widgetFallbackDays => 'ngày';

  @override
  String get widgetSampleVerse =>
      'Hãy yên lặng và biết rằng Ta là Đức Chúa Trời.';

  @override
  String get widgetSampleVerseRef => 'Thi 46:10';

  @override
  String get widgetSampleVerseShort =>
      'Hãy yên lặng và biết rằng Ta là Đức Chúa Trời. · Thi 46:10';

  @override
  String get widgetSampleVerseTiny => 'Hãy yên lặng và biết…';

  @override
  String get widgetSampleCanvasName => 'Câu châm ngôn hằng ngày';

  @override
  String get widgetSampleNeedFlights => 'Tra cứu chuyến bay đi Lisbon';

  @override
  String get widgetSampleNeedDentist => 'Dời lịch nha khoa sang thứ Sáu nhé?';

  @override
  String get widgetSampleBotText =>
      'Có ba email cần trả lời, và hóa đơn Acme đã quá hạn hai ngày.';

  @override
  String get widgetSampleStep => 'Đang đọc Hộp thư đến của bạn';

  @override
  String get widgetSampleRoutineInbox => 'Dọn Hộp thư đến';

  @override
  String get widgetSampleRoutineBrief => 'Tóm tắt buổi sáng';

  @override
  String get widgetSampleRoutineWeekly => 'Báo cáo hằng tuần';

  @override
  String get widgetSampleWeekdays => 'Ngày trong tuần';

  @override
  String get widgetSampleEveryDay => 'Mỗi ngày';

  @override
  String get widgetSampleFridays => 'Thứ Sáu lúc 16:00';

  @override
  String get widgetSampleBrief =>
      'Có ba email cần trả lời, và hóa đơn Acme đã quá hạn hai ngày. Trời mưa từ 15:00 nên hãy đi sớm đón lúc 16:30. Cuộc họp đầu tiên của bạn lúc 10:00 với Dana.';

  @override
  String get widgetSamplePricing => 'Trang bảng giá quý 4';

  @override
  String get widgetSampleLogoIdeas => 'Ý tưởng logo';

  @override
  String get widgetSampleTripPlan => 'Kế hoạch chuyến đi';

  @override
  String get widgetSampleLaunchPost => 'Soạn bài đăng ra mắt';

  @override
  String get widgetSampleStarterInbox => 'Tóm tắt Hộp thư đến của tôi';

  @override
  String get widgetSampleStarterFriday => 'Lập kế hoạch thứ Sáu giúp tôi';

  @override
  String get widgetSampleWorking => 'Đang làm · 2:14';

  @override
  String get widgetSampleCreditsLeft => 'Còn 5,70 US\$';

  @override
  String get widgetSampleSpentToday => '0,80 US\$ hôm nay';

  @override
  String get widgetSampleMorning =>
      'Chào buổi sáng. Hôm nay có hai cuộc họp, đầu tiên lúc 10:00 với đội thiết kế. Sau 15:00 có mưa nên nhớ mang áo khoác. Chuyến bay đi Lisbon của bạn đã được xác nhận cho thứ Sáu.';

  @override
  String get widgetSampleLisbonPlan => 'Kế hoạch đi Lisbon';

  @override
  String get widgetSampleAgo => 'Milo · 2 giờ trước';

  @override
  String get widgetSampleLaunchEmail => 'Soạn email ra mắt';

  @override
  String get widgetSampleInReviewBy => 'Đang duyệt · Ada';

  @override
  String get widgetSampleNeedAndroid =>
      'Milo muốn tìm giá vé máy bay đi Lisbon';

  @override
  String get widgetSampleUpNextAt => 'Tiếp theo · 9:00';

  @override
  String get widgetSampleInMinutes => 'Ada · sau 18 phút';

  @override
  String get widgetSampleDate => 'Thứ Tư, ngày 18 tháng 11';

  @override
  String get widgetSampleNeedsCount => 'Cần bạn · 1';

  @override
  String get widgetSampleSearchFlights => 'Tìm giá vé máy bay đi Lisbon';

  @override
  String get widgetSampleAskAda => 'Hỏi Ada';

  @override
  String get widgetSampleAskMilo => 'Hỏi Milo';

  @override
  String get widgetSamplePlanDay => '☀️ Lập kế hoạch ngày hôm nay';

  @override
  String get widgetSampleWhatsNew => '✉️ Có gì mới trong Hộp thư đến?';

  @override
  String get widgetAndroidBotDescription =>
      'Theo dõi việc một bot đang làm ngay lúc này';

  @override
  String get widgetAndroidTodayDescription =>
      'Giữ trọn ngày của bạn cùng các bot tại một địa điểm duy nhất';

  @override
  String get widgetAndroidBriefDescription => 'Đọc nhanh bản tóm tắt buổi sáng';

  @override
  String get widgetAndroidLibraryDescription =>
      'Mở những gì bot vừa tạo gần đây';

  @override
  String get widgetAndroidTasksDescription => 'Theo dõi tiến độ bảng công việc';

  @override
  String get widgetAndroidCreditsDescription =>
      'Kiểm tra lượng tín dụng đã dùng';

  @override
  String get widgetAndroidCanvasDescription =>
      'Hiển thị nội dung bot đặt lên đây, từ câu trích dẫn đến bộ đếm ngược';

  @override
  String get widgetConfigBotTitle => 'Chọn một bot';

  @override
  String get widgetConfigRoutinesTitle => 'Chọn quy trình';

  @override
  String get widgetConfigRoutinesHint =>
      'Chọn tối đa bốn quy trình bạn thường tự chạy';

  @override
  String get widgetConfigAutomatic => 'Tự động';

  @override
  String get widgetConfigAutomaticHint =>
      'Các lượt chạy sắp tới trên toàn bộ bot';

  @override
  String get widgetConfigDone => 'Xong';

  @override
  String get widgetConfigSignedOutTitle => 'Chưa có gì để chọn';

  @override
  String get widgetConfigSignedOut =>
      'Mở Casama và đăng nhập, rồi quay lại đây chọn.';

  @override
  String get widgetConfigCanvasTitle => 'Chọn canvas';

  @override
  String get widgetConfigCanvasAutomaticHint =>
      'Canvas được bot cập nhật gần nhất';

  @override
  String get widgetConfigCanvasNone =>
      'Chưa có canvas nào. Hãy bảo bot đặt nội dung lên đây.';

  @override
  String get iosUsageTracking =>
      'Nếu bạn cho phép, Casama sẽ thông báo cho Meta khi bạn cài đặt, tham gia hoặc đăng ký trả phí sau khi xem quảng cáo Casama trên Facebook hay Instagram để chúng tôi đo lường hiệu quả quảng cáo. Casama không bao giờ hiển thị quảng cáo và không chia sẻ cuộc trò chuyện hay tệp của bạn.';

  @override
  String get iosUsageContacts =>
      'Bot của bạn chỉ có thể tra cứu người quen của bạn khi bạn bật Danh bạ trong Kết nối thiết bị.';

  @override
  String get iosUsagePhotoLibrary =>
      'Casama mở Thư viện ảnh của bạn khi bạn chọn ảnh để gửi cho bot hoặc đặt ảnh hồ sơ.';

  @override
  String get iosUsageLocationAlways =>
      'Báo cho bot biết khi bạn đến hoặc rời khỏi các địa điểm đã đặt tên, ngay cả khi Casama đã đóng. Chỉ tên địa điểm và thời gian được chia sẻ, không bao giờ gửi lộ trình của bạn.';

  @override
  String get iosUsageLocationWhenInUse =>
      'Lưu các địa điểm bạn đặt tên, như Nhà hay Nơi làm việc, và để bot nhắc bạn lúc nên xuất phát để kịp lịch hẹn tiếp theo. Chỉ dùng khi bạn bật Địa điểm trong Kết nối thiết bị.';

  @override
  String get iosUsageCamera =>
      'Casama dùng camera khi bạn chụp ảnh gửi cho bot hoặc đặt ảnh hồ sơ.';

  @override
  String get iosUsageCalendars =>
      'Bot của bạn chỉ có thể trả lời câu hỏi về lịch trình và thêm sự kiện khi bạn bật Lịch trong Kết nối thiết bị.';

  @override
  String get iosUsageSpeech =>
      'Khi không kết nối được dịch vụ đọc chính tả của Casama, tính năng nhận dạng giọng nói ngay trên thiết bị sẽ chuyển lời nói của bạn thành văn bản.';

  @override
  String get iosUsageAlarmKit =>
      'Bot chỉ đặt được báo thức và hẹn giờ đổ chuông cả ở chế độ im lặng khi bạn cho phép Báo thức trong Kết nối thiết bị.';

  @override
  String get iosUsageHomeKit =>
      'Bot của bạn có thể kiểm tra và điều khiển nhà HomeKit khi bạn cho phép Nhà trong Kết nối thiết bị; mọi thay đổi luôn hỏi phê duyệt trước.';

  @override
  String get iosUsageMicrophone =>
      'Casama dùng micrô cho đọc chính tả và gọi trực tiếp với bot. Chỉ sau khi bạn đồng ý, giọng nói mới được gửi tới các nhà cung cấp AI để phản hồi bạn: Google Gemini cho cuộc gọi, OpenAI để chuyển lời đọc chính tả thành văn bản.';

  @override
  String get iosUsageHealthUpdate =>
      'Casama chỉ đọc dữ liệu Apple Health và không bao giờ ghi vào đó.';

  @override
  String get iosUsageFaceId =>
      'Casama dùng Face ID để mở khóa ứng dụng khi bạn bật khóa ứng dụng và để xác nhận các thao tác rủi ro.';

  @override
  String get iosUsageHealthShare =>
      'Bot của bạn chỉ có thể xem tóm tắt hằng ngày về giấc ngủ, vận động, tập luyện và nhịp tim từ Apple Health khi bạn bật Apple Health trong Kết nối thiết bị. Casama không bao giờ ghi vào Apple Health và không dùng dữ liệu này cho quảng cáo.';

  @override
  String get iosUsageWatchMicrophone =>
      'Casama ghi âm giọng nói khi bạn hỏi bot điều gì đó và gửi tới máy chủ Casama của bạn, nơi nhà cung cấp AI (OpenAI, trên Casama Cloud) chuyển thành văn bản cho bot.';

  @override
  String get macUsageContacts =>
      'Bot của bạn chỉ có thể tra cứu người quen của bạn khi bạn bật Danh bạ trong Kết nối thiết bị.';

  @override
  String get macUsageSpeech =>
      'Khi không kết nối được dịch vụ đọc chính tả của Casama, tính năng nhận dạng giọng nói ngay trên thiết bị sẽ chuyển lời nói của bạn thành văn bản.';

  @override
  String get macUsageMicrophone =>
      'Casama dùng micrô cho đọc chính tả và gọi trực tiếp với bot. Chỉ sau khi bạn đồng ý, giọng nói mới được gửi tới các nhà cung cấp AI để phản hồi bạn: Google Gemini cho cuộc gọi, OpenAI để chuyển lời đọc chính tả thành văn bản.';

  @override
  String get macUsageAppleEvents =>
      'Hỏi nhanh chỉ đọc tiêu đề cửa sổ phía trước và tab hiện tại của trình duyệt khi bạn nhấn phím tắt.';

  @override
  String get nativeNameFileProvider => 'Máy tính Casama';

  @override
  String get nativeNameNotifications => 'Thông báo Casama';

  @override
  String get nativeNameSafari => 'Casama cho Safari';

  @override
  String get nativeNameAskCasama => 'Hỏi Casama';

  @override
  String get nativeComputer => 'Máy tính';

  @override
  String get nativeSafariSignInIos =>
      'Mở Casama trên thiết bị này -> Cài đặt -> Đăng nhập trên thiết bị khác, hoặc dán liên kết đăng nhập bên dưới.';

  @override
  String get nativeSafariSignInMac =>
      'Mở Casama trên máy Mac này -> Cài đặt -> Đăng nhập trên thiết bị khác, hoặc dán liên kết đăng nhập bên dưới.';

  @override
  String get linuxDesktopComment =>
      'Những bot làm việc cho bạn trên mọi màn hình';

  @override
  String get linuxDesktopKeywords =>
      'AI;trợ lý;tác nhân;bot;trò chuyện;assistant;agent;chat;';

  @override
  String macMenuAbout(String appName) {
    return 'Giới thiệu về $appName';
  }

  @override
  String get macMenuPreferences => 'Tùy chọn…';

  @override
  String get macMenuServices => 'Dịch vụ';

  @override
  String macMenuHide(String appName) {
    return 'Ẩn $appName';
  }

  @override
  String get macMenuHideOthers => 'Ẩn các mục khác';

  @override
  String get macMenuShowAll => 'Hiển thị tất cả';

  @override
  String macMenuQuit(String appName) {
    return 'Thoát $appName';
  }

  @override
  String get macMenuEdit => 'Sửa';

  @override
  String get macMenuUndo => 'Hoàn tác';

  @override
  String get macMenuRedo => 'Làm lại';

  @override
  String get macMenuCut => 'Cắt';

  @override
  String get macMenuCopy => 'Sao chép';

  @override
  String get macMenuPaste => 'Dán';

  @override
  String get macMenuPasteAndMatchStyle => 'Dán và khớp kiểu';

  @override
  String get macMenuDelete => 'Xóa';

  @override
  String get macMenuSelectAll => 'Chọn tất cả';

  @override
  String get macMenuFind => 'Tìm';

  @override
  String get macMenuFindEllipsis => 'Tìm…';

  @override
  String get macMenuFindAndReplace => 'Tìm và thay thế…';

  @override
  String get macMenuFindNext => 'Tìm mục tiếp theo';

  @override
  String get macMenuFindPrevious => 'Tìm mục trước';

  @override
  String get macMenuUseSelectionForFind => 'Sử dụng lựa chọn để tìm';

  @override
  String get macMenuJumpToSelection => 'Chuyển tới lựa chọn';

  @override
  String get macMenuSpellingAndGrammar => 'Chính tả và ngữ pháp';

  @override
  String get macMenuSpelling => 'Chính tả';

  @override
  String get macMenuShowSpelling => 'Hiển thị chính tả và ngữ pháp';

  @override
  String get macMenuCheckDocumentNow => 'Kiểm tra tài liệu bây giờ';

  @override
  String get macMenuCheckSpellingWhileTyping => 'Kiểm tra chính tả khi nhập';

  @override
  String get macMenuCheckGrammar => 'Kiểm tra ngữ pháp và chính tả';

  @override
  String get macMenuCorrectSpelling => 'Sửa chính tả tự động';

  @override
  String get macMenuSubstitutions => 'Thay thế';

  @override
  String get macMenuShowSubstitutions => 'Hiển thị phương án thay thế';

  @override
  String get macMenuSmartCopyPaste => 'Sao chép/Dán thông minh';

  @override
  String get macMenuSmartQuotes => 'Trích dẫn thông minh';

  @override
  String get macMenuSmartDashes => 'Gạch ngang thông minh';

  @override
  String get macMenuSmartLinks => 'Liên kết thông minh';

  @override
  String get macMenuDataDetectors => 'Bộ dò tìm dữ liệu';

  @override
  String get macMenuTextReplacement => 'Thay thế văn bản';

  @override
  String get macMenuTransformations => 'Biến đổi';

  @override
  String get macMenuMakeUpperCase => 'Viết hoa';

  @override
  String get macMenuMakeLowerCase => 'Viết thường';

  @override
  String get macMenuCapitalize => 'Viết hoa chữ cái đầu';

  @override
  String get macMenuSpeech => 'Đọc văn bản';

  @override
  String get macMenuStartSpeaking => 'Bắt đầu nói';

  @override
  String get macMenuStopSpeaking => 'Dừng nói';

  @override
  String get macMenuView => 'Xem';

  @override
  String get macMenuEnterFullScreen => 'Chuyển sang toàn màn hình';

  @override
  String get macMenuWindow => 'Cửa sổ';

  @override
  String get macMenuMinimize => 'Thu nhỏ';

  @override
  String get macMenuZoom => 'Thu phóng';

  @override
  String get macMenuBringAllToFront => 'Đưa tất cả lên Phía trước';

  @override
  String get macMenuHelp => 'Trợ giúp';

  @override
  String get macMenuCheckForUpdates => 'Kiểm tra bản cập nhật…';

  @override
  String get macMenuSettings => 'Cài đặt…';

  @override
  String get macMenuFile => 'Tệp';

  @override
  String get macMenuNewChat => 'Trò chuyện mới';

  @override
  String get macMenuNewBot => 'Bot mới…';

  @override
  String get macMenuQuickAsk => 'Hỏi nhanh';

  @override
  String get macMenuSearch => 'Tìm kiếm…';

  @override
  String get macMenuCloseWindow => 'Đóng cửa sổ';

  @override
  String get macMenuGo => 'Đi tới';

  @override
  String get macMenuBots => 'Bot';

  @override
  String get macMenuInbox => 'Hộp thư đến';

  @override
  String get macMenuBoard => 'Bảng việc';

  @override
  String get macMenuComputer => 'Máy tính';

  @override
  String get macMenuPages => 'Trang';

  @override
  String get macMenuCasamaHelp => 'Trợ giúp Casama';

  @override
  String get macMenuSendFeedback => 'Gửi phản hồi…';

  @override
  String get siriBot => 'Bot';

  @override
  String get siriRoutine => 'Quy trình';

  @override
  String get siriRoutines => 'Quy trình';

  @override
  String get siriCanvas => 'Canvas';

  @override
  String get siriAutomatic => 'Tự động';

  @override
  String get siriAutomaticSubtitle => 'Nội dung bot đặt gần nhất';

  @override
  String get siriChooseCanvas => 'Chọn canvas';

  @override
  String get siriChooseCanvasDescription =>
      'Hiện nội dung bot đặt gần nhất hoặc một canvas cố định.';

  @override
  String get siriChooseBot => 'Chọn một bot';

  @override
  String get siriChooseBotDescription => 'Chọn bot mà tiện ích này hiển thị.';

  @override
  String get siriChooseRoutines => 'Chọn quy trình';

  @override
  String get siriChooseRoutinesDescription =>
      'Hiện các lượt chạy sắp tới hoặc tối đa bốn quy trình bạn chọn.';

  @override
  String get siriOpenCasama => 'Mở Casama';

  @override
  String get siriWhere => 'Nơi mở';

  @override
  String get siriTalkToBot => 'Nói chuyện với bot';

  @override
  String get siriTalkToBotDescription => 'Bắt đầu cuộc gọi với bot bạn chọn.';

  @override
  String get siriRunRoutine => 'Chạy quy trình';

  @override
  String get siriRunRoutineControlDescription =>
      'Chạy quy trình bạn chọn mà không cần mở Casama.';

  @override
  String get siriCallAction => 'Thao tác cuộc gọi';

  @override
  String get siriAction => 'Thao tác';

  @override
  String get siriStopBot => 'Dừng bot';

  @override
  String get siriRun => 'Chạy';

  @override
  String get siriAnswerRequest => 'Trả lời yêu cầu của bot';

  @override
  String get siriRequest => 'Yêu cầu';

  @override
  String get siriAllow => 'Cho phép';

  @override
  String get siriFromWidget => 'Từ tiện ích';

  @override
  String get siriRunRoutineNow => 'Chạy quy trình ngay';

  @override
  String get siriAcceptSuggestion => 'Làm theo gợi ý của bot';

  @override
  String get siriSuggestion => 'Gợi ý';

  @override
  String get siriBotStatusDescription => 'Trạng thái và việc bot đang làm';

  @override
  String get siriNextRoutineDescription =>
      'Quy trình tiếp theo và thời điểm chạy';

  @override
  String get siriAskCasama => 'Hỏi Casama';

  @override
  String get siriAskVoiceDescription => 'Hỏi bot điều gì đó bằng giọng nói';

  @override
  String get siriWhatWaiting => 'Những gì đang chờ bạn đồng ý';

  @override
  String get siriAsk => 'Hỏi';

  @override
  String get siriShortNeedsYou => 'Cần bạn';

  @override
  String get siriOpeningToFinish => 'Đang mở Casama để hoàn tất.';

  @override
  String get siriName => 'Tên';

  @override
  String get siriTitle => 'Tiêu đề';

  @override
  String get siriChat => 'Trò chuyện';

  @override
  String get siriBotSubtitle =>
      'Một bot trong Casama, trợ lý AI để bạn trò chuyện cùng';

  @override
  String siriRoutineSubtitle(String bot) {
    return 'Quy trình do $bot chạy trong Casama';
  }

  @override
  String siriChatSubtitle(String bot) {
    return 'Cuộc trò chuyện với $bot trong Casama';
  }

  @override
  String get siriBotInCasama => 'Bot trong Casama';

  @override
  String siriRoutineDot(String bot) {
    return 'Quy trình · $bot';
  }

  @override
  String siriChatWith(String bot) {
    return 'Trò chuyện với $bot';
  }

  @override
  String get siriKeywordBot => 'bot';

  @override
  String get siriKeywordRoutine => 'quy trình';

  @override
  String get siriKeywordChat => 'trò chuyện';

  @override
  String get siriAskBot => 'Hỏi một bot';

  @override
  String get siriAskBotDescription =>
      'Gửi câu hỏi tới một trong các bot Casama (trợ lý AI) trong cuộc trò chuyện mới và đọc lại câu trả lời. Nếu không nêu tên bot, bot bạn vừa trò chuyện gần nhất sẽ trả lời.';

  @override
  String get siriCategoryBots => 'Bot';

  @override
  String get siriAskBotParamDescription =>
      'Hỏi bot nào. Để trống để chọn bot bạn vừa trò chuyện gần nhất.';

  @override
  String get siriQuestion => 'Câu hỏi';

  @override
  String get siriQuestionDescription =>
      'Câu muốn hỏi bot, bằng lời của chính bạn.';

  @override
  String get siriWhatShouldIAsk => 'Tôi nên hỏi gì đây?';

  @override
  String siriSummaryAskBot(String bot, String question) {
    return 'Hỏi $bot $question';
  }

  @override
  String get siriRestOnScreen => 'Phần còn lại hiển thị trên màn hình.';

  @override
  String get siriRestOnScreenEllipsis =>
      '… Phần còn lại hiển thị trên màn hình.';

  @override
  String get siriRunRoutineDescription =>
      'Chạy ngay một quy trình của các bot Casama. Kết quả sẽ hiện trong ứng dụng và gửi qua thông báo giống như khi quy trình tự chạy.';

  @override
  String get siriRoutineParamDescription => 'Quy trình cần chạy ngay.';

  @override
  String siriSummaryRun(String routine) {
    return 'Chạy $routine';
  }

  @override
  String get siriWhatNeedsMe => 'Việc cần tôi';

  @override
  String get siriWhatNeedsMeDescription =>
      'Cho biết có bao nhiêu việc trong Casama đang chờ bạn: yêu cầu phê duyệt, tiếp quản hay gợi ý từ bot. Hãy xử lý trong ứng dụng.';

  @override
  String get siriOpenBot => 'Mở một bot';

  @override
  String get siriOpenBotDescription =>
      'Mở cuộc trò chuyện của bạn với một bot Casama.';

  @override
  String get siriOpenBotPersonDescription =>
      'Mở cuộc trò chuyện của bot Casama.';

  @override
  String get siriOpenChat => 'Mở một cuộc trò chuyện';

  @override
  String get siriOpenChatDescription =>
      'Mở một trong các cuộc trò chuyện với bot Casama.';

  @override
  String get siriOpenRoutine => 'Mở bot của quy trình';

  @override
  String get siriOpenRoutineDescription =>
      'Mở bot đang chạy một trong các quy trình Casama của bạn.';

  @override
  String get siriTalkDescription =>
      'Mở chế độ giọng nói với một bot Casama. Có thể gắn vào nút Tác vụ.';

  @override
  String get siriAskGetReply => 'Hỏi bot và lấy câu trả lời';

  @override
  String get siriAskGetReplyDescription =>
      'Gửi câu hỏi tới bot Casama và trả về văn bản câu trả lời để nối tiếp trong Phím tắt.';

  @override
  String get siriGetLastReply => 'Lấy câu trả lời gần nhất';

  @override
  String get siriGetLastReplyDescription =>
      'Trả về văn bản câu trả lời mới nhất từ cuộc trò chuyện với bot Casama.';

  @override
  String get siriStartComputer => 'Khởi động máy tính';

  @override
  String get siriStartComputerDescription =>
      'Đánh thức một máy tính Casama sau khi xác nhận.';

  @override
  String get siriComputerName => 'Tên máy tính';

  @override
  String get siriYourComputer => 'máy tính Casama của bạn';

  @override
  String siriStartConfirm(String computer) {
    return 'Khởi động $computer?';
  }

  @override
  String get siriOpenToStartComputer =>
      'Mở Casama để khởi động máy tính của bạn.';

  @override
  String get siriFocusTitle => 'Đặt Bộ lọc Tập trung Casama';

  @override
  String get siriFocusDescription =>
      'Chỉ hiện các bot được chọn và tùy chọn tạm giữ tin chủ động khi chế độ Tập trung này đang bật.';

  @override
  String get siriFocusBots => 'Bot cần hiển thị';

  @override
  String get siriFocusHold => 'Tạm giữ tin chủ động';

  @override
  String get siriFocusShowOne => 'Hiện 1 bot';

  @override
  String siriFocusShowMany(int count) {
    return 'Hiện $count bot';
  }

  @override
  String get siriFocusHoldCheckIns => 'Giữ tin chủ động';

  @override
  String get siriFocusAllowCheckIns => 'Cho phép tin chủ động';

  @override
  String get siriFocusAllBots => 'Tất cả bot';

  @override
  String get siriFocusAllVisible => 'Hiện tất cả bot';

  @override
  String get siriToolAsk => 'Hỏi một bot Casama';

  @override
  String get siriToolAskDescription =>
      'Hỏi một bot Casama của người dùng và trả về câu trả lời.';

  @override
  String get siriCategoryAssistants => 'Trợ lý';

  @override
  String get siriToolBotDescription => 'Bot Casama cần hỏi.';

  @override
  String get siriToolQuestionDescription => 'Điều cần hỏi bot.';

  @override
  String get siriToolRun => 'Chạy một quy trình Casama';

  @override
  String get siriToolRunDescription =>
      'Chạy một quy trình Casama đã lưu sau khi xác nhận với người dùng.';

  @override
  String get siriCategoryAutomation => 'Tự động hóa';

  @override
  String get siriToolRoutineDescription => 'Quy trình cần chạy.';

  @override
  String siriRunWithConfirm(String routine, String bot) {
    return 'Chạy $routine với $bot?';
  }

  @override
  String get siriToolNeeds => 'Việc gì cần tôi trong Casama';

  @override
  String get siriToolNeedsDescription =>
      'Kiểm tra xem có bao nhiêu yêu cầu phê duyệt, tiếp quản hoặc gợi ý đang chờ trong Casama.';

  @override
  String get siriOpenToCheck => 'Mở Casama để kiểm tra việc nào đang cần bạn.';

  @override
  String get siriToolStop => 'Dừng một bot Casama';

  @override
  String get siriToolStopDescription =>
      'Dừng một bot hiện đang chạy tác vụ trong Casama.';

  @override
  String get siriToolStopBotDescription => 'Bot cần dừng.';

  @override
  String siriStoppedBot(String bot) {
    return 'Đã dừng $bot.';
  }

  @override
  String get siriToolCall => 'Gọi một bot Casama';

  @override
  String get siriToolCallDescription =>
      'Mở Casama và bắt đầu cuộc gọi trực tiếp với bot đã chọn.';

  @override
  String get siriCategoryCommunication => 'Liên lạc';

  @override
  String get siriToolCallBotDescription => 'Bot cần gọi.';

  @override
  String siriCalling(String bot) {
    return 'Đang gọi $bot.';
  }

  @override
  String siriBotIn(String app) {
    return 'Một bot trong $app';
  }

  @override
  String get siriMe => 'Tôi';

  @override
  String get siriABot => 'một bot';

  @override
  String get siriFavorited => 'Đã thích';

  @override
  String siriSentTo(String bot) {
    return 'Đã gửi tới $bot';
  }

  @override
  String get siriMessage => 'Tin nhắn';

  @override
  String get siriNone => 'Không có';

  @override
  String get siriErrorOneBot =>
      'Casama chỉ gửi cho từng bot một. Bạn muốn chọn bot nào?';

  @override
  String get siriErrorTextOnly =>
      'Siri chỉ gửi được văn bản cho bot. Hãy thêm tệp, ảnh và địa điểm trong Casama.';

  @override
  String get siriErrorNoBot => 'Tôi không tìm thấy bot đó trong Casama.';

  @override
  String get siriWhatShouldISend => 'Tôi nên gửi gì?';

  @override
  String get siriAskCasamaBot => 'Hỏi Bot Casama';

  @override
  String siriAskName(String bot) {
    return 'Hỏi $bot';
  }

  @override
  String get siriAskAboutThis => 'Hỏi Casama về mục này';

  @override
  String siriPhraseAsk(String app) {
    return 'Hỏi $app';
  }

  @override
  String siriPhraseAskBotIn(String app) {
    return 'Hỏi một bot trong $app';
  }

  @override
  String siriPhraseAskNamed(String bot, String app) {
    return 'Hỏi $bot trong $app';
  }

  @override
  String siriPhraseTalkIn(String app) {
    return 'Nói chuyện với bot trong $app';
  }

  @override
  String siriPhraseTalkNamed(String bot, String app) {
    return 'Nói chuyện với $bot trong $app';
  }

  @override
  String siriPhraseRunIn(String app) {
    return 'Chạy một quy trình trong $app';
  }

  @override
  String siriPhraseRunNamed(String routine, String app) {
    return 'Chạy $routine trong $app';
  }

  @override
  String siriPhraseNeedsIn(String app) {
    return 'Có việc gì cần tôi trong $app';
  }

  @override
  String siriPhraseWaitingIn(String app) {
    return 'Có gì đang chờ trong $app';
  }

  @override
  String siriPhraseAskSomething(String app) {
    return 'Hỏi $app một việc';
  }

  @override
  String siriPhraseRunMy(String routine, String app) {
    return 'Chạy quy trình $routine của tôi trong $app';
  }

  @override
  String get siriABotSubject => 'Một bot';

  @override
  String siriBotNeedsOk(String bot) {
    return '$bot cần bạn đồng ý.';
  }

  @override
  String siriBotNeedsTakeOver(String bot) {
    return '$bot cần bạn tiếp quản.';
  }

  @override
  String siriBotHasSuggestion(String bot) {
    return '$bot có một gợi ý.';
  }

  @override
  String siriBotNeedsYouLine(String bot) {
    return '$bot cần bạn.';
  }

  @override
  String get siriOneThingNeedsYou => 'Có một việc cần bạn.';

  @override
  String siriCountThingsNeedYou(int count) {
    return 'Có $count việc cần bạn.';
  }

  @override
  String get siriUnlockPhone => 'Mở khóa điện thoại rồi thử lại.';

  @override
  String get siriGeminiOff =>
      'Gemini đang tắt đối với Casama trên điện thoại này (Casama → Cài đặt → Quyền riêng tư).';

  @override
  String get suggestionActionTurnOn => 'Bật';

  @override
  String suggestionActionRemindMe(String date) {
    return 'Nhắc tôi $date';
  }

  @override
  String get suggestionActionPickTime => 'Chọn thời gian';

  @override
  String get suggestionActionPutAwayAll => 'Để sau tất cả';

  @override
  String suggestionActionPutAwayAllCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Để sau tất cả $count ý tưởng',
      one: 'Để sau 1 ý tưởng',
    );
    return '$_temp0';
  }

  @override
  String get suggestionActionOpen => 'Mở';

  @override
  String get suggestionActionGotIt => 'Đã hiểu';

  @override
  String get suggestionActionLater => 'Để sau';

  @override
  String get suggestionActionSomethingElse => 'Lý do khác';

  @override
  String get suggestionTurnedOn => 'Đã bật';

  @override
  String suggestionReminderSet(String date) {
    return 'Đã đặt nhắc nhở cho $date';
  }

  @override
  String get suggestionSnoozed => 'Đã lưu để xem sau';

  @override
  String get suggestionSnoozedExpired => 'Đã để sau — đã hoãn hai lần';

  @override
  String suggestionPutAwayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã để sau $count ý tưởng',
      one: 'Đã để sau 1 ý tưởng',
    );
    return '$_temp0';
  }

  @override
  String get suggestionUndo => 'Hoàn tác';

  @override
  String get suggestionLaterTomorrow => 'Sáng mai';

  @override
  String get suggestionLaterEvening => 'Tối nay';

  @override
  String get suggestionLaterNextWeek => 'Tuần sau';

  @override
  String suggestionMoreWaiting(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Còn $count ý tưởng đang chờ',
      one: 'Còn 1 ý tưởng đang chờ',
    );
    return '$_temp0';
  }

  @override
  String botIdeasGrouped(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count ý tưởng',
      one: '$name · 1 ý tưởng',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutine(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count kết quả quy trình hôm nay',
      one: '$name · 1 kết quả quy trình hôm nay',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNotice(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$name · $count bản cập nhật hôm nay',
      one: '$name · 1 bản cập nhật hôm nay',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedRoutinePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kết quả quy trình hôm nay',
      one: '1 kết quả quy trình hôm nay',
    );
    return '$_temp0';
  }

  @override
  String updatesGroupedNoticePlain(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bản cập nhật hôm nay',
      one: '1 bản cập nhật hôm nay',
    );
    return '$_temp0';
  }

  @override
  String briefSinceYesterday(String summary) {
    return 'Từ hôm qua: $summary';
  }

  @override
  String briefSincePages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count trang',
      one: '1 trang',
    );
    return '$_temp0';
  }

  @override
  String briefSinceRoutines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kết quả quy trình',
      one: '1 kết quả quy trình',
    );
    return '$_temp0';
  }

  @override
  String briefSinceUpdates(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bản cập nhật',
      one: '1 bản cập nhật',
    );
    return '$_temp0';
  }

  @override
  String get notifTurnOn => 'Bật';

  @override
  String get notifOpen => 'Mở';

  @override
  String get notifGotIt => 'Đã hiểu';

  @override
  String get notifRemindMe => 'Nhắc tôi';

  @override
  String get notifLater => 'Để sau';

  @override
  String get watchTurnOn => 'Bật';

  @override
  String get watchGotIt => 'Đã hiểu';

  @override
  String get watchRemindMe => 'Nhắc nhở';

  @override
  String get watchLater => 'Để sau';

  @override
  String get watchOpen => 'Mở';

  @override
  String get costModeLabel => 'Chế độ xem chi phí';

  @override
  String get costModePaid => 'Đã trả';

  @override
  String get costModeEstimated => 'Ước tính';

  @override
  String get costPaid => 'Đã trả';

  @override
  String get costEstimatedTitle => 'Ước tính';

  @override
  String get costMarginListPrices => 'Biên lợi nhuận theo giá niêm yết';

  @override
  String get costFreePlan => 'Gói miễn phí';

  @override
  String costFreePlanCalls(String count) {
    return 'Gói miễn phí · $count lượt gọi';
  }

  @override
  String costCapUsage(String used, String limit, String unit) {
    return '$used / $limit $unit';
  }

  @override
  String get costShareOfOwnServers => 'Phần máy chủ riêng';

  @override
  String costIncludedCredit(String amount) {
    return 'gồm $amount/tháng';
  }

  @override
  String costAtListPrices(String amount) {
    return '$amount theo giá niêm yết';
  }

  @override
  String costEmptyPaidDays(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Không có khoản chi thực tế nào trong $days ngày này',
    );
    return '$_temp0';
  }

  @override
  String get costEmptyPaidRange =>
      'Không có khoản chi thực tế nào trong những ngày này';

  @override
  String get costEmptyPaidFiltered =>
      'Không có khoản chi thực tế nào khớp bộ lọc này';

  @override
  String costSpokenPaid(String amount) {
    return 'đã trả $amount';
  }

  @override
  String costSpokenEstimated(String amount) {
    return 'ước tính $amount';
  }

  @override
  String costSpendCardPaidSemantics(
    String paid,
    String charged,
    String margin,
  ) {
    return 'Chi tiêu 30 ngày qua: đã trả $paid, đã thu $charged, biên lợi nhuận theo giá niêm yết $margin';
  }

  @override
  String get vendorBillingFree => 'Gói miễn phí';

  @override
  String get vendorBillingMetered => 'Theo mức dùng';

  @override
  String get vendorBillingFreeHelp =>
      'Mức dùng dừng ở hạn mức và tính là \$0 đã trả.';

  @override
  String get vendorBillingMeteredHelp =>
      'Mức dùng được tính theo chi phí đã ghi nhận.';

  @override
  String get vendorIncludedUsd => 'Hạn mức tặng kèm mỗi tháng (USD)';

  @override
  String get vendorIncludedUsdHelp =>
      'Mức dùng trong khoản này mỗi tháng dương lịch tính là \$0 đã trả.';
}
