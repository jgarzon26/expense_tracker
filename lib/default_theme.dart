import 'package:expense_tracker/constants.dart';
import 'package:flutter/material.dart';

class DefaultTheme {
  static ThemeData buildThemeData() {
    return ThemeData(
      appBarTheme: _buildAppBarThemeData(),
      floatingActionButtonTheme: _buildFloatingActionButtonTheme(),
      textTheme: _buildTextTheme(),
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static AppBarTheme _buildAppBarThemeData() {
    return const AppBarTheme(
      backgroundColor: kAscentColor,
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

  static TextTheme _buildTextTheme() {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontFamily: 'Quicksand-Bold',
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Quicksand-Regular',
        fontSize: 12,
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
