import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),
    scaffoldBackgroundColor: AppColors.background,
  );
}