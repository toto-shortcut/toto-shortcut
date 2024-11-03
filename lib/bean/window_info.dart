class WindowInfo {
  String type;
  String functionName;
  int windowId = 0;
  double width = 800;
  double height = 600;
  String envDir;
  bool resizable = true;

  WindowInfo(this.type,
      {this.functionName = "",
      this.windowId = 0,
      this.width = 800,
      this.height = 600,
      this.envDir = "",
      this.resizable = true});

  WindowInfo.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        functionName = json['functionName'],
        windowId = json['windowId'],
        width = json['width'],
        height = json['height'],
        envDir = json['envDir'],
        resizable = json['resizable'];

  Map<String, dynamic> toJson() => {
        'type': type,
        'functionName': functionName,
        'windowId': windowId,
        'width': width,
        'height': height,
        'envDir': envDir,
        'resizable': resizable,
      };

  @override
  String toString() {
    return 'WindowInfo{type: $type, functionName: $functionName, windowId: $windowId, width: $width, height: $height, envDir: $envDir, resizable: $resizable}';
  }
}
