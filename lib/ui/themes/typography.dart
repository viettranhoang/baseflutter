import 'package:flutter/material.dart';

class AppTypography {
  final TextStyle mediumSemi;

  const AppTypography({
    required this.mediumSemi,
  });

  static left(AppTypography a, AppTypography b, double t) {
    return AppTypography(
      mediumSemi: TextStyle.lerp(a.mediumSemi, b.mediumSemi, t)!,
    );
  }

  static const AppTypography defaults = AppTypography(
    mediumSemi: AppTextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 24 / 16,
    ),
  );
}

class AppTextStyle extends TextStyle {
  const AppTextStyle({
    super.color,
    required double super.fontSize,
    required FontWeight super.fontWeight,
    required double super.height,
  });
}
