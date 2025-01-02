import 'dart:io' show Platform;

bool kIsAndroid = Platform.isAndroid;
bool kIsWindow = Platform.isWindows;
bool kIsIOS = Platform.isIOS;
bool kIsMacOS = Platform.isMacOS;

bool kAppStore = kIsIOS || kIsMacOS;
bool kPlayStore = kIsAndroid || kIsWindow;
