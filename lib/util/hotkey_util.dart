import 'package:flutter/services.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:toto/util/window_util.dart';

class HotKeyUtil {
  final HotKey _mainHotKey = HotKey(
    key: PhysicalKeyboardKey.keyE,
    modifiers: [HotKeyModifier.alt],
    scope: HotKeyScope.system,
  );

  final List<HotKey> _hotKeyList = [];

  void register() async {
    await hotKeyManager.unregisterAll();
    _hotKeyList.add(_mainHotKey);

    for (var value in _hotKeyList) {
      await hotKeyManager.register(
        value,
        keyDownHandler: onHotKeyDown,
      );
    }
  }

  void onHotKeyDown(HotKey hotKey) {
    print('onKeyDown+${hotKey.toJson()}');
    if (hotKey == _mainHotKey) {
      WindowUtil().toggleTOTOWindow();
    }
  }

  //单例
  HotKeyUtil._internal();

  factory HotKeyUtil() => _instance;

  static final HotKeyUtil _instance = HotKeyUtil._internal();
}
