import 'package:flutter/material.dart';
import 'package:toto/bean/window_info.dart';
import 'package:toto/main_app.dart';
import 'package:toto/util/hotkey_util.dart';
import 'package:toto/util/tray_manager.dart';
import 'package:toto/util/window_util.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  TrayManager.showTray();
  await windowManager.ensureInitialized();
  HotKeyUtil().register();

  WindowInfo windowInfo = WindowInfo("main", width: 600, height: 60);

  var windowOptions = WindowOptions(
    size: Size(windowInfo.width, windowInfo.height),
    center: false,
    alwaysOnTop: windowInfo.type == "main",
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    windowButtonVisibility: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  WindowUtil().add(windowInfo.windowId, windowManager);
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setAlignment(const Alignment(0.0, -0.8));
    await windowManager.setMaximizable(false);
    await windowManager.setMinimizable(false);
    await windowManager.setMovable(false);
    await windowManager.setPreventClose(true);
    await windowManager.setVisibleOnAllWorkspaces(false);
    // await windowManager.show();
    // await windowManager.focus();
  });

  runApp(MainApp(
    windowInfo: windowInfo,
  ));
}
