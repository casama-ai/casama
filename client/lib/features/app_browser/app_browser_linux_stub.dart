import 'app_browser_service.dart';

String? readOsReleaseSync() => null;

AppBrowserTokenStore createLinuxFileTokenStore({String? path}) =>
    MemoryAppBrowserTokenStore();

AppBrowserTokenStore createMacFileTokenStore({String? path}) =>
    MemoryAppBrowserTokenStore();
