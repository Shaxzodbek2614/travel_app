import 'package:flutter/material.dart';

class AppColors {
  Color textColor;
  Color backgroundColor;
  Color titleColor;
  Color signText;
  Color forgotPasswordText;
  AppColors({
    this.textColor = Colors.grey,
    required this.backgroundColor,
    required this.titleColor,
    this.signText = Colors.orange,
    this.forgotPasswordText = Colors.blue
  });

  static AppColors dark = AppColors(
    backgroundColor: Colors.black,
    titleColor: Colors.white,
  );

  static AppColors light = AppColors(
    backgroundColor: Colors.white,
    titleColor: Colors.black,
  );

  static AppColors of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }
}
