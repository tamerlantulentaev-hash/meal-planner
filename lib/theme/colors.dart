import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF6B5B95);
  static const Color primaryLight = Color(0xFF8B7BAD);
  static const Color primaryDark = Color(0xFF4A3F6B);

  // Secondary Colors
  static const Color secondary = Color(0xFFFF6B6B);
  static const Color secondaryLight = Color(0xFFFF8787);
  static const Color secondaryDark = Color(0xFFE63946);

  // Accent Colors
  static const Color accent = Color(0xFF4ECDC4);
  static const Color accentLight = Color(0xFF7FDFDA);
  static const Color accentDark = Color(0xFF2BA89D);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1F1F1F);
  static const Color grey = Color(0xFF868686);
  static const Color greyLight = Color(0xFFF5F5F5);
  static const Color greyDark = Color(0xFF4A4A4A);

  // Success, Warning, Error
  static const Color success = Color(0xFF51CF66);
  static const Color warning = Color(0xFFFFA500);
  static const Color error = Color(0xFFE63946);
  static const Color info = Color(0xFF0EA5E9);

  // Background Colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF0F0F0);
}

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.primary,
      AppColors.primaryLight,
    ],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.secondary,
      AppColors.secondaryLight,
    ],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.accent,
      AppColors.accentLight,
    ],
  );
}
