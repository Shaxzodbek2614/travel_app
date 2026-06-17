import 'package:flutter/material.dart';
import 'package:travel_app/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      enabledBorder: OutlineInputBorder(borderRadius: .circular(30),borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(borderRadius: .circular(30),borderSide: BorderSide(color: Colors.black)),
          errorBorder: OutlineInputBorder(borderRadius: .circular(30),borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: .circular(30),borderSide: BorderSide(color: Colors.red)),
          hintStyle: TextStyle(color: AppColors.light.textColor),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      enabledBorder: OutlineInputBorder(borderRadius: .circular(30),borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(borderRadius: .circular(30),borderSide: BorderSide(color: Colors.black)),
          errorBorder: OutlineInputBorder(borderRadius: .circular(30),borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: .circular(30),borderSide: BorderSide(color: Colors.red)),
          hintStyle: TextStyle(color: AppColors.dark.textColor),
    ),
  );
}