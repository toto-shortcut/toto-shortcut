import 'dart:io';

import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:toto/generated/assets.dart';
import 'package:toto/util/window_util.dart';
import 'package:tray_manager/tray_manager.dart';

class TrayManager {
  static void showTray() async {
    await trayManager.setIcon(
      Platform.isWindows ? Assets.imagesIconTrayIco : Assets.imagesIconTray,
    );
    final info = await PackageInfo.fromPlatform();
    //暂时看icon、sublabel 还不支持
    Menu menu = Menu(
      items: [
        MenuItem(
          key: 'tray_window',
          label: '显示',
          icon: Assets.imagesIconTray,
          sublabel: 'SubLabel',
          onClick: (menuItem) {
            WindowUtil().toggleTOTOWindow();
          },
        ),
        MenuItem.separator(),
        MenuItem(
          key: 'tray_version',
          label: 'TOTO v${info.version}+${info.buildNumber}',
          disabled: true,
        ),
        MenuItem.separator(),
        MenuItem(
            key: 'tray_exit',
            label: '退出',
            onClick: (menuItem) async {
              await trayManager.destroy();
              SystemNavigator.pop();
            }),
      ],
    );
    await trayManager.setIconPosition(TrayIconPositon.left);
    await trayManager.setContextMenu(menu);
  }
}
