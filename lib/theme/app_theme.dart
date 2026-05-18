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
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColor.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColor.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColor.textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColor.textSecondary,
      ),
      headlineSmall: TextStyle(fontSize: 14, color: AppColor.textSecondary),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.textPrimary,
      foregroundColor: AppColor.background,
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(AppColor.textSecondary),
      trackColor: WidgetStateProperty.all(AppColor.background),
      radius: const Radius.circular(10),
      thickness: WidgetStateProperty.all(6),
    ),

    // inputDecorationTheme: InputDecorationTheme(
    //   // filled: true,
    //   // fillColor: AppColor.textPrimary,
    //   labelStyle: const TextStyle(
    //     color: AppColor.textPrimary,
    //     fontWeight: FontWeight.normal,
    //   ),
    //   hintStyle: const TextStyle(
    //     color: AppColor.textSecondary,
    //     fontWeight: FontWeight.normal,
    //   ),
    //   border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColor.border),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: AppColor.textPrimary, width: 2),
    //   ),
    // ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.textPrimary,
      selectionColor: AppColor.textSecondary,
      selectionHandleColor: AppColor.textSecondary,
    ),
  );
}
