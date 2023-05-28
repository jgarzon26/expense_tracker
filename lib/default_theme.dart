import 'package:expense_tracker/constants.dart';
import 'package:flutter/material.dart';

class DefaultTheme {
  static ThemeData buildThemeData() {
    return ThemeData(
      appBarTheme: _buildAppBarThemeData(),
      colorScheme: const ColorScheme.light(
        primary: kAscentColor,
        secondary: kPrimaryColor,
      ),
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
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Quicksand-Regular',
        fontSize: 10,
      ),
    );
  }

  static FloatingActionButtonThemeData _buildFloatingActionButtonTheme() {
    return FloatingActionButtonThemeData(
      backgroundColor: Colors.yellow.shade700,
      foregroundColor: Colors.black,
    );
  }
}
