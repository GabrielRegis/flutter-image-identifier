import 'dart:ui';

import 'app_theme_colors.dart';

class AppThemeData {
  final AppThemeColors colors;
  final Brightness brightness;
  AppThemeData({
    required this.colors,
    required this.brightness,
  });

  Color get primaryColor => colors.primary;
  Color get backgroundColor => colors.background;
  Color get navbarColor => colors.navbar;
}
