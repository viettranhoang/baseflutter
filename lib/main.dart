import 'package:baseflutter/di/di.dart';
import 'package:baseflutter/generated/l10n.dart';
import 'package:baseflutter/ui/routes/route.dart';
import 'package:baseflutter/ui/themes/colors.dart';
import 'package:baseflutter/ui/themes/theme.dart';
import 'package:baseflutter/ui/themes/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = getIt<AppRouter>();

    return MaterialApp.router(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        Strings.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Strings.delegate.supportedLocales,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColors.light.primary,
        extensions: [
          const AppTheme(
            colors: AppColors.light,
            typography: AppTypography.defaults,
          )
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: AppColors.dark.primary,
        extensions: [
          const AppTheme(
            colors: AppColors.light,
            typography: AppTypography.defaults,
          )
        ],
      ),
      routerConfig: appRouter.config(),
    );
  }
}

