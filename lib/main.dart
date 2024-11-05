import 'package:flutter/material.dart';
import 'package:toto/bean/window_info.dart';
import 'package:toto/main_app.dart';
import 'package:toto/util/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  TrayManager.showTray();
  await windowManager.ensureInitialized();

  WindowInfo windowInfo = WindowInfo("main", width: 600, height: 300);

  var windowOptions = WindowOptions(
    size: Size(windowInfo.width, windowInfo.height),
    center: false,
    alwaysOnTop: windowInfo.type == "main",
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    windowButtonVisibility: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setAlignment(const Alignment(0.0, -0.8));
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(MainApp(
    windowInfo: windowInfo,
  ));
}
