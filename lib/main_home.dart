import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Colors.blue,
        child: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
