import 'package:flutter/material.dart';
import 'package:toto/util/window_util.dart';

class NavWidget extends StatefulWidget {
  const NavWidget({super.key});

  @override
  State<NavWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: <Widget>[
          Text("类型"),
          Expanded(
            child: Text("输入"),
            flex: 1,
          ),
          TextButton(
              child: Text("测试"),
              onPressed: () {
                var windowManager = WindowUtil().get(0);
                windowManager.setSize(Size(600, 260), animate: true);
              }),
        ],
      ),
    );
  }
}
