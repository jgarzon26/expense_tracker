import 'package:expense_tracker/default_theme.dart';
import 'package:expense_tracker/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme.buildThemeData(),
      home: const Home(),
    );
  }
}
