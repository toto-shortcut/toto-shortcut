import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toto/bean/window_info.dart';
import 'package:toto/main_app.dart';
import 'package:toto/util/tray_manager.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  TrayManager.showTray();

  WindowInfo windowInfo = WindowInfo("main", width: 800, height: 600);

  runApp(MainApp(
    windowInfo: windowInfo,
  ));

  doWhenWindowReady(() {
    const initialSize = Size(800, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.topCenter;
    appWindow.show();
  });
}
