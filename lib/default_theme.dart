import 'package:flutter/material.dart';

class DefaultTheme {
  static ThemeData buildThemeData() {
    return ThemeData(
      appBarTheme: _buildAppBarThemeData(),
      floatingActionButtonTheme: _buildFloatingActionButtonTheme(),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static AppBarTheme _buildAppBarThemeData() {
    return const AppBarTheme(
      backgroundColor: Colors.purple,
      elevation: 3,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'OpenSans-Bold',
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static FloatingActionButtonThemeData _buildFloatingActionButtonTheme() {
    return const FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 97, 74, 17),
      foregroundColor: Colors.black,
    );
  }
}
