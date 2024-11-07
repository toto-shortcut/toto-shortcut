import 'package:flutter/material.dart';
import 'package:toto/view/tobox_widget.dart';
import 'package:toto/view/toto_widget.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      autofocus: true,
      child: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        NavWidget(),
        Expanded(
          child: ToboxWidget(),
          flex: 1,
        )
      ],
    );
  }
}
