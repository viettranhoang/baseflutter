import 'dart:ui';

class AppColors {
  final Color primary;

  const AppColors({
    required this.primary,
  });

  static left(AppColors a, AppColors b, double t) {
    return AppColors(
      primary: Color.lerp(a.primary, b.primary, t)!,
    );
  }

  static const AppColors light = AppColors(
    primary: Color(0xFFCCD1FF),
  );

  static const AppColors dark = AppColors(
    primary: Color(0xFFCCD1FF),
  );
}
