import 'dart:io';

import 'package:toto/generated/assets.dart';
import 'package:tray_manager/tray_manager.dart';

class TrayManager {
  static void showTray() async {
    await trayManager.setIcon(
      Platform.isWindows ? Assets.imagesIconTrayIco : Assets.imagesIconTray,
    );
    Menu menu = Menu(
      items: [
        MenuItem(
          key: 'show_window',
          label: 'Show Window',
        ),
        MenuItem.separator(),
        MenuItem(
          key: 'exit_app',
          label: 'Exit App',
        ),
      ],
    );
    await trayManager.setContextMenu(menu);
  }
}
