import './app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.background,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.background,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColor.textPrimary,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColor.textPrimary,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColor.textPrimary,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColor.textPrimary,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColor.textPrimary),
      headlineSmall: TextStyle(fontSize: 14, color: AppColor.textSecondary),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.textPrimary,
      foregroundColor: AppColor.background,
    ),
  );
}
