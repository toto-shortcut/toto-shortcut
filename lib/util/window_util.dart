import 'package:window_manager/window_manager.dart';

class WindowUtil {
  Map<int, WindowManager> windowManagerMap = Map<int, WindowManager>();

  void add(int windowId, WindowManager windowManager) {
    windowManagerMap[windowId] = windowManager;
  }

  WindowManager get(int windowId) {
    return windowManagerMap[windowId]!;
  }

  void remove(int windowId) {
    windowManagerMap.remove(windowId);
  }

  void toggleTOTOWindow() async {
    var mainWindow = get(0);
    bool isVisible = await mainWindow.isVisible();
    if (isVisible) {
      mainWindow.hide();
    } else {
      mainWindow.show();
      mainWindow.focus();
    }
  }

  //单例
  WindowUtil._internal();

  factory WindowUtil() => _instance;

  static final WindowUtil _instance = WindowUtil._internal();
}
