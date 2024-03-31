import 'package:baseflutter/ui/themes/colors.dart';
import 'package:baseflutter/ui/themes/typography.dart';
import 'package:flutter/material.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  final AppColors colors;
  final AppTypography typography;

  const AppTheme({required this.colors, required this.typography});

  @override
  ThemeExtension<AppTheme> copyWith({
    AppColors? colors,
    AppTypography? typography,
  }) {
    return AppTheme(
      colors: colors ?? this.colors,
      typography: typography ?? this.typography,
    );
  }

  @override
  ThemeExtension<AppTheme> lerp(
    covariant ThemeExtension<AppTheme>? other,
    double t,
  ) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      colors: AppColors.left(colors, other.colors, t),
      typography: AppTypography.left(typography, other.typography, t),
    );
  }
}
