import 'package:baseflutter/generated/l10n.dart';
import 'package:baseflutter/ui/themes/colors.dart';
import 'package:baseflutter/ui/themes/theme.dart';
import 'package:baseflutter/ui/themes/typography.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  clearFocus() {
    FocusScope.of(this).requestFocus(FocusNode());
  }

  Strings get translations {
    return Strings.of(this);
  }

  AppColors get colors =>
      Theme.of(this).extension<AppTheme>()?.colors ?? AppColors.light;

  AppTypography get typography =>
      Theme.of(this).extension<AppTheme>()?.typography ??
      AppTypography.defaults;
}
